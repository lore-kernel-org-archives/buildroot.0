From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Fri, 24 Feb 2012 19:31:13 -0200
Subject: [Buildroot] [PATCH V2] openocd: fetch package from git repository
	and update version
In-Reply-To: <20120224190112.GB10670@game.jcrosoft.org>
References: <20120224190112.GB10670@game.jcrosoft.org>
Message-ID: <1330119073-24810-1-git-send-email-aletes.xgr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This overrided the DOWNLOAD_GIT method to also fetch the submodules used
by openocd.
Removed patches that are not needed anymore by the new version.
Updated the gnu99 patch to use configure.ac instead of configure.in.
Fix a build problem in the stm32_stlink.c file.

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 ...s-compilation-host-libsub-was-used-before.patch |   33 --------
 ...d-0001-stlink-fix-alignment-build-warning.patch |   83 ++++++++++++++++++++
 ...002-fix-xscale-uninitialise-breakpoint_pc.patch |   20 -----
 package/openocd/openocd-0003-force-gnu99.patch     |   24 ++++---
 .../openocd/openocd-0005-dont-force-ldflags.patch  |   37 ---------
 package/openocd/openocd.mk                         |   28 ++++++-
 6 files changed, 120 insertions(+), 105 deletions(-)
 delete mode 100644 package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
 create mode 100644 package/openocd/openocd-0001-stlink-fix-alignment-build-warning.patch
 delete mode 100644 package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
 delete mode 100644 package/openocd/openocd-0005-dont-force-ldflags.patch

