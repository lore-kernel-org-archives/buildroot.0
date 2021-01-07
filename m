From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jan 2021 22:32:07 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: properly handle
 host packages with -c option
In-Reply-To: <20210107211336.3030397-2-thomas.petazzoni@bootlin.com>
References: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
 <20210107211336.3030397-2-thomas.petazzoni@bootlin.com>
Message-ID: <20210107213207.GO1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-07 22:13 +0100, Thomas Petazzoni spake thusly:
> In commit 7a607dab336e7f78ab069cff1b503d0688950583
> ("support/scripts/pkg-stats: support generating stats based on
> configured packages"), we added a -c option to pkg-stats to generate a
> report based on the list of packages enabled in the configuration,
> rather than for all packages.
> 
> This is done based on the list of packages returned in JSON format by
> "make show-info". However, this JSON output contains really the actual
> name of packages, including their host- prefix for host packages. Due
> to this, none of the host packages were matching and therefore
> reported in the pkg-stats -c output.
> 
> This commit fixes that by stripping the host- prefix for host
> packages.

I think the correct fix would be for the json output to already contain
the base name of the package, and the script to use that field, rather
than the key, as a package name. That way, the behaviour would be the
same for both target and host packages.

Something like:

    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index a2cc160d0b..0f9d612f12 100644
    --- a/package/pkg-utils.mk
    +++ b/package/pkg-utils.mk
    @@ -91,6 +91,7 @@ endef
     # $(1): upper-case package or filesystem name
     define json-info
     	"$($(1)_NAME)": {
    +		"name": "$($(1)_RAWNAME)",
     		"type": "$($(1)_TYPE)",
     		$(if $(filter rootfs,$($(1)_TYPE)), \
     			$(call _json-info-fs,$(1)), \

Regards,
Yann E. MORIN.

> Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 4a9ff1ffa0..eabbcc72b6 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -353,7 +353,13 @@ def get_pkglist(npackages, package_list):
>  def get_config_packages():
>      cmd = ["make", "--no-print-directory", "show-info"]
>      js = json.loads(subprocess.check_output(cmd))
> -    return js.keys()
> +    pkgs = list()
> +    for k, v in js.items():
> +        if v["type"] == "host":
> +            pkgs.append(k[5:])
> +        else:
> +            pkgs.append(k)
> +    return pkgs
>  
>  
>  def package_init_make_info():
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
