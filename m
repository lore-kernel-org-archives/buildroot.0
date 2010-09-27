From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 17:55:18 +0200
Subject: [Buildroot] [git commit master 1/1] vsftpd: convert to gentargets,
	bump version and fix build
Message-ID: <20100927160104.6CF068B6F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed6bdad8a6181d9d128252f1c7a6cb2cce81ab03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vsftpd didn't build, and wasn't using the gentargets infrastructure.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 package/vsftpd/vsftpd-2.0.7-uclibc.patch           |   15 ---
 package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch       |   19 ----
 .../vsftpd/vsftpd-2.3.2-dont-force-largefile.patch |   27 +++++
 package/vsftpd/vsftpd.mk                           |  103 +++++++------------
 5 files changed, 66 insertions(+), 100 deletions(-)
 delete mode 100644 package/vsftpd/vsftpd-2.0.7-uclibc.patch
 delete mode 100644 package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch
 create mode 100644 package/vsftpd/vsftpd-2.3.2-dont-force-largefile.patch

diff --git a/CHANGES b/CHANGES
index ddace92..8677189 100644
--- a/CHANGES
+++ b/CHANGES
@@ -33,7 +33,7 @@
 	pcre, php, prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
 	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
 	tcpdump, thttpd, tiff, tn5250, udev, udpcast, usbmount,
-	usbutils, which, xlib_libX11, zlib
+	usbutils, vsftpd, which, xlib_libX11, zlib
 
 	Deprecated packages: hotplug, lzma
 
diff --git a/package/vsftpd/vsftpd-2.0.7-uclibc.patch b/package/vsftpd/vsftpd-2.0.7-uclibc.patch
deleted file mode 100644
index 43b6ccc..0000000
--- a/package/vsftpd/vsftpd-2.0.7-uclibc.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- vsftpd-2.0.5/sysdeputil.c.orig	2008-10-06 15:24:42.000000000 -0600
-+++ vsftpd-2.0.5/sysdeputil.c	2008-10-06 15:35:35.000000000 -0600
-@@ -159,7 +159,12 @@
- #include <linux/capability.h>
- #include <errno.h>
- #include <syscall.h>
-+/* try to handle kernel header versions correctly (2.4 and >= 2.6.18) */
-+#ifndef capset
-+#define capset(head,data) syscall(__NR_capset,head,data)
-+#else
- _syscall2(int, capset, cap_user_header_t, header, const cap_user_data_t, data)
-+#endif /* capset */
- /* Gross HACK to avoid warnings - linux headers overlap glibc headers */
- #undef __NFDBITS
- #undef __FDMASK
diff --git a/package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch b/package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch
deleted file mode 100644
index 610b782..0000000
--- a/package/vsftpd/vsftpd-2.0.7-uclibc_lfs.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -rdup vsftpd-2.0.5.orig/sysutil.c vsftpd-2.0.5/sysutil.c
---- vsftpd-2.0.5.orig/sysutil.c	2006-07-03 18:26:40.000000000 +0200
-+++ vsftpd-2.0.5/sysutil.c	2006-12-14 15:13:15.000000000 +0100
-@@ -16,11 +16,15 @@
- #include "utility.h"
- #include "tunables.h"
- 
-+#include <features.h>
-+
-+#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
- /* Activate 64-bit file support on Linux/32bit plus others */
- #define _FILE_OFFSET_BITS 64
- #define _LARGEFILE_SOURCE 1
- #define _LARGEFILE64_SOURCE 1
- #define _LARGE_FILES 1
-+#endif
- 
- /* For Linux, this adds nothing :-) */
- #include "port/porting_junk.h"
diff --git a/package/vsftpd/vsftpd-2.3.2-dont-force-largefile.patch b/package/vsftpd/vsftpd-2.3.2-dont-force-largefile.patch
new file mode 100644
index 0000000..b66c25e
--- /dev/null
+++ b/package/vsftpd/vsftpd-2.3.2-dont-force-largefile.patch
@@ -0,0 +1,27 @@
+[PATCH] vsftpd: don't enforce largefile support
+
+In Buildroot we enable/disable largefile support globally, and pass the
+correct defines in CFLAGS, so don't enforce it unconditionally.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ sysutil.c |    6 ------
+ 1 file changed, 6 deletions(-)
+
+Index: vsftpd-2.3.2/sysutil.c
+===================================================================
+--- vsftpd-2.3.2.orig/sysutil.c
++++ vsftpd-2.3.2/sysutil.c
+@@ -17,12 +17,6 @@
+ #include "tunables.h"
+ #include "sysdeputil.h"
+ 
+-/* Activate 64-bit file support on Linux/32bit plus others */
+-#define _FILE_OFFSET_BITS 64
+-#define _LARGEFILE_SOURCE 1
+-#define _LARGEFILE64_SOURCE 1
+-#define _LARGE_FILES 1
+-
+ /* For Linux, this adds nothing :-) */
+ #include "port/porting_junk.h"
+ 
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 1a29244..c8c68d2 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -3,74 +3,47 @@
 # vsftpd
 #
 #############################################################
