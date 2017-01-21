From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Jan 2017 18:19:36 +0100
Subject: [Buildroot] [PATCH 9/9] check-package: check *.mk for typo in
 variable
In-Reply-To: <20161231032110.11573-10-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
 <20161231032110.11573-10-ricardo.martincoski@gmail.com>
Message-ID: <d4c92dd2-1140-224e-090b-291b4b1e9e40@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo,

Le 31/12/2016 ? 04:21, Ricardo Martincoski a ?crit :
> Warn when a variable is defined in a .mk file and it don't start with
> the package name.
> 
> This function generates false warnings and the maintenance of the
> whitelist can be an extra burden, but it catches some typos really hard
> to see:
> - POPLER_CONF_OPTS [1]
> - BALELD_LICENSE [2]
> - DRDB_UTILS_DEPENDENCIES [3]
> - PERL_LIBWWW_LICENSE_FILES [4]
> - AVRDUDR_LICENSE_FILES [5]
> - GST1_PLUGINS_ULGY_HAS_GPL_LICENSE [6]
> - ON2_8170_LICENSE [7]
> - LIBFDTI_CONF_OPTS [8][9]
> - IPSEC_DEPENDENCIES [10]
> 
> [1] http://patchwork.ozlabs.org/patch/681533
> [2] http://patchwork.ozlabs.org/patch/643293
> [3] http://patchwork.ozlabs.org/patch/449589
> [4] http://patchwork.ozlabs.org/patch/464545
> [5] http://patchwork.ozlabs.org/patch/305060
> [6] http://patchwork.ozlabs.org/patch/253089
> [7] http://patchwork.ozlabs.org/patch/250523
> [8] http://patchwork.ozlabs.org/patch/394125
> [9] https://github.com/buildroot/buildroot/commit/fe7a4b524b72bcb448f7e723873d8244620cb2f1
> [10] https://github.com/buildroot/buildroot/commit/dff1d590b2a0fadf58b6eed60029b2ecbab7c710

This one produce a false positive with MYSQL_SOCKET from oracle-mysql because
it's a virtual package providing mysql:

package/oracle-mysql/oracle-mysql.mk:19: possible typo: MYSQL_SOCKET ->
*ORACLE_MYSQL*

MYSQL_SOCKET = /run/mysql/mysql.sock

ORACLE_MYSQL_PROVIDES = mysql

Maybe we could add an exception for variables named <<provider_name>_PROVIDES>_* ?

MYSQL_SOCKET is used in mariadb and php packages.

Other warnings (15) are real real typo or variable without the right package prefix.

Best regards,
Romain

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> 
> Notes:
>     $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
>     
>     real	0m3.088s
>     user	0m3.012s
>     sys	0m0.072s
>     
>     CHECK_TYPO_IN_PACKAGE_VARIABLE:
>      support/scripts/check-package --include-only check_typo_in_package_variable \
>      $(find package -name '*.mk') 2>/dev/null | wc -l
>       17
>      (cd support/scripts/check-package-example && \
>      ../check-package --include-only check_typo_in_package_variable -vv package/*/*)
>       package/package1/package1.mk:31: possible typo: LINUX_DEPENDENCIES -> *PACKAGE1*
>       LINUX_DEPENDENCIES = messing with others
>       package/package1/package1.mk:32: possible typo: PACKACE1_DEPENDENCIES -> *PACKAGE1*
>       PACKACE1_DEPENDENCIES = typo
>       159 lines processed
>       2 warnings generated
> 
>  support/scripts/checkpackagelib_mk.py | 44 +++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/support/scripts/checkpackagelib_mk.py b/support/scripts/checkpackagelib_mk.py
> index 40574584a..50d22abfc 100644
> --- a/support/scripts/checkpackagelib_mk.py
> +++ b/support/scripts/checkpackagelib_mk.py
> @@ -141,6 +141,50 @@ def check_trailing_backslash(
>                  check_trailing_backslash.lastline]
>  
>  
> +ALLOWED = re.compile("|".join([
> +    "ACLOCAL_DIR",
> +    "ACLOCAL_HOST_DIR",
> +    "BR_CCACHE_INITIAL_SETUP",
> +    "BR_NO_CHECK_HASH_FOR",
> +    "LINUX_POST_PATCH_HOOKS",
> +    "LINUX_TOOLS",
> +    "LUA_RUN",
> +    "MKFS_JFFS2",
> +    "MKIMAGE_ARCH",
> +    "PKG_CONFIG_HOST_BINARY",
> +    "TARGET_FINALIZE_HOOKS",
> +    "XTENSA_CORE_NAME"]))
> +PACKAGE_NAME = re.compile("/([^/]+)\.mk")
> +VARIABLE = re.compile("^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
> +
> +
> +def check_typo_in_package_variable(
> +        fname, args, lineno=0, text=None, start=False, end=False):
> +    if start:
> +        package = PACKAGE_NAME.search(fname).group(1).replace("-", "_").upper()
> +        # linux tools do not use LINUX_TOOL_ prefix for variables
> +        package = package.replace("LINUX_TOOL_", "")
> +        check_typo_in_package_variable.package = package
> +        check_typo_in_package_variable.REGEX = re.compile(
> +            "^(HOST_)?({}_[A-Z0-9_]+)".format(package))
> +        return
> +    if end:
> +        return
> +
> +    m = VARIABLE.search(text)
> +    if m is None:
> +        return
> +
> +    variable = m.group(1)
> +    if ALLOWED.match(variable):
> +        return
> +    if check_typo_in_package_variable.REGEX.search(text) is None:
> +        return ["{}:{}: possible typo: {} -> *{}*"
> +                .format(fname, lineno, variable,
> +                        check_typo_in_package_variable.package),
> +                text]
> +
> +
>  DEFAULT_AUTOTOOLS_FLAG = re.compile("^.*{}".format("|".join([
>      "_AUTORECONF\s*=\s*NO",
>      "_LIBTOOL_PATCH\s*=\s*YES"])))
> 
