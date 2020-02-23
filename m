From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 23 Feb 2020 14:26:42 +0100
Subject: [Buildroot] [PATCH v3 01/12] support/scripts/pkg-stats: store
 latest version in a dict
In-Reply-To: <20200222085715.23769-2-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-2-heiko.thiery@gmail.com>
Message-ID: <55ac6156-ea67-a5f1-b818-5219db34ba8e@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko and all,

On 2/22/20 9:57 AM, Heiko Thiery wrote:
> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> This patch changes the type of the latest_version variable to a dict.
> This is for better readability/usability of the data. With this the json
> output is more descriptive in later processing of the json output.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

You signed off with both your personal and work email addresses, was 
this intended ?

> ---
>   support/scripts/pkg-stats | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 7721d98459..8cc78f2f66 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -71,7 +71,7 @@ class Package:
>           self.url_status = None
>           self.url_worker = None
>           self.cves = list()
> -        self.latest_version = (RM_API_STATUS_ERROR, None, None)
> +        self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
>   
>       def pkgvar(self):
>           return self.name.upper().replace("-", "_")
> @@ -460,9 +460,8 @@ def check_package_latest_version(packages):
>       """
>       Fills in the .latest_version field of all Package objects
>   
> -    This field has a special format:
> -      (status, version, id)
> -    with:
> +    This field is a dict and has the following keys:
> +
>       - status: one of RM_API_STATUS_ERROR,
>         RM_API_STATUS_FOUND_BY_DISTRO, RM_API_STATUS_FOUND_BY_PATTERN,
>         RM_API_STATUS_NOT_FOUND
> @@ -478,7 +477,9 @@ def check_package_latest_version(packages):
>       worker_pool = Pool(processes=64)
>       results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
>       for pkg, r in zip(packages, results):
> -        pkg.latest_version = r
> +        pkg.latest_version['status'] = r[0]
> +        pkg.latest_version['version'] = r[1]
> +        pkg.latest_version['id'] = r[2]

Bikeshedding, but maybe more elegant:

pkg.latest_version = dict(zip(['status', 'version', 'id'], r))