-VSFTPD_VERSION:=2.0.7
-VSFTPD_SOURCE:=vsftpd-$(VSFTPD_VERSION).tar.gz
-VSFTPD_SITE:=ftp://vsftpd.beasts.org/users/cevans
-VSFTPD_DIR:=$(BUILD_DIR)/vsftpd-$(VSFTPD_VERSION)
-VSFTPD_CAT:=$(ZCAT)
-VSFTPD_BINARY:=vsftpd
-VSFTPD_TARGET_BINARY:=usr/sbin/vsftpd
+VSFTPD_VERSION = 2.3.2
+VSFTPD_SOURCE = vsftpd-$(VSFTPD_VERSION).tar.gz
+VSFTPD_SITE = ftp://vsftpd.beasts.org/users/cevans
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-VSFTPD_LIBS:=-lcrypt -lssl
-else
-VSFTPD_LIBS:=-lcrypt
-endif
-
-$(DL_DIR)/$(VSFTPD_SOURCE):
-	 $(call DOWNLOAD,$(VSFTPD_SITE),$(VSFTPD_SOURCE))
+VSFTPD_LIBS = -lcrypt
 
-vsftpd-source: $(DL_DIR)/$(VSFTPD_SOURCE)
+define VSFTPD_ENABLE_SSL
+	$(SED) 's/.*VSF_BUILD_SSL/#define VSF_BUILD_SSL/' $(@D)/builddefs.h
+endef
 
-$(VSFTPD_DIR)/.unpacked: $(DL_DIR)/$(VSFTPD_SOURCE)
-	$(VSFTPD_CAT) $(DL_DIR)/$(VSFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(VSFTPD_DIR) package/vsftpd/ vsftpd\*.patch
-	touch $@
-
-$(VSFTPD_DIR)/.configured: $(VSFTPD_DIR)/.unpacked
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	$(SED) 's,#undef[[:space:]]*VSF_BUILD_SSL.*,#define VSF_BUILD_SSL,g' $(VSFTPD_DIR)/builddefs.h
-else
-	$(SED) 's,#define[[:space:]]*VSF_BUILD_SSL.*,#undef VSF_BUILD_SSL,g' $(VSFTPD_DIR)/builddefs.h
-endif
-ifneq ($(findstring uclibc,$(BR2_GNU_TARGET_SUFFIX)),)
-	$(SED) 's,#define[[:space:]]*VSF_BUILDDEFS_H.*,#define VSF_BUILDDEFS_H\n#define __UCLIBC__,g' $(VSFTPD_DIR)/builddefs.h
-	$(SED) 's,.*__UCLIBC_HAS_LFS__.*,,g' $(VSFTPD_DIR)/builddefs.h
-ifeq ($(BR2_LARGEFILE),y)
-	$(SED) 's,#define[[:space:]]*VSF_BUILDDEFS_H.*,#define VSF_BUILDDEFS_H\n#define __UCLIBC_HAS_LFS__,g' $(VSFTPD_DIR)/builddefs.h
+VSFTPD_DEPENDENCIES += openssl
+VSFTPD_LIBS += -lssl
+VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
-else # not uclibc
-	$(SED) 's,.*__UCLIBC_.*,,g' $(VSFTPD_DIR)/builddefs.h
-endif
-	touch $@
-
-
-$(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPD_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
-	touch -c $@
 
-$(TARGET_DIR)/$(VSFTPD_TARGET_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
-	cp -dpf $< $@
-	$(INSTALL) -D -m 0755 package/vsftpd/vsftpd-init $(TARGET_DIR)/etc/init.d/S70vsftpd
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-vsftpd: openssl $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
-else
-vsftpd: $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
-endif
-
-vsftpd-clean:
-	-$(MAKE) -C $(VSFTPD_DIR) clean
-	rm -f $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
-
-vsftpd-dirclean:
-	rm -rf $(VSFTPD_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_VSFTPD),y)
-TARGETS+=vsftpd
-endif
+define VSFTPD_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
+endef
+
+define VSFTPD_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
+	install -D -m 644 $(@D)/vsftpd.8 \
+		$(TARGET_DIR)/usr/share/man/man8/vsftpd.8
+	install -D -m 644 $(@D)/vsftpd.conf.5 \
+		$(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
+	test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
+		$(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
+			$(TARGET_DIR)/etc/init.d/S70vsftpd
+endef
+
+define VSFTPD_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/vsftpd
+	rm -f $(TARGET_DIR)/usr/share/man/man8/vsftpd.8
+	rm -f $(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
+	rm -f $(TARGET_DIR)/etc/init.d/S70vsftpd
+endef
+
+define VSFTPD_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,vsftpd))
-- 
1.7.1
