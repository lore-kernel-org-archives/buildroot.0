From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 16:30:15 +0100
Subject: [Buildroot] [git commit] openocd: bump to version 0.8.0
Message-ID: <20150102153044.260DF80D94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa441aa84c38ad5319c4ff7fb27c84530e19c204
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the management of (almost) all the config options of
openocd 0.8.0. A BR config variable is added for (almost) every
adapter known to openocd and all the dependencies are automatically
calculated from the chosen adapters, so only the necessary libraries
are built.

Note that CMSIS_DAP adapter requires hidapi (not libhid) and hidapi is
not actually included in buildroot, so it has been removed.  Also
zy1000 adapters are actually broken in openocd and have been removed.

The host version of the package enables all the possible adapters and
the related libraries.

[Thomas:
 - Slightly fixup the commit log.
 - Rename the patches to the new patch naming convention.
 - Update hash file using a contribution from Vincent Stehl??.
 - Move the thread dependency from the OpenOCD option down to each
   sub-option that actually needs it (when it needs libusb,
   libusb-compat or libftdi). We keep only one comment, as we would
   otherwise have to add too many repeatitive comments.
 - Remove commented options.
 - Add missing dependency on BR2_ARCH_HAS_ATOMICS when selecting
   BR2_PACKAGE_LIBFTDI.
 - Remove trailing white spaces.
 - Pass -std=gnu99, needed to build with a basic toolchain.
 - Write the OPENOCD_DEPENDENCIES and OPENOCD_CONF_OPTS conditions in
   a more compact way.
 - Adjust indentation for HOST_OPENOCD_CONF_OPTS.
 - Reword the comment above HOST_OPENOCD_CONF_OPTS.]

Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...mpilation-error-in-src-flash-nor-mini51.c.patch |   30 +++
 ...auto-configuration-to-force-static-librar.patch |   35 ++++
 package/openocd/Config.in                          |  203 ++++++++++++++++++--
 ...s-compilation-host-libsub-was-used-before.patch |   33 ----
 ...002-fix-xscale-uninitialise-breakpoint_pc.patch |   20 --
 package/openocd/openocd-0003-force-gnu99.patch     |   19 --
 .../openocd/openocd-0004-force_jimtcl_static.patch |   25 ---
 .../openocd/openocd-0005-dont-force-ldflags.patch  |   37 ----
 package/openocd/openocd-0006-automake-compat.patch |   40 ----
 package/openocd/openocd.hash                       |    5 +-
 package/openocd/openocd.mk                         |  107 ++++++++---
 11 files changed, 339 insertions(+), 215 deletions(-)

