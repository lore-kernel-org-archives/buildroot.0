From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sun, 28 Dec 2014 15:31:38 +0100
Subject: [Buildroot] [PATCH] openocd: bump to version 0.8.0
Message-ID: <1419777098-6809-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refresh a few patches. Drop the ones, which are upstream already. (Keep patches
numbers steady for easier review.) Adapt configure options. Add hash file.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---


Hi,

Here is a proposal to "bump" OpenOCD. Buildroot is at v0.5.0 but this is v0.8.0
upstream already.

This "works for me" for one board and a few compilation tries, but this is only
lightly tested in view of all possible configurations. Feedbacks and tests are
very welcome!

Also, I can change the patches numbering if this is preferred.

Best regards,

V.


 ...s-compilation-host-libsub-was-used-before.patch | 33 ------------------
 ...002-fix-xscale-uninitialise-breakpoint_pc.patch | 27 ++++++++-------
 package/openocd/openocd-0003-force-gnu99.patch     | 22 +++++++-----
 .../openocd/openocd-0004-force_jimtcl_static.patch | 22 ++++++------
 .../openocd/openocd-0005-dont-force-ldflags.patch  | 37 --------------------
 package/openocd/openocd-0006-automake-compat.patch | 40 ----------------------
 package/openocd/openocd.hash                       |  3 ++
 package/openocd/openocd.mk                         |  6 ++--
 8 files changed, 46 insertions(+), 144 deletions(-)
 delete mode 100644 package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
 delete mode 100644 package/openocd/openocd-0005-dont-force-ldflags.patch
 delete mode 100644 package/openocd/openocd-0006-automake-compat.patch
 create mode 100644 package/openocd/openocd.hash

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
diff --git a/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch b/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
index 328241e..af1e09f 100644
--- a/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
+++ b/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
@@ -1,20 +1,23 @@
 xscale: fix uninitialise breakpoint_pc
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+
+[Refresh for v0.8.0]
+Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
 ---
- src/target/xscale.c |    2 +-
+ src/target/xscale.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: b/src/target/xscale.c
-===================================================================
+diff --git a/src/target/xscale.c b/src/target/xscale.c
+index e88a231..8d773b1 100644
 --- a/src/target/xscale.c
 +++ b/src/target/xscale.c
