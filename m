From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 22:50:23 +0100
Subject: [Buildroot] [PATCH v7,1/1] php: add apache support
In-Reply-To: <1481495356-24462-1-git-send-email-fabrice.fontaine@orange.com>
References: <1481495356-24462-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161212225023.03d99bc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 23:29:16 +0100, Fabrice Fontaine wrote:

> diff --git a/package/php/0008-Call-apxs-with-correct-prefix.patch b/package/php/0008-Call-apxs-with-correct-prefix.patch
> new file mode 100644
> index 0000000..b850ab7
> --- /dev/null
> +++ b/package/php/0008-Call-apxs-with-correct-prefix.patch
> @@ -0,0 +1,49 @@
> +From 4342bdea7a1a21430ce0d051fa4387441166c473 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fabrice.fontaine@orange.com>
> +Date: Sun, 11 Dec 2016 23:12:46 +0100
> +Subject: [PATCH] Call apxs with correct prefix
> +
> +php uses apache's apxs script from staging directory to install libphp
> +dynamic library and update /etc/apache2/httpd.conf in the staging and target
> +directories. Here is the full command line:
> +"apxs -S LIBEXECDIR='$(INSTALL_ROOT)/usr/modules'
> + -S SYSCONFDIR='$(INSTALL_ROOT)/etc/apache2' -i -a -n php7"
> +This does not work for target directory as apxs sets the full path of the
> +library and not the relative one. Indeed, apxs is smart enough to substitute
> +away the prefix specified in $(STAGING_DIR)/usr/build/config_vars.mk so
> +httpd.conf will only be correct in the staging directory.
> +To fix this, add -S PREFIX='$(INSTALL_ROOT)/usr' to apxs call in configure
> +
> +Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Thanks, this approach is better I believe.

> +diff --git a/sapi/apache2handler/config.m4 b/sapi/apache2handler/config.m4
> +index 2e64b21..f5bf002 100644
> +--- a/sapi/apache2handler/config.m4
> ++++ b/sapi/apache2handler/config.m4
> +@@ -66,10 +66,12 @@ if test "$PHP_APXS2" != "no"; then
> +     AC_MSG_ERROR([Please note that Apache version >= 2.0.44 is required])
> +   fi
> + 
> ++  APXS_PREFIX='$(INSTALL_ROOT)'/usr

This is still wrong, because the prefix could be something else
than /usr. However, if you query APXS -q PREFIX, it returns
$(STAGING_DIR)/usr, which is not what you want.

In fact, this is all messed up by the fact that we want APXS to
automagically return results prefixed by $(STAGING_DIR), in order for
the build to work fine, but in your case, you want some of the things
to take place on $(TARGET_DIR) as well at installation time. Somewhat
conflicting needs, not easy to handle with the current situation.

Bottom line: I've applied your patch as-is, since I don't see really
how to do things better for the moment.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
