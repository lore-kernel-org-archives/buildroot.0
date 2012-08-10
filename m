From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Aug 2012 09:41:39 +0200
Subject: [Buildroot] [PATCH] Add package linux-pam
In-Reply-To: <1344569575-25960-1-git-send-email-golubovsky@gmail.com>
References: <1344569575-25960-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120810094139.12fbf1f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dmitry,

Le Thu,  9 Aug 2012 23:32:55 -0400,
Dmitry <golubovsky@gmail.com> a ?crit :

> Signed-off-by: Dmitry <golubovsky@gmail.com>
> ---

Thanks, this looks good! A few comments below.

>  package/Config.in                                 |    1 +
>  package/linux-pam/Config.in                       |   15 ++++++++++++
>  package/linux-pam/linux-pam-configure.patch       |   11 +++++++++
>  package/linux-pam/linux-pam-doc-makefile-am.patch |   25 +++++++++++++++++++++
>  package/linux-pam/linux-pam-group.patch           |   18 +++++++++++++++
>  package/linux-pam/linux-pam-rhosts.patch          |   16 +++++++++++++
>  package/linux-pam/linux-pam-succeed.patch         |   23 +++++++++++++++++++
>  package/linux-pam/linux-pam-time.patch            |   18 +++++++++++++++

Each of your patches should contain a header with a description +
Signed-off-by line. See
package/libfcgi/libfcgi-link-against-libfcgi-la.patch for example.

> +++ b/package/linux-pam/linux-pam.mk
> @@ -0,0 +1,21 @@
> +############################################
> +#
> +# linux-pam
> +# 
> +############################################
> +
> +LINUX_PAM_VERSION = 1.1.4
> +LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
> +LINUX_PAM_SITE = http://linux-pam.org/library/
> +LINUX_PAM_INSTALL_STAGING = YES
> +LINUX_PAM_INSTALL_TARGET = YES

This line is not needed, please remove.

> +LINUX_PAM_CONF_OPT = --disable-prelude --disable-isadir --disable-nis --disable-regenerate-docu
> +LINUX_PAM_CONF_OPT += --enable-securedir=/lib/security --libdir=/lib

We generally format this in a different way:

LINUX_PAM_CONF_OPT = \
	--disable-prelude \
	--disable-isadir  \
	--disable-nis     \
	--disable-regenerate-docu \
	--enable-securedir=/lib/security \
	--libdir=/lib

> +LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) libintl flex

I think libintl should be part of the $(if
$(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) conditional: when building with
a glibc toolchain, BR2_NEEDS_GETTEXT_IF_LOCALE will be false, because
glibc has a builtin version of libintl.

> +LINUX_PAM_AUTORECONF = YES
> +
> +define LINUX_PAM_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC) -lintl -lfl" LD="$(TARGET_LD)" -C $(@D) all
> +endef

Instead of overriding LINUX_PAM_BUILD_CMDS, I would recommend using:

LINUX_PAM_CONF_ENV += \
	CC="$(TARGET_CC) -lintl -lfl"

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
