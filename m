From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:48:16 +0200
Subject: [Buildroot] [PATCH] axel: bump to version 2.15
In-Reply-To: <20171011014129.32230-1-ismael@iodev.co.uk>
References: <20171011014129.32230-1-ismael@iodev.co.uk>
Message-ID: <20171011234816.00e5534b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this update!

On Tue, 10 Oct 2017 22:41:29 -0300, Ismael Luceno wrote:

> -ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> -AXEL_DISABLE_I18N = --i18n=0
> +ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +AXEL_CONF_OPTS += --with-ssl
> +AXEL_DEPENDENCIES += libressl
> +else ifeq ($(BR2_PACKAGE_LIBRESSL),y)

This should be BR2_PACKAGE_OPENSSL

> +AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)

Such a variable has no effect with the autotools-package
infrastructure, to it is useless.

So you probably want to check instead if it's still needed:

 - To check if -lpthread is needed, build with a glibc toolchain
   toolchain, for example
   support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config

 - To check if $(TARGET_NLS_LIBS) is needed, build with a uClibc
   toolchain, for example
   support/config-fragments/autobuild/br-arm-full.config, and enable
   BR2_SYSTEM_ENABLE_NLS.

Ideally, none of these should be needed, and the configure script of
axel should automatically figure out if it needs to link against
-lpthread and/or -lintl.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
