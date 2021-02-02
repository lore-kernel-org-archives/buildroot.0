From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2021 20:29:03 +0100
Subject: [Buildroot] [PATCH v2 2/7] support/scripts/pkg-stats: properly
 handle host packages with -c option
In-Reply-To: <20210131133819.1818537-3-thomas.petazzoni@bootlin.com>
References: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
 <20210131133819.1818537-3-thomas.petazzoni@bootlin.com>
Message-ID: <ab88d31b-00a3-dcee-24ca-2ed431c094f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/01/2021 14:38, Thomas Petazzoni wrote:
> In commit 7a607dab336e7f78ab069cff1b503d0688950583
> ("support/scripts/pkg-stats: support generating stats based on
> configured packages"), we added a -c option to pkg-stats to generate a
> report based on the list of packages enabled in the configuration,
> rather than for all packages.
> 
> This is done based on the list of packages returned in JSON format by
> "make show-info". However, we use the keys of the JSON dict returned
> by "make show-info", which include the host- prefix of host
> packages. Due to this, none of the host packages are currently
> matching and therefore they are not reported in the pkg-stats -c
> output.
> 
> This commit fixes that by using the recently introduced "name"
> property in the "make show-info" JSON dict.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 This and the previous patch applied to master, thanks.

 The rest will have to wait for Gregory's SoB, but I'll review it.

 Regards,
 Arnout

> ---
>  support/scripts/pkg-stats | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index d222ba37c3..0d4e781e3b 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -358,7 +358,7 @@ def get_pkglist(npackages, package_list):
>  def get_config_packages():
>      cmd = ["make", "--no-print-directory", "show-info"]
>      js = json.loads(subprocess.check_output(cmd))
> -    return js.keys()
> +    return set([v["name"] for k, v in js.items()])
>  
>  
>  def package_init_make_info():
> 
