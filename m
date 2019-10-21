From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Oct 2019 20:45:10 +0200
Subject: [Buildroot] [PATCH v2] package/libv4l: bump version to 1.18.0
Message-ID: <20191021184510.4212-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove 0001-fixup-lfs-mismatch-in-preload-libraries.patch
  (Upstream applied [1])
- remove 0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
  (Upstream applied [2])
- remove 0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
  (Upstream applied [3])
- remove 0004-v4l2-compliance-needs-fork.patch
  (Upstream applied [4])

Despite all patches (specially the ones touching configure.ac/Makefile.am)
removed keep LIBV4L_AUTORECONF = YES to get utils/qv4l linker flags
right (seems the original debian based libtool sets a wrong
link_all_deplibs parameter), see [5] for details.

[1] https://git.linuxtv.org/v4l-utils.git/commit/?id=9f0354c3320f3cc62983f726bfed66e1d0c21f83
[2] https://git.linuxtv.org/v4l-utils.git/commit/?id=a3367e92f4b06667a36fb9485f22f7df52891a2f
[3] https://git.linuxtv.org/v4l-utils.git/commit/?id=692c2f0f35dd663e84d363867f2841d387726154
[4] https://git.linuxtv.org/v4l-utils.git/commit/?id=577ab225929c4e8dce7d2b911eeed38469a559bb
[5] http://lists.busybox.net/pipermail/buildroot/2019-October/261558.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add rational and comment for keeping LIBV4L_AUTORECONF
---
 ...up-lfs-mismatch-in-preload-libraries.patch | 44 -----------
 ...VIOCSCLOCKID-related-compile-failure.patch | 35 ---------
 ...Build-sdlcam-only-if-jpeg-is-enabled.patch | 31 --------
 .../0004-v4l2-compliance-needs-fork.patch     | 76 -------------------
 package/libv4l/libv4l.hash                    |  5 +-
 package/libv4l/libv4l.mk                      |  4 +-
 6 files changed, 5 insertions(+), 190 deletions(-)
 delete mode 100644 package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
 delete mode 100644 package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
 delete mode 100644 package/libv4l/0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
 delete mode 100644 package/libv4l/0004-v4l2-compliance-needs-fork.patch

