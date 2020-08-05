From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 5 Aug 2020 22:29:38 +0200
Subject: [Buildroot] [PATCH v2 1/3] support/scripts/pkg-stats: use
 aiohttp for latest version retrieval
In-Reply-To: <20200804195248.1238754-2-thomas.petazzoni@bootlin.com>
References: <20200804195248.1238754-1-thomas.petazzoni@bootlin.com>
 <20200804195248.1238754-2-thomas.petazzoni@bootlin.com>
Message-ID: <9ba283a3-53f5-f9d6-77ef-0d8c6665561b@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 4/08/20 21:52, Thomas Petazzoni wrote:
> This commit reworks the code that retrieves the latest upstream
> version of each package from release-monitoring.org using the aiohttp
> module. This makes the implementation much more elegant, and avoids
> the problematic multiprocessing Pool which is causing issues in some
> situations.
> 
> Suggested-by: Titouan Christophe <titouan.christophe@railnova.eu>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   support/scripts/pkg-stats | 142 +++++++++++++++++++++-----------------
>   1 file changed, 78 insertions(+), 64 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index ec4d538758..31ff101781 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -16,7 +16,9 @@
>   # along with this program; if not, write to the Free Software
>   # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

Now that pkg-state uses Python3 only, you should change the shebang line 
to #!/usr/bin/env python3 as well.

>   

[--SNIP--]

> -def release_monitoring_get_latest_version_by_guess(pool, name):
> +async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
> +    url = "https://release-monitoring.org//api/project/Buildroot/%s" % pkg.name
>       try:
> -        req = pool.request('GET', "/api/projects/?pattern=%s" % name)
> -    except HTTPError:
> -        return (RM_API_STATUS_ERROR, None, None)
> +        async with session.get(url) as resp:
> +            if resp.status != 200:
> +                return False
>   
> -    if req.status != 200:
> -        return (RM_API_STATUS_NOT_FOUND, None, None)
> +            data = await resp.json()
> +            version = data['version'] if 'version' in data else None
> +            check_package_latest_version_set_status(pkg,
> +                                                    RM_API_STATUS_FOUND_BY_DISTRO,
> +                                                    version,
> +                                                    data['id'])
> +            return True
> +
> +    except (aiohttp.ClientError, asyncio.exceptions.TimeoutError):
Use asyncio.TimeoutError here. The module asyncio.exceptions was 
introduced in Python3.8, which is quite recent [1]. Also the public API 
is asyncio.TimeoutError [2].

> +        if retry:
> +            return await check_package_get_latest_version_by_distro(session, pkg, retry=False)
> +        else:
> +            return False
>   
> -    data = json.loads(req.data)
>   
> -    projects = data['projects']
> -    projects.sort(key=lambda x: x['id'])
> +async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
> +    url = "https://release-monitoring.org/api/projects/?pattern=%s" % pkg.name
> +    try:
> +        async with session.get(url) as resp:
> +            if resp.status != 200:
> +                return False
> +
> +            data = await resp.json()
> +            # filter projects that have the right name and a version defined
> +            projects = [p for p in data['projects'] if p['name'] == pkg.name and 'version' in p]
> +            projects.sort(key=lambda x: x['id'])
> +
> +            if len(projects) > 0:
> +                check_package_latest_version_set_status(pkg,
> +                                                        RM_API_STATUS_FOUND_BY_DISTRO,
> +                                                        projects[0]['version'],
> +                                                        projects[0]['id'])
> +                return True
> +
> +    except (aiohttp.ClientError, asyncio.exceptions.TimeoutError):

Use asyncio.TimeoutError here.

[--SNIP--]

> @@ -587,33 +616,18 @@ def check_package_latest_version(packages):
>       - id: string containing the id of the project corresponding to this
>         package, as known by release-monitoring.org
>       """
> -    global http_pool
> -    http_pool = HTTPSConnectionPool('release-monitoring.org', port=443,
> -                                    cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
> -                                    timeout=30)
> -    worker_pool = Pool(processes=64)
> -    results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
> -    for pkg, r in zip(packages, results):
> -        pkg.latest_version = dict(zip(['status', 'version', 'id'], r))
>   
> +    for pkg in packages:
>           if not pkg.has_valid_infra:
>               pkg.status['version'] = ("na", "no valid package infra")
> -            continue
> -
> -        if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
> -            pkg.status['version'] = ('warning', "Release Monitoring API error")
> -        elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
> -            pkg.status['version'] = ('warning', "Package not found on Release Monitoring")
> -
> -        if pkg.latest_version['version'] is None:
> -            pkg.status['version'] = ('warning', "No upstream version available on Release Monitoring")
> -        elif pkg.latest_version['version'] != pkg.current_version:
> -            pkg.status['version'] = ('error', "The newer version {} is available upstream".format(pkg.latest_version['version']))
> -        else:
> -            pkg.status['version'] = ('ok', 'up-to-date')
>   
> -    worker_pool.terminate()
> -    del http_pool
> +    tasks = []
> +    connector = aiohttp.TCPConnector(limit_per_host=5) > +    async with aiohttp.ClientSession(connector=connector, 
trust_env=True) as sess:
> +        packages = [p for p in packages if p.has_valid_infra]
> +        for pkg in packages:
> +            tasks.append(check_package_latest_version_get(sess, pkg))
> +        await asyncio.wait(tasks)

We don't really need 3 consecutive for loops here. I would rewrite the 
function as:

async def check_package_latest_version(packages):
     global check_latest_count

     tasks = []
     connector = aiohttp.TCPConnector(limit_per_host=5)
     async with aiohttp.ClientSession(connector=connector) as sess:
         for pkg in packages:
             if pkg.has_valid_infra:
                 tasks.append(
                     check_package_latest_version_get(sess, pkg, 
len(packages))
                 )
             else:
                 check_latest_count += 1
                 pkg.status['version'] = ("na", "no valid package infra")
         await asyncio.wait(tasks)


>   
>   
>   def check_package_cves(nvd_path, packages):
> @@ -1057,7 +1071,7 @@ def __main__():
>       print("Checking URL status")
>       check_package_urls(packages)
>       print("Getting latest versions ...")
> -    check_package_latest_version(packages)
> +    asyncio.run(check_package_latest_version(packages))

asyncio.run was introduced in Python3.7 [3], which is quite "recent". 
You could maybe use an "older" form (that would run down to py3.5):

loop = asyncio.get_event_loop()
loop.run_until_complete(check_package_latest_version(packages))

>       if args.nvd_path:
>           print("Checking packages CVEs")
>           check_package_cves(args.nvd_path, {p.name: p for p in packages})
> 

[1] https://bugs.python.org/issue34622
[2] 
https://docs.python.org/3.8/library/asyncio-exceptions.html#asyncio.TimeoutError
[3] https://docs.python.org/3/library/asyncio-task.html#asyncio.run

Kind regards,
Titouan
