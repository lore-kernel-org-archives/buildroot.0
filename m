From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  1 Apr 2018 17:00:29 +0200
Subject: [Buildroot] [PATCH v4] package/snort: new package
Message-ID: <20180401150029.25841-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sergio Prado <sergio.prado@e-labworks.com>

Tested on Beaglebone Black.

Build-tested with test-pkg.

Patch to fix cross-compilation errors submitted upstream [1].

[1] https://lists.snort.org/pipermail/snort-devel/2018-January/011025.html

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
[Romain:
 - split patch by build issues
 - convert AC_RUN_IFELSE to AC_CHECK_MEMBERS (ThomasP)
 - convert AC_RUN_IFELSE to AC_COMPILE_IFELSE (ThomasP)
 - remove most make variable from SNORT_CONF_ENV
 - remove SNORT_SOURCE default value]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Sergio, snort install some shared libraries and a snort.pc file.
Does it make sens to add "SNORT_INSTALL_STAGING = YES"?

Changes v3 -> v4
 - split patch by build issues
 - convert AC_RUN_IFELSE to AC_CHECK_MEMBERS (ThomasP)
 - convert AC_RUN_IFELSE to AC_COMPILE_IFELSE (ThomasP)
 - remove most make variable from SNORT_CONF_ENV
 - remove SNORT_SOURCE default value

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
 ...gure.in-Avoid-path-poisoning-with-libpcap.patch |  35 +++
 ...n-Allow-to-override-the-INADDR_NONE-check.patch |  44 ++++
 ...n-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch | 239 +++++++++++++++++++++
 ...n-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch |  61 ++++++
 package/snort/Config.in                            |  25 +++
 package/snort/snort.hash                           |   6 +
 package/snort/snort.mk                             |  32 +++
 9 files changed, 444 insertions(+)
 create mode 100644 package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch
 create mode 100644 package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch
 create mode 100644 package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch
 create mode 100644 package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch
 create mode 100644 package/snort/Config.in
 create mode 100644 package/snort/snort.hash
 create mode 100644 package/snort/snort.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 035376eca8..d97259e73a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1681,6 +1681,7 @@ F:	package/daq/
 F:	package/libgdiplus/
 F:	package/mongodb/
 F:	package/pimd/
+F:	package/snort/
 F:	package/stella/
 F:	package/traceroute/
 F:	package/tunctl/
