From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Wed, 7 Jun 2017 12:12:06 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libv4l: upstream patches for
	noMMU platform
In-Reply-To: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
References: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
Message-ID: <1496830327-5235-2-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to build v4l2 utilities such as compliancy tools
like v4l2-compliance or cec-compliance, v4-utils can now be
built without dynamic libraries support.
In that case the v4l-utils parts which depends on dynamic
library support are not built:
 - libv4l & libv4lconvert libraries
 - libv4l plugins
 - rds-ctl utility
 - contrib test utilities
The rest of utilities are built.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 ...04-configure.ac-clarify-configure-summary.patch |  72 ++++++++++
 ...c-revisit-v4l2-ctl-compliance-using-libv4.patch |  43 ++++++
 ...c-revisit-disable-libv4l-to-disable-dyn-l.patch | 114 +++++++++++++++
 ...07-configure.ac-add-disable-libv4l-option.patch | 155 +++++++++++++++++++++
 ...gure.ac-fix-build-of-v4l-utils-on-uclinux.patch |  30 ++++
 ...09-configure.ac-add-USE_LIBV4L-to-summary.patch |  27 ++++
 package/libv4l/libv4l.mk                           |   6 +
 7 files changed, 447 insertions(+)
 create mode 100644 package/libv4l/0004-configure.ac-clarify-configure-summary.patch
 create mode 100644 package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
 create mode 100644 package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch
 create mode 100644 package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch
 create mode 100644 package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
 create mode 100644 package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch

