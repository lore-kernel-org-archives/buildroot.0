From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Jan 2015 09:24:06 -0300
Subject: [Buildroot] [PATCH] radvd: bump to version 2.9
Message-ID: <1420201446-22597-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0003-Improve-check-of-the-sysctl-function.patch is now upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...0003-Improve-check-of-the-sysctl-function.patch | 49 ----------------------
 package/radvd/radvd.hash                           |  4 +-
 package/radvd/radvd.mk                             |  2 +-
 3 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/radvd/0003-Improve-check-of-the-sysctl-function.patch

diff --git a/package/radvd/0003-Improve-check-of-the-sysctl-function.patch b/package/radvd/0003-Improve-check-of-the-sysctl-function.patch
deleted file mode 100644
index 3053f7b..0000000
--- a/package/radvd/0003-Improve-check-of-the-sysctl-function.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 4c86b3cbf52f810615d92835e98d83e9555a4d88 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 23 Nov 2014 12:13:47 +0100
-Subject: [PATCH 3/3] Improve check of the sysctl() function
-
-Since sysctl is a deprecated system call, new architectures such as
-ARC don't implement it. In such cases, uClibc installs the
-<sys/sysctl.h> header, but dos not implement the sysctl()
-function. This has the annoying side effect of breaking the sysctl
-detection of radvd, which is purely based on the header file being
-present.
-
-To fix this, this commit adds a check based on the existence of the
-sysctl() function.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac   | 1 +
- device-linux.c | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5dde3b2..5518f71 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -161,6 +161,7 @@ AC_CHECK_HEADERS( \
- 	time.h \
- )
- AC_HEADER_TIME
-+AC_CHECK_FUNCS([sysctl])
- 
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_MSG_CHECKING(whether struct sockaddr_in6 has sin6_scope_id)
-diff --git a/device-linux.c b/device-linux.c
-index 1ecaa6b..d9b56b8 100644
---- a/device-linux.c
-+++ b/device-linux.c
-@@ -183,7 +183,7 @@ int check_ip6_forwarding(void)
- 		value = -1;
- 	}
- 
--#ifdef HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && defined(HAVE_SYSCTL)
- 	int forw_sysctl[] = { SYSCTL_IP6_FORWARDING };
- 	size_t size = sizeof(value);
- 	if (!fp && sysctl(forw_sysctl, sizeof(forw_sysctl) / sizeof(forw_sysctl[0]), &value, &size, NULL, 0) < 0) {
--- 
-2.1.0
-
diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index 3ae4b69..af9e8fb 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,2 +1,2 @@
-# From http://www.litech.org/radvd/dist/radvd-2.8.tar.gz.sha256
-sha256	0a1041b2044dafa45882b9fc30badadb7abed76c1a20f6332fecaa53c8440df9	radvd-2.8.tar.xz
+# From http://www.litech.org/radvd/dist/radvd-2.9.tar.gz.sha256
+sha256	525ead3ba7fc6378f14c5d96a0de01ff62e9a1fea8cb7233b502a81da05bbab8	radvd-2.9.tar.xz
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index cc50ce4..6b241b7 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.8
+RADVD_VERSION = 2.9
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
-- 
2.0.5
