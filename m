Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67545C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB846FBAE;
	Tue, 21 Feb 2023 01:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB846FBAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XY-P8WbT9s8F; Tue, 21 Feb 2023 01:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BC970007;
	Tue, 21 Feb 2023 01:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BC970007
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4CB91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6539E6FC22
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6539E6FC22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrcDlKfLaK-E for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B9296FBE4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B9296FBE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 576878648F; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 01c0fb3862bce6605881d9e32c29b5f7373bb2f9
X-Git-Newrev: 29c9b4435503d1b3130ce37dcab88c89156b1481
X-Patchwork-Hint: ignore
Message-Id: <20230220205249.576878648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/checkpackagelib: warn
 about ifdef on .mk
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

commit: https://git.buildroot.net/buildroot/commit/?id=29c9b4435503d1b3130ce37dcab88c89156b1481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There are two legitimate cases to prefer ifdef over ifeq in package
recipes: command-line overrides are allowed for busybox and uclibc
configs.

Except for that, all package in tree already use ifeq, so warn the
developer adding/changing a package to use ifeq instead of ifdef, in
order to keep consistence across packages.
file.mk:2: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL
file.mk:5: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL

The difference between ifeq and ifdef is that ifdef doesn't expand
recursively.

Add comments to busybox and uclibc packages to avoid a warning in such
special cases.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk           |  1 +
 package/uclibc/uclibc.mk             |  1 +
 utils/checkpackagelib/lib_mk.py      | 18 ++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 48 ++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0f14bf999d..f8f9cb5616 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -110,6 +110,7 @@ BUSYBOX_MAKE_OPTS = \
 
 # specifying BUSYBOX_CONFIG_FILE on the command-line overrides the .config
 # setting.
+# check-package disable Ifdef
 ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0ddf7dfa6d..125aa4cdcf 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -22,6 +22,7 @@ UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
+# check-package disable Ifdef
 ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index b50a19ac62..8adf844e9a 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -21,6 +21,24 @@ continue_conditional = ["elif", "else"]
 end_conditional = ["endif"]
 
 
+class Ifdef(_CheckFunction):
+    IFDEF = re.compile(r"^\s*(else\s+|)(ifdef|ifndef)\s")
+
+    def check_line(self, lineno, text):
+        m = self.IFDEF.search(text)
+        if m is None:
+            return
+        word = m.group(2)
+        if word == 'ifdef':
+            return ["{}:{}: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL"
+                    .format(self.filename, lineno),
+                    text]
+        else:
+            return ["{}:{}: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL"
+                    .format(self.filename, lineno),
+                    text]
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 49fa216fcd..80a1736b4e 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -3,6 +3,54 @@ import checkpackagelib.test_util as util
 import checkpackagelib.lib_mk as m
 
 
+Ifdef = [
+    ('ignore commented line',
+     'any',
+     '# ifdef\n',
+     []),
+    ('simple',
+     'any',
+     '\n'
+     'ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE\n'
+     'endif\n',
+     [['any:2: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       'ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE\n']]),
+    ('ignore indentation',
+     'any',
+     '  ifdef FOO\n'
+     '  endif\n'
+     '\tifdef BAR\n'
+     'endif\n',
+     [['any:1: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       '  ifdef FOO\n'],
+      ['any:3: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       '\tifdef BAR\n']]),
+    ('typo',
+     'any',
+     '\n'
+     'ifndef ($(BR2_ENABLE_LOCALE),y)\n'
+     'endif\n',
+     [['any:2: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL',
+       'ifndef ($(BR2_ENABLE_LOCALE),y)\n']]),
+    ('else ifdef',
+     'any',
+     'else ifdef  SYMBOL # comment\n',
+     [['any:1: use ifeq ($(SYMBOL),y) instead of ifdef SYMBOL',
+       'else ifdef  SYMBOL # comment\n']]),
+    ('else ifndef',
+     'any',
+     '\t else  ifndef\t($(SYMBOL),y) # comment\n',
+     [['any:1: use ifneq ($(SYMBOL),y) instead of ifndef SYMBOL',
+       '\t else  ifndef\t($(SYMBOL),y) # comment\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Ifdef)
+def test_Ifdef(testname, filename, string, expected):
+    warnings = util.check_file(m.Ifdef, filename, string)
+    assert warnings == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