diff --git a/package/libv4l/0004-configure.ac-clarify-configure-summary.patch b/package/libv4l/0004-configure.ac-clarify-configure-summary.patch
new file mode 100644
index 0000000..7a690c9
--- /dev/null
+++ b/package/libv4l/0004-configure.ac-clarify-configure-summary.patch
@@ -0,0 +1,72 @@
+From f0871b0e6b7f42ab93bbb1dc780e2621a05362f3 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hans.verkuil@cisco.com>
+Date: Mon, 15 May 2017 15:13:00 +0200
+Subject: [PATCH 4/9] configure.ac: clarify configure summary
+
+Some of the texts are rather obscure and misleading. Fix those.
+
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+---
+ configure.ac | 48 ++++++++++++++++++++++++------------------------
+ 1 file changed, 24 insertions(+), 24 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e468b3a..3c70969 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -475,28 +475,28 @@ cat <<EOF
+ compile time options summary
+ ============================
+ 
+-    Host OS             : $host_os
+-    X11                 : $x11_pkgconfig
+-    GL                  : $gl_pkgconfig
+-    glu                 : $glu_pkgconfig
+-    libjpeg             : $have_jpeg
+-    libudev             : $have_libudev
+-    pthread             : $have_pthread
+-    QT version          : $QT_VERSION
+-    ALSA support        : $USE_ALSA
+-
+-    build dynamic libs  : $enable_shared
+-    build static libs   : $enable_static
+-
+-    gconv               : $USE_GCONV
+-
+-    libv4l              : $USE_LIBV4L
+-    v4l_plugins         : $USE_V4L_PLUGINS
+-    v4l_wrappers        : $USE_V4L_WRAPPERS
+-    libdvbv5            : $USE_LIBDVBV5
+-    dvbv5-daemon        : $USE_DVBV5_REMOTE
+-    v4lutils            : $USE_V4LUTILS
+-    qv4l2               : $USE_QV4L2
+-    v4l2-ctrl           : $USE_V4L2_CTL
+-    v4l2-compliance     : $USE_V4L2_COMPLIANCE
++    Host OS                    : $host_os
++    X11                        : $x11_pkgconfig
++    GL                         : $gl_pkgconfig
++    glu                        : $glu_pkgconfig
++    libjpeg                    : $have_jpeg
++    libudev                    : $have_libudev
++    pthread                    : $have_pthread
++    QT version                 : $QT_VERSION
++    ALSA support               : $USE_ALSA
++
++    build dynamic libs         : $enable_shared
++    build static libs          : $enable_static
++
++    gconv                      : $USE_GCONV
++
++    dynamic libv4l             : $USE_LIBV4L
++    v4l_plugins                : $USE_V4L_PLUGINS
++    v4l_wrappers               : $USE_V4L_WRAPPERS
++    libdvbv5                   : $USE_LIBDVBV5
++    dvbv5-daemon               : $USE_DVBV5_REMOTE
++    v4lutils                   : $USE_V4LUTILS
++    qv4l2                      : $USE_QV4L2
++    v4l2-ctl uses libv4l       : $USE_V4L2_CTL
++    v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE
+ EOF
+-- 
+1.9.1
+
diff --git a/package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch b/package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
new file mode 100644
index 0000000..20bef6b
--- /dev/null
+++ b/package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
@@ -0,0 +1,43 @@
+From 015f11204f1128fbd77e90408799f7ef2b5473de Mon Sep 17 00:00:00 2001
+From: Hugues Fruchet <hugues.fruchet@st.com>
+Date: Wed, 17 May 2017 10:03:09 +0200
+Subject: [PATCH 5/9] configure.ac: revisit v4l2-ctl/compliance using libv4l
+ variable naming
+
+USE_V4L2_CTL and USE_V4L2_COMPLIANCE are used to trig the fact that
+v4l2-ctl and v4l2-compliance are using libv4l2, change namings to not
+confuse with overall v4l2-ctl/compliance utilities building.
+
+Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3c70969..5f20fc8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -461,8 +461,8 @@ AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
+ AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"], [USE_V4L_PLUGINS="no"])
+ AM_COND_IF([WITH_V4L_WRAPPERS], [USE_V4L_WRAPPERS="yes"], [USE_V4L_WRAPPERS="no"])
+ AM_COND_IF([WITH_GCONV], [USE_GCONV="yes"], [USE_GCONV="no"])
+-AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL="yes"], [USE_V4L2_CTL="no"])
+-AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE="yes"], [USE_V4L2_COMPLIANCE="no"])
++AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL_LIBV4L="yes"], [USE_V4L2_CTL_LIBV4L="no"])
++AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
+ AS_IF([test "x$alsa_pkgconfig" = "xtrue"], [USE_ALSA="yes"], [USE_ALSA="no"])
+ 
+ AC_OUTPUT
+@@ -497,6 +497,6 @@ compile time options summary
+     dvbv5-daemon               : $USE_DVBV5_REMOTE
+     v4lutils                   : $USE_V4LUTILS
+     qv4l2                      : $USE_QV4L2
+-    v4l2-ctl uses libv4l       : $USE_V4L2_CTL
+-    v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE
++    v4l2-ctl uses libv4l       : $USE_V4L2_CTL_LIBV4L
++    v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
+ EOF
+-- 
+1.9.1
+
diff --git a/package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch b/package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch
new file mode 100644
index 0000000..edccbd9
--- /dev/null
+++ b/package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch
@@ -0,0 +1,114 @@
+From b6348576091093f96f61dc5a44b25649e2fb4fe0 Mon Sep 17 00:00:00 2001
+From: Hugues Fruchet <hugues.fruchet@st.com>
+Date: Wed, 17 May 2017 10:03:10 +0200
+Subject: [PATCH 6/9] configure.ac: revisit --disable-libv4l to
+ --disable-dyn-libv4l
+
+--disable-libv4l is not disabling libv4l compilation, but only
+dynamic library support of libv4l libraries.
+
+Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+---
+ configure.ac                  | 16 ++++++++--------
+ lib/libv4l1/Makefile.am       |  2 +-
+ lib/libv4l2/Makefile.am       |  2 +-
+ lib/libv4l2rds/Makefile.am    |  2 +-
+ lib/libv4lconvert/Makefile.am |  2 +-
+ 5 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5f20fc8..8e536cc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -371,11 +371,11 @@ AC_ARG_ENABLE(libdvbv5,
+    esac]
+ )
+ 
+-AC_ARG_ENABLE(libv4l,
+-  AS_HELP_STRING([--disable-libv4l], [disable dynamic libv4l compilation]),
++AC_ARG_ENABLE(dyn-libv4l,
++  AS_HELP_STRING([--disable-dyn-libv4l], [disable dynamic libv4l support]),
+   [case "${enableval}" in
+      yes | no ) ;;
+-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-libv4l) ;;
++     *) AC_MSG_ERROR(bad value ${enableval} for --disable-dyn-libv4l) ;;
+    esac]
+ )
+ 
+@@ -427,11 +427,11 @@ AC_SEARCH_LIBS([backtrace], [execinfo], [
+ AM_CONDITIONAL([WITH_LIBDVBV5],     [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes])
+ AM_CONDITIONAL([WITH_DVBV5_REMOTE], [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes -a x$have_pthread = xyes])
+ 
+-AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno])
++AM_CONDITIONAL([WITH_DYN_LIBV4L],   [test x$enable_dyn_libv4l != xno])
+ AM_CONDITIONAL([WITH_V4LUTILS],	    [test x$enable_v4l_utils != xno -a x$linux_os = xyes])
+ AM_CONDITIONAL([WITH_QV4L2],	    [test x${qt_pkgconfig} = xtrue -a x$enable_qv4l2 != xno])
+-AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_libv4l != xno -a x$enable_shared != xno])
+-AM_CONDITIONAL([WITH_V4L_WRAPPERS], [test x$enable_libv4l != xno -a x$enable_shared != xno])
++AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
++AM_CONDITIONAL([WITH_V4L_WRAPPERS], [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
+ AM_CONDITIONAL([WITH_QTGL],	    [test x${qt_pkgconfig_gl} = xtrue])
+ AM_CONDITIONAL([WITH_GCONV],        [test x${enable_gconv} = xyes])
+ AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test x${enable_v4l2_ctl_libv4l} != xno])
+@@ -455,7 +455,7 @@ AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
+ AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
+ 				 AC_DEFINE([HAVE_DVBV5_REMOTE], [1], [Usage of DVBv5 remote enabled])],
+ 			        [USE_DVBV5_REMOTE="no"])
+-AM_COND_IF([WITH_LIBV4L], [USE_LIBV4L="yes"], [USE_LIBV4L="no"])
++AM_COND_IF([WITH_DYN_LIBV4L], [USE_DYN_LIBV4L="yes"], [USE_DYN_LIBV4L="no"])
+ AM_COND_IF([WITH_V4LUTILS], [USE_V4LUTILS="yes"], [USE_V4LUTILS="no"])
+ AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
+ AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"], [USE_V4L_PLUGINS="no"])
+@@ -490,7 +490,7 @@ compile time options summary
+ 
+     gconv                      : $USE_GCONV
+ 
+-    dynamic libv4l             : $USE_LIBV4L
++    dynamic libv4l             : $USE_DYN_LIBV4L
+     v4l_plugins                : $USE_V4L_PLUGINS
+     v4l_wrappers               : $USE_V4L_WRAPPERS
+     libdvbv5                   : $USE_LIBDVBV5
+diff --git a/lib/libv4l1/Makefile.am b/lib/libv4l1/Makefile.am
+index f768eaa..42cb3db 100644
+--- a/lib/libv4l1/Makefile.am
++++ b/lib/libv4l1/Makefile.am
+@@ -1,4 +1,4 @@
+-if WITH_LIBV4L
++if WITH_DYN_LIBV4L
+ lib_LTLIBRARIES = libv4l1.la
+ include_HEADERS = ../include/libv4l1.h ../include/libv4l1-videodev.h
+ pkgconfig_DATA = libv4l1.pc
+diff --git a/lib/libv4l2/Makefile.am b/lib/libv4l2/Makefile.am
+index 1314a99..811c45c 100644
+--- a/lib/libv4l2/Makefile.am
++++ b/lib/libv4l2/Makefile.am
+@@ -1,4 +1,4 @@
+-if WITH_LIBV4L
++if WITH_DYN_LIBV4L
+ lib_LTLIBRARIES = libv4l2.la
+ include_HEADERS = ../include/libv4l2.h ../include/libv4l-plugin.h
+ pkgconfig_DATA = libv4l2.pc
+diff --git a/lib/libv4l2rds/Makefile.am b/lib/libv4l2rds/Makefile.am
+index 4f23a3f..73fdd3e 100644
+--- a/lib/libv4l2rds/Makefile.am
++++ b/lib/libv4l2rds/Makefile.am
+@@ -1,4 +1,4 @@
+-if WITH_LIBV4L
++if WITH_DYN_LIBV4L
+ lib_LTLIBRARIES = libv4l2rds.la
+ include_HEADERS = ../include/libv4l2rds.h
+ pkgconfig_DATA = libv4l2rds.pc
+diff --git a/lib/libv4lconvert/Makefile.am b/lib/libv4lconvert/Makefile.am
+index 5c8a1cf..4f332fa 100644
+--- a/lib/libv4lconvert/Makefile.am
++++ b/lib/libv4lconvert/Makefile.am
+@@ -1,4 +1,4 @@
+-if WITH_LIBV4L
++if WITH_DYN_LIBV4L
+ lib_LTLIBRARIES = libv4lconvert.la
+ libv4lconvertpriv_PROGRAMS = ov511-decomp ov518-decomp
+ include_HEADERS = ../include/libv4lconvert.h
+-- 
+1.9.1
+
diff --git a/package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch b/package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch
new file mode 100644
index 0000000..07d3eab
--- /dev/null
+++ b/package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch
@@ -0,0 +1,155 @@
+From 2c359933fa4ef40aa621af8b1015817769d12086 Mon Sep 17 00:00:00 2001
+From: Hugues Fruchet <hugues.fruchet@st.com>
+Date: Wed, 17 May 2017 10:03:11 +0200
+Subject: [PATCH 7/9] configure.ac: add --disable-libv4l option
+
+Add an option to disable libv4l libraries and plugins compilation.
+If system is not supporting dynamic shared libraries, this option
+is automatically set.
+dlopen() is no more a mandatory dependency (warning is kept).
+lib/ and contrib/ folders are no more built with this option set
+because of libv4l dependency.
+utils/ folder is still built with this options set but without
+rds-ctl because of its libv4l dependency.
+v4l2-compliance and v4l2-ctl are also built but without any links
+on libv4l and libv4lconvert libraries.
+
+Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+---
+ Makefile.am                       | 11 +++++++++--
+ configure.ac                      | 12 +++++++++++-
+ utils/Makefile.am                 |  6 +++++-
+ utils/v4l2-compliance/Makefile.am |  4 ++++
+ utils/v4l2-ctl/Makefile.am        |  4 ++++
+ 5 files changed, 33 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e603472..07c3ef8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,10 +1,17 @@
+ AUTOMAKE_OPTIONS = foreign
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = v4l-utils-po libdvbv5-po lib
++SUBDIRS = v4l-utils-po libdvbv5-po
++
++if WITH_LIBV4L
++SUBDIRS += lib
++endif
+ 
+ if WITH_V4LUTILS
+-SUBDIRS += utils contrib
++SUBDIRS += utils
++if WITH_LIBV4L
++SUBDIRS += contrib
++endif
+ endif
+ 
+ EXTRA_DIST = android-config.h bootstrap.sh doxygen_libdvbv5.cfg include COPYING.libv4l \
+diff --git a/configure.ac b/configure.ac
+index 8e536cc..b9fc59a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -285,7 +285,7 @@ dl_saved_libs=$LIBS
+   AC_SEARCH_LIBS([dlopen],
+                  [dl],
+                  [test "$ac_cv_search_dlopen" = "none required" || DLOPEN_LIBS=$ac_cv_search_dlopen],
+-                 [AC_MSG_ERROR([unable to find the dlopen() function])])
++                 [AC_MSG_WARN([unable to find the dlopen() function])])
+   AC_SUBST([DLOPEN_LIBS])
+ LIBS=$dl_saved_libs
+ 
+@@ -371,6 +371,14 @@ AC_ARG_ENABLE(libdvbv5,
+    esac]
+ )
+ 
++AC_ARG_ENABLE(libv4l,
++  AS_HELP_STRING([--disable-libv4l], [disable libv4l compilation]),
++  [case "${enableval}" in
++     yes | no ) ;;
++     *) AC_MSG_ERROR(bad value ${enableval} for --disable-libv4l) ;;
++   esac]
++)
++
+ AC_ARG_ENABLE(dyn-libv4l,
+   AS_HELP_STRING([--disable-dyn-libv4l], [disable dynamic libv4l support]),
+   [case "${enableval}" in
+@@ -428,6 +436,7 @@ AM_CONDITIONAL([WITH_LIBDVBV5],     [test x$enable_libdvbv5  != xno -a x$have_li
+ AM_CONDITIONAL([WITH_DVBV5_REMOTE], [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes -a x$have_pthread = xyes])
+ 
+ AM_CONDITIONAL([WITH_DYN_LIBV4L],   [test x$enable_dyn_libv4l != xno])
++AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno -a x$enable_shared != xno])
+ AM_CONDITIONAL([WITH_V4LUTILS],	    [test x$enable_v4l_utils != xno -a x$linux_os = xyes])
+ AM_CONDITIONAL([WITH_QV4L2],	    [test x${qt_pkgconfig} = xtrue -a x$enable_qv4l2 != xno])
+ AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
+@@ -455,6 +464,7 @@ AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
+ AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
+ 				 AC_DEFINE([HAVE_DVBV5_REMOTE], [1], [Usage of DVBv5 remote enabled])],
+ 			        [USE_DVBV5_REMOTE="no"])
++AM_COND_IF([WITH_LIBV4L], [USE_LIBV4L="yes"], [USE_LIBV4L="no"])
+ AM_COND_IF([WITH_DYN_LIBV4L], [USE_DYN_LIBV4L="yes"], [USE_DYN_LIBV4L="no"])
+ AM_COND_IF([WITH_V4LUTILS], [USE_V4LUTILS="yes"], [USE_V4LUTILS="no"])
+ AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index d7708cc..ce710c2 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -13,8 +13,12 @@ SUBDIRS = \
+ 	v4l2-sysfs-path \
+ 	cec-ctl \
+ 	cec-compliance \
+-	cec-follower \
++	cec-follower
++
++if WITH_LIBV4L
++SUBDIRS += \
+ 	rds-ctl
++endif
+ 
+ if WITH_LIBDVBV5
+ SUBDIRS += \
+diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
+index c2b5919..0240a50 100644
+--- a/utils/v4l2-compliance/Makefile.am
++++ b/utils/v4l2-compliance/Makefile.am
+@@ -7,12 +7,16 @@ v4l2_compliance_SOURCES = v4l2-compliance.cpp v4l2-test-debug.cpp v4l2-test-inpu
+ 	v4l2-test-codecs.cpp v4l2-test-colors.cpp v4l2-compliance.h
+ v4l2_compliance_CPPFLAGS = -I../common
+ 
++if WITH_LIBV4L
+ if WITH_V4L2_COMPLIANCE_LIBV4L
+ v4l2_compliance_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
+ else
+ v4l2_compliance_LDADD = -lrt -lpthread
+ DEFS += -DNO_LIBV4L2
+ endif
++else
++DEFS += -DNO_LIBV4L2
++endif
+ 
+ EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1
+ 
+diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
+index 955647d..4475aed 100644
+--- a/utils/v4l2-ctl/Makefile.am
++++ b/utils/v4l2-ctl/Makefile.am
+@@ -9,10 +9,14 @@ v4l2_ctl_SOURCES = v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cp
+ 	v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c
+ v4l2_ctl_CPPFLAGS = -I../common
+ 
++if WITH_LIBV4L
+ if WITH_V4L2_CTL_LIBV4L
+ v4l2_ctl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
+ else
+ DEFS += -DNO_LIBV4L2
+ endif
++else
++DEFS += -DNO_LIBV4L2
++endif
+ 
+ EXTRA_DIST = Android.mk v4l2-ctl.1
+-- 
+1.9.1
+
diff --git a/package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch b/package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
new file mode 100644
index 0000000..8647174
--- /dev/null
+++ b/package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
@@ -0,0 +1,30 @@
+From bc8b0c0b29e60a20c26a7a80a61bd06d40246a0e Mon Sep 17 00:00:00 2001
+From: Hugues Fruchet <hugues.fruchet@st.com>
+Date: Wed, 17 May 2017 10:03:12 +0200
+Subject: [PATCH 8/9] configure.ac: fix build of v4l-utils on uclinux
+
+Build of v4-utils is conditional to "linux_os=yes" which was
+not set in case of uclinux, fix this.
+
+Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b9fc59a..8dc676e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -149,7 +149,7 @@ AC_CHECK_FUNCS([__secure_getenv secure_getenv])
+ 
+ # Check host os
+ case "$host_os" in
+-  linux*)
++  *linux*)
+     linux_os="yes"
+     ;;
+   *freebsd*)
+-- 
+1.9.1
+
diff --git a/package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch b/package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch
new file mode 100644
index 0000000..ef4c14b
--- /dev/null
+++ b/package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch
@@ -0,0 +1,27 @@
+From aa90a83a37329ebefebb80dab28cf1b54bc71c08 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hans.verkuil@cisco.com>
+Date: Mon, 29 May 2017 07:55:18 +0200
+Subject: [PATCH 9/9] configure.ac: add USE_LIBV4L to summary
+
+This was missing, so add it.
+
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8dc676e..9031b42 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -500,6 +500,7 @@ compile time options summary
+ 
+     gconv                      : $USE_GCONV
+ 
++    libv4l                     : $USE_LIBV4L
+     dynamic libv4l             : $USE_DYN_LIBV4L
+     v4l_plugins                : $USE_V4L_PLUGINS
+     v4l_wrappers               : $USE_V4L_WRAPPERS
+-- 
+1.9.1
+
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 08dc6cb..3162ff1 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -82,4 +82,10 @@ endif
 
 LIBV4L_CONF_ENV += LIBS="$(LIBV4L_LIBS)"
 
+# we patch configure.ac
+define LIBV4L_RUN_BOOTSTRAP
+	cd $(@D) && ./bootstrap.sh
+endef
+LIBV4L_PRE_CONFIGURE_HOOKS += LIBV4L_RUN_BOOTSTRAP
+
 $(eval $(autotools-package))
-- 
1.9.1