diff --git a/package/openocd/0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch b/package/openocd/0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch
new file mode 100644
index 0000000..6eb7f9d
--- /dev/null
+++ b/package/openocd/0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch
@@ -0,0 +1,30 @@
+From 893330638a26ea2868c6e7606047acf9b6fe31ea Mon Sep 17 00:00:00 2001
+From: Claudio Laurita <claudio.laurita@integrazionetotale.it>
+Date: Sun, 30 Nov 2014 17:30:36 +0100
+Subject: [PATCH 1/1] Fix compilation error in src/flash/nor/mini51.c
+
+0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch
+gcc complains about missing initialization of 
+local variable flash_size and compilation aborts
+
+Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>
+---
+ src/flash/nor/mini51.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/flash/nor/mini51.c b/src/flash/nor/mini51.c
+index 61aee5d..c7ba13a 100644
+--- a/src/flash/nor/mini51.c
++++ b/src/flash/nor/mini51.c
+@@ -397,7 +397,7 @@ static int mini51_write(struct flash_bank *bank, const uint8_t *buffer, uint32_t
+ 
+ static int mini51_probe(struct flash_bank *bank)
+ {
+-	uint32_t flash_size;
++	uint32_t flash_size = 0;
+ 	int retval;
+ 	int num_pages;
+ 	uint32_t offset = 0;
+-- 
+2.1.3
+
diff --git a/package/openocd/0002-Fix-jimtcl-auto-configuration-to-force-static-librar.patch b/package/openocd/0002-Fix-jimtcl-auto-configuration-to-force-static-librar.patch
new file mode 100644
index 0000000..5ec0552
--- /dev/null
+++ b/package/openocd/0002-Fix-jimtcl-auto-configuration-to-force-static-librar.patch
@@ -0,0 +1,35 @@
+From 3bef159779c8fd39a070ec5c8191e18ba2efa79d Mon Sep 17 00:00:00 2001
+From: Claudio Laurita <claudio.laurita@integrazionetotale.it>
+Date: Sun, 30 Nov 2014 18:21:58 +0100
+Subject: [PATCH 2/2] Fix jimtcl auto configuration to force static library
+ only. jimtcl ignores a --disable-shared option if a previous --enable-shared
+ option was given. This breaks openocd compilation if shared was the preferred
+ option in buildroot project.
+
+Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>
+---
+ jimtcl/auto.def | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/jimtcl/auto.def b/jimtcl/auto.def
+index ddb0c1e..929ade0 100644
+--- a/jimtcl/auto.def
++++ b/jimtcl/auto.def
+@@ -181,12 +181,8 @@ if {[opt-bool references]} {
+     msg-result "Enabling references"
+     define JIM_REFERENCES
+ }
+-if {[opt-bool shared with-jim-shared]} {
+-    msg-result "Building shared library"
+-} else {
+-    msg-result "Building static library"
+-    define JIM_STATICLIB
+-}
++msg-result "Building static library"
++define JIM_STATICLIB
+ define JIM_INSTALL [opt-bool install-jim]
+ 
+ # Attributes of the extensions
+-- 
+2.1.3
+
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 9440c65..1f9889c 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,8 +1,5 @@
 config BR2_PACKAGE_OPENOCD
 	bool "openocd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  OpenOCD - Open On-Chip Debugger
 
@@ -12,23 +9,203 @@ if BR2_PACKAGE_OPENOCD
 
 comment "Adapters"
 
-config BR2_PACKAGE_OPENOCD_FT2XXX
-	bool "FT2xxx/FT4xxx Based JTAG Programmer"
-	depends on BR2_ARCH_HAS_ATOMICS # libftdi
-	select BR2_PACKAGE_LIBFTDI
+config BR2_PACKAGE_OPENOCD_FTDI
+	bool "MPSSE mode of FTDI based devices"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  Enable building support for the MPSSE mode of FTDI
+	  (FT2xxx/FT4xxx) based devices (default is auto)
+
+config BR2_PACKAGE_OPENOCD_STLINK
+	bool "ST-Link JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  Enable building support for the ST-Link JTAG
+	  Programmer (default is auto)
+
+config BR2_PACKAGE_OPENOCD_TI_ICDI
+	bool "TI ICDI JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  Enable building support for the TI ICDI JTAG
+	  Programmer (default is auto)
+
+config BR2_PACKAGE_OPENOCD_ULINK
+	bool "Keil ULINK JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  Enable building support for the Keil ULINK JTAG
+	  Programmer (default is auto)
+
+config BR2_PACKAGE_OPENOCD_UBLASTER2
+	bool "Altera USB-Blaster II Compatible"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	help
-	  Enable building support for FT2232 based devices
-	  using the libftdi driver, opensource alternate of FTD2XX
+	  Enable building support for the Altera USB-Blaster
+	  II Compatible (default is auto)
 
 config BR2_PACKAGE_OPENOCD_JLINK
 	bool "Segger J-Link JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	help
-	  Segger J-Link JTAG Programmer and clone such as Atmel SAM-ICE
+	  Segger J-Link JTAG Programmer and clone such as Atmel
+	  SAM-ICE
+
+config BR2_PACKAGE_OPENOCD_OSDBM
+	bool "OSDBM JTAG (only) Programmer"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  Enable building support for the OSBDM (JTAG only)
+	  Programmer (default is auto)
+
+config BR2_PACKAGE_OPENOCD_OPENDOUS
+	bool "eStick/opendous JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  Enable building support for the eStick/opendous JTAG
+	  Programmer (default is auto)
+
+config BR2_PACKAGE_OPENOCD_AICE
+	bool "Andes JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  Enable building support for the Andes JTAG
+	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_VSLLINK
-	bool "Versaloon-Link JTAG Programmr"
+	bool "Versaloon-Link JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	help
+	  Enable building support for the Versaloon-Link JTAG
+	  Programmer (default is auto)
 
-endif # BR2_PACKAGE_OPENOCD
+config BR2_PACKAGE_OPENOCD_USBPROG
+	bool "USBProg JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	help
+	  Enable building support for the USBProg JTAG
+	  Programmer (default is auto)
 
-comment "openocd needs a toolchain w/ threads"
+config BR2_PACKAGE_OPENOCD_RLINK
+	bool "Raisonance RLink JTAG Programmer"
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	help
+	  Enable building support for the Raisonance RLink
+	  JTAG Programmer (default is auto)
+
+config BR2_PACKAGE_OPENOCD_ARMEW
+	bool "Olimex ARM-JTAG-EW Programmer"
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
+	help
+	  Enable building support for the Olimex ARM-JTAG-EW
+	  Programmer (default is auto)
+
+config BR2_PACKAGE_OPENOCD_PARPORT
+	bool "pc parallel port driver"
+	help
+	  Enable building the pc parallel port driver
+
+config BR2_PACKAGE_OPENOCD_FT2XXX
+	bool "FT2232 based devices (DEPRECATED)"
+	select BR2_PACKAGE_LIBFTDI
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	depends on BR2_ARCH_HAS_ATOMICS
+	help
+	  (DEPRECATED) Enable building support for FT2232
+	  based devices using the libftdi library
+
+config BR2_PACKAGE_OPENOCD_VPI
+	bool "JTAG VPI"
+	help
+	  Enable building support for JTAG VPI
+
+config BR2_PACKAGE_OPENOCD_UBLASTER
+	bool "Altera USB-Blaster"
+	select BR2_PACKAGE_LIBFTDI
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	depends on BR2_ARCH_HAS_ATOMICS
+	help
+	  Enable building support for the Altera USB-Blaster
+	  using the libftdi driver, opensource alternate of
+	  FTD2XX
+
+config BR2_PACKAGE_OPENOCD_AMTJT
+	bool "Amontec JTAG-Accelerator"
+	help
+	  Enable building the Amontec JTAG-Accelerator driver
+
+if BR2_arm
+
+config BR2_PACKAGE_OPENOCD_EP93XX
+	bool "EP93xx based SBCs"
+	help
+	  Enable building support for EP93xx based SBCs
+
+config BR2_PACKAGE_OPENOCD_AT91RM
+	bool "AT91RM9200 based SBCs"
+	help
+	  Enable building support for AT91RM9200 based SBCs
+
+config BR2_PACKAGE_OPENOCD_BCM2835
+	bool "bitbanging on BCM2835"
+	help
+	  Enable building support for bitbanging on BCM2835
+	  (as found in Raspberry Pi)
+
+endif # BR2_arm
+
+config BR2_PACKAGE_OPENOCD_GW16012
+	bool "Gateworks GW16012 JTAG Programmer"
+	help
+	  Enable building support for the Gateworks GW16012
+	  JTAG Programmer
+
+config BR2_PACKAGE_OPENOCD_PRESTO
+	bool "ASIX Presto Programmer"
+	select BR2_PACKAGE_LIBFTDI
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	depends on BR2_ARCH_HAS_ATOMICS
+	help
+	  Enable building support for ASIX Presto Programmer
+	  using the libftdi driver
+
+config BR2_PACKAGE_OPENOCD_OPENJTAG
+	bool "OpenJTAG Programmer"
+	select BR2_PACKAGE_LIBFTDI
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	depends on BR2_ARCH_HAS_ATOMICS
+	help
+	  Enable building support for the OpenJTAG Programmer
+	  with ftdi driver
+
+config BR2_PACKAGE_OPENOCD_BUSPIRATE
+	bool "Buspirate"
+	help
+	  Enable building support for the Buspirate
+
+config BR2_PACKAGE_OPENOCD_SYSFS
+	bool "programming via sysfs gpios"
+	help
+	  Enable building support for programming driven via
+	  sysfs gpios.
+
+# Many adapters need libusb or libusb-compat, which require threads,
+# but we don't want to duplicate this comment for all adapters that
+# select libusb or libusb-compat.
+comment "many openocd adapters needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif # BR2_PACKAGE_OPENOCD
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
deleted file mode 100644
index 106d112..0000000
--- a/package/openocd/openocd-0003-force-gnu99.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-force gnu99
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
----
- configure.in |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -28,6 +28,7 @@ AC_DISABLE_SHARED
- AC_PROG_LIBTOOL
- AC_SUBST(LIBTOOL_DEPS)
- 
-+CFLAGS="$CFLAGS -std=gnu99"
- 
- dnl configure checks required for Jim files (these are obsolete w/ C99)
- AC_C_CONST
diff --git a/package/openocd/openocd-0004-force_jimtcl_static.patch b/package/openocd/openocd-0004-force_jimtcl_static.patch
deleted file mode 100644
index 7118b57..0000000
--- a/package/openocd/openocd-0004-force_jimtcl_static.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-force jimtcl to build static
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
----
- jimtcl/auto.def |    5 -----
- 1 file changed, 5 deletions(-)
-
-Index: b/jimtcl/auto.def
-===================================================================
---- a/jimtcl/auto.def
-+++ b/jimtcl/auto.def
-@@ -148,13 +148,8 @@ if {[opt-bool references]} {
-     msg-result "Enabling references"
-     define JIM_REFERENCES
- }
--if {[opt-bool shared with-jim-shared]} {
--    msg-result "Building shared library"
--    define JIM_LIBTYPE shared
--} else {
-     msg-result "Building static library"
-     define JIM_LIBTYPE static
--}
- if {[opt-bool install-jim]} {
-     define install_jim 1
- } else {
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
index 11f79a6..bc5c8c0 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  0bc122f98a6cd68c4392f6265d480b0e875ff54203ec05a5a52d23900903a78d  openocd-0.5.0.tar.bz2
+# From http://sourceforge.net/projects/openocd/files/openocd/0.8.0/
+sha1 10bf9eeb54e03083cb1a101785b2d69fbdf18f31 openocd-0.8.0.tar.bz2
+md5 6d83c34763a5f1d1ac7ad83c5a11f4fb openocd-0.8.0.tar.bz2
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 07366af..b0bcb7e 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,43 +4,98 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.5.0
+OPENOCD_VERSION = 0.8.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
-OPENOCD_LICENSE = GPLv2+
-OPENOCD_LICENSE_FILES = COPYING
 
-OPENOCD_AUTORECONF = YES
+OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
 OPENOCD_CONF_OPTS = \
 	--oldincludedir=$(STAGING_DIR)/usr/include \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--disable-doxygen-html \
+	--with-jim-shared=no \
+	--disable-shared \
 	--enable-dummy
 
-OPENOCD_DEPENDENCIES = libusb-compat
+# Rely on the Config.in options of each individual adapter selecting
+# the dependencies they need.
+
+OPENOCD_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LIBFTDI),libftdi) \
+	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
+	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
+	$(if $(BR2_PACKAGE_LIBHID),libhid)
 
 # Adapters
-ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
-OPENOCD_CONF_OPTS += --enable-ft2232_libftdi
-OPENOCD_DEPENDENCIES += libftdi
-endif
-
-ifeq ($(BR2_PACKAGE_OPENOCD_JLINK),y)
-OPENOCD_CONF_OPTS += --enable-jlink
-endif
-
-ifeq ($(BR2_PACKAGE_OPENOCD_VSLLINK),y)
-OPENOCD_CONF_OPTS += --enable-vsllink
-endif
-
-HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
-
-HOST_OPENOCD_CONF_OPTS = 	\
-	--disable-doxygen-html 	\
-	--enable-dummy 		\
-	--enable-ft2232_libftdi \
-	--enable-jlink 		\
-	--enable-vsllink
+OPENOCD_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_OPENOCD_FTDI),--enable-ftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_STLINK),--enable-stlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_TI_ICDI),--enable-ti-icdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_ULINK),--enable-ulink) \
+	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER2),--enable-usb-blaster-2) \
+	$(if $(BR2_PACKAGE_OPENOCD_JLINK),--enable-jlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_OSDBM),--enable-osbdm) \
+	$(if $(BR2_PACKAGE_OPENOCD_OPENDOUS),--enable-opendous) \
+	$(if $(BR2_PACKAGE_OPENOCD_AICE),--enable-aice) \
+	$(if $(BR2_PACKAGE_OPENOCD_VSLLINK),--enable-vsllink) \
+	$(if $(BR2_PACKAGE_OPENOCD_USBPROG),--enable-usbprog) \
+	$(if $(BR2_PACKAGE_OPENOCD_RLINK),--enable-rlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_ARMEW),--enable-armjtagew) \
+	$(if $(BR2_PACKAGE_OPENOCD_CMSIS_DAP),--enable-cmsis-dap) \
+	$(if $(BR2_PACKAGE_OPENOCD_PARPORT),--enable-parport) \
+	$(if $(BR2_PACKAGE_OPENOCD_FT2XXX),--enable-legacy-ft2232_libftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_VPI),--enable-jtag_vpi) \
+	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER),--enable-usb_blaster_libftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_AMTJT),--enable-amtjtagaccel) \
+	$(if $(BR2_PACKAGE_OPENOCD_ZY1000_MASTER),--enable-zy1000-master) \
+	$(if $(BR2_PACKAGE_OPENOCD_ZY1000),--enable-zy1000) \
+	$(if $(BR2_PACKAGE_OPENOCD_EP93XX),--enable-ep93xx) \
+	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200) \
+	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio) \
+	$(if $(BR2_PACKAGE_OPENOCD_GW16012),--enable-gw16012) \
+	$(if $(BR2_PACKAGE_OPENOCD_PRESTO),--enable-presto_libftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_OPENJTAG),--enable-openjtag_ftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_BUSPIRATE),--enable-buspirate) \
+	$(if $(BR2_PACKAGE_OPENOCD_SYSFS),--enable-sysfsgpio)
+
+# Enable all configuration options for host build.
+#
+# Note that deprecated options have been removed. CMSIS_DAP needs
+# hidapi (currently not included in buildroot) and zy1000 stuff fails
+# to build, so they've been removed too.
+#
+HOST_OPENOCD_CONF_OPTS = \
+	--enable-ftdi \
+	--enable-stlink \
+	--enable-ti-icdi \
+	--enable-ulink \
+	--enable-usb-blaster-2 \
+	--enable-jlink \
+	--enable-osbdm \
+	--enable-opendous \
+	--enable-aice \
+	--enable-vsllink \
+	--enable-usbprog \
+	--enable-rlink \
+	--enable-armjtagew \
+	--enable-parport \
+	--enable-jtag_vpi \
+	--enable-usb_blaster_libftdi \
+	--enable-amtjtagaccel \
+	--enable-gw16012 \
+	--enable-presto_libftdi \
+	--enable-openjtag_ftdi \
+	--enable-buspirate \
+	--enable-sysfsgpio \
+	--oldincludedir=$(HOST_DIR)/usr/include \
+	--includedir=$(HOST_DIR)/usr/include \
+	--disable-doxygen-html \
+	--with-jim-shared=no \
+	--disable-shared \
+	--enable-dummy
+
+HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
