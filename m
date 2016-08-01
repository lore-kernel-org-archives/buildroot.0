From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 1 Aug 2016 14:14:30 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.17
Message-ID: <20160801121429.GA24576@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many cleanups and ARC improvements including PIE support.
Patches included upstream and removed.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
 package/uclibc/0001-bfin-allow-to-build-ldd.patch  | 29 ---------
 ...issing-Linux-extension-headers-for-poll.h.patch | 71 ----------------------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 2 insertions(+), 102 deletions(-)
 delete mode 100644 package/uclibc/0001-bfin-allow-to-build-ldd.patch
 delete mode 100644 package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch

diff --git a/package/uclibc/0001-bfin-allow-to-build-ldd.patch b/package/uclibc/0001-bfin-allow-to-build-ldd.patch
deleted file mode 100644
index 4ec2b71..0000000
--- a/package/uclibc/0001-bfin-allow-to-build-ldd.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 10f469f6ce1a0c14e4506c42e47e15aa83be2eef Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Wed, 6 Jul 2016 06:08:51 +0200
-Subject: [PATCH] bfin: allow to build ldd
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- utils/ldd.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/utils/ldd.c b/utils/ldd.c
-index f6413c6..5d2c8f4 100644
---- a/utils/ldd.c
-+++ b/utils/ldd.c
-@@ -35,6 +35,11 @@
- #define ELFCLASSM      ELFCLASS32
- #endif
-
-+#if defined(__bfin__)
-+#define MATCH_MACHINE(x) (x == EM_BLACKFIN)
-+#define ELFCLASSM      ELFCLASS32
-+#endif
-+
- #if defined(__s390__)
- #define MATCH_MACHINE(x) (x == EM_S390)
- #define ELFCLASSM	ELFCLASS32
---
-2.1.4
-
diff --git a/package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch b/package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch
deleted file mode 100644
index f28cd80..0000000
--- a/package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 7a575d98449780a95fc4004b179a2ea0dcd0f468 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sun, 31 Jul 2016 13:22:00 +0200
-Subject: [PATCH] include missing Linux extension headers for poll.h
-
-This was found by Buildroot autobuilders for m68k.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/sysdeps/linux/c6x/bits/poll.h        | 7 +++++++
- libc/sysdeps/linux/m68k/bits/poll.h       | 7 +++++++
- libc/sysdeps/linux/microblaze/bits/poll.h | 7 +++++++
- 3 files changed, 21 insertions(+)
-
-diff --git a/libc/sysdeps/linux/c6x/bits/poll.h b/libc/sysdeps/linux/c6x/bits/poll.h
-index 1d845eb..4c984cc 100644
---- a/libc/sysdeps/linux/c6x/bits/poll.h
-+++ b/libc/sysdeps/linux/c6x/bits/poll.h
-@@ -34,6 +34,13 @@
- # define POLLWRBAND	0x100		/* Priority data may be written.  */
- #endif
- 
-+#ifdef __USE_GNU
-+/* These are extensions for Linux.  */
-+# define POLLMSG	0x400
-+# define POLLREMOVE	0x1000
-+# define POLLRDHUP	0x2000
-+#endif
-+
- /* Event types always implicitly polled for.  These bits need not be set in
-    `events', but they will appear in `revents' to indicate the status of
-    the file descriptor.  */
-diff --git a/libc/sysdeps/linux/m68k/bits/poll.h b/libc/sysdeps/linux/m68k/bits/poll.h
-index 1d845eb..4c984cc 100644
---- a/libc/sysdeps/linux/m68k/bits/poll.h
-+++ b/libc/sysdeps/linux/m68k/bits/poll.h
-@@ -34,6 +34,13 @@
- # define POLLWRBAND	0x100		/* Priority data may be written.  */
- #endif
- 
-+#ifdef __USE_GNU
-+/* These are extensions for Linux.  */
-+# define POLLMSG	0x400
-+# define POLLREMOVE	0x1000
-+# define POLLRDHUP	0x2000
-+#endif
-+
- /* Event types always implicitly polled for.  These bits need not be set in
-    `events', but they will appear in `revents' to indicate the status of
-    the file descriptor.  */
-diff --git a/libc/sysdeps/linux/microblaze/bits/poll.h b/libc/sysdeps/linux/microblaze/bits/poll.h
-index 9b284c8..27c3219 100644
---- a/libc/sysdeps/linux/microblaze/bits/poll.h
-+++ b/libc/sysdeps/linux/microblaze/bits/poll.h
-@@ -34,6 +34,13 @@
- # define POLLWRBAND	0x0200		/* Priority data may be written.  */
- #endif
- 
-+#ifdef __USE_GNU
-+/* These are extensions for Linux.  */
-+# define POLLMSG	0x400
-+# define POLLREMOVE	0x1000
-+# define POLLRDHUP	0x2000
-+#endif
-+
- /* Event types always implicitly polled for.  These bits need not be set in
-    `events', but they will appear in `revents' to indicate the status of
-    the file descriptor.  */
--- 
-2.7.4 (Apple Git-66)
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index d7d1195..637d93e 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  8de41ab1e774c4770a240009a85ad9c1566d82c52017267b99883d60e5bb10b3        uClibc-ng-1.0.16.tar.xz
+sha256  a2e7207634c19997e8b9f3e712182d80d42aaa85ce3462eff1a9bce812aaf354        uClibc-ng-1.0.17.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0b56f1f..124bd59 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.16
+UCLIBC_VERSION = 1.0.17
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
-- 
2.1.4
