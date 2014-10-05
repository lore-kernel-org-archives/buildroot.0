From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 17:23:22 +0200
Subject: [Buildroot] [PATCH 7/8] Apache: New package
In-Reply-To: <1412516718-12597-7-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <1412516718-12597-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005152322.GL4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-05 15:45 +0200, Bernd Kuhls spake thusly:
[--SNIP--]
> diff --git a/package/apache/apache-0001-cross-compile.patch b/package/apache/apache-0001-cross-compile.patch
> new file mode 100644
> index 0000000..05e99dd
> --- /dev/null
> +++ b/package/apache/apache-0001-cross-compile.patch
> @@ -0,0 +1,58 @@
> +Fix cross-compilation
> +
> +Fetched httpd-2.4.x-cross_compile.diff from upstream bugtracker:
> +https://issues.apache.org/bugzilla/show_bug.cgi?id=51257#c6

which is a bundle of upstream revisions:
    http://svn.apache.org/viewvc?view=revision&revision=1327907
    http://svn.apache.org/viewvc?view=revision&revision=1328390
    http://svn.apache.org/viewvc?view=revision&revision=1328714

;-)

[--SNIP--]
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> new file mode 100644
> index 0000000..d525024
> --- /dev/null
> +++ b/package/apache/apache.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# apache
> +#
> +################################################################################
> +
> +APACHE_VERSION = 2.4.10
> +APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
> +APACHE_SITE = http://archive.apache.org/dist/httpd
> +APACHE_LICENSE = Apache-2.0
> +APACHE_LICENSE_FILES = LICENSE
> +APACHE_INSTALL_STAGING = YES

Why do you meed to install it in staging?

Answer: I guess that's becasue apache installs headers and libs so that
it is possible to build out-of-apache modules. Right?

Say so, because it is not obvious.

> +APACHE_AUTORECONF = YES

Ditto as for apr: short explanation why autoreconf is needed.

> +APACHE_DEPENDENCIES = apr-util pcre

Apache does not need apr directly, too?

> +APACHE_CONF_ENV= \
> +	CC_FOR_BUILD="$(HOSTCC)" \
> +	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
> +	ap_cv_void_ptr_lt_long=no \
> +	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
> +
> +APACHE_CONF_OPTS = \
> +	--sysconfdir=/etc/apache2 \
> +	--with-apr=$(STAGING_DIR)/usr \
> +	--with-apr-util=$(STAGING_DIR)/usr \
> +	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
> +	--enable-http \
> +	--enable-dbd \
> +	--enable-proxy \
> +	--enable-mime-magic \
> +	--without-suexec-bin \
> +	--enable-mods-shared=all \
> +	--with-mpm=worker \

This could later be made a choice option.

> +	--enable-nonportable-atomics=yes

Can you shade some explanations to this one? How would it work with:
    BR2_ARCH_HAS_ATOMICS

Regards,
Yann E. MORIN.

> +define APACHE_FIX_STAGING_APACHE_CONFIG
> +	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
> +	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
> +endef
> +APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
> +
> +$(eval $(autotools-package))
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
