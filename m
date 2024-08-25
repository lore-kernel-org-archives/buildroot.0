Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B908C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 08:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DB12606B6;
	Sun, 25 Aug 2024 08:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAVz9sfm3b2v; Sun, 25 Aug 2024 08:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7F1605E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B7F1605E3;
	Sun, 25 Aug 2024 08:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1071BF40E
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 08:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE1A605E3
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 08:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7loMsOMTKmv2 for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 08:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8AD06059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8AD06059E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8AD06059E
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 08:42:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A50201C0002;
 Sun, 25 Aug 2024 08:42:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 10:42:20 +0200
Message-ID: <20240825084221.2438493-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724575343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FJbh+bP9ZxU8BLPA1T0ncsAu4kra0UqFY0U5UPsd3UY=;
 b=Fw5DmW4DMwMvxMbW9VpliOll/AXhdYqYWgKvS8prTdTQWBWztNzCMSB0Is5yaDzrhpbHnA
 SC1WQJ2MAjfS0LAIaxfryVeoCpr+iCV4Q9fVIDT3mVujgzwiaJvUsSoT7rs0lVIcOFR4pH
 eXr3Kb6xsKfzYG3VpGDBi2XiIDwUM056THbOYXaek2Jlc4l1jQyHjhklBXTaUiowxCR7e6
 7+JYyPbSYOpfigTqnx4R/fkp2xlglKbJezFkgCtzkkQlP+fJK29yAihRbD603kL/1M42zu
 DYocbbBPP1oUynblLQ0Z+ICmXoelNE46sFfeXGfEIgEzR6oqTOzJANstsD2Iow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fw5DmW4D
Subject: [Buildroot] [PATCH] package/norm: fix build issue with waf >= 2.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...lib-wscript-fix-build-with-waf-2.1.0.patch | 53 +++++++++++++++++++
 ...005-wscript-fix-build-with-waf-2.1.0.patch | 35 ++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 package/norm/0004-protolib-wscript-fix-build-with-waf-2.1.0.patch
 create mode 100644 package/norm/0005-wscript-fix-build-with-waf-2.1.0.patch

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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
