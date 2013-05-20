From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 10:00:59 +0100
Subject: [Buildroot] [PATCH] pixman: Apply upstream patch to fix compilation
	on MIPS
Message-ID: <1369040459-17604-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Fixes:
http://autobuild.buildroot.net/results/38aa4f2a2269b80226b910c46e0c9abe7dc38ff8/

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/pixman/pixman-0.30.0-loongson-cflags.patch | 38 ++++++++++++++++++++++
 package/pixman/pixman.mk                           |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 package/pixman/pixman-0.30.0-loongson-cflags.patch

diff --git a/package/pixman/pixman-0.30.0-loongson-cflags.patch b/package/pixman/pixman-0.30.0-loongson-cflags.patch
new file mode 100644
index 0000000..fc53be2
--- /dev/null
+++ b/package/pixman/pixman-0.30.0-loongson-cflags.patch
@@ -0,0 +1,38 @@
+configure.ac: Verify that the Loongson MMI code can link
+
+The Loongson MMI code modifies -march and as a result it breaks linking
+when the rest of the code is built with a different -match/-mtune.
+This patch fixes the problem by trying to link the code instead of just
+compiling it. This patch is already committed upstream.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+From d77d75cc6e5de14d027d22b70389a4d0c71048b9 Mon Sep 17 00:00:00 2001
+From: Markos Chandras <markos.chandras@imgtec.com>
+Date: Wed, 15 May 2013 16:51:20 +0000
+Subject: Use AC_LINK_IFELSE to check if the Loongson MMI code can link
+
+The Loongson code is compiled with -march=loongson2f to enable the MMI
+instructions, but binutils refuses to link object code compiled with
+different -march settings, leading to link failures later in the
+compile. This avoids that problem by checking if we can link code
+compiled for Loongson.
+
+Reviewed-by: Matt Turner <mattst88@gmail.com>
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+---
+diff --git a/configure.ac b/configure.ac
+index c43a0d2..221179f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -279,7 +279,7 @@ AC_MSG_CHECKING(whether to use Loongson MMI assembler)
+ 
+ xserver_save_CFLAGS=$CFLAGS
+ CFLAGS=" $LS_CFLAGS $CFLAGS -I$srcdir"
+-AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
++AC_LINK_IFELSE([AC_LANG_SOURCE([[
+ #ifndef __mips_loongson_vector_rev
+ #error "Loongson Multimedia Instructions are only available on Loongson"
+ #endif
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index c2ee035..7822ede 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,11 +3,12 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.28.2
+PIXMAN_VERSION = 0.30.0
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
 
+PIXMAN_AUTORECONF = YES
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
 # don't build gtk based demos
-- 
1.8.2.1
