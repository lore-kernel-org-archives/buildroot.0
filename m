Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6552AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A73583E52;
	Thu, 14 Apr 2022 19:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_Fk8ZFuXqJB; Thu, 14 Apr 2022 19:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21AA5836E1;
	Thu, 14 Apr 2022 19:34:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2A7E1BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF8228194C
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wfo0Cxjida-Q for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F54C81775
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C6F5C83C86; Thu, 14 Apr 2022 19:24:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:23:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2699eb563156f6e9282342534122cf08ed7a0c25
X-Git-Newrev: 2a92509f50bb3eae972cf2f32cf3af38b2736413
X-Patchwork-Hint: ignore
Message-Id: <20220414192443.C6F5C83C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a92509f50bb3eae972cf2f32cf3af38b2736413
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since switch to meson-package in
commit 1db13226394ff7e6f5e7ca643e275f35d6c633bb and
https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:

The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
