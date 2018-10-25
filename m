From: Marcel Patzlaff <M.Patzlaff@pilz.de>
Date: Thu, 25 Oct 2018 08:02:14 +0200
Subject: [Buildroot] Antwort: [PATCH v3] merge_config.sh: merge also
 buildroot config files
In-Reply-To: <20181025022031.14043-1-afshin.nasser@gmail.com>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
Message-ID: <OFFE2543D5.00FA2BCE-ONC1258331.0020E29D-C1258331.002129E5@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nasser, Arnout,

after looking into the uclibc config, I think it would be better to
just remove the prefix restriction completely. What purpose does
filtering for "CONFIG_" or "BR2_" serve?

Kind regards,
Marcel

"buildroot" <buildroot-bounces@busybox.net> schrieb am 25.10.2018 
04:20:31:

> Von: Nasser Afshin <afshin.nasser@gmail.com>
> An: Arnout Vandecappelle <arnout@mind.be>
> Kopie: Nasser Afshin <afshin.nasser@gmail.com>, buildroot 
> <buildroot@buildroot.org>
> Datum: 25.10.2018 04:21
> Betreff: [Buildroot] [PATCH v3] merge_config.sh: merge also 
> buildroot config files
> Gesendet von: "buildroot" <buildroot-bounces@busybox.net>
> 
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch adds a way to merge buildroot config file programmatically.
> It adds an option (-b, buildroot mode) to manage buildroot config files.
> The buildroot mode changes the way the script looks for configurations
> entries using the BR2_ prefix and modify the call to the make command
> to be buildroot friendly.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
> ---
> I forgot to apply the presented patch. Now it's applied.
> 
>  support/kconfig/merge_config.sh                    |  9 ++++-
>  ...18-fix-finding-redundant-config-mechanism.patch | 41 +++++++++++
> +++++++++++
>  support/kconfig/patches/series                     |  1 +
>  3 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 support/kconfig/patches/18-fix-finding-
> redundant-config-mechanism.patch
> 
> diff --git a/support/kconfig/merge_config.sh 
b/support/kconfig/merge_config.sh
> index 67d1314476..f22198023c 100755
> --- a/support/kconfig/merge_config.sh
> +++ b/support/kconfig/merge_config.sh
> @@ -29,6 +29,7 @@ trap clean_up HUP INT TERM
>  usage() {
>     echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
>     echo "  -h    display this help text"
> +   echo "  -b    buildroot mode (searches for BR2_ and uses a 
> custom make command)"
>     echo "  -m    only merge the fragments, do not execute the make 
command"
>     echo "  -n    use allnoconfig instead of alldefconfig"
>     echo "  -r    list redundant entries when merging fragments"
> @@ -39,6 +40,7 @@ RUNMAKE=true
>  ALLTARGET=alldefconfig
>  WARNREDUN=false
>  OUTPUT=.
> +CONFIG_PREFIX=CONFIG_
> 
>  while true; do
>     case $1 in
> @@ -71,6 +73,11 @@ while true; do
>        shift 2
>        continue
>        ;;
> +   "-b")
> +      CONFIG_PREFIX=BR2_
> +      shift
> +      continue
> +      ;;
>     *)
>        break
>        ;;
> @@ -99,7 +106,7 @@ if [ ! -r "$INITFILE" ]; then
>  fi
> 
>  MERGE_LIST=$*
> -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> +SED_CONFIG_EXP="s/^\(# 
\)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[=].*/\2/p"
>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> 
>  echo "Using $INITFILE as base"
> diff --git a/support/kconfig/patches/18-fix-finding-redundant-
> config-mechanism.patch b/support/kconfig/patches/18-fix-finding-
> redundant-config-mechanism.patch
> new file mode 100644
> index 0000000000..eec92a5fad
> --- /dev/null
> +++ 
b/support/kconfig/patches/18-fix-finding-redundant-config-mechanism.patch
> @@ -0,0 +1,41 @@
> +Index: kconfig/merge_config.sh
> +===================================================================
> +--- kconfig.orig/merge_config.sh
> ++++ kconfig/merge_config.sh
> +@@ -29,6 +29,7 @@ trap clean_up HUP INT TERM
> + usage() {
> +    echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
> +    echo "  -h    display this help text"
> ++   echo "  -b    buildroot mode (searches for BR2_ and uses a 
> custom make command)"
> +    echo "  -m    only merge the fragments, do not execute the make 
command"
> +    echo "  -n    use allnoconfig instead of alldefconfig"
> +    echo "  -r    list redundant entries when merging fragments"
> +@@ -39,6 +40,7 @@ RUNMAKE=true
> + ALLTARGET=alldefconfig
> + WARNREDUN=false
> + OUTPUT=.
> ++CONFIG_PREFIX=CONFIG_
> + 
> + while true; do
> +    case $1 in
> +@@ -71,6 +73,11 @@ while true; do
> +       shift 2
> +       continue
> +       ;;
> ++   "-b")
> ++      CONFIG_PREFIX=BR2_
> ++      shift
> ++      continue
> ++      ;;
> +    *)
> +       break
> +       ;;
> +@@ -99,7 +106,7 @@ if [ ! -r "$INITFILE" ]; then
> + fi
> + 
> + MERGE_LIST=$*
> +-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> ++SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)
> [= ].*/\2/p"
> + TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> + 
> + echo "Using $INITFILE as base"
> diff --git a/support/kconfig/patches/series 
b/support/kconfig/patches/series
> index 36591e2189..5ebc2e0225 100644
> --- a/support/kconfig/patches/series
> +++ b/support/kconfig/patches/series
> @@ -6,3 +6,4 @@
>  14-support-out-of-tree-config.patch
>  16-fix-space-to-de-select-options.patch
>  17-backport-kecho.patch
> +18-fix-finding-redundant-config-mechanism.patch
> -- 
> 2.15.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