diff --git a/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch b/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
deleted file mode 100644
index f23eb7a350..0000000000
--- a/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e5952b043a71fe83fbc392e498e8f77774fca0d8 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Sat, 28 Jun 2014 09:32:53 -0300
-Subject: [PATCH] fixup lfs mismatch in preload libraries
-
-Ensure that the lfs variants are not transparently used instead of the !lfs
-ones so both can be wrapped, independently of any custom CFLAGS/CPPFLAGS.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lib/libv4l1/v4l1compat.c  | 3 +++
- lib/libv4l2/v4l2convert.c | 3 +++
- 2 files changed, 6 insertions(+)
-
-diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
-index e328288..70eb74f 100644
---- a/lib/libv4l1/v4l1compat.c
-+++ b/lib/libv4l1/v4l1compat.c
-@@ -19,6 +19,9 @@
- # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
-  */
-
-+/* ensure we see *64 variants and they aren't transparently used */
-+#undef _LARGEFILE_SOURCE
-+#undef _FILE_OFFSET_BITS
- #define _LARGEFILE64_SOURCE 1
-
- #include <config.h>
-diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
-index 9b46ab8..bc41056 100644
---- a/lib/libv4l2/v4l2convert.c
-+++ b/lib/libv4l2/v4l2convert.c
-@@ -23,6 +23,9 @@
- /* prevent GCC 4.7 inlining error */
- #undef _FORTIFY_SOURCE
-
-+/* ensure we see *64 variants and they aren't transparently used */
-+#undef _LARGEFILE_SOURCE
-+#undef _FILE_OFFSET_BITS
- #define _LARGEFILE64_SOURCE 1
-
- #include <config.h>
---
-1.9.1
diff --git a/package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch b/package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
deleted file mode 100644
index 656008b708..0000000000
--- a/package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 663b7be9d27c979c914011a3ce707e227987bc59 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 3 Feb 2018 22:47:18 +0100
-Subject: [PATCH] keytable: fix EVIOCSCLOCKID related compile failure
-
-Fixes:
-
-  keytable.c: In function 'test_event':
-  keytable.c:1351:12: error: 'EVIOCSCLOCKID' undeclared (first use in this function)
-    ioctl(fd, EVIOCSCLOCKID, &mode);
-              ^~~~~~~~~~~~~
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- utils/keytable/keytable.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
-index 34a1522e..925eab00 100644
---- a/utils/keytable/keytable.c
-+++ b/utils/keytable/keytable.c
-@@ -55,6 +55,10 @@ struct input_keymap_entry_v2 {
- 	u_int8_t  scancode[32];
- };
-
-+#ifndef EVIOCSCLOCKID
-+#define EVIOCSCLOCKID		_IOW('E', 0xa0, int)
-+#endif
-+
- #ifndef EVIOCGKEYCODE_V2
- #define EVIOCGKEYCODE_V2	_IOR('E', 0x04, struct input_keymap_entry_v2)
- #define EVIOCSKEYCODE_V2	_IOW('E', 0x04, struct input_keymap_entry_v2)
---
-2.16.1
-
diff --git a/package/libv4l/0003-Build-sdlcam-only-if-jpeg-is-enabled.patch b/package/libv4l/0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
deleted file mode 100644
index 4c4365f907..0000000000
--- a/package/libv4l/0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5c407e130f8d0416f91f5a12bcdc2709f00dda65 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 29 Jun 2018 21:15:10 +0200
-Subject: [PATCH] Build sdlcam only if jpeg is enabled
-
-Fixes:
- - http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/test/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
-index 0188fe21..c7c38e7a 100644
---- a/contrib/test/Makefile.am
-+++ b/contrib/test/Makefile.am
-@@ -17,8 +17,10 @@ noinst_PROGRAMS += v4l2gl
- endif
-
- if HAVE_SDL
-+if HAVE_JPEG
- noinst_PROGRAMS += sdlcam
- endif
-+endif
-
- driver_test_SOURCES = driver-test.c
- driver_test_LDADD = ../../utils/libv4l2util/libv4l2util.la
---
-2.14.1
-
diff --git a/package/libv4l/0004-v4l2-compliance-needs-fork.patch b/package/libv4l/0004-v4l2-compliance-needs-fork.patch
deleted file mode 100644
index d29a059520..0000000000
--- a/package/libv4l/0004-v4l2-compliance-needs-fork.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 21d7082c635433176aebcd9d6f0177edb059f41f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Nov 2018 21:26:57 +0100
-Subject: [PATCH] v4l2-compliance needs fork
-
-v4l2-compliance uses fork, since
-https://git.linuxtv.org/v4l-utils.git/commit/utils/v4l2-compliance/?id=79d98edd1a27233667a6bc38d3d7f8958c2ec02c
-
-So don't build it if fork is not available
-
-Fixes:
- - http://autobuild.buildroot.org/results/447d792ce21c0e33a36ca9384fee46e099435ed8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac      | 5 ++++-
- utils/Makefile.am | 6 +++++-
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5cc34c24..52ea5c6d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -478,7 +478,8 @@ AM_CONDITIONAL([WITH_QTGL],	    [test x${qt_pkgconfig_gl} = xtrue])
- AM_CONDITIONAL([WITH_GCONV],        [test x$enable_gconv = xyes -a x$enable_shared == xyes -a x$with_gconvdir != x -a -f $with_gconvdir/gconv-modules])
- AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test x${enable_v4l2_ctl_libv4l} != xno])
- AM_CONDITIONAL([WITH_V4L2_CTL_STREAM_TO], [test x${enable_v4l2_ctl_stream_to} != xno])
--AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x${enable_v4l2_compliance_libv4l} != xno])
-+AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
-+AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
- AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang])
-
- # append -static to libtool compile and link command to enforce static libs
-@@ -509,6 +510,7 @@ AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"
- AM_COND_IF([WITH_V4L_WRAPPERS], [USE_V4L_WRAPPERS="yes"], [USE_V4L_WRAPPERS="no"])
- AM_COND_IF([WITH_GCONV], [USE_GCONV="yes"], [USE_GCONV="no"])
- AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL_LIBV4L="yes"], [USE_V4L2_CTL_LIBV4L="no"])
-+AM_COND_IF([WITH_V4L2_COMPLIANCE], [USE_V4L2_COMPLIANCE="yes"], [USE_V4L2_COMPLIANCE="no"])
- AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
- AM_COND_IF([WITH_BPF],         [USE_BPF="yes"
-                                 AC_DEFINE([HAVE_BPF], [1], [BPF IR decoder support enabled])],
-@@ -556,6 +558,7 @@ compile time options summary
-     qv4l2                      : $USE_QV4L2
-     qvidcap                    : $USE_QVIDCAP
-     v4l2-ctl uses libv4l       : $USE_V4L2_CTL_LIBV4L
-+    v4l2-compliance            : $USE_V4L2_COMPLIANCE
-     v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
-     BPF IR Decoders:           : $USE_BPF
- EOF
-diff --git a/utils/Makefile.am b/utils/Makefile.am
-index 2d507028..9c29926a 100644
---- a/utils/Makefile.am
-+++ b/utils/Makefile.am
-@@ -6,7 +6,6 @@ SUBDIRS = \
- 	cx18-ctl \
- 	keytable \
- 	media-ctl \
--	v4l2-compliance \
- 	v4l2-ctl \
- 	v4l2-dbg \
- 	v4l2-sysfs-path \
-@@ -20,6 +19,11 @@ SUBDIRS += \
- 	dvb
- endif
-
-+if WITH_V4L2_COMPLIANCE
-+SUBDIRS += \
-+	v4l2-compliance
-+endif
-+
- if WITH_QV4L2
- SUBDIRS += qv4l2
- endif
---
-2.17.1
-
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 78351c97e5..5b29d7d65a 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,8 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.6.tar.bz2.asc
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.18.0.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256 f9dac1878e3d5636eab7f56bb209fdfc66b94ee8a2aae54dcb4282fe63a678ae  v4l-utils-1.16.6.tar.bz2
+sha256 6cb60d822eeed20486a03cc23e0fc65956fbc1e85e0c1a7477f68bbd9802880d  v4l-utils-1.18.0.tar.bz2
+
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index b31d1a4c41..a3bf099221 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################

-LIBV4L_VERSION = 1.16.6
+LIBV4L_VERSION = 1.18.0
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
-# We're patching contrib/test/Makefile.am
+# needed to get utils/qv4l link flags right
 LIBV4L_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
 LIBV4L_DEPENDENCIES += host-gettext
--
2.23.0