-@@ -2811,7 +2811,7 @@ static int xscale_analyze_trace(struct t
-    struct xscale_common *xscale = target_to_xscale(target);
-    struct xscale_trace_data *trace_data = xscale->trace.data;
-    int i, retval;
--   uint32_t breakpoint_pc;
-+   uint32_t breakpoint_pc = 0;
-    struct arm_instruction instruction;
-    uint32_t current_pc = 0;  /* initialized when address determined */
- 	
+@@ -2667,7 +2667,7 @@ static int xscale_analyze_trace(struct target *target, struct command_context *c
+ 	struct xscale_common *xscale = target_to_xscale(target);
+ 	struct xscale_trace_data *trace_data = xscale->trace.data;
+ 	int i, retval;
+-	uint32_t breakpoint_pc;
++	uint32_t breakpoint_pc = 0;
+ 	struct arm_instruction instruction;
+ 	uint32_t current_pc = 0;/* initialized when address determined */
+ 
diff --git a/package/openocd/openocd-0003-force-gnu99.patch b/package/openocd/openocd-0003-force-gnu99.patch
index 106d112..03a271f 100644
--- a/package/openocd/openocd-0003-force-gnu99.patch
+++ b/package/openocd/openocd-0003-force-gnu99.patch
@@ -1,19 +1,23 @@
 force gnu99
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+
+[Refresh for v0.8.0]
+Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
 ---
- configure.in |    1 +
- 1 file changed, 1 insertion(+)
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
 
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -28,6 +28,7 @@ AC_DISABLE_SHARED
+diff --git a/configure.ac b/configure.ac
+index 27fdb2c..9b2d4f3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,6 +29,8 @@ AC_DISABLE_SHARED
  AC_PROG_LIBTOOL
- AC_SUBST(LIBTOOL_DEPS)
+ AC_SUBST([LIBTOOL_DEPS])
  
 +CFLAGS="$CFLAGS -std=gnu99"
- 
++
  dnl configure checks required for Jim files (these are obsolete w/ C99)
  AC_C_CONST
+ AC_TYPE_LONG_LONG_INT
diff --git a/package/openocd/openocd-0004-force_jimtcl_static.patch b/package/openocd/openocd-0004-force_jimtcl_static.patch
index 7118b57..988eae5 100644
--- a/package/openocd/openocd-0004-force_jimtcl_static.patch
+++ b/package/openocd/openocd-0004-force_jimtcl_static.patch
@@ -1,25 +1,27 @@
 force jimtcl to build static
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+
+[Refresh for v0.8.0]
+Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
 ---
- jimtcl/auto.def |    5 -----
- 1 file changed, 5 deletions(-)
+ jimtcl/auto.def | 4 ----
+ 1 file changed, 4 deletions(-)
 
-Index: b/jimtcl/auto.def
-===================================================================
+diff --git a/jimtcl/auto.def b/jimtcl/auto.def
+index ddb0c1e..13d3ab3 100644
 --- a/jimtcl/auto.def
 +++ b/jimtcl/auto.def
-@@ -148,13 +148,8 @@ if {[opt-bool references]} {
+@@ -181,12 +181,8 @@ if {[opt-bool references]} {
      msg-result "Enabling references"
      define JIM_REFERENCES
  }
 -if {[opt-bool shared with-jim-shared]} {
 -    msg-result "Building shared library"
--    define JIM_LIBTYPE shared
 -} else {
      msg-result "Building static library"
-     define JIM_LIBTYPE static
+     define JIM_STATICLIB
 -}
- if {[opt-bool install-jim]} {
-     define install_jim 1
- } else {
+ define JIM_INSTALL [opt-bool install-jim]
+ 
+ # Attributes of the extensions
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
diff --git a/package/openocd/openocd-0006-automake-compat.patch b/package/openocd/openocd-0006-automake-compat.patch
deleted file mode 100644
index cdc6c92..0000000
--- a/package/openocd/openocd-0006-automake-compat.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Backport from openocd commit 737a52d7b22b1774acc5d20f9bd25000a70ac116
-Fix for automake 1.11.2+
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura openocd-0.5.0/src/jtag/drivers/Makefile.am openocd-0.5.0.automake/src/jtag/drivers/Makefile.am
---- openocd-0.5.0/src/jtag/drivers/Makefile.am	2011-08-09 02:34:19.000000000 -0300
-+++ openocd-0.5.0.automake/src/jtag/drivers/Makefile.am	2012-05-01 13:57:01.007561480 -0300
-@@ -5,7 +5,8 @@
- libocdjtagdrivers_la_SOURCES = \
- 	$(DRIVERFILES)
- 
--nobase_dist_pkglib_DATA =
-+ocddatadir = $(pkglibdir)
-+nobase_dist_ocddata_DATA =
- 
- ULINK_FIRMWARE = $(srcdir)/OpenULINK
- 
-@@ -64,7 +65,7 @@
- endif
- if ULINK
- DRIVERFILES += ulink.c
--nobase_dist_pkglib_DATA += $(ULINK_FIRMWARE)/ulink_firmware.hex
-+nobase_dist_ocddata_DATA += $(ULINK_FIRMWARE)/ulink_firmware.hex
- endif
- if VSLLINK
- DRIVERFILES += vsllink.c
-diff -Nura openocd-0.5.0/src/target/Makefile.am openocd-0.5.0.automake/src/target/Makefile.am
---- openocd-0.5.0/src/target/Makefile.am	2011-08-09 02:34:19.000000000 -0300
-+++ openocd-0.5.0.automake/src/target/Makefile.am	2012-05-01 13:57:01.934567076 -0300
-@@ -165,7 +165,7 @@
- 	avr32_mem.h \
- 	avr32_regs.h
- 
--nobase_dist_pkglib_DATA =
--nobase_dist_pkglib_DATA += ecos/at91eb40a.elf
-+ocddatadir = $(pkglibdir)
-+nobase_dist_ocddata_DATA = ecos/at91eb40a.elf
- 
- MAINTAINERCLEANFILES = $(srcdir)/Makefile.in
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
new file mode 100644
index 0000000..bc5c8c0
--- /dev/null
+++ b/package/openocd/openocd.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/openocd/files/openocd/0.8.0/
+sha1 10bf9eeb54e03083cb1a101785b2d69fbdf18f31 openocd-0.8.0.tar.bz2
+md5 6d83c34763a5f1d1ac7ad83c5a11f4fb openocd-0.8.0.tar.bz2
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 07366af..868e07f 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.5.0
+OPENOCD_VERSION = 0.8.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
 OPENOCD_LICENSE = GPLv2+
@@ -21,7 +21,7 @@ OPENOCD_DEPENDENCIES = libusb-compat
 
 # Adapters
 ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
-OPENOCD_CONF_OPTS += --enable-ft2232_libftdi
+OPENOCD_CONF_OPTS += --enable-ftdi
 OPENOCD_DEPENDENCIES += libftdi
 endif
 
@@ -38,7 +38,7 @@ HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
 HOST_OPENOCD_CONF_OPTS = 	\
 	--disable-doxygen-html 	\
 	--enable-dummy 		\
-	--enable-ft2232_libftdi \
+	--enable-ftdi \
 	--enable-jlink 		\
 	--enable-vsllink
 
-- 
2.1.4
