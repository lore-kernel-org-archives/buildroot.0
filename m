From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 14:54:56 +0100
Subject: [Buildroot] [PATCH] package/proftpd: security bump to version 1.3.6c
Message-ID: <20200227135457.13710-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2020-9273: In ProFTPD 1.3.7, it is possible to corrupt the memory pool
  by interrupting the data transfer channel.  This triggers a use-after-free
  in alloc_pool in pool.c, and possible remote code execution.

And additionally, fixes a number of other issues.  For details, see the
release notes:

https://github.com/proftpd/proftpd/blob/1.3.6/RELEASE_NOTES

This also bumps the bundled libcap, so
0001-fix-kernel-header-capability-version.patch can be dropped.

While we are at it, adjust the white space in the .hash function to match
the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-kernel-header-capability-version.patch  | 12 ------------
 package/proftpd/proftpd.hash                         |  4 ++--
 package/proftpd/proftpd.mk                           |  2 +-
 3 files changed, 3 insertions(+), 15 deletions(-)
 delete mode 100644 package/proftpd/0001-fix-kernel-header-capability-version.patch

diff --git a/package/proftpd/0001-fix-kernel-header-capability-version.patch b/package/proftpd/0001-fix-kernel-header-capability-version.patch
deleted file mode 100644
index 4401c9aeaf..0000000000
--- a/package/proftpd/0001-fix-kernel-header-capability-version.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- a/lib/libcap/libcap.h	2008-08-22 19:49:48.000000000 -0700
-+++ b/lib/libcap/libcap.h	2010-10-06 15:31:11.000000000 -0700
-@@ -65,7 +65,8 @@ struct _cap_struct {
-  */
- 
- #if !defined(_LINUX_CAPABILITY_VERSION_1) || \
--            (_LINUX_CAPABILITY_VERSION_1 != 0x19980330)
-+            ((_LINUX_CAPABILITY_VERSION_1 != 0x19980330) && \
-+            (_LINUX_CAPABILITY_VERSION_1 != 0x20071026))
- 
- # error "Kernel <linux/capability.h> does not match library"
- # error "file "libcap.h" --> fix and recompile libcap"
diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 0f2acd3a20..1ac54de4ca 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fe5baf6c469a2b0b7f0e2611561b6fd5414300e32a76b96adb2ccfe05b5efb60 proftpd-1.3.6b.tar.gz
-sha256 391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80 COPYING
+sha256  fa3541c4b34136a7b80cb12a2f6f9a0cab5118a5b0a1653d40af49c6479c35ad  proftpd-1.3.6c.tar.gz
+sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 2c3e0a6877..02dd0e825e 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.6b
+PROFTPD_VERSION = 1.3.6c
 PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
-- 
2.20.1
