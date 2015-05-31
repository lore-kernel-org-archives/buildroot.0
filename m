From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 May 2015 19:28:25 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/eudev: bump version to 3.1
Message-ID: <1433093305-17868-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/gentoo/eudev/commit/d2aeb8b63dfcb15161c4dd3e80491c844c3f0581#diff-0a5e92f58aded4146365ea36ee8b3c21

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...evert-udev-rules-modernise-add_rule-a-bit.patch |   46 --------------------
 package/eudev/eudev.hash                           |    2 +-
 package/eudev/eudev.mk                             |    2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch

diff --git a/package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch b/package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch
deleted file mode 100644
index d0109c8..0000000
--- a/package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d2aeb8b63dfcb15161c4dd3e80491c844c3f0581 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 4 Apr 2015 13:47:32 +0200
-Subject: [PATCH] Revert "udev: rules - modernise add_rule a bit"
-
-Initialisers for anonymous unions are unknown to gcc-4.5, which is still
-quite widely used.
-
-See the following build failure, reported by the Buildroot autobuilders:
-    http://autobuild.buildroot.org/results/11e/11ebb926b891862e270b9cb39fd2ed4344b736a8/build-end.log
-
-This reverts commit 5cb98078479d93e25099c1cb73fa9c46aa9ccf29.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Tom Gundersen <teg@jklm.no>
----
-Notes:
-  - submitted upstream: https://github.com/gentoo/eudev/pull/113
-
----
- src/udev/udev-rules.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 5a4792e..3a96c8a 100644
---- a/src/udev/udev-rules.c
-+++ b/src/udev/udev-rules.c
-@@ -1047,11 +1047,11 @@ static int add_rule(struct udev_rules *rules, char *line,
-                     const char *filename, unsigned int filename_off, unsigned int lineno) {
-         char *linepos;
-         const char *attr;
--        struct rule_tmp rule_tmp = {
--                .rules = rules,
--                .rule.type = TK_RULE,
--        };
-+        struct rule_tmp rule_tmp;
- 
-+        memzero(&rule_tmp, sizeof(struct rule_tmp));
-+        rule_tmp.rules = rules;
-+        rule_tmp.rule.type = TK_RULE;
-         /* the offset in the rule is limited to unsigned short */
-         if (filename_off < USHRT_MAX)
-                 rule_tmp.rule.rule.filename_off = filename_off;
--- 
-1.9.1
-
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 49f86ae..4cd4a9f 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,2 +1,2 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5	a2706a1413723b6b82eecb7d6982763c	eudev-3.0.tar.gz
+md5	3969383124e03df132cac92a519334fa	eudev-3.1.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index cfff94a..3146f1f 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.0
+EUDEV_VERSION = 3.1
 EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
-- 
1.7.10.4
