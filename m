From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Mar 2015 08:31:15 -0300
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.13
Message-ID: <1427196675-5815-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch now upstream so remove.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../sudo/0001-make-signame-include-unistd_h.patch    | 20 --------------------
 package/sudo/sudo.hash                               |  4 ++--
 package/sudo/sudo.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 package/sudo/0001-make-signame-include-unistd_h.patch

diff --git a/package/sudo/0001-make-signame-include-unistd_h.patch b/package/sudo/0001-make-signame-include-unistd_h.patch
deleted file mode 100644
index 234cd71..0000000
--- a/package/sudo/0001-make-signame-include-unistd_h.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-signame.c uses sudo_compat.h which in turn uses gid_t definitions
-that are normally defined in unistd.h.
-This doesn't seem to cause issues with (e)glibc systems, but it does break
-uClibc-based builds.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura sudo-1.8.12.orig/lib/util/mksigname.c sudo-1.8.12/lib/util/mksigname.c
---- sudo-1.8.12.orig/lib/util/mksigname.c	2015-02-09 15:40:10.000000000 -0300
-+++ sudo-1.8.12/lib/util/mksigname.c	2015-02-17 09:20:05.126701093 -0300
-@@ -44,6 +44,9 @@
- 
-     printf("#include <config.h>\n");
-     printf("#include <signal.h>\n");
-+    printf("#ifdef HAVE_UNISTD_H\n");
-+    printf("#include <unistd.h>\n");
-+    printf("#endif /* HAVE_UNISTD_H */\n");
-     printf("#include \"sudo_compat.h\"\n\n");
-     printf("const char *const sudo_sys_signame[NSIG] = {\n");
-     for (i = 0; i < NSIG; i++) {
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 4f4df16..94b897d 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
-# From http://www.sudo.ws/pipermail/sudo-announce/2015-February/000136.html
-sha256	163b51841de8ad19276581a6782d61f5948f1f72a0a843371a1c167d3dc4f3b0	sudo-1.8.12.tar.gz
+# From http://www.sudo.ws/pipermail/sudo-announce/2015-March/000138.html
+sha256	e374e5edf2c11c00d6916a9f51cb0ad15e51c7b028370fa15169b07e61e05a25	sudo-1.8.13.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 3048557..a1a8328 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.12
+SUDO_VERSION = 1.8.13
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
2.0.5
