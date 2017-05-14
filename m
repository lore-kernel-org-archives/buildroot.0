From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 22:18:55 +0200
Subject: [Buildroot] [git commit] libv4l: add patch to link qv4l2 tool with
	librt
Message-ID: <20170514201905.E3F77826B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8bd6c40723897e6a398e0481290460cd40e8b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qv4l2 tool in libv4l uses clock_gettime(), so it should link
against librt to build properly with old versions of glibc. Therefore,
we add a patch to libv4l to fix this issue. Autoreconfiguring libv4l
is now necessary since the patch touches Makefile.am.

Fixes:

  http://autobuild.buildroot.net/results/5dff0ec19205e02f6ee373d34cb79f39ac25b609/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...3-utils-qv4l2-Makefile.am-link-with-librt.patch | 29 ++++++++++++++++++++++
 package/libv4l/libv4l.mk                           |  5 ++++
 2 files changed, 34 insertions(+)

diff --git a/package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch b/package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch
new file mode 100644
index 0000000..4bac577
--- /dev/null
+++ b/package/libv4l/0003-utils-qv4l2-Makefile.am-link-with-librt.patch
@@ -0,0 +1,29 @@
+From 66d1d752976f4b45a5faff2bc68fc2fa9d435c71 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 14 May 2017 22:04:55 +0200
+Subject: [PATCH] utils/qv4l2/Makefile.am: link with librt
+
+qv4l2 uses clock_gettime(), so it should link with librt to be
+compatible with old versions of glibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ utils/qv4l2/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
+index fd58486..a991d66 100644
+--- a/utils/qv4l2/Makefile.am
++++ b/utils/qv4l2/Makefile.am
+@@ -7,7 +7,7 @@ qv4l2_SOURCES = qv4l2.cpp general-tab.cpp ctrl-tab.cpp vbi-tab.cpp capture-win.c
+   v4l2-tpg-core.c v4l2-tpg-colors.c
+ nodist_qv4l2_SOURCES = moc_qv4l2.cpp moc_general-tab.cpp moc_capture-win.cpp moc_vbi-tab.cpp qrc_qv4l2.cpp
+ qv4l2_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la \
+-  ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la
++  ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la -lrt
+ qv4l2_CPPFLAGS = -I../common
+ 
+ if WITH_QTGL
+-- 
+2.7.4
+
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 465f6cc..6bc9d85 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -11,6 +11,11 @@ LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
 
+# 0003-utils-qv4l2-Makefile.am-link-with-librt.patch, host-gettext
+# needed for autoreconf to work
+LIBV4L_AUTORECONF = YES
+LIBV4L_DEPENDENCIES += host-gettext
+
 # fix uclibc-ng configure/compile
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
