From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 16:42:48 +0200
Subject: [Buildroot] [PATCH 1/8] package/apr: Bump version to 1.5.1
In-Reply-To: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005144248.GG4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-05 15:45 +0200, Bernd Kuhls spake thusly:
> apr-0001-cross-compile.patch: Fix cross compilation
> Fix top_builddir in usr/build-1/apr_rules.mk
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apr/apr-0001-cross-compile.patch |   53 ++++++++++++++++++++++++++++++
>  package/apr/apr.mk                       |    7 +++-
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 package/apr/apr-0001-cross-compile.patch
> 
> diff --git a/package/apr/apr-0001-cross-compile.patch b/package/apr/apr-0001-cross-compile.patch
> new file mode 100644
> index 0000000..6bd1194
> --- /dev/null
> +++ b/package/apr/apr-0001-cross-compile.patch
> @@ -0,0 +1,53 @@
> +Fix cross-compilation
> +
> +Patch submitted upstream:
> +https://issues.apache.org/bugzilla/show_bug.cgi?id=57058

which is a bundle of upstream revisions:
    http://svn.apache.org/viewvc?view=revision&revision=1327907
    http://svn.apache.org/viewvc?view=revision&revision=1328390
    http://svn.apache.org/viewvc?view=revision&revision=1328714

[--SNIP rest of patch--]
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index 1a4c0e2..bdf4c78 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -4,12 +4,15 @@
>  #
>  ################################################################################
>  
> -APR_VERSION = 1.4.8
> +APR_VERSION = 1.5.1
>  APR_SITE = http://archive.apache.org/dist/apr
>  APR_LICENSE = Apache-2.0
>  APR_LICENSE_FILES = LICENSE
>  APR_INSTALL_STAGING = YES
> +APR_AUTORECONF = YES

Usually, we explicit why autoreconf is needed:

    # We have a patch touching configure.in and Makefile.in,
    # so we need to autoreconf:
    APR_AUTORECONF = YES

With the above two, you can add my:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  APR_CONF_ENV = \
> +	CC_FOR_BUILD="$(HOSTCC)" \
> +	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
>  	ac_cv_file__dev_zero=yes \
>  	ac_cv_func_setpgrp_void=yes \
>  	apr_cv_process_shared_works=yes \
> @@ -35,6 +38,8 @@ define APR_FIXUP_RULES_MK
>  		$(STAGING_DIR)/usr/build-1/apr_rules.mk
>  	$(SED) 's%apr_builders=%apr_builders=$(STAGING_DIR)%' \
>  		$(STAGING_DIR)/usr/build-1/apr_rules.mk
> +	$(SED) 's%top_builddir=%top_builddir=$(STAGING_DIR)%' \
> +		$(STAGING_DIR)/usr/build-1/apr_rules.mk
>  endef
>  
>  APR_POST_INSTALL_STAGING_HOOKS += APR_FIXUP_RULES_MK
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
