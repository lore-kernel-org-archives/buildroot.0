Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF1DC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 09:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 897E54056F;
	Mon, 26 Aug 2024 09:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6fINXQjYBU8; Mon, 26 Aug 2024 09:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E79DC40420
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E79DC40420;
	Mon, 26 Aug 2024 09:35:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 830D31BF2BE
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 09:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E97C60730
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 09:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPC2tzdYJ3m8 for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 09:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C65D60703
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C65D60703
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 09:35:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B7F28632F; Mon, 26 Aug 2024 09:35:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 11:31:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2383768cdf03ad78a89a0b4355c4e1a576c2d219
X-Git-Newrev: cf647b69fbeec000663bd9b55047e7c2d69217f8
X-Patchwork-Hint: ignore
Message-Id: <20240826093551.2B7F28632F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/norm: fix build issue with waf >=
 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf647b69fbeec000663bd9b55047e7c2d69217f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To fix build issues with modern Python versions, commit
8012a86f5cf751f9c4d5d4a63f6502a6ac60d13a ("package/norm: use external
waf") switched the norm package from using its internal waf copy to
using our external waf package.

Then, in fd5623150dcc23441c4f0bd586378daeb91d66ea ("package/waf: bump
to v2.1.1"), we updated out external waf to a newer version, which
breaks the API around ArgParse, see upstream commit:

  https://gitlab.com/ita1024/waf/-/commit/bd5c22d484734f7c1b77e16c91a10c7a44fa6c8a:

This causes breakage when building the norm package. Fabrice had
already submitted patches upstream, to both the "protolib"
project (which is used as a submodule in norm) and to the "norm"
project. These pull requests are still pending, but let's backport the
patches that seem reasonable and that fix the build issue.

Fixes:

  http://autobuild.buildroot.net/results/f005d513434d42d26e601096b94b4070586118b2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...protolib-wscript-fix-build-with-waf-2.1.0.patch | 53 ++++++++++++++++++++++
 .../0005-wscript-fix-build-with-waf-2.1.0.patch    | 35 ++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/package/norm/0004-protolib-wscript-fix-build-with-waf-2.1.0.patch b/package/norm/0004-protolib-wscript-fix-build-with-waf-2.1.0.patch
new file mode 100644
index 0000000000..827a607fb0
--- /dev/null
+++ b/package/norm/0004-protolib-wscript-fix-build-with-waf-2.1.0.patch
@@ -0,0 +1,53 @@
+From c35a9dc031cda1406eff7de1f199ad55949b17c6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 24 Aug 2024 21:28:16 +0200
+Subject: [PATCH] protolib/wscript: fix build with waf >= 2.1.0
+
+Replace add_option_group by add_argument_group and add_option by
+add_argument to avoid the following build failure with waf 2.1.0 and
+https://gitlab.com/ita1024/waf/-/commit/bd5c22d484734f7c1b77e16c91a10c7a44fa6c8a:
+
+  File "/home/autobuild/autobuild/instance-21/output-1/build/norm-1.5.8/protolib/wscript", line 37, in options
+    bind_opts = ctx.parser.add_option_group('Language Bindings', 'Use during configure step.')
+                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/USNavalResearchLaboratory/protolib/pull/47
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ protolib/wscript | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/protolib/wscript b/protolib/wscript
+index 97dda93..97f65f6 100644
+--- a/protolib/wscript
++++ b/protolib/wscript
+@@ -34,18 +34,18 @@ def options(ctx):
+     ctx.load('python')
+     ctx.load('java')
+ 
+-    bind_opts = ctx.parser.add_option_group('Language Bindings', 'Use during configure step.')
+-    bind_opts.add_option('--build-python', action='store_true',
++    bind_opts = ctx.parser.add_argument_group('Language Bindings', 'Use during configure step.')
++    bind_opts.add_argument('--build-python', action='store_true',
+             help='Build Python bindings [default:false]')
+-    bind_opts.add_option('--build-java', action='store_true',
++    bind_opts.add_argument('--build-java', action='store_true',
+             help='Build Java bindings [default:false]')
+ 
+-    build_opts = ctx.parser.add_option_group('Compile Options', 'Use during build step.')
+-    build_opts.add_option('--debug', action='store_true',
++    build_opts = ctx.parser.add_argument_group('Compile Options', 'Use during build step.')
++    build_opts.add_argument('--debug', action='store_true',
+             help='Build in debug mode [default:release]')
+-    build_opts.add_option('--enable-wx', action='store_true',
++    build_opts.add_argument('--enable-wx', action='store_true',
+             help='Enable checking for wxWidgets.')
+-    build_opts.add_option('--enable-static-library', action='store_true',
++    build_opts.add_argument('--enable-static-library', action='store_true',
+             help='Enable installing static library. [default:false]')
+ 
+ def configure(ctx):
+-- 
+2.46.0
+
diff --git a/package/norm/0005-wscript-fix-build-with-waf-2.1.0.patch b/package/norm/0005-wscript-fix-build-with-waf-2.1.0.patch
new file mode 100644
index 0000000000..7260beefc2
--- /dev/null
+++ b/package/norm/0005-wscript-fix-build-with-waf-2.1.0.patch
@@ -0,0 +1,35 @@
+From 9f7a9b72ff5a7313793bba86962f9677970c9b4c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 27 Jul 2024 20:41:45 +0200
+Subject: [PATCH] wscript: fix build with waf >= 2.1.0
+
+Replace add_option_group by add_argument_group to a build failure with
+waf 2.1.0 and
+https://gitlab.com/ita1024/waf/-/commit/bd5c22d484734f7c1b77e16c91a10c7a44fa6c8a:
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/USNavalResearchLaboratory/norm/pull/86
+[Thomas: small change needed to backport on version 1.5.8]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ wscript | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/wscript b/wscript
+index 0fdae96..6a8c22a 100644
+--- a/wscript
++++ b/wscript
+@@ -47,8 +47,8 @@ system = platform.system().lower()
+ 
+ def options(ctx):
+     ctx.recurse('protolib')    
+-    build_opts = ctx.parser.add_option_group('Compile/install Options', 'Use during build/install step.')
+-    build_opts.add_option('--enable-static-library', action='store_true',
++    build_opts = ctx.parser.add_argument_group('Compile/install Options', 'Use during build/install step.')
++    build_opts.add_argument('--enable-static-library', action='store_true',
+             help='Enable building and installing static library. [default:false]')
+ 
+ 
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
