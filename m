Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C079C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E612940AA7;
	Tue, 26 Apr 2022 20:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBsHa25PxCO4; Tue, 26 Apr 2022 20:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6412A40A93;
	Tue, 26 Apr 2022 20:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 041BA1BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D043540ABA
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqrUMmaTqsyB for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5942F40A8E
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C826E844EA; Tue, 26 Apr 2022 20:39:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 22:45:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 76c8a1ca741bbb005d1522fcdbb7976576cdb729
X-Git-Newrev: f7b3a8bf07413b05724eb043eebb1169214061d8
X-Patchwork-Hint: ignore
Message-Id: <20220426203953.C826E844EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/polkit: fix build
 without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7b3a8bf07413b05724eb043eebb1169214061d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since switch to meson-package in
commit 1db13226394ff7e6f5e7ca643e275f35d6c633bb and
https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:

The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2a92509f50bb3eae972cf2f32cf3af38b2736413)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/0003-fix-build-without-C.patch | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/polkit/0003-fix-build-without-C.patch b/package/polkit/0003-fix-build-without-C.patch
new file mode 100644
index 0000000000..8e16de256c
--- /dev/null
+++ b/package/polkit/0003-fix-build-without-C.patch
@@ -0,0 +1,50 @@
+From abbc04f6f3acfc2dfa34b1c07decaa658786e142 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 2 Apr 2022 18:33:08 +0200
+Subject: [PATCH] fix build without C++
+
+Fix the following build failure without C++ raised since
+https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:
+
+The following exception(s) were encountered:
+Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
+
+Indeed, C++ is only required with mozjs engine
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/polkit/polkit/-/commit/abbc04f6f3acfc2dfa34b1c07decaa658786e142]
+---
+ meson.build                   | 2 +-
+ src/polkitbackend/meson.build | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c6765fd..da60930 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project(
+-  'polkit', ['c', 'cpp'],
++  'polkit', ['c'],
+   version: '0.120',
+   license: 'LGPL2+',
+   default_options: [
+diff --git a/src/polkitbackend/meson.build b/src/polkitbackend/meson.build
+index 266f280..7c5d443 100644
+--- a/src/polkitbackend/meson.build
++++ b/src/polkitbackend/meson.build
+@@ -38,6 +38,7 @@ if js_engine == 'duktape'
+   deps += libm_dep
+   deps += thread_dep
+ elif js_engine == 'mozjs'
++  add_languages('cpp')
+   sources += files('polkitbackendjsauthority.cpp')
+ endif
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
