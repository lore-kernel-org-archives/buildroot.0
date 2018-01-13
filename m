From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 13 Jan 2018 16:40:39 -0200
Subject: [Buildroot] [PATCH v3] snort: new package
Message-ID: <1515868839-25930-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on Beaglebone Black.

Build-tested with test-pkg.

Patch to fix cross-compilation errors submitted upstream [1].

[1] https://lists.snort.org/pipermail/snort-devel/2018-January/011025.html

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
Changes v2 -> v3
  - using AC_CACHE_CHECK() in configure.in to preseed the variable value
  from the environment and avoid the AC_TRY_RUN() when cross compiling (as
  suggested by Thomas Petazzoni)
  - since now daq has an optional dependency on libdnet, snort must depend
  on it.

Changes v1 -> v2 (as reviewed by Thomas Petazzoni):
  - patching configure.in instead of configure
  - using STAGING_DIR to pass libpcap headers location to configure
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../snort/0001-Fix-cross-compilation-errors.patch  | 267 +++++++++++++++++++++
 package/snort/Config.in                            |  25 ++
 package/snort/snort.hash                           |   6 +
 package/snort/snort.mk                             |  45 ++++
 6 files changed, 345 insertions(+)
 create mode 100644 package/snort/0001-Fix-cross-compilation-errors.patch
 create mode 100644 package/snort/Config.in
 create mode 100644 package/snort/snort.hash
 create mode 100644 package/snort/snort.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f7d051e8a98..0c744a94b03c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1588,6 +1588,7 @@ F:	package/daq/
 F:	package/libgdiplus/
 F:	package/mongodb/
 F:	package/pimd/
+F:	package/snort/
 F:	package/stella/
 F:	package/traceroute/
 F:	package/tunctl/
