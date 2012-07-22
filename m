From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:20:52 +0200
Subject: [Buildroot] [PATCH 01/11] libgpg-error: add optional nls support
In-Reply-To: <1342963719-1810-2-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20120722162052.544460b7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 22 Jul 2012 15:28:29 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> +LIBGPG_ERROR_DEPENDENCIES += gettext libintl
> +LIBGPG_ERROR_CONF_OPT += --enable-nls
> +else
> +LIBGPG_ERROR_CONF_OPT += --disable-nls
> +endif

This means that NLS support will always be enabled for uClibc
toolchains, and never be enabled for (e)glibc toolchains.

See the definition of BR2_NEEDS_GETTEXT and BR2_NEEDS_GETTEXT_IF_LOCALE:

---

# glibc and eglibc directly include gettext, so a separatly compiled
# gettext isn't needed and shouldn't be built to avoid conflicts. Some
# packages always need gettext, other packages only need gettext when
# locale support is enabled. See the documentation for how packages
# should rely on the following two options.

config BR2_NEEDS_GETTEXT
        bool
        default y if BR2_TOOLCHAIN_BUILDROOT
        default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
        default y if BR2_TOOLCHAIN_CTNG_uClibc

config BR2_NEEDS_GETTEXT_IF_LOCALE
        bool
        default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)

---

The fact that there is a dependency on gettext+libintl for i18n support
on uClibc toolchains is correct. The fact that
--enable-nls/--disable-nls is decided depending on
BR2_NEEDS_GETTEXT_IF_LOCALE is not correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
