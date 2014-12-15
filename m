From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 17:55:10 -0300
Subject: [Buildroot] [PATCH] libyaml: add security patch for CVE-2014-9130
Message-ID: <1418676910-2361-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: assert failure when processing wrapped strings (CVE-2014-9130).
See https://bugzilla.redhat.com/show_bug.cgi?id=1169369

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libyaml/0001-fix-CVE-2014-9130.patch | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libyaml/0001-fix-CVE-2014-9130.patch

diff --git a/package/libyaml/0001-fix-CVE-2014-9130.patch b/package/libyaml/0001-fix-CVE-2014-9130.patch
new file mode 100644
index 0000000..a267e40
--- /dev/null
+++ b/package/libyaml/0001-fix-CVE-2014-9130.patch
@@ -0,0 +1,33 @@
+From e6aa721cc0e5a48f408c52355559fd36780ba32a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ingy=20d=C3=B6t=20Net?= <ingy@ingy.net>
+Date: Fri, 28 Nov 2014 09:21:49 -0800
+Subject: [PATCH] Fix for https://bitbucket.org/xi/libyaml/issue/10/
+
+https://bitbucket.org/xi/libyaml/issue/10/wrapped-strings-cause-assert-failure
+
+Commenting out the assert makes the scanner do the right thing and
+results in just a simple parse failure.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/scanner.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/scanner.c b/src/scanner.c
+index 88d4fa5..c5f3d2f 100644
+--- a/src/scanner.c
++++ b/src/scanner.c
+@@ -1110,7 +1110,9 @@ yaml_parser_save_simple_key(yaml_parser_t *parser)
+      * line.  Therefore it is always allowed.  But we add a check anyway.
+      */
+ 
+-    assert(parser->simple_key_allowed || !required);    /* Impossible. */
++    /* XXX This caused:
++     * https://bitbucket.org/xi/libyaml/issue/10/wrapped-strings-cause-assert-failure
++    assert(parser->simple_key_allowed || !required); */    /* Impossible. */
+ 
+     /*
+      * If the current position may start a simple key, save it.
+-- 
+2.0.4
+
-- 
2.0.4
