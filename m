From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 10 Jan 2018 07:18:10 -0200
Subject: [Buildroot] [PATCH v2] snort: new package
Message-ID: <1515575890-29518-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on Beaglebone Black.

Build-tested with test-pkg.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
Changes v1 -> v2 (as reviewed by Thomas Petazzoni):
  - patching configure.in instead of configure
  - using STAGING_DIR to pass libpcap headers location to configure
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../snort/0001-Fix-cross-compilation-errors.patch  | 290 +++++++++++++++++++++
 package/snort/Config.in                            |  25 ++
 package/snort/snort.hash                           |   6 +
 package/snort/snort.mk                             |  31 +++
 6 files changed, 354 insertions(+)
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
index 000000000000..b3cad44229c3
--- /dev/null
+++ b/package/snort/0001-Fix-cross-compilation-errors.patch
@@ -0,0 +1,290 @@
+From 0c3d43c5f189b24504a809af9eaa1d2741a18bea Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Tue, 9 Jan 2018 22:24:40 -0200
+Subject: [PATCH] Fix cross compilation errors
+
+Prevent configure script from trying to run programs in a cross
+compilation environment.
+
+Also remove unsafe header/library path used in cross-compilation.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure.in | 160 +++++------------------------------------------------------
+ 1 file changed, 13 insertions(+), 147 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 4b3a5dbbf450..13798ce80ae7 100644
+--- a/configure.in
++++ b/configure.in
+@@ -71,7 +71,6 @@ case "$host" in
+     linux="yes"
+     AC_DEFINE([LINUX],[1],[Define if Linux])
+     AC_SUBST(extra_incl)
+-    extra_incl="-I/usr/include/pcap"
+     ;;
+   *-hpux10*|*-hpux11*)
+     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
+@@ -282,21 +281,8 @@ AC_CHECK_TYPES([int8_t,int16_t,int32_t,int64_t])
+ AC_CHECK_TYPES([boolean])
+ 
+ # In case INADDR_NONE is not defined (like on Solaris)
+-have_inaddr_none="no"
++have_inaddr_none="yes"
+ AC_MSG_CHECKING([for INADDR_NONE])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <sys/types.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-]],
+-[[
+-	if (inet_addr("10,5,2") == INADDR_NONE);
+-    return 0;
+-]])],
+-[have_inaddr_none="yes"],
+-[have_inaddr_none="no"])
+ AC_MSG_RESULT($have_inaddr_none)
+ if test "x$have_inaddr_none" = "xno"; then
+ 	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+@@ -428,17 +414,8 @@ if test "x$LPCAP" = "xno"; then
+   fi
+ fi
+ 
++have_pcap_lex_destroy="yes"
+ AC_MSG_CHECKING([for pcap_lex_destroy])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <pcap.h>
+-]],
+-[[
+-   pcap_lex_destroy();
+-]])],
+-[have_pcap_lex_destroy="yes"],
+-[have_pcap_lex_destroy="no"])
+ AC_MSG_RESULT($have_pcap_lex_destroy)
+ if test "x$have_pcap_lex_destroy" = "xyes"; then
+     AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
+@@ -715,18 +692,8 @@ fi
+ 
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta] [daq_dp_add_dc])
+ 
++have_daq_real_addresses="no"
+ AC_MSG_CHECKING([for daq real addresses])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.n_real_dPort = 0;
+-]])],
+-[have_daq_real_addresses="yes"],
+-[have_daq_real_addresses="no"])
+ AC_MSG_RESULT($have_daq_real_addresses)
+ if test "x$have_daq_real_addresses" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_REAL_ADDRESSES],[1],
+@@ -753,56 +720,24 @@ if test "x$ac_cv_func_daq_dp_add_dc" = "xyes"; then
+ 
+ fi
+ 
++have_daq_address_space_id="yes"
+ AC_MSG_CHECKING([for daq address space ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.address_space_id = 0;
+-]])],
+-[have_daq_address_space_id="yes"],
+-[have_daq_address_space_id="no"])
+ AC_MSG_RESULT($have_daq_address_space_id)
+ if test "x$have_daq_address_space_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+         [DAQ version supports address space ID in header.])
+ fi
+ 
++have_daq_flow_id="yes"
+ AC_MSG_CHECKING([for daq flow ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.flow_id = 0;
+-]])],
+-[have_daq_flow_id="yes"],
+-[have_daq_flow_id="no"])
+ AC_MSG_RESULT($have_daq_flow_id)
+ if test "x$have_daq_flow_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
+         [DAQ version supports flow ID in header.])
+ fi
+ 
++have_daq_ext_modflow="no"
+ AC_MSG_CHECKING([for daq extended flow modifiers])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_ModFlow_t mod;
+-   mod.type = 0;
+-   mod.length = 0;
+-   mod.value = NULL;
+-]])],
+-[have_daq_ext_modflow="yes"],
+-[have_daq_ext_modflow="no"])
+ AC_MSG_RESULT($have_daq_ext_modflow)
+ if test "x$have_daq_ext_modflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_EXT_MODFLOW"
+@@ -810,20 +745,8 @@ if test "x$have_daq_ext_modflow" = "xyes"; then
+         [DAQ version supports extended flow modifiers.])
+ fi
+ 
++have_daq_queryflow="no"
+ AC_MSG_CHECKING([for daq query flow])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_QueryFlow_t mod;
+-   mod.type = 0;
+-   mod.length = 0;
+-   mod.value = NULL;
+-]])],
+-[have_daq_queryflow="yes"],
+-[have_daq_queryflow="no"])
+ AC_MSG_RESULT($have_daq_queryflow)
+ if test "x$have_daq_queryflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_QUERYFLOW"
+@@ -831,17 +754,8 @@ if test "x$have_daq_queryflow" = "xyes"; then
+         [DAQ version supports query flow.])
+ fi
+ 
++have_daq_data_channel_flags="no"
+ AC_MSG_CHECKING([for daq data channel flags])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_Data_Channel_Params_t params;
+-]])],
+-[have_daq_data_channel_flags="yes"],
+-[have_daq_data_channel_flags="no"])
+ AC_MSG_RESULT($have_daq_data_channel_flags)
+ if test "x$have_daq_data_channel_flags" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_PARAMS"
+@@ -849,18 +763,8 @@ if test "x$have_daq_data_channel_flags" = "xyes"; then
+         [DAQ version supports data channel.])
+ fi
+ 
++have_daq_data_channel_separate_ip_versions="no"
+ AC_MSG_CHECKING([for separate IP versions on pinhole endpoints])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_DP_key_t dpKey;
+-   dpKey.src_af = 0;
+-]])],
+-[have_daq_data_channel_separate_ip_versions="yes"],
+-[have_daq_data_channel_separate_ip_versions="no"])
+ AC_MSG_RESULT($have_daq_data_channel_separate_ip_versions)
+ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_SEPARATE_IP_VERSIONS"
+@@ -868,36 +772,16 @@ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+         [DAQ version supports separate IP versions on pinhole endpoints.])
+ fi
+ 
++have_daq_verdict_retry="yes"
+ AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_Verdict verdict;
+-   verdict = DAQ_VERDICT_RETRY;
+-]])],
+-[have_daq_verdict_retry="yes"],
+-[have_daq_verdict_retry="no"])
+ AC_MSG_RESULT($have_daq_verdict_retry)
+ if test "x$have_daq_verdict_retry" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
+         [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
+ fi
+ 
++have_daq_packet_trace="no"
+ AC_MSG_CHECKING([for daq packet trace])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.flags = DAQ_PKT_FLAG_TRACE_ENABLED;
+-]])],
+-[have_daq_packet_trace="yes"],
+-[have_daq_packet_trace="no"])
+ AC_MSG_RESULT($have_daq_packet_trace)
+ if test "x$have_daq_packet_trace" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_PKT_TRACE],[1],
+@@ -906,18 +790,8 @@ else
+     echo "DAQ version doesn't support packet trace."
+ fi
+ 
++have_daq_verdict_reason="no"
+ AC_MSG_CHECKING([for daq verdict reason])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_ModFlow_t fl;
+-   fl.type = DAQ_MODFLOW_TYPE_VER_REASON;
+-]])],
+-[have_daq_verdict_reason="yes"],
+-[have_daq_verdict_reason="no"])
+ AC_MSG_RESULT($have_daq_verdict_reason)
+ if test "x$have_daq_verdict_reason" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_REASON],[1],
+@@ -944,16 +818,8 @@ fi
+ if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
+     OLD_CFLAGS="$CFLAGS"
+     CFLAGS="$CFLAGS -mcpu=v9 "
++    sparcv9="no"
+     AC_MSG_CHECKING([for sparc %time register])
+-    AC_RUN_IFELSE(
+-    [AC_LANG_PROGRAM(
+-    [[]],
+-    [[
+-        int val;
+-        __asm__ __volatile__("rd %%tick, %0" : "=r"(val));
+-    ]])],
+-    [sparcv9="yes"],
+-    [sparcv9="no"])
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
index 000000000000..e43bced21b89
--- /dev/null
+++ b/package/snort/snort.mk
@@ -0,0 +1,31 @@
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
+	CFLAGS="$(TARGET_CFLAGS) $(SNORT_CFLAGS)" LIBS="$(SNORT_LIBS)"
+
+$(eval $(autotools-package))
-- 
1.9.1
