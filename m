From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2015 14:09:58 +0200
Subject: [Buildroot] [PATCH] package/eudev: fix build with older gcc
Message-ID: <1428149398-1552-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initialisers for anonymous unions/structs are unknown to gcc-4.5, still
widely used.

Fixes:
    http://autobuild.buildroot.org/results/11e/11ebb926b891862e270b9cb39fd2ed4344b736a8/
    http://autobuild.buildroot.org/results/065/065fdef50b1dd57b95ad2b5eda9904a1d0787cdc/
    http://autobuild.buildroot.org/results/316/3161eb96da66936e2cb3ec6aa5547587c3d90338/
    http://autobuild.buildroot.org/results/226/2267a204e9eb46bcb621f5bd408deaca98709fc3/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...evert-udev-rules-modernise-add_rule-a-bit.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch

diff --git a/package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch b/package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch
new file mode 100644
index 0000000..d0109c8
--- /dev/null
+++ b/package/eudev/0002-Revert-udev-rules-modernise-add_rule-a-bit.patch
@@ -0,0 +1,46 @@
+From d2aeb8b63dfcb15161c4dd3e80491c844c3f0581 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 4 Apr 2015 13:47:32 +0200
+Subject: [PATCH] Revert "udev: rules - modernise add_rule a bit"
+
+Initialisers for anonymous unions are unknown to gcc-4.5, which is still
+quite widely used.
+
+See the following build failure, reported by the Buildroot autobuilders:
+    http://autobuild.buildroot.org/results/11e/11ebb926b891862e270b9cb39fd2ed4344b736a8/build-end.log
+
+This reverts commit 5cb98078479d93e25099c1cb73fa9c46aa9ccf29.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Tom Gundersen <teg@jklm.no>
+---
+Notes:
+  - submitted upstream: https://github.com/gentoo/eudev/pull/113
+
+---
+ src/udev/udev-rules.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index 5a4792e..3a96c8a 100644
+--- a/src/udev/udev-rules.c
++++ b/src/udev/udev-rules.c
+@@ -1047,11 +1047,11 @@ static int add_rule(struct udev_rules *rules, char *line,
+                     const char *filename, unsigned int filename_off, unsigned int lineno) {
+         char *linepos;
+         const char *attr;
+-        struct rule_tmp rule_tmp = {
+-                .rules = rules,
+-                .rule.type = TK_RULE,
+-        };
++        struct rule_tmp rule_tmp;
+ 
++        memzero(&rule_tmp, sizeof(struct rule_tmp));
++        rule_tmp.rules = rules;
++        rule_tmp.rule.type = TK_RULE;
+         /* the offset in the rule is limited to unsigned short */
+         if (filename_off < USHRT_MAX)
+                 rule_tmp.rule.rule.filename_off = filename_off;
+-- 
+1.9.1
+
-- 
1.9.1
