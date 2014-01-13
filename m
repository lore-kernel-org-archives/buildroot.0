From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 08:40:43 +0100
Subject: [Buildroot] [git commit] tcpreplay: bump version to 4.0.0
Message-ID: <20140113074100.B3D6E9BFDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07ec04246fca00bab8f2dde20762f65e1830edfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the tcpreplay package to version 4.0.0. The upstream package has
a new maintainer and license. Version 4.0.0 brings a number of new
features see http://tcpreplay.appneta.com/ for details.

[Peter: drop autoreconf]
Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/Config.in                        |    2 +-
 .../tcpreplay-3.4.3-010-cross-compile.patch        |  255 --------------------
 package/tcpreplay/tcpreplay.mk                     |    9 +-
 3 files changed, 7 insertions(+), 259 deletions(-)

diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index 7337070..2ba2eb5 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_TCPREPLAY
 	  Tcpreplay is a tool for replaying network traffic from files saved
 	  with tcpdump or other tools which write pcap(3) files.
 
-	  http://tcpreplay.synfin.net/
+	  http://tcpreplay.appneta.com/
diff --git a/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch b/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
deleted file mode 100644
index 816efd6..0000000
--- a/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
+++ /dev/null
@@ -1,255 +0,0 @@
---- tcpreplay-3.4.3-orig/configure.ac	2009-06-25 14:45:55.000000000 -0400
-+++ tcpreplay-3.4.3/configure.ac	2009-10-30 12:29:49.000000000 -0400
-@@ -420,6 +420,11 @@
-     exit(1);
- ]]), [
-     libpcap_version_096=yes
-+], [
-+    libpcap_version_096=no
-+], [
-+    AC_MSG_WARN([Tests not run when cross compiling])
-+    libpcap_version_096=no
- ])
- 
- libpcap_ver8=no
-@@ -447,6 +452,9 @@
-     libpcap_ver8=yes
- ], [
-     libpcap_ver8=no
-+], [
-+    AC_MSG_WARN([Tests not run when cross compiling])
-+    libpcap_ver8=no
- ])
- 
- libpcap_ver7=no
-@@ -472,25 +480,31 @@
-     libpcap_ver7=yes
- ], [
-     libpcap_ver7=no
-+], [
-+    AC_MSG_WARN([Tests not run when cross compiling])
-+    libpcap_ver7=no
- ])
- 
--if test x$libpcap_ver8 = xyes ; then
--    AC_MSG_RESULT(>= 0.8.0)
--elif test x$libpcap_ver7 = xyes ; then
--    AC_MSG_RESULT(>= 0.7.2)
--else 
--    AC_MSG_ERROR([Libpcap versions < 0.7.2 are not supported
--    Please upgrade to version 0.7.2 or better])
--fi
--
--libpcap_version=unknown
--if test x$libpcap_version_096 = xyes ; then
--    libpcap_version=">= 0.9.6"
--elif test x$libpcap_ver8 = xyes ; then
--    libpcap_version=">= 0.8.0"
--elif test x$libcap_ver7 = xyes ; then
--    libpcap_version=">= 0.7.0"
--fi
-+AC_CACHE_CHECK([for supported libpcap verision], [tr_cv_libpcap_version],
-+[
-+    if test x$libpcap_ver8 = xyes ; then
-+        AC_MSG_RESULT(>= 0.8.0)
-+    elif test x$libpcap_ver7 = xyes ; then
-+        AC_MSG_RESULT(>= 0.7.2)
-+    else 
-+        AC_MSG_ERROR([Libpcap versions < 0.7.2 are not supported
-+        Please upgrade to version 0.7.2 or better])
-+    fi
-+
-+    tr_cv_libpcap_version=unknown
-+    if test x$libpcap_version_096 = xyes ; then
-+        tr_cv_libpcap_version=">= 0.9.6"
-+    elif test x$libpcap_ver8 = xyes ; then
-+        tr_cv_libpcap_version=">= 0.8.0"
-+    elif test x$libcap_ver7 = xyes ; then
-+        tr_cv_libpcap_version=">= 0.7.0"
-+    fi
-+])
- 
- dnl Check for pcap_setnonblock()
- AC_MSG_CHECKING(for pcap_setnonblock)
-@@ -770,6 +784,9 @@
-     have_bpf=yes
- ],[
-     AC_MSG_RESULT(no)
-+],[
-+    AC_MSG_WARN([Tests not run when cross compiling])
-+    AC_MSG_RESULT(no)
- ])
- 
- 
-@@ -1189,7 +1206,7 @@
- ##########################################################################
-              TCPREPLAY Suite Configuration Results (${TCPREPLAY_VERSION})
- ##########################################################################
--libpcap:                    ${foundpcap} (${libpcap_version})
-+libpcap:                    ${foundpcap} (${tr_cv_libpcap_version})
- libdnet:                    ${founddnet} (${libdnet_version})
- autogen:                    ${AUTOGEN} (${AUTOGEN_VERSION})
- Use libopts tearoff:        ${enable_local_libopts}
---- tcpreplay-3.4.3-orig/configure	2009-06-25 15:24:38.000000000 -0400
-+++ tcpreplay-3.4.3/configure	2009-10-30 12:22:32.000000000 -0400
-@@ -21177,13 +21177,11 @@
- 
- libpcap_version_096=no
- if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&5
--$as_echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }; }
-+
-+    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
-+$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
-+    libpcap_version_096=no
-+
- else
-   cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
-@@ -21246,6 +21244,10 @@
- $as_echo "$as_me: failed program was:" >&5
- sed 's/^/| /' conftest.$ac_ext >&5
- 
-+( exit $ac_status )
-+
-+    libpcap_version_096=no
-+
- fi
- rm -rf conftest.dSYM
- rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
-@@ -21255,13 +21257,11 @@
- 
- libpcap_ver8=no
- if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&5
--$as_echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }; }
-+
-+    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
-+$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
-+    libpcap_ver8=no
-+
- else
-   cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
-@@ -21341,13 +21341,11 @@
- 
- libpcap_ver7=no
- if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&5
--$as_echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }; }
-+
-+    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
-+$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
-+    libpcap_ver7=no
-+
- else
-   cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
-@@ -21423,28 +21421,38 @@
- 
- 
- 
--if test x$libpcap_ver8 = xyes ; then
--    { $as_echo "$as_me:$LINENO: result: >= 0.8.0" >&5
-+{ $as_echo "$as_me:$LINENO: checking for supported libpcap verision" >&5
-+$as_echo_n "checking for supported libpcap verision... " >&6; }
-+if test "${tr_cv_libpcap_version+set}" = set; then
-+  $as_echo_n "(cached) " >&6
-+else
-+
-+    if test x$libpcap_ver8 = xyes ; then
-+        { $as_echo "$as_me:$LINENO: result: >= 0.8.0" >&5
- $as_echo ">= 0.8.0" >&6; }
--elif test x$libpcap_ver7 = xyes ; then
--    { $as_echo "$as_me:$LINENO: result: >= 0.7.2" >&5
-+    elif test x$libpcap_ver7 = xyes ; then
-+        { $as_echo "$as_me:$LINENO: result: >= 0.7.2" >&5
- $as_echo ">= 0.7.2" >&6; }
--else
--    { { $as_echo "$as_me:$LINENO: error: Libpcap versions < 0.7.2 are not supported
--    Please upgrade to version 0.7.2 or better" >&5
-+    else
-+        { { $as_echo "$as_me:$LINENO: error: Libpcap versions < 0.7.2 are not supported
-+        Please upgrade to version 0.7.2 or better" >&5
- $as_echo "$as_me: error: Libpcap versions < 0.7.2 are not supported
--    Please upgrade to version 0.7.2 or better" >&2;}
-+        Please upgrade to version 0.7.2 or better" >&2;}
-    { (exit 1); exit 1; }; }
--fi
-+    fi
-+
-+    tr_cv_libpcap_version=unknown
-+    if test x$tr_cv_libpcap_version_096 = xyes ; then
-+        tr_cv_libpcap_version=">= 0.9.6"
-+    elif test x$libpcap_ver8 = xyes ; then
-+        tr_cv_libpcap_version=">= 0.8.0"
-+    elif test x$libcap_ver7 = xyes ; then
-+        tr_cv_libpcap_version=">= 0.7.0"
-+    fi
- 
--libpcap_version=unknown
--if test x$libpcap_version_096 = xyes ; then
--    libpcap_version=">= 0.9.6"
--elif test x$libpcap_ver8 = xyes ; then
--    libpcap_version=">= 0.8.0"
--elif test x$libcap_ver7 = xyes ; then
--    libpcap_version=">= 0.7.0"
- fi
-+{ $as_echo "$as_me:$LINENO: result: $tr_cv_libpcap_version" >&5
-+$as_echo "$tr_cv_libpcap_version" >&6; }
- 
- { $as_echo "$as_me:$LINENO: checking for pcap_setnonblock" >&5
- $as_echo_n "checking for pcap_setnonblock... " >&6; }
-@@ -22159,13 +22167,12 @@
- { $as_echo "$as_me:$LINENO: checking for BPF device sending support" >&5
- $as_echo_n "checking for BPF device sending support... " >&6; }
- if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&5
--$as_echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }; }
-+
-+    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
-+$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
-+    { $as_echo "$as_me:$LINENO: result: no" >&5
-+$as_echo "no" >&6; }
-+
- else
-   cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
-@@ -35562,7 +35569,7 @@
- { $as_echo "$as_me:$LINENO: result: ##########################################################################
-              TCPREPLAY Suite Configuration Results (${TCPREPLAY_VERSION})
- ##########################################################################
--libpcap:                    ${foundpcap} (${libpcap_version})
-+libpcap:                    ${foundpcap} (${tr_cv_libpcap_version})
- libdnet:                    ${founddnet} (${libdnet_version})
- autogen:                    ${AUTOGEN} (${AUTOGEN_VERSION})
- Use libopts tearoff:        ${enable_local_libopts}
-@@ -35585,7 +35592,7 @@
- $as_echo "##########################################################################
-              TCPREPLAY Suite Configuration Results (${TCPREPLAY_VERSION})
- ##########################################################################
--libpcap:                    ${foundpcap} (${libpcap_version})
-+libpcap:                    ${foundpcap} (${tr_cv_libpcap_version})
- libdnet:                    ${founddnet} (${libdnet_version})
- autogen:                    ${AUTOGEN} (${AUTOGEN_VERSION})
- Use libopts tearoff:        ${enable_local_libopts}
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index f2b1991..0939c6c 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 3.4.3
+TCPREPLAY_VERSION = 4.0.0
 TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
-TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
+TCPREPLAY_LICENSE = GPLv3
+TCPREPLAY_LICENSE_FILES = docs/LICENSE
+TCPREPLAY_CONF_ENV = \
+	tr_cv_libpcap_version=">= 0.7.0" \
+	ac_cv_have_bpf=no
 TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
-TCPREPLAY_AUTORECONF = YES
 TCPREPLAY_DEPENDENCIES = libpcap
 
 # libpcap may depend on symbols in libusb as well
