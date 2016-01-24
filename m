From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 16:21:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/libpciaccess: fix musl build
Message-ID: <1453648919-16172-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added note about upstream commit to patch 0001.

Fixes
http://autobuild.buildroot.net/results/e86/e869e08779626ac578017e6b34a82adf156d12f8/
http://autobuild.buildroot.net/results/0bf/0bf803654e7298d5cd0b31fc55b1babdcd2f8765/
http://autobuild.buildroot.net/results/f5a/f5a516cf6c25af89000019b6789d5a003099cdff/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/0001-limits_h.patch |  4 ++--
 package/libpciaccess/0002-musl-arm.patch | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 package/libpciaccess/0002-musl-arm.patch

diff --git a/package/libpciaccess/0001-limits_h.patch b/package/libpciaccess/0001-limits_h.patch
index 9afa203..c5c8444 100644
--- a/package/libpciaccess/0001-limits_h.patch
+++ b/package/libpciaccess/0001-limits_h.patch
@@ -3,8 +3,8 @@ Fix compilation error with musl-based toolchain
 linux_sysfs.c:751:15: error: 'PATH_MAX' undeclared (first use in this function)
      char name[PATH_MAX];
 
-Patch already sent upstream by Felix Janda
-http://lists.x.org/archives/xorg-devel/2014-December/044723.html
+Patch applied upstream:
+http://cgit.freedesktop.org/xorg/lib/libpciaccess/commit/?id=8ea3af620a2d4ad5648917b4a0ef2b23ff566774
 
 Signed-off-by: Felix Janda <felix.janda@posteo.de>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
diff --git a/package/libpciaccess/0002-musl-arm.patch b/package/libpciaccess/0002-musl-arm.patch
new file mode 100644
index 0000000..0077f45
--- /dev/null
+++ b/package/libpciaccess/0002-musl-arm.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Inspired by http://patchwork.openembedded.org/patch/111661/
+"inb/outb are implemented for ARM on glibc but not on linux in general
+therefore the conditional has to reflect that"
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libpciaccess-0.13.4.org/src/linux_sysfs.c libpciaccess-0.13.4/src/linux_sysfs.c
+--- libpciaccess-0.13.4.org/src/linux_sysfs.c	2015-05-01 06:44:47.000000000 +0200
++++ libpciaccess-0.13.4/src/linux_sysfs.c	2016-01-24 15:27:57.141562678 +0100
+@@ -49,7 +49,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ 
+-#if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
++#if defined(__i386__) || defined(__x86_64__)
+ #include <sys/io.h>
+ #else
+ #define inb(x) -1
-- 
2.7.0.rc3
