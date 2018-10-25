From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 25 Oct 2018 09:43:10 +0200
Subject: [Buildroot] [PATCH v3] merge_config.sh: merge also buildroot
 config files
In-Reply-To: <20181025022031.14043-1-afshin.nasser@gmail.com>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
Message-ID: <20181025074309.GB18528@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

> This patch adds a way to merge buildroot config file programmatically.
> It adds an option (-b, buildroot mode) to manage buildroot config files.
> The buildroot mode changes the way the script looks for configurations
> entries using the BR2_ prefix and modify the call to the make command
> to be buildroot friendly.

> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM. Could you please add commit where you actually use -b option?
I guess it should be in utils/test-pkg and support/kconfig/Makefile.
Not sure whether all packages using kconfig-package are using prefix CONFIG_,
but probably yes.

I'd suggest to move underscore to $SED_CONFIG_EXP. Or is it less intuitive?

> +CONFIG_PREFIX=CONFIG_
   CONFIG_PREFIX=CONFIG

>  while true; do
>  	case $1 in
> @@ -71,6 +73,11 @@ while true; do
>  		shift 2
>  		continue
>  		;;
> +	"-b")
> +		CONFIG_PREFIX=BR2_
		CONFIG_PREFIX=BR2

...
>  MERGE_LIST=$*
> -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> +SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
   SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}_[a-zA-Z0-9_]*\)[= ].*/\2/p"

BTW There is some mixed spaces and tabs (pwclient fixed that but bare that in
mind next time):
Description: [v3] merge_config.sh: merge also buildroot config files
Applying: merge_config.sh: merge also buildroot config files
.git/rebase-apply/patch:63: space before tab in indent.
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
.git/rebase-apply/patch:64: space before tab in indent.
 	echo "  -h    display this help text"
.git/rebase-apply/patch:66: space before tab in indent.
 	echo "  -m    only merge the fragments, do not execute the make command"
.git/rebase-apply/patch:67: space before tab in indent.
 	echo "  -n    use allnoconfig instead of alldefconfig"
.git/rebase-apply/patch:68: space before tab in indent.
 	echo "  -r    list redundant entries when merging fragments"
warning: squelched 10 whitespace errors


Kind regards,
Petr
