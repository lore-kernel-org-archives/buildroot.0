From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 5 Aug 2020 22:37:35 +0200
Subject: [Buildroot] [PATCH v2 2/3] support/scripts/pkg-stats: use
 aiohttp for upstream URL checking
In-Reply-To: <20200804195248.1238754-3-thomas.petazzoni@bootlin.com>
References: <20200804195248.1238754-1-thomas.petazzoni@bootlin.com>
 <20200804195248.1238754-3-thomas.petazzoni@bootlin.com>
Message-ID: <d35bc046-1cde-02a0-1c80-6b460c207b1f@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 4/08/20 21:52, Thomas Petazzoni wrote:
> This commit reworks the code that checks if the upstream URL of each
> package (specified by its Config.in file) using the aiohttp
> module. This makes the implementation much more elegant, and avoids
> the problematic multiprocessing Pool which is causing issues in some
> situations.
> 
> Suggested-by: Titouan Christophe <titouan.christophe@railnova.eu>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   support/scripts/pkg-stats | 45 +++++++++++++++++++++------------------
>   1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 31ff101781..30aca89336 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -25,14 +25,13 @@ import os
>   from collections import defaultdict
>   import re
>   import subprocess
> -import requests  # URL checking
> +import requests  # NVD database download

Shouldn't we migrate the NVD downloads to aiohttp as well ? So we do not 
need 2 different HTTP client libs.

>   import json
>   import ijson
>   import distutils.version
>   import time
>   import gzip
>   import sys
> -from multiprocessing import Pool
>   
>   sys.path.append('utils/')
>   from getdeveloperlib import parse_developers  # noqa: E402
> @@ -499,26 +498,30 @@ def package_init_make_info():
>               Package.all_ignored_cves[pkgvar] = value.split()
>   
>   
> -def check_url_status_worker(url, url_status):
> -    if url_status[0] == 'ok':
> -        try:
> -            url_status_code = requests.head(url, timeout=30).status_code
> -            if url_status_code >= 400:
> -                return ("error", "invalid {}".format(url_status_code))
> -        except requests.exceptions.RequestException:
> -            return ("error", "invalid (err)")
> -        return ("ok", "valid")
> -    return url_status
> +async def check_url_status(session, pkg, retry=True):
> +    try:
> +        async with session.get(pkg.url) as resp:
> +            if resp.status >= 400:
> +                pkg.status['url'] = ("error", "invalid {}".format(resp.status))
> +                return
> +    except (aiohttp.ClientError, asyncio.exceptions.TimeoutError):

Same as in previous patch: use asyncio.TimeoutError

> +        if retry:
> +            return await check_url_status(session, pkg, retry=False)
> +        else:
> +            pkg.status['url'] = ("error", "invalid (err)")
> +            return
>   
> +    pkg.status['url'] = ("ok", "valid")
>   
> -def check_package_urls(packages):
> -    pool = Pool(processes=64)
> -    for pkg in packages:
> -        pkg.url_worker = pool.apply_async(check_url_status_worker, (pkg.url, pkg.status['url']))
> -    for pkg in packages:
> -        pkg.status['url'] = pkg.url_worker.get(timeout=3600)
> -        del pkg.url_worker
> -    pool.terminate()
> +
> +async def check_package_urls(packages):
> +    tasks = []
> +    connector = aiohttp.TCPConnector(limit_per_host=5)
> +    async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
> +        packages = [p for p in packages if p.status['url'][0] == 'ok']
> +        for pkg in packages:
> +            tasks.append(check_url_status(sess, pkg))
> +        await asyncio.wait(tasks)
>   
>   
>   def check_package_latest_version_set_status(pkg, status, version, identifier):
> @@ -1069,7 +1072,7 @@ def __main__():
>           pkg.set_url()
>           pkg.set_developers(developers)
>       print("Checking URL status")
> -    check_package_urls(packages)
> +    asyncio.run(check_package_urls(packages))

Same as in previous patch to support down to py3.5:

loop.run_until_complete(check_package_urls(packages))

>       print("Getting latest versions ...")
>       asyncio.run(check_package_latest_version(packages))
>       if args.nvd_path:
> 

Best regards,

Titouan
