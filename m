From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 May 2013 16:41:02 +0200
Subject: [Buildroot] [PATCH v3 1/2] lockdev: add lockdev
In-Reply-To: <1367964142-23036-1-git-send-email-spenser@gillilanding.com>
References: <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
 <1367964142-23036-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130508164102.5e7d3247@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue,  7 May 2013 17:02:21 -0500, Spenser Gilliland wrote:

> diff --git a/package/lockdev/Config.in b/package/lockdev/Config.in
> new file mode 100644
> index 0000000..2bd75d1
> --- /dev/null
> +++ b/package/lockdev/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_LOCKDEV
> +	bool "lockdev"
> +	help
> +	  library for locking devices

A few more details would be nice to have here, but I see that the
package itself doesn't really provide a more detailed description of
what it does. It also apparently doesn't have an upstream site.

> +LOCKDEV_VERSION = 1.0.3
> +LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
> +LOCKDEV_SITE = http://ftp.debian.org/debian/pool/main/l/lockdev/

You should use BR2_DEBIAN_MIRROR here. See package/argus/argus.mk for
example. Or probably better, use http://snapshot.debian.net/, as in
package/fakeroot/fakeroot.mk. Using snapshot.debian.net ensures that
the file will always be present at this location.

> +LOCKDEV_LICENSE = LGPLv2.1

I checked and confirm that the license appears to be LGPLv2.1, without
the plus.

> +LOCKDEV_LICENSE_FILE = LICENSE

LOCKDEV_LICENSE_FILES

> +LOCKDEV_INSTALL_STAGING = YES
> +
> +define LOCKDEV_BUILD_CMDS
> +	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static shared
> +endef

Building the shared variant will not work when
BR2_PREFER_STATIC_LIB=y.

> +define LOCKDEV_INSTALL_STAGING_CMDS
> +	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install
> +	ln -sf $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
> +	ln -sf $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
> +endef
> +
> +define LOCKDEV_INSTALL_TARGET_CMDS
> +	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install
> +	ln -sf $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
> +endef

I am not sure using the 'install' target is appropriate here. Looking
at the package Makefile, it not only installs the library, in usr/lib,
but also some debug stuff in usr/lib/debug, some profile stuff in
usr/lib/profile, etc.

So, I believe it should probably be something like (untested) :

ifeq ($(BR2_PREFER_STATIC_LIB),y)
define LOCKDEV_BUILD_CMDS
	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
endef

define LOCKDEV_INSTALL_STAGING_CMDS
	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev
endef

else # BR2_PREFER_STATIC_LIB

define LOCKDEV_BUILD_CMDS
	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static shared
endef

define LOCKDEV_INSTALL_STAGING_CMDS
	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev install_run
	ln -sf $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
	ln -sf $(STAGING_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
endef

define LOCKDEV_INSTALL_TARGET_CMDS
	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
	ln -sf $(TARGET_DIR)/usr/lib/liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
endef

endif # BR2_PREFER_STATIC_LIB

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
