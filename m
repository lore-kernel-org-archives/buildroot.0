Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018F7C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1473E419B9;
	Fri, 10 Feb 2023 14:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1473E419B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3-xbIvO6hVk; Fri, 10 Feb 2023 14:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D856740897;
	Fri, 10 Feb 2023 14:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D856740897
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D99E81BF2C9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF7CA81756
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF7CA81756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYPJ1dO62H3b for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C59F5817C0
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C59F5817C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B31A384EA9; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 15:10:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e331da62fb7612b7a52a40e37312753cc1c1eef5
X-Git-Newrev: e8fe92584446bba2bb81f454c5ebbcb4f80a371b
X-Patchwork-Hint: ignore
Message-Id: <20230210141450.B31A384EA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack2: fix build with host python
 >= 3.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8fe92584446bba2bb81f454c5ebbcb4f80a371b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5ce/5ce5ebd20e0e509b31b51d2ec1aed56fdb8f45aa/

The bundled waf script is too old (2.0.12) for python >= 3.11 as it uses the
'U' modifier to open (universal newlines), which have been deprecated since
python 3.3 and finally removed in 3.11.

Jack unfortunately uses a modified waf, so we cannot just set
JACK2_NEEDS_EXTERNAL_WAF, so instead backport an upstream patch fixing the
compatibility issue:

https://github.com/jackaudio/jack2/pull/884

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-of-U-mode-bit-for-opening-files-in-pyth.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch b/package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
new file mode 100644
index 0000000000..9ee5a43e18
--- /dev/null
+++ b/package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
@@ -0,0 +1,55 @@
+From 328c58967dce8be426f9208ba7717ab5afc2c4f3 Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Mon, 11 Jul 2022 00:56:28 +0200
+Subject: [PATCH] Remove usage of 'U' mode bit for opening files in python
+
+The 'U' mode bit is removed in python 3.11. It has been
+deprecated for a long time. The 'U' mode bit has no effect
+so this change doesn't change any behavior.
+
+See https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-the-python-api
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ waflib/ConfigSet.py | 2 +-
+ waflib/Context.py   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py
+index b300bb56..84736c9c 100644
+--- a/waflib/ConfigSet.py
++++ b/waflib/ConfigSet.py
+@@ -312,7 +312,7 @@ class ConfigSet(object):
+ 		:type filename: string
+ 		"""
+ 		tbl = self.table
+-		code = Utils.readf(filename, m='rU')
++		code = Utils.readf(filename, m='r')
+ 		for m in re_imp.finditer(code):
+ 			g = m.group
+ 			tbl[g(2)] = eval(g(3))
+diff --git a/waflib/Context.py b/waflib/Context.py
+index 9fee3fa1..761b521f 100644
+--- a/waflib/Context.py
++++ b/waflib/Context.py
+@@ -266,7 +266,7 @@ class Context(ctx):
+ 				cache[node] = True
+ 				self.pre_recurse(node)
+ 				try:
+-					function_code = node.read('rU', encoding)
++					function_code = node.read('r', encoding)
+ 					exec(compile(function_code, node.abspath(), 'exec'), self.exec_dict)
+ 				finally:
+ 					self.post_recurse(node)
+@@ -662,7 +662,7 @@ def load_module(path, encoding=None):
+ 
+ 	module = imp.new_module(WSCRIPT_FILE)
+ 	try:
+-		code = Utils.readf(path, m='rU', encoding=encoding)
++		code = Utils.readf(path, m='r', encoding=encoding)
+ 	except EnvironmentError:
+ 		raise Errors.WafError('Could not read the file %r' % path)
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
