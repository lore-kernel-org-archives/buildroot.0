From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 21:24:45 +0200
Subject: [Buildroot] [PATCH/RFC v3 02/50] package/libsquish: New package
In-Reply-To: <1437332755-9764-3-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
 <1437332755-9764-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150719212445.3e77f88a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Jul 2015 21:05:07 +0200, Bernd Kuhls wrote:

> diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
> new file mode 100644
> index 0000000..df37368
> --- /dev/null
> +++ b/package/libsquish/libsquish.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# libsquish
> +#
> +################################################################################
> +
> +LIBSQUISH_VERSION = 1.13
> +LIBSQUISH_SOURCE = libsquish-$(LIBSQUISH_VERSION).tgz
> +LIBSQUISH_SITE = http://downloads.sourceforge.net/project/libsquish
> +LIBSQUISH_INSTALL_STAGING = YES
> +LIBSQUISH_STRIP_COMPONENTS = 0
> +LIBSQUISH_LICENSE = MIT
> +LIBSQUISH_LICENSE_FILES = README
> +
> +define LIBSQUISH_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define LIBSQUISH_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
> +		PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
> +	$(INSTALL) -m 644 $(@D)/squish.pc $(STAGING_DIR)/usr/lib/pkgconfig
> +	ln -sf libsquish.so.0.0 $(STAGING_DIR)/usr/lib/libsquish.so
> +
> +endef
> +
> +define LIBSQUISH_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/include/
> +	mkdir -p $(TARGET_DIR)/usr/lib/pkgconfig/
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
> +		PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
> +	ln -sf libsquish.so.0.0 $(TARGET_DIR)/usr/lib/libsquish.so
> +endef
> +
> +$(eval $(generic-package))

Have you considered using the CMakeLists.txt provided in libsquish, and
therefore use the cmake-package infrastructure? It should properly
handle the shared vs. static library case, and reduce the amount of
manual stuff that you need to do in LIBSQUISH_INSTALL_STAGING_CMDS and
LIBSQUISH_INSTALL_TARGET_CMDS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
