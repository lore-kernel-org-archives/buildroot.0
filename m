Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50954C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 10:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1B16FB90;
	Wed, 12 Jan 2022 10:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luj1E4W_Sthx; Wed, 12 Jan 2022 10:37:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D216FB8A;
	Wed, 12 Jan 2022 10:37:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F1B1BF9B9
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47E0583E75
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X__BHIpxc9xD for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 10:37:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ECFF83E73
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6999E82A79; Wed, 12 Jan 2022 10:30:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 11:36:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c97b8925ed01bfa18d66da9ab01863191c591f2
X-Git-Newrev: 0e0118a6a7d85081529ad66aa72f74025d682c60
X-Patchwork-Hint: ignore
Message-Id: <20220112103044.6999E82A79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: fix build on meson 0.61.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e0118a6a7d85081529ad66aa72f74025d682c60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch removing invalid positional arguments:
../output-1/build/polkit-0.120/actions/meson.build:3:5: ERROR: Function does not take positional arguments.

Fixes:
 - http://autobuild.buildroot.net/results/b2d/b2d2b27844b32b3609e11005966d85dc0dfb7a9f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-positional-parameters-to-i18n.merge_file.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch b/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch
new file mode 100644
index 0000000000..25fa4ef19b
--- /dev/null
+++ b/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch
@@ -0,0 +1,45 @@
+From 30c368a6b729bc8a0a9d0d023739c4fa07b0928b Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Mon, 25 Oct 2021 20:21:27 +0100
+Subject: [PATCH] Don't pass positional parameters to i18n.merge_file
+
+These were always ignored, and Meson 0.60.0 disallowed them.
+
+Resolves: https://gitlab.freedesktop.org/polkit/polkit/-/issues/160
+Reference: https://github.com/mesonbuild/meson/pull/9445
+Signed-off-by: Simon McVittie <smcv@debian.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/99]
+---
+ actions/meson.build      | 1 -
+ src/examples/meson.build | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/actions/meson.build b/actions/meson.build
+index 2abaaf3..1e3f370 100644
+--- a/actions/meson.build
++++ b/actions/meson.build
+@@ -1,7 +1,6 @@
+ policy = 'org.freedesktop.policykit.policy'
+ 
+ i18n.merge_file(
+-  policy,
+   input: policy + '.in',
+   output: '@BASENAME@',
+   po_dir: po_dir,
+diff --git a/src/examples/meson.build b/src/examples/meson.build
+index c6305ab..8c18de5 100644
+--- a/src/examples/meson.build
++++ b/src/examples/meson.build
+@@ -1,7 +1,6 @@
+ policy = 'org.freedesktop.policykit.examples.pkexec.policy'
+ 
+ i18n.merge_file(
+-  policy,
+   input: policy + '.in',
+   output: '@BASENAME@',
+   po_dir: po_dir,
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
