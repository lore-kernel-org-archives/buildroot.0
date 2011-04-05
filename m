From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Apr 2011 12:05:08 +0200
Subject: [Buildroot] [git commit] libv4l: add options to install utilites
Message-ID: <20110405100726.E0DAE81F6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=54f33b3865a88002c06abf8da1c4529d43cd07c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These have extra deps though (C++ for some, argp.h for others which is not
available on uClibc).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/Config.in |   50 ++++++++++++++++++++++++++++++++++++++++++++++
 package/libv4l/libv4l.mk |   19 ++++++++++++++--
 2 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 1620b93..1e5eec6 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -7,5 +7,55 @@ config BR2_PACKAGE_LIBV4L
 
 	  http://freshmeat.net/projects/libv4l
 
+if BR2_PACKAGE_LIBV4L
+
+config BR2_PACKAGE_LIBV4L_DECODE_TM6000
+	bool "decode_tm6000"
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc
+	help
+	  Tool to decode tm6000 proprietary format streams
+
+comment "decode_tm6000 requires a GLIBC based toolchain"
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc)
+
+config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
+	bool "ir-keytable"
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc
+	help
+	  Tool to alter keymaps of Remote Controller devices
+
+comment "ir-keytable requires a GLIBC based toolchain"
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc)
+
+config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
+	bool "v4l2-compliance"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Tool to test v4l2 API compliance of drivers
+
+comment "v4l2-compliance requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_LIBV4L_V4L2_CTL
+	bool "v4l2-ctl"
+	depends on BR2_INSTALL_LIBSTDCPP
+	default y
+	help
+	  Tool to configure v4l2 controls from the cmdline
+
+comment "v4l2-ctl requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_LIBV4L_V4L2_DBG
+	bool "v4l2-dbg"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Tool to directly get and set registers of v4l2 devices
+
+comment "v4l2-dbg requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endif
+
 comment "libv4l requires a toolchain with LARGEFILE support"
         depends on !BR2_LARGEFILE
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a72320e..1ea859a 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -9,20 +9,33 @@ LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_MAKE_OPTS = PREFIX=/usr
 
+LIBV4L_DIRS_y += lib
+LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/decode_tm6000
+LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_IR_KEYTABLE)	+= utils/keytable
+LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE) += utils/v4l2-compliance
+LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_CTL)	+= utils/v4l2-ctl
+LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_V4L2_DBG)	+= utils/v4l2-dbg
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 	LIBV4L_MAKE_OPTS += LINKTYPE=static
 endif
 
 define LIBV4L_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib $(LIBV4L_MAKE_OPTS)
+	for i in $(LIBV4L_DIRS_y); do \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$$i \
+			$(LIBV4L_MAKE_OPTS); done
 endef
 
 define LIBV4L_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/lib DESTDIR=$(STAGING_DIR) $(LIBV4L_MAKE_OPTS) install
+	for i in $(LIBV4L_DIRS_y); do \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$$i \
+			DESTDIR=$(STAGING_DIR) $(LIBV4L_MAKE_OPTS) install; done
 endef
 
 define LIBV4L_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/lib DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install
+	for i in $(LIBV4L_DIRS_y); do \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$$i \
+			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install; done
 endef
 
 $(eval $(call GENTARGETS,package,libv4l))
-- 
1.7.3.4