diff --git a/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch b/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
deleted file mode 100644
index caf1a8b..0000000
--- a/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3728c4af7f6303ccedab56ec220797f8f290580e Mon Sep 17 00:00:00 2001
-From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
-Date: Wed, 10 Aug 2011 00:17:29 +0800
-Subject: [PATCH] fix cross compilation: host libsub was used before
-
-tested in buildroot
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
----
- configure.in |    7 +++++--
- 1 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index dfa1e8f..cfe2218 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1046,8 +1046,11 @@ build_usb=no
- if test $build_jlink = yes -o $build_vsllink = yes -o $build_usbprog = yes -o \
-   $build_rlink = yes -o $build_ulink = yes -o $build_armjtagew = yes
- then
--  AC_CHECK_HEADERS([usb.h],[],
--  [AC_MSG_ERROR([usb.h is required to build some OpenOCD driver(s)])])
-+  dnl check for libusb
-+  PKG_CHECK_MODULES(LIBUSB, libusb >= 0.1.11)
-+  CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
-+  LDFLAGS="$LDFLAGS $LIBUSB_LDFLAGS"
-+  LIBS="$LIBS $LIBUSB_LIBS"
-   build_usb=yes
- fi
- 
--- 
-1.7.5.4
-
diff --git a/package/openocd/openocd-0001-stlink-fix-alignment-build-warning.patch b/package/openocd/openocd-0001-stlink-fix-alignment-build-warning.patch
new file mode 100644
index 0000000..2d8e521
--- /dev/null
+++ b/package/openocd/openocd-0001-stlink-fix-alignment-build-warning.patch
@@ -0,0 +1,83 @@
+From 94228f37f54ace3040bea1e5c2ccee895d854859 Mon Sep 17 00:00:00 2001
+From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
+Date: Fri, 24 Feb 2012 18:51:48 -0200
+Subject: [PATCH] stlink: fix alignment build warning
+
+The {read,write}_mem32 interface functions was asking a 32 bits buffer but
+they don't need 32 bits alignment.
+This will change the interface to a 8 bits buffer to remove the alignment
+mismatch warning. This was causing build errors on platforms with strict
+aliasing rules.
+
+Change-Id: I338be8df5686f07a64ddb4f17c1bb494af583999
+Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
+---
+ src/jtag/drivers/stlink_usb.c   |    4 ++--
+ src/jtag/stlink/stlink_layout.h |    4 ++--
+ src/target/stm32_stlink.c       |    4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/jtag/drivers/stlink_usb.c b/src/jtag/drivers/stlink_usb.c
+index 3cb2434..4604716 100644
+--- a/src/jtag/drivers/stlink_usb.c
++++ b/src/jtag/drivers/stlink_usb.c
+@@ -968,7 +968,7 @@ static int stlink_usb_write_mem8(void *handle, uint32_t addr, uint16_t len,
+ 
+ /** */
+ static int stlink_usb_read_mem32(void *handle, uint32_t addr, uint16_t len,
+-			  uint32_t *buffer)
++			  uint8_t *buffer)
+ {
+ 	int res;
+ 	struct stlink_usb_handle_s *h;
+@@ -998,7 +998,7 @@ static int stlink_usb_read_mem32(void *handle, uint32_t addr, uint16_t len,
+ 
+ /** */
+ static int stlink_usb_write_mem32(void *handle, uint32_t addr, uint16_t len,
+-			   const uint32_t *buffer)
++			   const uint8_t *buffer)
+ {
+ 	int res;
+ 	struct stlink_usb_handle_s *h;
+diff --git a/src/jtag/stlink/stlink_layout.h b/src/jtag/stlink/stlink_layout.h
+index c0c89f5..59e6174 100644
+--- a/src/jtag/stlink/stlink_layout.h
++++ b/src/jtag/stlink/stlink_layout.h
+@@ -56,10 +56,10 @@ struct stlink_layout_api_s {
+ 			    const uint8_t *buffer);
+ 	/** */
+ 	int (*read_mem32) (void *handle, uint32_t addr, uint16_t len,
+-			   uint32_t *buffer);
++			   uint8_t *buffer);
+ 	/** */
+ 	int (*write_mem32) (void *handle, uint32_t addr, uint16_t len,
+-			    const uint32_t *buffer);
++			    const uint8_t *buffer);
+ 	/** */
+ 	int (*idcode) (void *fd, uint32_t *idcode);
+ 	/** */
+diff --git a/src/target/stm32_stlink.c b/src/target/stm32_stlink.c
+index 32896cc..fc97188 100644
+--- a/src/target/stm32_stlink.c
++++ b/src/target/stm32_stlink.c
+@@ -651,7 +651,7 @@ static int stm32_stlink_read_memory(struct target *target, uint32_t address,
+ 					address, c, dst);
+ 		else
+ 			res = stlink_if->layout->api->read_mem32(stlink_if->fd,
+-					address, c, (uint32_t *)dst);
++					address, c, dst);
+ 
+ 		if (res != ERROR_OK)
+ 			return res;
+@@ -700,7 +700,7 @@ static int stm32_stlink_write_memory(struct target *target, uint32_t address,
+ 					address, c, dst);
+ 		else
+ 			res = stlink_if->layout->api->write_mem32(stlink_if->fd,
+-					address, c, (uint32_t *)dst);
++					address, c, dst);
+ 
+ 		if (res != ERROR_OK)
+ 			return res;
+-- 
+1.7.9
+
diff --git a/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch b/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
deleted file mode 100644
index 328241e..0000000
--- a/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-xscale: fix uninitialise breakpoint_pc
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
----
- src/target/xscale.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: b/src/target/xscale.c
-===================================================================
---- a/src/target/xscale.c
-+++ b/src/target/xscale.c
-@@ -2811,7 +2811,7 @@ static int xscale_analyze_trace(struct t
-    struct xscale_common *xscale = target_to_xscale(target);
-    struct xscale_trace_data *trace_data = xscale->trace.data;
-    int i, retval;
--   uint32_t breakpoint_pc;
-+   uint32_t breakpoint_pc = 0;
-    struct arm_instruction instruction;
-    uint32_t current_pc = 0;  /* initialized when address determined */
- 	
diff --git a/package/openocd/openocd-0003-force-gnu99.patch b/package/openocd/openocd-0003-force-gnu99.patch
index 106d112..5511f09 100644
--- a/package/openocd/openocd-0003-force-gnu99.patch
+++ b/package/openocd/openocd-0003-force-gnu99.patch
@@ -1,19 +1,23 @@
 force gnu99
 
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
 ---
- configure.in |    1 +
- 1 file changed, 1 insertion(+)
+ configure.ac |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
 
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -28,6 +28,7 @@ AC_DISABLE_SHARED
+diff --git a/configure.ac b/configure.ac
+index ffab637..60fe4ab 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,6 +28,8 @@ AC_DISABLE_SHARED
  AC_PROG_LIBTOOL
- AC_SUBST(LIBTOOL_DEPS)
+ AC_SUBST([LIBTOOL_DEPS])
  
 +CFLAGS="$CFLAGS -std=gnu99"
- 
++
  dnl configure checks required for Jim files (these are obsolete w/ C99)
  AC_C_CONST
+ AC_TYPE_LONG_LONG_INT
+-- 
+1.7.9
+
diff --git a/package/openocd/openocd-0005-dont-force-ldflags.patch b/package/openocd/openocd-0005-dont-force-ldflags.patch
deleted file mode 100644
index 1880e00..0000000
--- a/package/openocd/openocd-0005-dont-force-ldflags.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-[PATCH] don't force library search path / rpath settings
-
-openocd adds -L$exec_prefix/lib -Wl,rpath,$exec_prefix/lib to the compile
-LDFLAGS if it isn't installed into /usr/local, which breaks cross compilation
-as the compiler ends up using host libraries.
----
- configure.in |   17 -----------------
- 1 file changed, 17 deletions(-)
-
-Index: openocd-0.5.0/configure.in
-===================================================================
---- openocd-0.5.0.orig/configure.in
-+++ openocd-0.5.0/configure.in
-@@ -174,23 +174,6 @@
- # Let make expand exec_prefix.
- test x"$OCDxprefix" = xNONE && OCDxprefix="$OCDprefix"
- 
--# what matters is the "exec-prefix"
--if test "$OCDxprefix" != "$ac_default_prefix"
--then
--    # We are installing in a non-standard place
--    # Nonstandard --prefix and/or --exec-prefix
--    # We have an override of some sort.
--    # use build specific install library dir
--
--    LDFLAGS="$LDFLAGS -L$OCDxprefix/lib"
--    # RPATH becomes an issue on Linux only
--    if test $host_os = linux-gnu || test $host_os = linux ; then
--      LDFLAGS="$LDFLAGS -Wl,-rpath,$OCDxprefix/lib"
--    fi
--    # The "INCDIR" is also usable
--    CFLAGS="$CFLAGS -I$includedir"
--fi
--
- AC_ARG_WITH(ftd2xx,
-    AS_HELP_STRING([--with-ftd2xx=<PATH>],[This option has been removed.]),
-   [
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index a12ba6c..2796e81 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -3,16 +3,18 @@
 # openocd
 #
 #############################################################
-OPENOCD_VERSION:=0.5.0
-OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
-OPENOCD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
+#OPENOCD_VERSION = master
+OPENOCD_VERSION = dec6b913809bd3f857af31be178ffde65e42dbab
+OPENOCD_SITE = git://openocd.git.sourceforge.net/gitroot/openocd/openocd
+OPENOCD_SITE_METHOD = git
 
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_OPT = \
 	--oldincludedir=$(STAGING_DIR)/usr/include \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--disable-doxygen-html \
-	--enable-dummy
+	--enable-dummy \
+    --enable-maintainer-mode
 
 OPENOCD_DEPENDENCIES = libusb-compat
 
@@ -32,12 +34,28 @@ endif
 
 HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
 
+HOST_OPENOCD_AUTORECONF = YES
 HOST_OPENOCD_CONF_OPT = 	\
 	--disable-doxygen-html 	\
 	--enable-dummy 		\
 	--enable-ft2232_libftdi \
 	--enable-jlink 		\
-	--enable-vsllink
+	--enable-vsllink \
+	--enable-maintainer-mode 
+
+define DOWNLOAD_GIT
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	(pushd $(DL_DIR) > /dev/null && \
+	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	pushd $($(PKG)_BASE_NAME) > /dev/null && \
+	$(GIT) checkout $($(PKG)_VERSION) && \
+	$(GIT) submodule init && \
+	$(GIT) submodule update && \
+	$(TAR) czf $(DL_DIR)/$($(PKG)_SOURCE) . &&\
+	popd > /dev/null && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null)    
+endef
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.9
