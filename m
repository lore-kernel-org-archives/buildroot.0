Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE0BC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DEBF4157D;
	Mon,  6 Feb 2023 10:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DEBF4157D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4nVuOG9fyat; Mon,  6 Feb 2023 10:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF6E416A5;
	Mon,  6 Feb 2023 10:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF6E416A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 971A91BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7051D402EB
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7051D402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCpPQLO5asmc for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:54:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CDBB40339
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CDBB40339
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57344835C2; Mon,  6 Feb 2023 10:54:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:26:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 316e149611a761db04171ee6141048d9057183c8
X-Git-Newrev: 4bbda72743d39df29dfc91e0f52be02b2d465f6d
X-Patchwork-Hint: ignore
Message-Id: <20230206105450.57344835C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: warn about
 redefined config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4bbda72743d39df29dfc91e0f52be02b2d465f6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warn the developer in the case the same config is declared more than
once in the same Config.in file.
But take into account the conditional code that lets the config be
visible and warn only when it is declared more than once in the same
conditions.
For instance, do not warn for:
 if BR2_PACKAGE_BUSYBOX
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_config.py      | 38 ++++++++++++++++
 utils/checkpackagelib/test_lib_config.py | 78 ++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index b05831f2c3..f26ca0d898 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -233,3 +233,41 @@ class Indent(_CheckFunction):
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
                         text]
+
+
+class RedefinedConfig(_CheckFunction):
+    CONFIG = re.compile(r"^\s*(menu|)config\s+(BR2_\w+)\b")
+    IF = re.compile(r"^\s*if\s+([^#]*)\b")
+    ENDIF = re.compile(r"^\s*endif\b")
+
+    def before(self):
+        self.configs = {}
+        self.conditional = []
+
+    def check_line(self, lineno, text):
+        if _empty_or_comment(text) or _part_of_help_text(text):
+            return
+
+        m = self.IF.search(text)
+        if m is not None:
+            condition = m.group(1)
+            self.conditional.append(condition)
+            return
+
+        m = self.ENDIF.search(text)
+        if m is not None:
+            self.conditional.pop()
+            return
+
+        m = self.CONFIG.search(text)
+        if m is None:
+            return
+        config = m.group(2)
+
+        key = (config, ' AND '.join(self.conditional))
+        if key in self.configs.keys():
+            previous_line = self.configs[key]
+            return ["{}:{}: config {} redeclared (previous line: {})"
+                    .format(self.filename, lineno, config, previous_line),
+                    text]
+        self.configs[key] = lineno
diff --git a/utils/checkpackagelib/test_lib_config.py b/utils/checkpackagelib/test_lib_config.py
index 91a549adf2..474d17105e 100644
--- a/utils/checkpackagelib/test_lib_config.py
+++ b/utils/checkpackagelib/test_lib_config.py
@@ -385,3 +385,81 @@ Indent = [
 def test_Indent(testname, filename, string, expected):
     warnings = util.check_file(m.Indent, filename, string)
     assert warnings == expected
+
+
+RedefinedConfig = [
+    ('no redefinition',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_FOO_BAR\n'
+     'bool "foo"\n',
+     []),
+    ('no conditional',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_BAR\n'
+     'bool "bar"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n',
+     [['any:5: config BR2_PACKAGE_FOO redeclared (previous line: 1)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('three times',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n',
+     [['any:3: config BR2_PACKAGE_FOO redeclared (previous line: 1)',
+       'config BR2_PACKAGE_FOO\n'],
+      ['any:5: config BR2_PACKAGE_FOO redeclared (previous line: 1)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('same conditional',
+     'any',
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'config BR2_PACKAGE_BAR\n'
+     'bool "bar"\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n',
+     [['any:6: config BR2_PACKAGE_FOO redeclared (previous line: 2)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('equivalent conditional',
+     'any',
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n',
+     [['any:8: config BR2_PACKAGE_FOO redeclared (previous line: 2)',
+       'config BR2_PACKAGE_FOO\n']]),
+    ('not equivalent conditional',
+     'any',
+     'if BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'if !BR2_PACKAGE_BAZ\n'
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'endif\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', RedefinedConfig)
+def test_RedefinedConfig(testname, filename, string, expected):
+    warnings = util.check_file(m.RedefinedConfig, filename, string)
+    assert warnings == expected
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
