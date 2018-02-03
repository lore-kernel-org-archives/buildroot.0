From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  4 Feb 2018 00:21:27 +0100
Subject: [Buildroot] [RFC v1] libv4l: fix qv4l2 libatomic related compile
 failure
Message-ID: <20180203232127.22765-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'

[1] http://autobuild.buildroot.net/results/baa2595e1acdf4e795fbb940ca57fd136c827da3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Patch fixes the qv4l2 linking problem for sparc, but adds a libatomic
dependency to all v4l libraries. Any better suggestions to add
libatomic linking only to utils/qv4l2?
---
 .../0003-configure.ac-check-for-libatomic.patch    | 30 ++++++++++++++++++++++
 package/libv4l/libv4l.mk                           |  5 ++++
 2 files changed, 35 insertions(+)
 create mode 100644 package/libv4l/0003-configure.ac-check-for-libatomic.patch

diff --git a/package/libv4l/0003-configure.ac-check-for-libatomic.patch b/package/libv4l/0003-configure.ac-check-for-libatomic.patch
new file mode 100644
index 0000000000..78aaada653
--- /dev/null
+++ b/package/libv4l/0003-configure.ac-check-for-libatomic.patch
@@ -0,0 +1,30 @@
+From 87978992fbcba13550e900fbe9abb2a60be98bf4 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 4 Feb 2018 00:08:45 +0100
+Subject: [PATCH] configure.ac: check for libatomic
+
+Fixes:
+
+  .../sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index dc1e9cbf..65a3caaa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -279,6 +279,8 @@ AS_IF([test x$enable_shared != xno],
+ 		   [have_pthread=no])],
+ 	[have_pthread=no])
+ 
++AC_SEARCH_LIBS([__atomic_load_4], [atomic])
++
+ # The dlopen() function is in the C library for *BSD and in
+ # libdl on GLIBC-based systems
+ 
+-- 
+2.16.1
+
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 11061306c7..bc9b5c9abd 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -11,6 +11,11 @@ LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
 
+# patch 0003-configure.ac-check-for-libatomic.patch touches configure.ac
+LIBV4L_AUTORECONF = YES
+# host-gettext needed for autoreconf to work
+LIBV4L_DEPENDENCIES += host-gettext
+
 # fix uclibc-ng configure/compile
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-- 
2.16.1
