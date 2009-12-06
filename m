From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 22:09:23 +0100
Subject: [Buildroot] [git commit master] add tcpreplay tool
Message-ID: <20091206211453.348F47770D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=20417bbf4e8be341c6754e5444c58ad1a25f3096
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #515.

Tcpreplay is a tool for replaying network traffic from files saved with
tcpdump or other tools which write pcap(3) files.

The tcpreplay suite also ships with other tools (tcprewrite,
tcpreplay-edit) for manipulating pcap files.

[Peter: minor tweaks]
Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 +
 package/Config.in                                  |    1 +
 package/tcpreplay/Config.in                        |    8 +
 .../tcpreplay-3.4.3-010-cross-compile.patch        |  255 ++++++++++++++++++++
 package/tcpreplay/tcpreplay.mk                     |   16 ++
 5 files changed, 283 insertions(+), 0 deletions(-)
 create mode 100644 package/tcpreplay/Config.in
 create mode 100644 package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
 create mode 100644 package/tcpreplay/tcpreplay.mk

diff --git a/CHANGES b/CHANGES
index 6af8cd6..a284a89 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,10 +1,13 @@
 2010.02, Not yet released:
 
+	New packages: tcpreplay
+
 	Updated/fixed packages: autoconf, bind, binutils, busybox, iw,
 	libpcap, lighttpd, mesa, pcre, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#515: tcpreplay: new package
 	#559: mesa3d build fails
 	#749: Bump usbutils package to version 0.86
 	#751: Kernel 2.6 snapshot fetch fail
diff --git a/package/Config.in b/package/Config.in
index c5a2365..e48ee93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -200,6 +200,7 @@ source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
+source "package/tcpreplay/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tftpd/Config.in"
 source "package/thttpd/Config.in"
diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
new file mode 100644
index 0000000..6d3a3bf
--- /dev/null
+++ b/package/tcpreplay/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TCPREPLAY
+	bool "tcpreplay"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Tcpreplay is a tool for replaying network traffic from files saved
+	  with tcpdump or other tools which write pcap(3) files.
+
+	  http://tcpreplay.synfin.net/
diff --git a/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch b/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
new file mode 100644
index 0000000..816efd6
--- /dev/null
+++ b/package/tcpreplay/tcpreplay-3.4.3-010-cross-compile.patch
@@ -0,0 +1,255 @@
+--- tcpreplay-3.4.3-orig/configure.ac	2009-06-25 14:45:55.000000000 -0400
++++ tcpreplay-3.4.3/configure.ac	2009-10-30 12:29:49.000000000 -0400
+@@ -420,6 +420,11 @@
+     exit(1);
+ ]]), [
+     libpcap_version_096=yes
++], [
++    libpcap_version_096=no
++], [
++    AC_MSG_WARN([Tests not run when cross compiling])
++    libpcap_version_096=no
+ ])
+ 
+ libpcap_ver8=no
+@@ -447,6 +452,9 @@
+     libpcap_ver8=yes
+ ], [
+     libpcap_ver8=no
++], [
++    AC_MSG_WARN([Tests not run when cross compiling])
++    libpcap_ver8=no
+ ])
+ 
+ libpcap_ver7=no
+@@ -472,25 +480,31 @@
+     libpcap_ver7=yes
+ ], [
+     libpcap_ver7=no
++], [
++    AC_MSG_WARN([Tests not run when cross compiling])
++    libpcap_ver7=no
+ ])
+ 
+-if test x$libpcap_ver8 = xyes ; then
+-    AC_MSG_RESULT(>= 0.8.0)
+-elif test x$libpcap_ver7 = xyes ; then
+-    AC_MSG_RESULT(>= 0.7.2)
+-else 
+-    AC_MSG_ERROR([Libpcap versions < 0.7.2 are not supported
+-    Please upgrade to version 0.7.2 or better])
+-fi
+-
+-libpcap_version=unknown
+-if test x$libpcap_version_096 = xyes ; then
+-    libpcap_version=">= 0.9.6"
+-elif test x$libpcap_ver8 = xyes ; then
+-    libpcap_version=">= 0.8.0"
+-elif test x$libcap_ver7 = xyes ; then
+-    libpcap_version=">= 0.7.0"
+-fi
++AC_CACHE_CHECK([for supported libpcap verision], [tr_cv_libpcap_version],
++[
++    if test x$libpcap_ver8 = xyes ; then
++        AC_MSG_RESULT(>= 0.8.0)
++    elif test x$libpcap_ver7 = xyes ; then
++        AC_MSG_RESULT(>= 0.7.2)
++    else 
++        AC_MSG_ERROR([Libpcap versions < 0.7.2 are not supported
++        Please upgrade to version 0.7.2 or better])
++    fi
++
++    tr_cv_libpcap_version=unknown
++    if test x$libpcap_version_096 = xyes ; then
++        tr_cv_libpcap_version=">= 0.9.6"
++    elif test x$libpcap_ver8 = xyes ; then
++        tr_cv_libpcap_version=">= 0.8.0"
++    elif test x$libcap_ver7 = xyes ; then
++        tr_cv_libpcap_version=">= 0.7.0"
++    fi
++])
+ 
+ dnl Check for pcap_setnonblock()
+ AC_MSG_CHECKING(for pcap_setnonblock)
+@@ -770,6 +784,9 @@
+     have_bpf=yes
+ ],[
+     AC_MSG_RESULT(no)
++],[
++    AC_MSG_WARN([Tests not run when cross compiling])
++    AC_MSG_RESULT(no)
+ ])
+ 
+ 
+@@ -1189,7 +1206,7 @@
+ ##########################################################################
+              TCPREPLAY Suite Configuration Results (${TCPREPLAY_VERSION})
+ ##########################################################################
+-libpcap:                    ${foundpcap} (${libpcap_version})
++libpcap:                    ${foundpcap} (${tr_cv_libpcap_version})
+ libdnet:                    ${founddnet} (${libdnet_version})
+ autogen:                    ${AUTOGEN} (${AUTOGEN_VERSION})
+ Use libopts tearoff:        ${enable_local_libopts}
+--- tcpreplay-3.4.3-orig/configure	2009-06-25 15:24:38.000000000 -0400
++++ tcpreplay-3.4.3/configure	2009-10-30 12:22:32.000000000 -0400
+@@ -21177,13 +21177,11 @@
+ 
+ libpcap_version_096=no
+ if test "$cross_compiling" = yes; then
+-  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-$as_echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }; }
++
++    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
++$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
++    libpcap_version_096=no
++
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -21246,6 +21244,10 @@
+ $as_echo "$as_me: failed program was:" >&5
+ sed 's/^/| /' conftest.$ac_ext >&5
+ 
++( exit $ac_status )
++
++    libpcap_version_096=no
++
+ fi
+ rm -rf conftest.dSYM
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+@@ -21255,13 +21257,11 @@
+ 
+ libpcap_ver8=no
+ if test "$cross_compiling" = yes; then
+-  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-$as_echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }; }
++
++    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
++$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
++    libpcap_ver8=no
++
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -21341,13 +21341,11 @@
+ 
+ libpcap_ver7=no
+ if test "$cross_compiling" = yes; then
+-  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-$as_echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }; }
++
++    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
++$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
++    libpcap_ver7=no
++
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -21423,28 +21421,38 @@
+ 
+ 
+ 
+-if test x$libpcap_ver8 = xyes ; then
+-    { $as_echo "$as_me:$LINENO: result: >= 0.8.0" >&5
++{ $as_echo "$as_me:$LINENO: checking for supported libpcap verision" >&5
++$as_echo_n "checking for supported libpcap verision... " >&6; }
++if test "${tr_cv_libpcap_version+set}" = set; then
++  $as_echo_n "(cached) " >&6
++else
++
++    if test x$libpcap_ver8 = xyes ; then
++        { $as_echo "$as_me:$LINENO: result: >= 0.8.0" >&5
+ $as_echo ">= 0.8.0" >&6; }
+-elif test x$libpcap_ver7 = xyes ; then
+-    { $as_echo "$as_me:$LINENO: result: >= 0.7.2" >&5
++    elif test x$libpcap_ver7 = xyes ; then
++        { $as_echo "$as_me:$LINENO: result: >= 0.7.2" >&5
+ $as_echo ">= 0.7.2" >&6; }
+-else
+-    { { $as_echo "$as_me:$LINENO: error: Libpcap versions < 0.7.2 are not supported
+-    Please upgrade to version 0.7.2 or better" >&5
++    else
++        { { $as_echo "$as_me:$LINENO: error: Libpcap versions < 0.7.2 are not supported
++        Please upgrade to version 0.7.2 or better" >&5
+ $as_echo "$as_me: error: Libpcap versions < 0.7.2 are not supported
+-    Please upgrade to version 0.7.2 or better" >&2;}
++        Please upgrade to version 0.7.2 or better" >&2;}
+    { (exit 1); exit 1; }; }
+-fi
++    fi
++
++    tr_cv_libpcap_version=unknown
++    if test x$tr_cv_libpcap_version_096 = xyes ; then
++        tr_cv_libpcap_version=">= 0.9.6"
++    elif test x$libpcap_ver8 = xyes ; then
++        tr_cv_libpcap_version=">= 0.8.0"
++    elif test x$libcap_ver7 = xyes ; then
++        tr_cv_libpcap_version=">= 0.7.0"
++    fi
+ 
+-libpcap_version=unknown
+-if test x$libpcap_version_096 = xyes ; then
+-    libpcap_version=">= 0.9.6"
+-elif test x$libpcap_ver8 = xyes ; then
+-    libpcap_version=">= 0.8.0"
+-elif test x$libcap_ver7 = xyes ; then
+-    libpcap_version=">= 0.7.0"
+ fi
++{ $as_echo "$as_me:$LINENO: result: $tr_cv_libpcap_version" >&5
++$as_echo "$tr_cv_libpcap_version" >&6; }
+ 
+ { $as_echo "$as_me:$LINENO: checking for pcap_setnonblock" >&5
+ $as_echo_n "checking for pcap_setnonblock... " >&6; }
+@@ -22159,13 +22167,12 @@
+ { $as_echo "$as_me:$LINENO: checking for BPF device sending support" >&5
+ $as_echo_n "checking for BPF device sending support... " >&6; }
+ if test "$cross_compiling" = yes; then
+-  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-$as_echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }; }
++
++    { $as_echo "$as_me:$LINENO: WARNING: Tests not run when cross compiling" >&5
++$as_echo "$as_me: WARNING: Tests not run when cross compiling" >&2;}
++    { $as_echo "$as_me:$LINENO: result: no" >&5
++$as_echo "no" >&6; }
++
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -35562,7 +35569,7 @@
+ { $as_echo "$as_me:$LINENO: result: ##########################################################################
+              TCPREPLAY Suite Configuration Results (${TCPREPLAY_VERSION})
+ ##########################################################################
+-libpcap:                    ${foundpcap} (${libpcap_version})
++libpcap:                    ${foundpcap} (${tr_cv_libpcap_version})
+ libdnet:                    ${founddnet} (${libdnet_version})
+ autogen:                    ${AUTOGEN} (${AUTOGEN_VERSION})
+ Use libopts tearoff:        ${enable_local_libopts}
+@@ -35585,7 +35592,7 @@
+ $as_echo "##########################################################################
+              TCPREPLAY Suite Configuration Results (${TCPREPLAY_VERSION})
+ ##########################################################################
+-libpcap:                    ${foundpcap} (${libpcap_version})
++libpcap:                    ${foundpcap} (${tr_cv_libpcap_version})
+ libdnet:                    ${founddnet} (${libdnet_version})
+ autogen:                    ${AUTOGEN} (${AUTOGEN_VERSION})
+ Use libopts tearoff:        ${enable_local_libopts}
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
new file mode 100644
index 0000000..52b0b35
--- /dev/null
+++ b/package/tcpreplay/tcpreplay.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# tcpreplay
+#
+#############################################################
+
+TCPREPLAY_VERSION = 3.4.3
+TCPREPLAY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/tcpreplay
+TCPREPLAY_LIBTOOL_PATCH = NO
+TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
+TCPREPLAY_CONF_OPT = --program-prefix="" --with-libpcap=$(STAGING_DIR)/usr
+
+TCPREPLAY_DEPENDENCIES = uclibc libpcap
+
+$(eval $(call AUTOTARGETS,package,tcpreplay))
+
-- 
1.6.3.3
