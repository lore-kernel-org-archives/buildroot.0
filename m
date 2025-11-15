Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67A7CEB2D2
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B613608AA;
	Sat, 15 Nov 2025 20:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y_tkhKM82iP; Sat, 15 Nov 2025 20:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FDF9608F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FDF9608F2;
	Sat, 15 Nov 2025 20:59:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DBC21A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EE10608F2
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrO1Pd5bT3IN for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 20:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B14E608AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B14E608AA
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 20:59:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3674E84622; Sat, 15 Nov 2025 20:59:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 21:56:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74f565039651786706713707f0ef856bc3a9ce73
X-Git-Newrev: 279cbbdb646e7136c4d8b3b5b44d9b4e31ed31dd
X-Patchwork-Hint: ignore
Message-Id: <20251115205937.3674E84622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: add a check for
 'default n' in Config.in files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=279cbbdb646e7136c4d8b3b5b44d9b4e31ed31dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Boolean Config.in symbols default to 'n', so we typically do not add such
redundant lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/checkpackagelib/lib_config.py      | 11 +++++++++++
 utils/checkpackagelib/test_lib_config.py | 33 ++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index bf975d7a3b..202baa7f1b 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -242,6 +242,17 @@ class Indent(_CheckFunction):
                         text]
 
 
+class NoDefaultN(_CheckFunction):
+    DEFAULTN = re.compile(r"^\tdefault n$")
+
+    def check_line(self, lineno, text):
+        text_nocomments = text.split("#")[0].rstrip()
+        if self.DEFAULTN.match(text_nocomments):
+            return ["{}:{}: boolean symbols default to 'n', so 'default n' is redundant"
+                    .format(self.filename, lineno),
+                    text]
+
+
 class RedefinedConfig(_CheckFunction):
     CONFIG = re.compile(r"^\s*(menu|)config\s+(BR2_\w+)\b")
     IF = re.compile(r"^\s*if\s+([^#]*)\b")
diff --git a/utils/checkpackagelib/test_lib_config.py b/utils/checkpackagelib/test_lib_config.py
index 474d17105e..35614ef152 100644
--- a/utils/checkpackagelib/test_lib_config.py
+++ b/utils/checkpackagelib/test_lib_config.py
@@ -387,6 +387,39 @@ def test_Indent(testname, filename, string, expected):
     assert warnings == expected
 
 
+NoDefaultN = [
+    ('good example',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault y\n',
+     []),
+    ('default n',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault n\n',
+     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
+       '\tdefault n\n']]),
+    ('default n with comment',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault n # this is a comment\n',
+     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
+       '\tdefault n # this is a comment\n']]),
+    ('default n with trailing whitespace',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tdefault n  \t\n',
+     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
+       '\tdefault n  \t\n']])
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', NoDefaultN)
+def test_NoDefaultN(testname, filename, string, expected):
+    warnings = util.check_file(m.NoDefaultN, filename, string)
+    assert warnings == expected
+
+
 RedefinedConfig = [
     ('no redefinition',
      'any',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
