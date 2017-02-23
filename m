From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:34:55 +0100
Subject: [Buildroot] [git commit] btrfs-progs: don't use <execinfo.h> with
	uClibc
Message-ID: <20170223213512.0A2B682245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06b555b6d5baadb6fe73e5d8a9fd640602908251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to btrfs-progs that fixes the build of
docker-engine, and possibly other packages including kerncompat.h from
btrfs-progs.

For the btrfs-progs build itself, a --disable-backtrace option allows to
indicate whether backtrace()/<execinfo.h> support should be used or
not. However, once btrfs-progs is installed, it simply looks at whether
__GLIBC__ is defined or not to decide to use backtrace() or not.

However, uClibc defines __GLIBC__ but does not provide backtrace()
functionality. The additional patch tweaks the kerncompat.h to look at
__UCLIBC__ and not use backtrace() functionality in this case.

Fixes:

  http://autobuild.buildroot.net/results/9dc9370a79c5c44e6c92be6a44334842c211d923/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch b/package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch
new file mode 100644
index 0000000..9c1173b
--- /dev/null
+++ b/package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch
@@ -0,0 +1,42 @@
+From 1fc5444f5620670bb9d293be4f92df59661e1810 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 20 Feb 2017 23:31:24 +0100
+Subject: [PATCH] kerncompat.h: define BTRFS_DISABLE_BACKTRACE when building
+ with uClibc
+
+uClibc does not provide backtrace() nor <execinfo.h>. When building
+btrfs-progs, passing --disable-backtrace is enough to make it build with
+uClibc. But once btrfs-progs is installed and another program/library
+includes kerncompat.h, it fails to build with uClibc, because
+BTRFS_DISABLE_BACKTRACE is not defined.
+
+The most correct fix for this would be to have kerncompat.h generated
+from kerncompat.h.in during the btrfs-progs build process, and tuned
+depending on autoconf/automake variables. But as a quick fix that
+follows the current strategy, we simply tweak the existing __GLIBC__
+conditional. Indeed, uClibc pretends to be glibc and defines __GLIBC__,
+but it does not replace it completely, hence the need to define
+BTRFS_DISABLE_BACKTRACE when __GLIBC__ is not defined *or* when
+__UCLIBC__ is defined.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ kerncompat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index 0f207b7..e47d164 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -32,7 +32,7 @@
+ 
+ #include <features.h>
+ 
+-#ifndef __GLIBC__
++#if !defined(__GLIBC__) || defined(__UCLIBC__)
+ #ifndef BTRFS_DISABLE_BACKTRACE
+ #define BTRFS_DISABLE_BACKTRACE
+ #endif
+-- 
+2.7.4
+
