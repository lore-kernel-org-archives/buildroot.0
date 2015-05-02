From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:36:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-r128: bump
	version to 6.10.0
Message-ID: <1430555777-32638-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-cross-compile.patch                       |   23 ++++++++++++++++++++
 .../xdriver_xf86-video-r128.hash                   |    2 ++
 .../xdriver_xf86-video-r128.mk                     |    5 +++--
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash

diff --git a/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch b/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch
index d276176..7b2ebd4 100644
--- a/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch
+++ b/package/x11r7/xdriver_xf86-video-r128/0001-cross-compile.patch
@@ -1,3 +1,12 @@
+Fix cross-compile
+
+Original patch for DRI
+http://git.buildroot.net/buildroot/commit/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch?id=c0726391523da6a17ffa8e62681ffa0cc895da8e
+
+Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
+(Added exa.h fix)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
 --- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
 +++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
 @@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
@@ -25,3 +34,17 @@
  fi
  
  AC_MSG_CHECKING([whether to include DRI support])
+@@ -121,7 +127,12 @@
+ AC_MSG_CHECKING([whether to enable EXA support])
+ if test "x$EXA" = xyes; then
+         AC_MSG_RESULT(yes)
+-        AC_CHECK_FILE(${sdkdir}/exa.h, [have_exa_h="yes"], [have_exa_h="no"])
++	if test "$cross_compiling" = "no" ; then
++		AC_CHECK_FILE(${sdkdir}/exa.h,
++                      [have_exa_h="yes"], [have_exa_h="no"])
++	else
++		have_exa_h="yes"
++	fi
+ else
+         AC_MSG_RESULT(no)
+ fi
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
new file mode 100644
index 0000000..976521a
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-May/002598.html
+sha256	80d531a07168230a408b88809a5440cfd48f9098666d12702d0012148a0d353d	xf86-video-r128-6.10.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index d4294ad..f9fcfdb 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = fcee44e469b22934a04bd3ee19ed101aaa176a54
-XDRIVER_XF86_VIDEO_R128_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-r128
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.10.0
+XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
-- 
1.7.10.4
