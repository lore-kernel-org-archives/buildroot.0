From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 22:46:38 +0200
Subject: [Buildroot] [PATCH v2 1/3] support/scripts/pkg-stats: use
 aiohttp for latest version retrieval
In-Reply-To: <9ba283a3-53f5-f9d6-77ef-0d8c6665561b@railnova.eu>
References: <20200804195248.1238754-1-thomas.petazzoni@bootlin.com>
 <20200804195248.1238754-2-thomas.petazzoni@bootlin.com>
 <9ba283a3-53f5-f9d6-77ef-0d8c6665561b@railnova.eu>
Message-ID: <20200805224638.133f56dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 5 Aug 2020 22:29:38 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> > -    worker_pool.terminate()
> > -    del http_pool
> > +    tasks = []
> > +    connector = aiohttp.TCPConnector(limit_per_host=5) > +    async with aiohttp.ClientSession(connector=connector,   
> trust_env=True) as sess:
> > +        packages = [p for p in packages if p.has_valid_infra]
> > +        for pkg in packages:
> > +            tasks.append(check_package_latest_version_get(sess, pkg))
> > +        await asyncio.wait(tasks)  
> 
> We don't really need 3 consecutive for loops here. I would rewrite the 
> function as:
> 
> async def check_package_latest_version(packages):
>      global check_latest_count
> 
>      tasks = []
>      connector = aiohttp.TCPConnector(limit_per_host=5)
>      async with aiohttp.ClientSession(connector=connector) as sess:
>          for pkg in packages:
>              if pkg.has_valid_infra:
>                  tasks.append(
>                      check_package_latest_version_get(sess, pkg, 
> len(packages))
>                  )
>              else:
>                  check_latest_count += 1

There will be "gaps" in the count being displayed, since you're
incrementing this counter without displaying the package name and total
count of packages.

That is why I was doing differently: handle the packages that don't
have any valid infra first, and then handle the remainder of the
packages.

>                  pkg.status['version'] = ("na", "no valid package infra")
>          await asyncio.wait(tasks)
> 
> 
> >   
> >   
> >   def check_package_cves(nvd_path, packages):
> > @@ -1057,7 +1071,7 @@ def __main__():
> >       print("Checking URL status")
> >       check_package_urls(packages)
> >       print("Getting latest versions ...")
> > -    check_package_latest_version(packages)
> > +    asyncio.run(check_package_latest_version(packages))  
> 
> asyncio.run was introduced in Python3.7 [3], which is quite "recent". 
> You could maybe use an "older" form (that would run down to py3.5):
> 
> loop = asyncio.get_event_loop()
> loop.run_until_complete(check_package_latest_version(packages))

ACK, will change this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
