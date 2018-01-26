From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 13:38:25 +0100
Subject: [Buildroot] [git commit] libv4l: bump to version 1.14.1
Message-ID: <20180126124344.F12C783C7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b94c8cf7ca44159cb8e36b500a8d6d7a01f46f32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches. autoreconf is no longer needed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-ir-ctl-fixes-for-musl-compile.patch       |  59 ------
 ...04-configure.ac-clarify-configure-summary.patch |  73 -------
 ...c-revisit-v4l2-ctl-compliance-using-libv4.patch |  43 ----
 ...c-revisit-disable-libv4l-to-disable-dyn-l.patch | 114 -----------
 ...07-configure.ac-add-disable-libv4l-option.patch | 155 ---------------
 ...gure.ac-fix-build-of-v4l-utils-on-uclinux.patch |  30 ---
 ...09-configure.ac-add-USE_LIBV4L-to-summary.patch |  28 ---
 ...lconvert-helper-support-only-when-fork-is.patch | 102 ----------
 ...c-drop-disable-libv4l-disable-plugin-supp.patch | 217 ---------------------
 package/libv4l/libv4l.hash                         |   4 +-
 package/libv4l/libv4l.mk                           |  15 +-
 11 files changed, 3 insertions(+), 837 deletions(-)

diff --git a/package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch b/package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch
deleted file mode 100644
index 5bce2d9..0000000
--- a/package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9908872aaa614a6c4bba80d7a5f1adea7ca7117e Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 14 Feb 2017 21:27:59 +0100
-Subject: [PATCH] ir-ctl: fixes for musl compile
-
-- add copy of TEMP_FAILURE_RETRY macro
-- use strdup instead of strdupa
-
-Fixes [1]:
-
-  ir-ctl.c:(.text+0xb06): undefined reference to `strndupa'
-  ir-ctl.c:(.text+0xe01): undefined reference to `TEMP_FAILURE_RETRY'
-
-[1] http://autobuild.buildroot.net/results/b8b96c7bbf2147dacac62485cbfdbcfd758271a5
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- utils/ir-ctl/ir-ctl.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
-index bc58cee..e9da777 100644
---- a/utils/ir-ctl/ir-ctl.c
-+++ b/utils/ir-ctl/ir-ctl.c
-@@ -44,6 +44,15 @@
- 
- # define N_(string) string
- 
-+/* taken from glibc unistd.h */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__                                                              \
-+    ({ long int __result;                                                     \
-+       do __result = (long int) (expression);                                 \
-+       while (__result == -1L && errno == EINTR);                             \
-+       __result; }))
-+#endif
- 
- /* See drivers/media/rc/ir-lirc-codec.c line 23 */
- #define LIRCBUF_SIZE	512
-@@ -344,12 +353,14 @@ static struct file *read_scancode(const char *name)
- 		return NULL;
- 	}
- 
--	pstr = strndupa(name, p - name);
-+	pstr = strndup(name, p - name);
- 
- 	if (!protocol_match(pstr, &proto)) {
- 		fprintf(stderr, _("error: protocol '%s' not found\n"), pstr);
-+		free(pstr);
- 		return NULL;
- 	}
-+	free(pstr);
- 
- 	if (!strtoscancode(p + 1, &scancode)) {
- 		fprintf(stderr, _("error: invalid scancode '%s'\n"), p + 1);
--- 
-2.11.0
-
diff --git a/package/libv4l/0004-configure.ac-clarify-configure-summary.patch b/package/libv4l/0004-configure.ac-clarify-configure-summary.patch
deleted file mode 100644
index dc67600..0000000
--- a/package/libv4l/0004-configure.ac-clarify-configure-summary.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 069efd194cf4cb225075440ae58137ea6375fb8b Mon Sep 17 00:00:00 2001
-From: Hans Verkuil <hans.verkuil@cisco.com>
-Date: Mon, 15 May 2017 15:13:00 +0200
-Subject: [PATCH] configure.ac: clarify configure summary
-
-Some of the texts are rather obscure and misleading. Fix those.
-
-Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
-Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
----
- configure.ac | 48 ++++++++++++++++++++++++------------------------
- 1 file changed, 24 insertions(+), 24 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e468b3a..3c70969 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -475,28 +475,28 @@ cat <<EOF
- compile time options summary
- ============================
- 
--    Host OS             : $host_os
--    X11                 : $x11_pkgconfig
--    GL                  : $gl_pkgconfig
--    glu                 : $glu_pkgconfig
--    libjpeg             : $have_jpeg
--    libudev             : $have_libudev
--    pthread             : $have_pthread
--    QT version          : $QT_VERSION
--    ALSA support        : $USE_ALSA
--
--    build dynamic libs  : $enable_shared
--    build static libs   : $enable_static
--
--    gconv               : $USE_GCONV
--
--    libv4l              : $USE_LIBV4L
--    v4l_plugins         : $USE_V4L_PLUGINS
--    v4l_wrappers        : $USE_V4L_WRAPPERS
--    libdvbv5            : $USE_LIBDVBV5
--    dvbv5-daemon        : $USE_DVBV5_REMOTE
--    v4lutils            : $USE_V4LUTILS
--    qv4l2               : $USE_QV4L2
--    v4l2-ctrl           : $USE_V4L2_CTL
--    v4l2-compliance     : $USE_V4L2_COMPLIANCE
-+    Host OS                    : $host_os
-+    X11                        : $x11_pkgconfig
-+    GL                         : $gl_pkgconfig
-+    glu                        : $glu_pkgconfig
-+    libjpeg                    : $have_jpeg
-+    libudev                    : $have_libudev
-+    pthread                    : $have_pthread
-+    QT version                 : $QT_VERSION
-+    ALSA support               : $USE_ALSA
-+
-+    build dynamic libs         : $enable_shared
-+    build static libs          : $enable_static
-+
-+    gconv                      : $USE_GCONV
-+
-+    dynamic libv4l             : $USE_LIBV4L
-+    v4l_plugins                : $USE_V4L_PLUGINS
-+    v4l_wrappers               : $USE_V4L_WRAPPERS
-+    libdvbv5                   : $USE_LIBDVBV5
-+    dvbv5-daemon               : $USE_DVBV5_REMOTE
-+    v4lutils                   : $USE_V4LUTILS
-+    qv4l2                      : $USE_QV4L2
-+    v4l2-ctl uses libv4l       : $USE_V4L2_CTL
-+    v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE
- EOF
--- 
-1.9.1
-
diff --git a/package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch b/package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
deleted file mode 100644
index 27fd498..0000000
--- a/package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e2f317f5b9a1ba888325ac938de26b402664c271 Mon Sep 17 00:00:00 2001
-From: Hugues Fruchet <hugues.fruchet@st.com>
-Date: Wed, 17 May 2017 10:03:09 +0200
-Subject: [PATCH] configure.ac: revisit v4l2-ctl/compliance using libv4l
- variable naming
-
-USE_V4L2_CTL and USE_V4L2_COMPLIANCE are used to trig the fact that
-v4l2-ctl and v4l2-compliance are using libv4l2, change namings to not
-confuse with overall v4l2-ctl/compliance utilities building.
-
-Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
-Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3c70969..5f20fc8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -461,8 +461,8 @@ AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
- AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"], [USE_V4L_PLUGINS="no"])
- AM_COND_IF([WITH_V4L_WRAPPERS], [USE_V4L_WRAPPERS="yes"], [USE_V4L_WRAPPERS="no"])
- AM_COND_IF([WITH_GCONV], [USE_GCONV="yes"], [USE_GCONV="no"])
--AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL="yes"], [USE_V4L2_CTL="no"])
--AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE="yes"], [USE_V4L2_COMPLIANCE="no"])
-+AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL_LIBV4L="yes"], [USE_V4L2_CTL_LIBV4L="no"])
-+AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
- AS_IF([test "x$alsa_pkgconfig" = "xtrue"], [USE_ALSA="yes"], [USE_ALSA="no"])
- 
- AC_OUTPUT
-@@ -497,6 +497,6 @@ compile time options summary
-     dvbv5-daemon               : $USE_DVBV5_REMOTE
-     v4lutils                   : $USE_V4LUTILS
-     qv4l2                      : $USE_QV4L2
--    v4l2-ctl uses libv4l       : $USE_V4L2_CTL
--    v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE
-+    v4l2-ctl uses libv4l       : $USE_V4L2_CTL_LIBV4L
-+    v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
- EOF
--- 
-1.9.1
-
diff --git a/package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch b/package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch
deleted file mode 100644
index 12f5d0d..0000000
--- a/package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 73efcd77d17fe92750bf5f76896786ca8e147a9f Mon Sep 17 00:00:00 2001
-From: Hugues Fruchet <hugues.fruchet@st.com>
-Date: Wed, 17 May 2017 10:03:10 +0200
-Subject: [PATCH] configure.ac: revisit --disable-libv4l to
- --disable-dyn-libv4l
-
---disable-libv4l is not disabling libv4l compilation, but only
-dynamic library support of libv4l libraries.
-
-Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
-Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
----
- configure.ac                  | 16 ++++++++--------
- lib/libv4l1/Makefile.am       |  2 +-
- lib/libv4l2/Makefile.am       |  2 +-
- lib/libv4l2rds/Makefile.am    |  2 +-
- lib/libv4lconvert/Makefile.am |  2 +-
- 5 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5f20fc8..8e536cc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -371,11 +371,11 @@ AC_ARG_ENABLE(libdvbv5,
-    esac]
- )
- 
--AC_ARG_ENABLE(libv4l,
--  AS_HELP_STRING([--disable-libv4l], [disable dynamic libv4l compilation]),
-+AC_ARG_ENABLE(dyn-libv4l,
-+  AS_HELP_STRING([--disable-dyn-libv4l], [disable dynamic libv4l support]),
-   [case "${enableval}" in
-      yes | no ) ;;
--     *) AC_MSG_ERROR(bad value ${enableval} for --disable-libv4l) ;;
-+     *) AC_MSG_ERROR(bad value ${enableval} for --disable-dyn-libv4l) ;;
-    esac]
- )
- 
-@@ -427,11 +427,11 @@ AC_SEARCH_LIBS([backtrace], [execinfo], [
- AM_CONDITIONAL([WITH_LIBDVBV5],     [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes])
- AM_CONDITIONAL([WITH_DVBV5_REMOTE], [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes -a x$have_pthread = xyes])
- 
--AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno])
-+AM_CONDITIONAL([WITH_DYN_LIBV4L],   [test x$enable_dyn_libv4l != xno])
- AM_CONDITIONAL([WITH_V4LUTILS],	    [test x$enable_v4l_utils != xno -a x$linux_os = xyes])
- AM_CONDITIONAL([WITH_QV4L2],	    [test x${qt_pkgconfig} = xtrue -a x$enable_qv4l2 != xno])
--AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_libv4l != xno -a x$enable_shared != xno])
--AM_CONDITIONAL([WITH_V4L_WRAPPERS], [test x$enable_libv4l != xno -a x$enable_shared != xno])
-+AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
-+AM_CONDITIONAL([WITH_V4L_WRAPPERS], [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
- AM_CONDITIONAL([WITH_QTGL],	    [test x${qt_pkgconfig_gl} = xtrue])
- AM_CONDITIONAL([WITH_GCONV],        [test x${enable_gconv} = xyes])
- AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test x${enable_v4l2_ctl_libv4l} != xno])
-@@ -455,7 +455,7 @@ AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
- AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
- 				 AC_DEFINE([HAVE_DVBV5_REMOTE], [1], [Usage of DVBv5 remote enabled])],
- 			        [USE_DVBV5_REMOTE="no"])
--AM_COND_IF([WITH_LIBV4L], [USE_LIBV4L="yes"], [USE_LIBV4L="no"])
-+AM_COND_IF([WITH_DYN_LIBV4L], [USE_DYN_LIBV4L="yes"], [USE_DYN_LIBV4L="no"])
- AM_COND_IF([WITH_V4LUTILS], [USE_V4LUTILS="yes"], [USE_V4LUTILS="no"])
- AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
- AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"], [USE_V4L_PLUGINS="no"])
-@@ -490,7 +490,7 @@ compile time options summary
- 
-     gconv                      : $USE_GCONV
- 
--    dynamic libv4l             : $USE_LIBV4L
-+    dynamic libv4l             : $USE_DYN_LIBV4L
-     v4l_plugins                : $USE_V4L_PLUGINS
-     v4l_wrappers               : $USE_V4L_WRAPPERS
-     libdvbv5                   : $USE_LIBDVBV5
-diff --git a/lib/libv4l1/Makefile.am b/lib/libv4l1/Makefile.am
-index f768eaa..42cb3db 100644
---- a/lib/libv4l1/Makefile.am
-+++ b/lib/libv4l1/Makefile.am
-@@ -1,4 +1,4 @@
--if WITH_LIBV4L
-+if WITH_DYN_LIBV4L
- lib_LTLIBRARIES = libv4l1.la
- include_HEADERS = ../include/libv4l1.h ../include/libv4l1-videodev.h
- pkgconfig_DATA = libv4l1.pc
-diff --git a/lib/libv4l2/Makefile.am b/lib/libv4l2/Makefile.am
-index 1314a99..811c45c 100644
---- a/lib/libv4l2/Makefile.am
-+++ b/lib/libv4l2/Makefile.am
-@@ -1,4 +1,4 @@
--if WITH_LIBV4L
-+if WITH_DYN_LIBV4L
- lib_LTLIBRARIES = libv4l2.la
- include_HEADERS = ../include/libv4l2.h ../include/libv4l-plugin.h
- pkgconfig_DATA = libv4l2.pc
-diff --git a/lib/libv4l2rds/Makefile.am b/lib/libv4l2rds/Makefile.am
-index 4f23a3f..73fdd3e 100644
---- a/lib/libv4l2rds/Makefile.am
-+++ b/lib/libv4l2rds/Makefile.am
-@@ -1,4 +1,4 @@
--if WITH_LIBV4L
-+if WITH_DYN_LIBV4L
- lib_LTLIBRARIES = libv4l2rds.la
- include_HEADERS = ../include/libv4l2rds.h
- pkgconfig_DATA = libv4l2rds.pc
-diff --git a/lib/libv4lconvert/Makefile.am b/lib/libv4lconvert/Makefile.am
-index 5c8a1cf..4f332fa 100644
---- a/lib/libv4lconvert/Makefile.am
-+++ b/lib/libv4lconvert/Makefile.am
-@@ -1,4 +1,4 @@
--if WITH_LIBV4L
-+if WITH_DYN_LIBV4L
- lib_LTLIBRARIES = libv4lconvert.la
- libv4lconvertpriv_PROGRAMS = ov511-decomp ov518-decomp
- include_HEADERS = ../include/libv4lconvert.h
--- 
-1.9.1
-
diff --git a/package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch b/package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch
deleted file mode 100644
index fed2837..0000000
--- a/package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 702722a43ee6472993fabdd810272d3599064866 Mon Sep 17 00:00:00 2001
-From: Hugues Fruchet <hugues.fruchet@st.com>
-Date: Wed, 17 May 2017 10:03:11 +0200
-Subject: [PATCH] configure.ac: add --disable-libv4l option
-
-Add an option to disable libv4l libraries and plugins compilation.
-If system is not supporting dynamic shared libraries, this option
-is automatically set.
-dlopen() is no more a mandatory dependency (warning is kept).
-lib/ and contrib/ folders are no more built with this option set
-because of libv4l dependency.
-utils/ folder is still built with this options set but without
-rds-ctl because of its libv4l dependency.
-v4l2-compliance and v4l2-ctl are also built but without any links
-on libv4l and libv4lconvert libraries.
-
-Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
-Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
----
- Makefile.am                       | 11 +++++++++--
- configure.ac                      | 12 +++++++++++-
- utils/Makefile.am                 |  6 +++++-
- utils/v4l2-compliance/Makefile.am |  4 ++++
- utils/v4l2-ctl/Makefile.am        |  4 ++++
- 5 files changed, 33 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e603472..07c3ef8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,10 +1,17 @@
- AUTOMAKE_OPTIONS = foreign
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = v4l-utils-po libdvbv5-po lib
-+SUBDIRS = v4l-utils-po libdvbv5-po
-+
-+if WITH_LIBV4L
-+SUBDIRS += lib
-+endif
- 
- if WITH_V4LUTILS
--SUBDIRS += utils contrib
-+SUBDIRS += utils
-+if WITH_LIBV4L
-+SUBDIRS += contrib
-+endif
- endif
- 
- EXTRA_DIST = android-config.h bootstrap.sh doxygen_libdvbv5.cfg include COPYING.libv4l \
-diff --git a/configure.ac b/configure.ac
-index 8e536cc..b9fc59a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -285,7 +285,7 @@ dl_saved_libs=$LIBS
-   AC_SEARCH_LIBS([dlopen],
-                  [dl],
-                  [test "$ac_cv_search_dlopen" = "none required" || DLOPEN_LIBS=$ac_cv_search_dlopen],
--                 [AC_MSG_ERROR([unable to find the dlopen() function])])
-+                 [AC_MSG_WARN([unable to find the dlopen() function])])
-   AC_SUBST([DLOPEN_LIBS])
- LIBS=$dl_saved_libs
- 
-@@ -371,6 +371,14 @@ AC_ARG_ENABLE(libdvbv5,
-    esac]
- )
- 
-+AC_ARG_ENABLE(libv4l,
-+  AS_HELP_STRING([--disable-libv4l], [disable libv4l compilation]),
-+  [case "${enableval}" in
-+     yes | no ) ;;
-+     *) AC_MSG_ERROR(bad value ${enableval} for --disable-libv4l) ;;
-+   esac]
-+)
-+
- AC_ARG_ENABLE(dyn-libv4l,
-   AS_HELP_STRING([--disable-dyn-libv4l], [disable dynamic libv4l support]),
-   [case "${enableval}" in
-@@ -428,6 +436,7 @@ AM_CONDITIONAL([WITH_LIBDVBV5],     [test x$enable_libdvbv5  != xno -a x$have_li
- AM_CONDITIONAL([WITH_DVBV5_REMOTE], [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes -a x$have_pthread = xyes])
- 
- AM_CONDITIONAL([WITH_DYN_LIBV4L],   [test x$enable_dyn_libv4l != xno])
-+AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno -a x$enable_shared != xno])
- AM_CONDITIONAL([WITH_V4LUTILS],	    [test x$enable_v4l_utils != xno -a x$linux_os = xyes])
- AM_CONDITIONAL([WITH_QV4L2],	    [test x${qt_pkgconfig} = xtrue -a x$enable_qv4l2 != xno])
- AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
-@@ -455,6 +464,7 @@ AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
- AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
- 				 AC_DEFINE([HAVE_DVBV5_REMOTE], [1], [Usage of DVBv5 remote enabled])],
- 			        [USE_DVBV5_REMOTE="no"])
-+AM_COND_IF([WITH_LIBV4L], [USE_LIBV4L="yes"], [USE_LIBV4L="no"])
- AM_COND_IF([WITH_DYN_LIBV4L], [USE_DYN_LIBV4L="yes"], [USE_DYN_LIBV4L="no"])
- AM_COND_IF([WITH_V4LUTILS], [USE_V4LUTILS="yes"], [USE_V4LUTILS="no"])
- AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
-diff --git a/utils/Makefile.am b/utils/Makefile.am
-index d7708cc..ce710c2 100644
---- a/utils/Makefile.am
-+++ b/utils/Makefile.am
-@@ -13,8 +13,12 @@ SUBDIRS = \
- 	v4l2-sysfs-path \
- 	cec-ctl \
- 	cec-compliance \
--	cec-follower \
-+	cec-follower
-+
-+if WITH_LIBV4L
-+SUBDIRS += \
- 	rds-ctl
-+endif
- 
- if WITH_LIBDVBV5
- SUBDIRS += \
-diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
-index c2b5919..0240a50 100644
---- a/utils/v4l2-compliance/Makefile.am
-+++ b/utils/v4l2-compliance/Makefile.am
-@@ -7,12 +7,16 @@ v4l2_compliance_SOURCES = v4l2-compliance.cpp v4l2-test-debug.cpp v4l2-test-inpu
- 	v4l2-test-codecs.cpp v4l2-test-colors.cpp v4l2-compliance.h
- v4l2_compliance_CPPFLAGS = -I../common
- 
-+if WITH_LIBV4L
- if WITH_V4L2_COMPLIANCE_LIBV4L
- v4l2_compliance_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
- else
- v4l2_compliance_LDADD = -lrt -lpthread
- DEFS += -DNO_LIBV4L2
- endif
-+else
-+DEFS += -DNO_LIBV4L2
-+endif
- 
- EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1
- 
-diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
-index 955647d..4475aed 100644
---- a/utils/v4l2-ctl/Makefile.am
-+++ b/utils/v4l2-ctl/Makefile.am
-@@ -9,10 +9,14 @@ v4l2_ctl_SOURCES = v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cp
- 	v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c
- v4l2_ctl_CPPFLAGS = -I../common
- 
-+if WITH_LIBV4L
- if WITH_V4L2_CTL_LIBV4L
- v4l2_ctl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
- else
- DEFS += -DNO_LIBV4L2
- endif
-+else
-+DEFS += -DNO_LIBV4L2
-+endif
- 
- EXTRA_DIST = Android.mk v4l2-ctl.1
--- 
-1.9.1
-
diff --git a/package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch b/package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
deleted file mode 100644
index 8f57ec9..0000000
--- a/package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f66141af12fe45af4ef3bba26e8f300fb203203a Mon Sep 17 00:00:00 2001
-From: Hugues Fruchet <hugues.fruchet@st.com>
-Date: Wed, 17 May 2017 10:03:12 +0200
-Subject: [PATCH] configure.ac: fix build of v4l-utils on uclinux
-
-Build of v4-utils is conditional to "linux_os=yes" which was
-not set in case of uclinux, fix this.
-
-Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
-Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b9fc59a..8dc676e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -149,7 +149,7 @@ AC_CHECK_FUNCS([__secure_getenv secure_getenv])
- 
- # Check host os
- case "$host_os" in
--  linux*)
-+  *linux*)
-     linux_os="yes"
-     ;;
-   *freebsd*)
--- 
-1.9.1
-
diff --git a/package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch b/package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch
deleted file mode 100644
index d9c38e0..0000000
--- a/package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d92eb36658af05286c5aac7e1cc8a5013f766cb4 Mon Sep 17 00:00:00 2001
-From: Hans Verkuil <hans.verkuil@cisco.com>
-Date: Mon, 29 May 2017 07:55:18 +0200
-Subject: [PATCH] configure.ac: add USE_LIBV4L to summary
-
-This was missing, so add it.
-
-Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
-Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8dc676e..9031b42 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -500,6 +500,7 @@ compile time options summary
- 
-     gconv                      : $USE_GCONV
- 
-+    libv4l                     : $USE_LIBV4L
-     dynamic libv4l             : $USE_DYN_LIBV4L
-     v4l_plugins                : $USE_V4L_PLUGINS
-     v4l_wrappers               : $USE_V4L_WRAPPERS
--- 
-1.9.1
-
diff --git a/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch b/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
deleted file mode 100644
index 30a8bde..0000000
--- a/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 91e7e4f4765780786e1479d28a70982adea256fc Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 25 Jul 2017 21:04:35 +0200
-Subject: [PATCH] Build libv4lconvert helper support only when fork() is
- available
-
-Upstream: https://git.linuxtv.org/v4l-utils.git/commit/?id=ed6eeee5f7dbc5b1b5b9263ae9281665d3fbe105
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac                      | 3 +++
- lib/libv4lconvert/Makefile.am     | 7 ++++++-
- lib/libv4lconvert/libv4lconvert.c | 6 ++++++
- 3 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ae8f2e2..72c9421 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -299,6 +299,9 @@ argp_saved_libs=$LIBS
-   AC_SUBST([ARGP_LIBS])
- LIBS=$argp_saved_libs
- 
-+AC_CHECK_FUNCS([fork], AC_DEFINE([HAVE_LIBV4LCONVERT_HELPERS],[1],[whether to use libv4lconvert helpers]))
-+AM_CONDITIONAL([HAVE_LIBV4LCONVERT_HELPERS], [test x$ac_cv_func_fork = xyes])
-+
- AC_CHECK_HEADER([linux/i2c-dev.h], [linux_i2c_dev=yes], [linux_i2c_dev=no])
- AM_CONDITIONAL([HAVE_LINUX_I2C_DEV], [test x$linux_i2c_dev = xyes])
- 
-diff --git a/lib/libv4lconvert/Makefile.am b/lib/libv4lconvert/Makefile.am
-index 4f332fa..f266f3e 100644
---- a/lib/libv4lconvert/Makefile.am
-+++ b/lib/libv4lconvert/Makefile.am
-@@ -1,6 +1,8 @@
- if WITH_DYN_LIBV4L
- lib_LTLIBRARIES = libv4lconvert.la
-+if HAVE_LIBV4LCONVERT_HELPERS
- libv4lconvertpriv_PROGRAMS = ov511-decomp ov518-decomp
-+endif
- include_HEADERS = ../include/libv4lconvert.h
- pkgconfig_DATA = libv4lconvert.pc
- LIBV4LCONVERT_VERSION = -version-info 0
-@@ -16,11 +18,14 @@ libv4lconvert_la_SOURCES = \
-   control/libv4lcontrol.c control/libv4lcontrol.h control/libv4lcontrol-priv.h \
-   processing/libv4lprocessing.c processing/whitebalance.c processing/autogain.c \
-   processing/gamma.c processing/libv4lprocessing.h processing/libv4lprocessing-priv.h \
--  helper.c helper-funcs.h libv4lconvert-priv.h libv4lsyscall-priv.h \
-+  helper-funcs.h libv4lconvert-priv.h libv4lsyscall-priv.h \
-   tinyjpeg.h tinyjpeg-internal.h
- if HAVE_JPEG
- libv4lconvert_la_SOURCES += jpeg_memsrcdest.c jpeg_memsrcdest.h
- endif
-+if HAVE_LIBV4LCONVERT_HELPERS
-+libv4lconvert_la_SOURCES += helper.c
-+endif
- libv4lconvert_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
- libv4lconvert_la_LDFLAGS = $(LIBV4LCONVERT_VERSION) -lrt -lm $(JPEG_LIBS) $(ENFORCE_LIBV4L_STATIC)
- 
-diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
-index d60774e..1a5ccec 100644
---- a/lib/libv4lconvert/libv4lconvert.c
-+++ b/lib/libv4lconvert/libv4lconvert.c
-@@ -122,8 +122,10 @@ static const struct v4lconvert_pixfmt supported_src_pixfmts[] = {
- 	{ V4L2_PIX_FMT_JPEG,		 0,	 7,	 7,	0 },
- 	{ V4L2_PIX_FMT_PJPG,		 0,	 7,	 7,	1 },
- 	{ V4L2_PIX_FMT_JPGL,		 0,	 7,	 7,	1 },
-+#ifdef HAVE_LIBV4LCONVERT_HELPERS
- 	{ V4L2_PIX_FMT_OV511,		 0,	 7,	 7,	1 },
- 	{ V4L2_PIX_FMT_OV518,		 0,	 7,	 7,	1 },
-+#endif
- 	/* uncompressed bayer */
- 	{ V4L2_PIX_FMT_SBGGR8,		 8,	 8,	 8,	0 },
- 	{ V4L2_PIX_FMT_SGBRG8,		 8,	 8,	 8,	0 },
-@@ -278,7 +280,9 @@ void v4lconvert_destroy(struct v4lconvert_data *data)
- 	if (data->cinfo_initialized)
- 		jpeg_destroy_decompress(&data->cinfo);
- #endif // HAVE_JPEG
-+#ifdef HAVE_LIBV4LCONVERT_HELPERS
- 	v4lconvert_helper_cleanup(data);
-+#endif
- 	free(data->convert1_buf);
- 	free(data->convert2_buf);
- 	free(data->rotate90_buf);
-@@ -833,6 +837,7 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
- 				return -1;
- 			}
- 			break;
-+#ifdef HAVE_LIBV4LCONVERT_HELPERS
- 		case V4L2_PIX_FMT_OV511:
- 			if (v4lconvert_helper_decompress(data, LIBV4LCONVERT_PRIV_DIR "/ov511-decomp",
- 						src, src_size, d, d_size, width, height, yvu)) {
-@@ -849,6 +854,7 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
- 				return -1;
- 			}
- 			break;
-+#endif
- 		}
- 
- 		switch (dest_pix_fmt) {
--- 
-1.9.1
-
diff --git a/package/libv4l/0011-configure.ac-drop-disable-libv4l-disable-plugin-supp.patch b/package/libv4l/0011-configure.ac-drop-disable-libv4l-disable-plugin-supp.patch
deleted file mode 100644
index 2224919..0000000
--- a/package/libv4l/0011-configure.ac-drop-disable-libv4l-disable-plugin-supp.patch
+++ /dev/null
@@ -1,217 +0,0 @@
-From 305ae25455b1f19ad2eda92523bd553fd8bc72fd Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 20 Aug 2017 23:58:44 +0200
-Subject: [PATCH] configure.ac: drop --disable-libv4l, disable plugin support
- instead
-
-In commit 2e604dfbcd09b93f0808cedb2a0b324c5569a599 ("configure.ac: add
---disable-libv4l option"), an option --disable-libv4l was added. As
-part of this, libv4l is no longer built at all in static linking
-configurations, just because libv4l uses dlopen() for plugin support.
-
-However, plugin support is only a side feature of libv4l, and one may
-need to use libv4l in static configurations, just without plugin
-support.
-
-Therefore, this commit:
-
- - Essentially reverts 2e604dfbcd09b93f0808cedb2a0b324c5569a599, so
-   that libv4l can be built in static linking configurations again.
-
- - Adjusts the compilation of libv4l2 so that the plugin support is
-   not compiled in when dlopen() in static linking configuration
-   (dlopen is not available).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream: https://www.mail-archive.com/linux-media at vger.kernel.org/msg117449.html
----
- Makefile.am                       | 11 ++---------
- configure.ac                      | 15 +++------------
- lib/libv4l2/Makefile.am           |  6 +++++-
- lib/libv4l2/libv4l2-priv.h        | 14 ++++++++++++++
- utils/Makefile.am                 |  6 +-----
- utils/v4l2-compliance/Makefile.am |  4 ----
- utils/v4l2-ctl/Makefile.am        |  4 ----
- 7 files changed, 25 insertions(+), 35 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 07c3ef8..e603472 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,17 +1,10 @@
- AUTOMAKE_OPTIONS = foreign
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = v4l-utils-po libdvbv5-po
--
--if WITH_LIBV4L
--SUBDIRS += lib
--endif
-+SUBDIRS = v4l-utils-po libdvbv5-po lib
- 
- if WITH_V4LUTILS
--SUBDIRS += utils
--if WITH_LIBV4L
--SUBDIRS += contrib
--endif
-+SUBDIRS += utils contrib
- endif
- 
- EXTRA_DIST = android-config.h bootstrap.sh doxygen_libdvbv5.cfg include COPYING.libv4l \
-diff --git a/configure.ac b/configure.ac
-index 58fb688..2ecb4a1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -374,14 +374,6 @@ AC_ARG_ENABLE(libdvbv5,
-    esac]
- )
- 
--AC_ARG_ENABLE(libv4l,
--  AS_HELP_STRING([--disable-libv4l], [disable libv4l compilation]),
--  [case "${enableval}" in
--     yes | no ) ;;
--     *) AC_MSG_ERROR(bad value ${enableval} for --disable-libv4l) ;;
--   esac]
--)
--
- AC_ARG_ENABLE(dyn-libv4l,
-   AS_HELP_STRING([--disable-dyn-libv4l], [disable dynamic libv4l support]),
-   [case "${enableval}" in
-@@ -439,7 +431,6 @@ AM_CONDITIONAL([WITH_LIBDVBV5],     [test x$enable_libdvbv5  != xno -a x$have_li
- AM_CONDITIONAL([WITH_DVBV5_REMOTE], [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes -a x$have_pthread = xyes])
- 
- AM_CONDITIONAL([WITH_DYN_LIBV4L],   [test x$enable_dyn_libv4l != xno])
--AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno -a x$enable_shared != xno])
- AM_CONDITIONAL([WITH_V4LUTILS],	    [test x$enable_v4l_utils != xno -a x$linux_os = xyes])
- AM_CONDITIONAL([WITH_QV4L2],	    [test x${qt_pkgconfig} = xtrue -a x$enable_qv4l2 != xno])
- AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
-@@ -467,11 +458,12 @@ AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
- AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
- 				 AC_DEFINE([HAVE_DVBV5_REMOTE], [1], [Usage of DVBv5 remote enabled])],
- 			        [USE_DVBV5_REMOTE="no"])
--AM_COND_IF([WITH_LIBV4L], [USE_LIBV4L="yes"], [USE_LIBV4L="no"])
- AM_COND_IF([WITH_DYN_LIBV4L], [USE_DYN_LIBV4L="yes"], [USE_DYN_LIBV4L="no"])
- AM_COND_IF([WITH_V4LUTILS], [USE_V4LUTILS="yes"], [USE_V4LUTILS="no"])
- AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
--AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"], [USE_V4L_PLUGINS="no"])
-+AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"
-+				AC_DEFINE([HAVE_V4L_PLUGINS], [1], [V4L plugin support enabled])],
-+				[USE_V4L_PLUGINS="no"])
- AM_COND_IF([WITH_V4L_WRAPPERS], [USE_V4L_WRAPPERS="yes"], [USE_V4L_WRAPPERS="no"])
- AM_COND_IF([WITH_GCONV], [USE_GCONV="yes"], [USE_GCONV="no"])
- AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL_LIBV4L="yes"], [USE_V4L2_CTL_LIBV4L="no"])
-@@ -503,7 +495,6 @@ compile time options summary
- 
-     gconv                      : $USE_GCONV
- 
--    libv4l                     : $USE_LIBV4L
-     dynamic libv4l             : $USE_DYN_LIBV4L
-     v4l_plugins                : $USE_V4L_PLUGINS
-     v4l_wrappers               : $USE_V4L_WRAPPERS
-diff --git a/lib/libv4l2/Makefile.am b/lib/libv4l2/Makefile.am
-index 811c45c..3a1bb90 100644
---- a/lib/libv4l2/Makefile.am
-+++ b/lib/libv4l2/Makefile.am
-@@ -15,7 +15,11 @@ else
- noinst_LTLIBRARIES = libv4l2.la
- endif
- 
--libv4l2_la_SOURCES = libv4l2.c v4l2-plugin.c log.c libv4l2-priv.h
-+libv4l2_la_SOURCES = libv4l2.c log.c libv4l2-priv.h
-+if WITH_V4L_PLUGINS
-+libv4l2_la_SOURCES += v4l2-plugin.c
-+endif
-+
- libv4l2_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
- libv4l2_la_LDFLAGS = $(LIBV4L2_VERSION) -lpthread $(DLOPEN_LIBS) $(ENFORCE_LIBV4L_STATIC)
- libv4l2_la_LIBADD = ../libv4lconvert/libv4lconvert.la
-diff --git a/lib/libv4l2/libv4l2-priv.h b/lib/libv4l2/libv4l2-priv.h
-index 343db5e..1924c91 100644
---- a/lib/libv4l2/libv4l2-priv.h
-+++ b/lib/libv4l2/libv4l2-priv.h
-@@ -107,10 +107,24 @@ struct v4l2_dev_info {
- };
- 
- /* From v4l2-plugin.c */
-+#if defined(HAVE_V4L_PLUGINS)
- void v4l2_plugin_init(int fd, void **plugin_lib_ret, void **plugin_priv_ret,
- 		      const struct libv4l_dev_ops **dev_ops_ret);
- void v4l2_plugin_cleanup(void *plugin_lib, void *plugin_priv,
- 			 const struct libv4l_dev_ops *dev_ops);
-+#else
-+static inline void v4l2_plugin_init(int fd, void **plugin_lib_ret, void **plugin_priv_ret,
-+				    const struct libv4l_dev_ops **dev_ops_ret)
-+{
-+	*dev_ops_ret = v4lconvert_get_default_dev_ops();
-+	*plugin_lib_ret = NULL;
-+	*plugin_priv_ret = NULL;
-+}
-+static inline void v4l2_plugin_cleanup(void *plugin_lib, void *plugin_priv,
-+				       const struct libv4l_dev_ops *dev_ops)
-+{
-+}
-+#endif /* WITH_V4L_PLUGINS */
- 
- /* From log.c */
- extern const char *v4l2_ioctls[];
-diff --git a/utils/Makefile.am b/utils/Makefile.am
-index ce710c2..d7708cc 100644
---- a/utils/Makefile.am
-+++ b/utils/Makefile.am
-@@ -13,12 +13,8 @@ SUBDIRS = \
- 	v4l2-sysfs-path \
- 	cec-ctl \
- 	cec-compliance \
--	cec-follower
--
--if WITH_LIBV4L
--SUBDIRS += \
-+	cec-follower \
- 	rds-ctl
--endif
- 
- if WITH_LIBDVBV5
- SUBDIRS += \
-diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
-index 0240a50..c2b5919 100644
---- a/utils/v4l2-compliance/Makefile.am
-+++ b/utils/v4l2-compliance/Makefile.am
-@@ -7,16 +7,12 @@ v4l2_compliance_SOURCES = v4l2-compliance.cpp v4l2-test-debug.cpp v4l2-test-inpu
- 	v4l2-test-codecs.cpp v4l2-test-colors.cpp v4l2-compliance.h
- v4l2_compliance_CPPFLAGS = -I../common
- 
--if WITH_LIBV4L
- if WITH_V4L2_COMPLIANCE_LIBV4L
- v4l2_compliance_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
- else
- v4l2_compliance_LDADD = -lrt -lpthread
- DEFS += -DNO_LIBV4L2
- endif
--else
--DEFS += -DNO_LIBV4L2
--endif
- 
- EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1
- 
-diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
-index 4475aed..955647d 100644
---- a/utils/v4l2-ctl/Makefile.am
-+++ b/utils/v4l2-ctl/Makefile.am
-@@ -9,14 +9,10 @@ v4l2_ctl_SOURCES = v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cp
- 	v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c
- v4l2_ctl_CPPFLAGS = -I../common
- 
--if WITH_LIBV4L
- if WITH_V4L2_CTL_LIBV4L
- v4l2_ctl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
- else
- DEFS += -DNO_LIBV4L2
- endif
--else
--DEFS += -DNO_LIBV4L2
--endif
- 
- EXTRA_DIST = Android.mk v4l2-ctl.1
--- 
-2.9.4
-
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 909ef73..aea9cc9 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.12.6.tar.bz2.asc
-sha256 74da1040284eaba48277ad051ffe1fca0ee05c5591bb01179d928def6d0a4561  v4l-utils-1.12.6.tar.bz2
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.14.1.tar.bz2.asc
+sha256 7974e5626447407d8a1ed531da0461c0fe00e599a696cb548a240d17d3519005  v4l-utils-1.14.1.tar.bz2
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index b24002a..1106130 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,26 +4,13 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.12.6
+LIBV4L_VERSION = 1.14.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
 
-# below patches requires autoreconf:
-# 0004-configure.ac-clarify-configure-summary.patch
-# 0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
-# 0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch
-# 0007-configure.ac-add-disable-libv4l-option.patch
-# 0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
-# 0009-configure.ac-add-USE_LIBV4L-to-summary.patch
-# 0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
-# 0011-configure.ac-drop-disable-libv4l-disable-plugin-supp.patch
-LIBV4L_AUTORECONF = YES
-# host-gettext needed for autoreconf to work
-LIBV4L_DEPENDENCIES += host-gettext
-
 # fix uclibc-ng configure/compile
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
