From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun,  7 Jan 2018 09:57:29 -0200
Subject: [Buildroot] [PATCH] snort: new package
Message-ID: <1515326249-26971-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on Beaglebone Black.

Build-tested with test-pkg.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../snort/0001-Fix-cross-compilation-errors.patch  | 251 +++++++++++++++++++++
 package/snort/Config.in                            |  25 ++
 package/snort/snort.hash                           |   6 +
 package/snort/snort.mk                             |  28 +++
 6 files changed, 312 insertions(+)
 create mode 100644 package/snort/0001-Fix-cross-compilation-errors.patch
 create mode 100644 package/snort/Config.in
 create mode 100644 package/snort/snort.hash
 create mode 100644 package/snort/snort.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 999e7d3300b6..4a8be05f8825 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1584,6 +1584,7 @@ F:	package/daq/
 F:	package/libgdiplus/
 F:	package/mongodb/
 F:	package/pimd/
+F:	package/snort/
 F:	package/stella/
 F:	package/traceroute/
 F:	package/tunctl/
diff --git a/package/Config.in b/package/Config.in
index 729d660d525b..26e5fc8786a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1798,6 +1798,7 @@ endif
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/sngrep/Config.in"
+	source "package/snort/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/snort/0001-Fix-cross-compilation-errors.patch b/package/snort/0001-Fix-cross-compilation-errors.patch
new file mode 100644
index 000000000000..f5ff03343821
--- /dev/null
+++ b/package/snort/0001-Fix-cross-compilation-errors.patch
@@ -0,0 +1,251 @@
+From 30d31b3064e26ce437ffc36e6e95cf8ebd1ecc22 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sat, 6 Jan 2018 20:13:18 -0200
+Subject: [PATCH] Fix cross compilation errors
+
+Ignore errors when trying to run programs in a cross compilation
+environment.
+
+Also remove unsafe header/library path used in cross-compilation.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure | 40 ++++++++++++++++++++++++++--------------
+ 1 file changed, 26 insertions(+), 14 deletions(-)
+
+diff --git a/configure b/configure
+index b3cdc40c4f8b..5a913faa624f 100755
+--- a/configure
++++ b/configure
+@@ -13909,7 +13909,6 @@ $as_echo "#define SUNOS 1" >>confdefs.h
+ $as_echo "#define LINUX 1" >>confdefs.h
+ 
+ 
+-    extra_incl="-I/usr/include/pcap"
+     ;;
+   *-hpux10*|*-hpux11*)
+ 
+@@ -15068,7 +15067,7 @@ $as_echo_n "checking for INADDR_NONE... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -15097,6 +15096,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_inaddr_none="yes"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_inaddr_none" >&5
+ $as_echo "$have_inaddr_none" >&6; }
+@@ -15519,7 +15519,7 @@ $as_echo_n "checking for pcap_lex_destroy... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -15545,6 +15545,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_pcap_lex_destroy="yes"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_pcap_lex_destroy" >&5
+ $as_echo "$have_pcap_lex_destroy" >&6; }
+@@ -16384,7 +16385,7 @@ $as_echo_n "checking for daq real addresses... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16411,6 +16412,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_real_addresses="no"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_real_addresses" >&5
+ $as_echo "$have_daq_real_addresses" >&6; }
+@@ -16459,7 +16461,7 @@ $as_echo_n "checking for daq address space ID... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16486,6 +16488,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_address_space_id="yes"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_address_space_id" >&5
+ $as_echo "$have_daq_address_space_id" >&6; }
+@@ -16500,7 +16503,7 @@ $as_echo_n "checking for daq flow ID... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16527,6 +16530,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_flow_id="yes"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_flow_id" >&5
+ $as_echo "$have_daq_flow_id" >&6; }
+@@ -16541,7 +16545,7 @@ $as_echo_n "checking for daq extended flow modifiers... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16570,6 +16574,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_ext_modflow="no"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_ext_modflow" >&5
+ $as_echo "$have_daq_ext_modflow" >&6; }
+@@ -16585,7 +16590,7 @@ $as_echo_n "checking for daq query flow... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16614,6 +16619,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_queryflow="no"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_queryflow" >&5
+ $as_echo "$have_daq_queryflow" >&6; }
+@@ -16629,7 +16635,7 @@ $as_echo_n "checking for daq data channel flags... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16655,6 +16661,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_data_channel_flags="no"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_data_channel_flags" >&5
+ $as_echo "$have_daq_data_channel_flags" >&6; }
+@@ -16670,7 +16677,7 @@ $as_echo_n "checking for separate IP versions on pinhole endpoints... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16697,6 +16704,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_data_channel_separate_ip_versions="no"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_data_channel_separate_ip_versions" >&5
+ $as_echo "$have_daq_data_channel_separate_ip_versions" >&6; }
+@@ -16712,7 +16720,7 @@ $as_echo_n "checking for DAQ_VERDICT_RETRY... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16739,6 +16747,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_verdict_retry="yes"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_verdict_retry" >&5
+ $as_echo "$have_daq_verdict_retry" >&6; }
+@@ -16753,7 +16762,7 @@ $as_echo_n "checking for daq packet trace... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16780,6 +16789,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_packet_trace="no"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_packet_trace" >&5
+ $as_echo "$have_daq_packet_trace" >&6; }
+@@ -16796,7 +16806,7 @@ $as_echo_n "checking for daq verdict reason... " >&6; }
+ if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16823,6 +16833,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++have_daq_verdict_reason="no"
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_daq_verdict_reason" >&5
+ $as_echo "$have_daq_verdict_reason" >&6; }
+@@ -16862,7 +16873,7 @@ $as_echo_n "checking for sparc %time register... " >&6; }
+     if test "$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
++$as_echo $? "cannot run test program while cross compiling
+ See \`config.log' for more details" "$LINENO" 5; }
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -16887,6 +16898,7 @@ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+ fi
++sparcv9="no"
+ 
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $sparcv9" >&5
+ $as_echo "$sparcv9" >&6; }
+-- 
+1.9.1
+
diff --git a/package/snort/Config.in b/package/snort/Config.in
new file mode 100644
index 000000000000..d1a59d505004
--- /dev/null
+++ b/package/snort/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SNORT
+	bool "snort"
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # daq
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_DAQ
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Snort is a free and open source network intrusion
+	  prevention system (IPS) and network intrusion detection
+	  system (IDS). It can perform protocol analysis, content
+	  searching/matching, and can be used to detect a variety
+	  of attacks and probes, such as buffer overflows, stealth
+	  port scans, CGI attacks, SMB probes, OS fingerprinting
+	  attempts, and much more.
+
+	  https://www.snort.org
+
+comment "snort needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/snort/snort.hash b/package/snort/snort.hash
new file mode 100644
index 000000000000..211e862b7fc0
--- /dev/null
+++ b/package/snort/snort.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 9f6b3aeac5a109f55504bd370564ac431cb1773507929dc461626898f33f46cd  snort-2.9.11.1.tar.gz
+
+# Hash for license files:
+sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
+sha256 3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
new file mode 100644
index 000000000000..73e376a6474c
--- /dev/null
+++ b/package/snort/snort.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# snort
+#
+################################################################################
+
+SNORT_VERSION = 2.9.11.1
+SNORT_SOURCE = snort-$(SNORT_VERSION).tar.gz
+SNORT_SITE = https://www.snort.org/downloads/snort
+SNORT_LICENSE = GPL-2.0
+SNORT_LICENSE_FILES = LICENSE COPYING
+
+SNORT_DEPENDENCIES = libpcap daq pcre
+
+SNORT_CONF_OPTS = \
+	--with-libpcap-includes=$(TARGET_DIR)/usr/include/pcap \
+	--disable-static-daq
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+SNORT_DEPENDENCIES += libtirpc host-pkgconf
+SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+SNORT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
+endif
+
+SNORT_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) $(SNORT_CFLAGS)" LIBS="$(SNORT_LIBS)"
+
+$(eval $(autotools-package))
-- 
1.9.1
