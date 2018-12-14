From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:37:51 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] alsa-utils: fix udev build with pkgconf 1.5.3
In-Reply-To: <20181214155435.31884-1-fontaine.fabrice@gmail.com>
References: <20181214155435.31884-1-fontaine.fabrice@gmail.com>
Message-ID: <20181214223751.60308367@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 14 Dec 2018 16:54:34 +0100, Fabrice Fontaine wrote:

> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +ALSA_UTILS_CONF_OPTS += --with-udev-rules-dir=/usr/lib/udev/rules.d
> +endif

I think this is still wrong: we should pass the --with-udev-rules-dir
option unconditionally.

Indeed, the udev files are installed unconditionally by alsa-utils,
regardless of whether udev is present or not.

Currently what happens is that if udev is not installed, the rules are
installed in /lib/udev/rules.d/. If udev is installed, then the udev.pc
file is found, and this is where the issue happens with pkg-config
1.5.3, and which you work-around here.

See:

$ find output/staging/ | grep udev
output/staging/lib/udev
output/staging/lib/udev/rules.d
output/staging/lib/udev/rules.d/89-alsa-ucm.rules
output/staging/lib/udev/rules.d/90-alsa-restore.rules

$ grep UDEV .config
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_UDEV_RULES_GEN is not set
# BR2_PACKAGE_UDEV_ALL_EXTRAS is not set

Note: the rule files are not installed to TARGET_DIR, because we don't
run "make install" for alsa-utils, but only manually install things to
the target (which is a bit crappy, but that's a separate issue).

Also, I'm not convinced /usr/lib/udev/rules.d is the right
place, /lib/udev/rules.d seems common. But Buildroot is not very
consistent on this:

$ git grep "/lib/udev" | cat
package/bcache-tools/bcache-tools.mk:# expects the /lib/udev/rules.d directory to exist.
package/bcache-tools/bcache-tools.mk:	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/udev/rules.d
package/gpsd/gpsd.mk:	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
package/libgphoto2/libgphoto2.mk:LIBGPHOTO2_CONF_ENV = udevscriptdir=/lib/udev
package/libv4l/libv4l.mk:LIBV4L_CONF_OPTS += --with-udevdir=/usr/lib/udev
package/systemd/Config.in:	  Enables hardware database installation to /usr/lib/udev/hwdb.d
package/tpm2-abrmd/tpm2-abrmd.mk:	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no)
package/triggerhappy/triggerhappy.mk:		$(TARGET_DIR)/lib/udev/rules.d/triggerhappy.rules
package/usbmount/usbmount.mk:	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules

Some packages install them in /lib/udev, some in /usr/lib/udev. Not
good. So, for the alsa-utils patch, just unconditionally do:

	--with-udev-rules-dir=/lib/udev/rules.d

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
