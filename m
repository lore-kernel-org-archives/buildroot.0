From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 05:41:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20081208134156.9F5533C6FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 05:41:56 -0800 (Mon, 08 Dec 2008)
New Revision: 24319

Log:
package/udev: fix CFLAGS for udev extras

If the udev extras are built without large file support in uClibc,
I get the following error:

 build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc -c -g -Wall
 -pipe -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -Wstrict-prototypes
 -Wsign-compare -Wshadow -Wchar-subscripts -Wmissing-declarations
 -Wnested-externs -Wpointer-arith -Wcast-align -Wsign-compare
 -Wmissing-prototypes -Os ext.c -o ext.o
 In file included from build_powerpc/staging_dir/usr/include/stdio.h:28,
 from ext.c:19:
 build_powerpc/staging_dir/usr/include/features.h:382:4: error:
 #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately,
 uClibc was built without large file support enabled.

Although the base udev package builds correctly, the extras pacakges
don't adjust their CFLAGS depending on BR2_LARGEFILE.

This change adds the required CFLAGS modifications to make the
extras build.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Modified:
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2008-12-08 13:41:53 UTC (rev 24318)
+++ trunk/buildroot/package/udev/udev.mk	2008-12-08 13:41:56 UTC (rev 24319)
@@ -81,6 +81,7 @@
 
 $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION):
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="extras/volume_id" -C $(UDEV_DIR)
 	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/usr/include/libvolume_id.h
@@ -125,6 +126,7 @@
 
 $(TARGET_DIR)/lib/udev/scsi_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="extras/scsi_id" -C $(UDEV_DIR)
 	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/scsi_id/scsi_id $(TARGET_DIR)/lib/udev/scsi_id
@@ -132,6 +134,7 @@
 
 $(TARGET_DIR)/lib/udev/usb_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="extras/usb_id" -C $(UDEV_DIR)
 	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/usb_id/usb_id $(TARGET_DIR)/lib/udev/usb_id