diff --git a/package/Config.in b/package/Config.in
index 01f4095be5aa..ee3377918e66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1800,6 +1800,7 @@ endif
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/sngrep/Config.in"
+	source "package/snort/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/snort/0001-Fix-cross-compilation-errors.patch b/package/snort/0001-Fix-cross-compilation-errors.patch
new file mode 100644
index 000000000000..799c0182961b
--- /dev/null
+++ b/package/snort/0001-Fix-cross-compilation-errors.patch
@@ -0,0 +1,267 @@
+From f95f7f02a1646a91e9f3fadf4de2c264c65782f2 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sat, 13 Jan 2018 11:07:41 -0200
+Subject: [PATCH] Fix cross compilation errors
+
+Prevent configure script from trying to run programs in a cross
+compilation environment.
+
+Also prevent usage of unsafe libpcap header path when cross compiling.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure.in | 58 ++++++++++++++++++++++++++++++----------------------------
+ 1 file changed, 30 insertions(+), 28 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 4b3a5dbbf450..6dff6fad6157 100644
+--- a/configure.in
++++ b/configure.in
+@@ -70,8 +70,10 @@ case "$host" in
+   *-linux*)
+     linux="yes"
+     AC_DEFINE([LINUX],[1],[Define if Linux])
+-    AC_SUBST(extra_incl)
+-    extra_incl="-I/usr/include/pcap"
++    if test -z "x$with_libpcap_includes"; then
++        AC_SUBST(extra_incl)
++        extra_incl="-I/usr/include/pcap"
++    fi
+     ;;
+   *-hpux10*|*-hpux11*)
+     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
+@@ -282,8 +284,8 @@ AC_CHECK_TYPES([int8_t,int16_t,int32_t,int64_t])
+ AC_CHECK_TYPES([boolean])
+ 
+ # In case INADDR_NONE is not defined (like on Solaris)
++AC_CACHE_CHECK([for INADDR_NONE], [have_inaddr_none], [
+ have_inaddr_none="no"
+-AC_MSG_CHECKING([for INADDR_NONE])
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -296,7 +298,7 @@ AC_RUN_IFELSE(
+     return 0;
+ ]])],
+ [have_inaddr_none="yes"],
+-[have_inaddr_none="no"])
++[have_inaddr_none="no"])])
+ AC_MSG_RESULT($have_inaddr_none)
+ if test "x$have_inaddr_none" = "xno"; then
+ 	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+@@ -428,7 +430,7 @@ if test "x$LPCAP" = "xno"; then
+   fi
+ fi
+ 
+-AC_MSG_CHECKING([for pcap_lex_destroy])
++AC_CACHE_CHECK([for pcap_lex_destroy], [have_pcap_lex_destroy], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -438,7 +440,7 @@ AC_RUN_IFELSE(
+    pcap_lex_destroy();
+ ]])],
+ [have_pcap_lex_destroy="yes"],
+-[have_pcap_lex_destroy="no"])
++[have_pcap_lex_destroy="no"])])
+ AC_MSG_RESULT($have_pcap_lex_destroy)
+ if test "x$have_pcap_lex_destroy" = "xyes"; then
+     AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
+@@ -715,7 +717,7 @@ fi
+ 
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta] [daq_dp_add_dc])
+ 
+-AC_MSG_CHECKING([for daq real addresses])
++AC_CACHE_CHECK([for daq real addresses], [have_daq_real_addresses], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -726,7 +728,7 @@ AC_RUN_IFELSE(
+    hdr.n_real_dPort = 0;
+ ]])],
+ [have_daq_real_addresses="yes"],
+-[have_daq_real_addresses="no"])
++[have_daq_real_addresses="no"])])
+ AC_MSG_RESULT($have_daq_real_addresses)
+ if test "x$have_daq_real_addresses" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_REAL_ADDRESSES],[1],
+@@ -753,7 +755,7 @@ if test "x$ac_cv_func_daq_dp_add_dc" = "xyes"; then
+ 
+ fi
+ 
+-AC_MSG_CHECKING([for daq address space ID])
++AC_CACHE_CHECK([for daq address space ID], [have_daq_address_space_id], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -764,14 +766,14 @@ AC_RUN_IFELSE(
+    hdr.address_space_id = 0;
+ ]])],
+ [have_daq_address_space_id="yes"],
+-[have_daq_address_space_id="no"])
++[have_daq_address_space_id="no"])])
+ AC_MSG_RESULT($have_daq_address_space_id)
+ if test "x$have_daq_address_space_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+         [DAQ version supports address space ID in header.])
+ fi
+ 
+-AC_MSG_CHECKING([for daq flow ID])
++AC_CACHE_CHECK([for daq flow ID], [have_daq_flow_id], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -782,14 +784,14 @@ AC_RUN_IFELSE(
+    hdr.flow_id = 0;
+ ]])],
+ [have_daq_flow_id="yes"],
+-[have_daq_flow_id="no"])
++[have_daq_flow_id="no"])])
+ AC_MSG_RESULT($have_daq_flow_id)
+ if test "x$have_daq_flow_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
+         [DAQ version supports flow ID in header.])
+ fi
+ 
+-AC_MSG_CHECKING([for daq extended flow modifiers])
++AC_CACHE_CHECK([for daq extended flow modifiers], [have_daq_ext_modflow], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -802,7 +804,7 @@ AC_RUN_IFELSE(
+    mod.value = NULL;
+ ]])],
+ [have_daq_ext_modflow="yes"],
+-[have_daq_ext_modflow="no"])
++[have_daq_ext_modflow="no"])])
+ AC_MSG_RESULT($have_daq_ext_modflow)
+ if test "x$have_daq_ext_modflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_EXT_MODFLOW"
+@@ -810,7 +812,7 @@ if test "x$have_daq_ext_modflow" = "xyes"; then
+         [DAQ version supports extended flow modifiers.])
+ fi
+ 
+-AC_MSG_CHECKING([for daq query flow])
++AC_CACHE_CHECK([for daq query flow], [have_daq_queryflow], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -823,7 +825,7 @@ AC_RUN_IFELSE(
+    mod.value = NULL;
+ ]])],
+ [have_daq_queryflow="yes"],
+-[have_daq_queryflow="no"])
++[have_daq_queryflow="no"])])
+ AC_MSG_RESULT($have_daq_queryflow)
+ if test "x$have_daq_queryflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_QUERYFLOW"
+@@ -831,7 +833,7 @@ if test "x$have_daq_queryflow" = "xyes"; then
+         [DAQ version supports query flow.])
+ fi
+ 
+-AC_MSG_CHECKING([for daq data channel flags])
++AC_CACHE_CHECK([for daq data channel flags], [have_daq_data_channel_flags], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -841,7 +843,7 @@ AC_RUN_IFELSE(
+    DAQ_Data_Channel_Params_t params;
+ ]])],
+ [have_daq_data_channel_flags="yes"],
+-[have_daq_data_channel_flags="no"])
++[have_daq_data_channel_flags="no"])])
+ AC_MSG_RESULT($have_daq_data_channel_flags)
+ if test "x$have_daq_data_channel_flags" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_PARAMS"
+@@ -849,7 +851,7 @@ if test "x$have_daq_data_channel_flags" = "xyes"; then
+         [DAQ version supports data channel.])
+ fi
+ 
+-AC_MSG_CHECKING([for separate IP versions on pinhole endpoints])
++AC_CACHE_CHECK([for separate IP versions on pinhole endpoints], [have_daq_data_channel_separate_ip_versions], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -860,7 +862,7 @@ AC_RUN_IFELSE(
+    dpKey.src_af = 0;
+ ]])],
+ [have_daq_data_channel_separate_ip_versions="yes"],
+-[have_daq_data_channel_separate_ip_versions="no"])
++[have_daq_data_channel_separate_ip_versions="no"])])
+ AC_MSG_RESULT($have_daq_data_channel_separate_ip_versions)
+ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_SEPARATE_IP_VERSIONS"
+@@ -868,7 +870,7 @@ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+         [DAQ version supports separate IP versions on pinhole endpoints.])
+ fi
+ 
+-AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
++AC_CACHE_CHECK([for DAQ_VERDICT_RETRY], [have_daq_verdict_retry], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -879,14 +881,14 @@ AC_RUN_IFELSE(
+    verdict = DAQ_VERDICT_RETRY;
+ ]])],
+ [have_daq_verdict_retry="yes"],
+-[have_daq_verdict_retry="no"])
++[have_daq_verdict_retry="no"])])
+ AC_MSG_RESULT($have_daq_verdict_retry)
+ if test "x$have_daq_verdict_retry" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
+         [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
+ fi
+ 
+-AC_MSG_CHECKING([for daq packet trace])
++AC_CACHE_CHECK([for daq packet trace], [have_daq_packet_trace], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -897,7 +899,7 @@ AC_RUN_IFELSE(
+    hdr.flags = DAQ_PKT_FLAG_TRACE_ENABLED;
+ ]])],
+ [have_daq_packet_trace="yes"],
+-[have_daq_packet_trace="no"])
++[have_daq_packet_trace="no"])])
+ AC_MSG_RESULT($have_daq_packet_trace)
+ if test "x$have_daq_packet_trace" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_PKT_TRACE],[1],
+@@ -906,7 +908,7 @@ else
+     echo "DAQ version doesn't support packet trace."
+ fi
+ 
+-AC_MSG_CHECKING([for daq verdict reason])
++AC_CACHE_CHECK([for daq verdict reason], [have_daq_verdict_reason], [
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -917,7 +919,7 @@ AC_RUN_IFELSE(
+    fl.type = DAQ_MODFLOW_TYPE_VER_REASON;
+ ]])],
+ [have_daq_verdict_reason="yes"],
+-[have_daq_verdict_reason="no"])
++[have_daq_verdict_reason="no"])])
+ AC_MSG_RESULT($have_daq_verdict_reason)
+ if test "x$have_daq_verdict_reason" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_REASON],[1],
+@@ -944,7 +946,7 @@ fi
+ if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
+     OLD_CFLAGS="$CFLAGS"
+     CFLAGS="$CFLAGS -mcpu=v9 "
+-    AC_MSG_CHECKING([for sparc %time register])
++    AC_CACHE_CHECK([for sparc %time register], [sparcv9], [
+     AC_RUN_IFELSE(
+     [AC_LANG_PROGRAM(
+     [[]],
+@@ -953,7 +955,7 @@ if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
+         __asm__ __volatile__("rd %%tick, %0" : "=r"(val));
+     ]])],
+     [sparcv9="yes"],
+-    [sparcv9="no"])
++    [sparcv9="no"])])
+     AC_MSG_RESULT($sparcv9)
+     if test "x$sparcv9" = "xyes"; then
+         AC_DEFINE([SPARCV9],[1],[For sparc v9 with %time register])
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
index 000000000000..3b79c325fbe7
--- /dev/null
+++ b/package/snort/snort.mk
@@ -0,0 +1,45 @@
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
+SNORT_DEPENDENCIES = libpcap libdnet daq pcre
+
+# patching configure.in
+SNORT_AUTORECONF = YES
+
+SNORT_CONF_OPTS = \
+	--with-libpcap-includes=$(STAGING_DIR)/usr/include/pcap \
+	--disable-static-daq
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+SNORT_DEPENDENCIES += libtirpc host-pkgconf
+SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+SNORT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
+endif
+
+SNORT_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) $(SNORT_CFLAGS)" \
+	LIBS="$(SNORT_LIBS)" \
+	have_inaddr_none=yes \
+	have_pcap_lex_destroy=yes \
+	have_daq_real_addresses=no \
+	have_daq_address_space_id=yes \
+	have_daq_flow_id=yes \
+	have_daq_ext_modflow=no \
+	have_daq_queryflow=no \
+	have_daq_data_channel_flags=no \
+	have_daq_data_channel_separate_ip_versions=no \
+	have_daq_verdict_retry=yes \
+	have_daq_packet_trace=no \
+	have_daq_verdict_reason=no \
+	sparcv9=no
+
+$(eval $(autotools-package))
-- 
1.9.1