diff --git a/package/Config.in b/package/Config.in
index b98f661783..e9f671ddb2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1833,6 +1833,7 @@ endif
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/sngrep/Config.in"
+	source "package/snort/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch b/package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch
new file mode 100644
index 0000000000..286b6f5883
--- /dev/null
+++ b/package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch
@@ -0,0 +1,35 @@
+From 732459ca3423799ae3386df3de3f5d6ea2af1b95 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 1 Apr 2018 15:18:51 +0200
+Subject: [PATCH] configure.in: Avoid path poisoning with libpcap
+
+Prevent usage of unsafe libpcap header path when cross compiling.
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Cc: Sergio Prado <sergio.prado@e-labworks.com>
+---
+From http://patchwork.ozlabs.org/patch/860363/
+---
+ configure.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 4b3a5db..1e940b1 100644
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
+-- 
+2.14.3
+
diff --git a/package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch b/package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch
new file mode 100644
index 0000000000..6575154240
--- /dev/null
+++ b/package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch
@@ -0,0 +1,44 @@
+From a6817677a42d1294f1a3ce7b9f46b10ec557ddfa Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 1 Apr 2018 15:23:59 +0200
+Subject: [PATCH] configure.in: Allow to override the INADDR_NONE check
+
+Prevent configure script from trying to run programs in a cross
+compilation environment to check if INADDR_NONE is defined.
+
+In the context of Buildroot, INADDR_NONE is always defined.
+The snort package will set have_inaddr_none=yes in
+SNORT_CONF_ENV.
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Cc: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 1e940b1..938409f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -284,8 +284,8 @@ AC_CHECK_TYPES([int8_t,int16_t,int32_t,int64_t])
+ AC_CHECK_TYPES([boolean])
+ 
+ # In case INADDR_NONE is not defined (like on Solaris)
++AC_CACHE_CHECK([for INADDR_NONE], [have_inaddr_none], [
+ have_inaddr_none="no"
+-AC_MSG_CHECKING([for INADDR_NONE])
+ AC_RUN_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+@@ -298,7 +298,7 @@ AC_RUN_IFELSE(
+     return 0;
+ ]])],
+ [have_inaddr_none="yes"],
+-[have_inaddr_none="no"])
++[have_inaddr_none="no"])])
+ AC_MSG_RESULT($have_inaddr_none)
+ if test "x$have_inaddr_none" = "xno"; then
+ 	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+-- 
+2.14.3
+
diff --git a/package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch b/package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch
new file mode 100644
index 0000000000..059190ff6d
--- /dev/null
+++ b/package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch
@@ -0,0 +1,239 @@
+From 1ef6bdaeb0463a208a14e5d90646ce337df738fc Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 1 Apr 2018 15:38:55 +0200
+Subject: [PATCH] configure.in: convert AC_RUN_IFELSE to AC_CHECK_MEMBERS
+
+With AC_CHECK_MEMBERS, we don't need to compile and run a test program
+to check if a daq structure element is defined.
+
+Also check DAQ_Data_Channel_Params_t with params.flags
+
+typedef struct _DAQ_Data_Channel_Params_t
+{
+    unsigned flags;     /* DAQ_DATA_CHANNEL_* flags*/
+    unsigned timeout_ms;/* timeout of the data channel in milliseconds */
+    unsigned length;    /* [Future] length of the data associated with the data channel */
+    uint8_t* data;      /* [Future] opaque data blob to return with the data channel */
+} DAQ_Data_Channel_Params_t;
+
+https://github.com/Xiche/libdaq/blob/master/api/daq_common.h
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Cc: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure.in | 143 +++++++++++++++++------------------------------------------
+ 1 file changed, 41 insertions(+), 102 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 938409f..571322b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -718,17 +718,11 @@ fi
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta] [daq_dp_add_dc])
+ 
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
++
++AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.n_real_dPort],
++    [have_daq_real_addresses="yes"],
++    [have_daq_real_addresses="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_real_addresses)
+ if test "x$have_daq_real_addresses" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_REAL_ADDRESSES],[1],
+@@ -756,17 +750,11 @@ if test "x$ac_cv_func_daq_dp_add_dc" = "xyes"; then
+ fi
+ 
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
++
++AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.address_space_id],
++    [have_daq_address_space_id="yes"],
++    [have_daq_address_space_id="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_address_space_id)
+ if test "x$have_daq_address_space_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+@@ -774,17 +762,10 @@ if test "x$have_daq_address_space_id" = "xyes"; then
+ fi
+ 
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
++AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.flow_id],
++    [have_daq_flow_id="yes"],
++    [have_daq_flow_id="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_flow_id)
+ if test "x$have_daq_flow_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
+@@ -792,19 +773,10 @@ if test "x$have_daq_flow_id" = "xyes"; then
+ fi
+ 
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
++AC_CHECK_MEMBERS([DAQ_ModFlow_t mod.type, DAQ_ModFlow_t mod.length, DAQ_ModFlow_t mod.value],
++    [have_daq_ext_modflow="yes"],
++    [have_daq_ext_modflow="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_ext_modflow)
+ if test "x$have_daq_ext_modflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_EXT_MODFLOW"
+@@ -813,19 +785,11 @@ if test "x$have_daq_ext_modflow" = "xyes"; then
+ fi
+ 
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
++
++AC_CHECK_MEMBERS([DAQ_QueryFlow_t mod.type, DAQ_QueryFlow_t mod.length, DAQ_QueryFlow_t mod.value],
++    [have_daq_queryflow="yes"],
++    [have_daq_queryflow="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_queryflow)
+ if test "x$have_daq_queryflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_QUERYFLOW"
+@@ -834,16 +798,11 @@ if test "x$have_daq_queryflow" = "xyes"; then
+ fi
+ 
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
++
++AC_CHECK_MEMBERS([DAQ_Data_Channel_Params_t params.flags],
++    [have_daq_data_channel_flags="yes"],
++    [have_daq_data_channel_flags="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_data_channel_flags)
+ if test "x$have_daq_data_channel_flags" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_PARAMS"
+@@ -852,17 +811,10 @@ if test "x$have_daq_data_channel_flags" = "xyes"; then
+ fi
+ 
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
++AC_CHECK_MEMBERS([DAQ_DP_key_t dpKey.src_af],
++    [have_daq_data_channel_separate_ip_versions="yes"],
++    [have_daq_data_channel_separate_ip_versions="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_data_channel_separate_ip_versions)
+ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_SEPARATE_IP_VERSIONS"
+@@ -889,17 +841,10 @@ if test "x$have_daq_verdict_retry" = "xyes"; then
+ fi
+ 
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
++AC_CHECK_MEMBERS([DAQ_PktHdr_t hdr.flags],
++    [have_daq_packet_trace="yes"],
++    [have_daq_packet_trace="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_packet_trace)
+ if test "x$have_daq_packet_trace" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_PKT_TRACE],[1],
+@@ -909,17 +854,11 @@ else
+ fi
+ 
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
++
++AC_CHECK_MEMBERS([DAQ_ModFlow_t fl.type],
++    [have_daq_verdict_reason="yes"],
++    [have_daq_verdict_reason="no"],
++    [[#include <daq.h>]])
+ AC_MSG_RESULT($have_daq_verdict_reason)
+ if test "x$have_daq_verdict_reason" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_REASON],[1],
+-- 
+2.14.3
+
diff --git a/package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch b/package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch
new file mode 100644
index 0000000000..d4a7176abd
--- /dev/null
+++ b/package/snort/0004-configure.in-convert-AC_RUN_IFELSE-to-AC_COMPILE_IFE.patch
@@ -0,0 +1,61 @@
+From ce317ee86fc87c2eedf6b0065a7c5fd4dd9b6725 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 1 Apr 2018 16:21:31 +0200
+Subject: [PATCH] configure.in: convert AC_RUN_IFELSE to AC_COMPILE_IFELSE
+
+Prevent configure script from trying to run programs in a cross
+compilation environment.
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Cc: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure.in | 19 ++++++-------------
+ 1 file changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 571322b..28e2663 100644
+--- a/configure.in
++++ b/configure.in
+@@ -431,7 +431,7 @@ if test "x$LPCAP" = "xno"; then
+ fi
+ 
+ AC_MSG_CHECKING([for pcap_lex_destroy])
+-AC_RUN_IFELSE(
++AC_COMPILE_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+ #include <pcap.h>
+@@ -823,17 +823,10 @@ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+ fi
+ 
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
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <daq.h>]],
++                  [[DAQ_Verdict verdict; verdict = DAQ_VERDICT_RETRY;]])],
++                  [have_daq_verdict_retry="yes"],
++                  [have_daq_verdict_retry="no"])
+ AC_MSG_RESULT($have_daq_verdict_retry)
+ if test "x$have_daq_verdict_retry" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
+@@ -886,7 +879,7 @@ if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
+     OLD_CFLAGS="$CFLAGS"
+     CFLAGS="$CFLAGS -mcpu=v9 "
+     AC_MSG_CHECKING([for sparc %time register])
+-    AC_RUN_IFELSE(
++    AC_COMPILE_IFELSE(
+     [AC_LANG_PROGRAM(
+     [[]],
+     [[
+-- 
+2.14.3
+
diff --git a/package/snort/Config.in b/package/snort/Config.in
new file mode 100644
index 0000000000..d1a59d5050
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
index 0000000000..211e862b7f
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
index 0000000000..13f16b3b0f
--- /dev/null
+++ b/package/snort/snort.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# snort
+#
+################################################################################
+
+SNORT_VERSION = 2.9.11.1
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
+	have_inaddr_none=yes
+
+$(eval $(autotools-package))
-- 
2.14.3
