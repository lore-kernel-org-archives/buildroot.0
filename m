Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1141C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 07:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C6AD61075
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 07:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C6AD61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F04E880E05;
	Mon,  8 Nov 2021 07:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YoG4iDKhHK3o; Mon,  8 Nov 2021 07:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 576ED80DFF;
	Mon,  8 Nov 2021 07:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6905D1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 07:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5714840235
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 07:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKuKqVPyyoMz for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 07:40:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91A47401BF
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 07:40:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A24B68B553; Mon,  8 Nov 2021 07:36:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 08:37:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b5b9f75e998f30cdaebcc12deaed82be12ee81b
X-Git-Newrev: 0787695a50b77e71669bef4e1e67e8f8c8e505ef
X-Patchwork-Hint: ignore
Message-Id: <20211108073629.A24B68B553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mono: fix build with autoconf >=
 2.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=0787695a50b77e71669bef4e1e67e8f8c8e505ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an unknown reason, the following build failure is raised on one of
the autobuilder with host gcc 6.3.0 since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

icall.c: In function 'mono_create_icall_signatures':
icall.c:9513:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
   gsize_a *types = (gsize*)(sig + 1);
                    ^

Add an upstream patch to fix it.

Fixes:
 - http://autobuild.buildroot.org/results/1d1d82b505abd16d014d754b6a4a48fb1271e3b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Ongoing-work-on-the-cmake-build.patch     | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/mono/0002-Ongoing-work-on-the-cmake-build.patch b/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
new file mode 100644
index 0000000000..afe618f193
--- /dev/null
+++ b/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
@@ -0,0 +1,34 @@
+From 17650f7e0f571287bb14bb9b4fbde7b91d842bb4 Mon Sep 17 00:00:00 2001
+From: monojenkins <jo.shields+jenkins@xamarin.com>
+Date: Thu, 24 Sep 2020 12:17:34 -0400
+Subject: [PATCH] Ongoing work on the cmake build. (#20428)
+
+* Fix some warnings.
+* Avoid creating netcore/config.make.
+* Fix CPU_COUNT test.
+* Add missing source file.
+
+Co-authored-by: vargaz <vargaz@users.noreply.github.com>
+
+[Retrieved (and updated to keep only update of icall.c) from:
+https://github.com/mono/mono/commit/17650f7e0f571287bb14bb9b4fbde7b91d842bb4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ mono/metadata/CMakeLists.txt | 1 +
+ mono/metadata/icall.c        | 2 +-
+ mono/mini/CMakeLists.txt     | 5 +++++
+ 3 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/mono/metadata/icall.c b/mono/metadata/icall.c
+index fa991bc72e57..f2c003ac1ff1 100644
+--- a/mono/metadata/icall.c
++++ b/mono/metadata/icall.c
+@@ -9605,7 +9605,7 @@ mono_create_icall_signatures (void)
+ 	int n;
+ 	while ((n = sig->param_count)) {
+ 		--sig->param_count; // remove ret
+-		gsize_a *types = (gsize*)(sig + 1);
++		gsize_a *types = (gsize_a*)(sig + 1);
+ 		for (int i = 0; i < n; ++i) {
+ 			gsize index = *types++;
+ 			g_assert (index < G_N_ELEMENTS (lookup));
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
