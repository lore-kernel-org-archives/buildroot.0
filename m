From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 04 Jan 2019 00:12:05 -0200
Subject: [Buildroot] [PATCH v5] support/scripts/pkg-stats: add latest
 upstream version information
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
Message-ID: <5c2ec0f5b7e9d_45642abcb84d500471755@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In overall looks good. But I think a v6 would be good.

On Thu, Jan 03, 2019 at 06:38 AM, Thomas Petazzoni wrote:

> This commit adds fetching the latest upstream version of each package
> from release-monitoring.org.
> 
> The fetching process first tries to use the package mappings of the
> "Buildroot" distribution [1]. This mapping mechanism allows to tell
> release-monitoring.org what is the name of a package in a given
> distribution/build-system. For example, the package xutil_util-macros
> in Buildroot is named xorg-util-macros on release-monitoring.org. This
> mapping can be seen in the section "Mappings" of
> https://release-monitoring.org/project/15037/.
> 
> If there is no mapping, then it does a regular search, and within the
> search results, looks for a package whose name matches the Buildroot
> name.
> 
> Even though fetching from release-monitoring.org is a bit slow, using
> multiprocessing.Pool has proven to not be reliable, with some requests
> ending up with an exception. So we keep a serialized approach, but
> with a single HTTPSConnectionPool() for all queries. Long term, we

Looks like using urllib3 improves the speed a lot.
To me it took 25 minutes using v5 instead of 2 hours using v3 (also serialized
approach).

[snip]
> ---
> Changes since v4:
> - Don't use multiprocessing.Pool(), stick to a serialized approach,
>   which is more reliable.
> - Handle errors/exceptions properly.

Almost!
Could you fix the warnings from flake8?
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/141278172

I never used urllib3 but from the docs it seems there is a base exception, so
perhaps this line can be useful to avoid bare except:
from urllib3.exceptions import HTTPError

> - Improve the layout of the resulting table column.

[snip]
> +++ b/support/scripts/pkg-stats
> @@ -25,11 +25,19 @@ import re
>  import subprocess
>  import sys
>  import requests  # URL checking
> +import json
> +import certifi
> +from urllib3 import HTTPSConnectionPool
>  from multiprocessing import Pool
>  
>  INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
>  URL_RE = re.compile("\s*https?://\S*\s*$")
> +RELEASE_MONITORING_API = "http://release-monitoring.org/api"

Not used in v5. Matt already mentioned it, but I highlight it because flake8
does not catch it.


Regards,
Ricardo
