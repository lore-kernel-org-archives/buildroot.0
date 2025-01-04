Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F69EC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790484F481;
	Fri, 28 Feb 2025 16:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUa11xVzBNrW; Fri, 28 Feb 2025 16:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD08B4EF26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD08B4EF26;
	Fri, 28 Feb 2025 16:50:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F3B711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E72D42EAD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBIVFrWTXFi6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51E15419AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51E15419AB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AA4A87C2C; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jan 2025 13:19:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 80e0f643e88afeccb69b679fe55677d8065445d8
X-Git-Newrev: c765462d944f8756d62e3df0a410bb178c0383f4
X-Patchwork-Hint: ignore
Message-Id: <20250228162957.4AA4A87C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/igt-gpu-tools: fix
 build with procps-ng 4.0.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c765462d944f8756d62e3df0a410bb178c0383f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump of procps-ng to version 4.0.5 in Buildroot commit
f7fe84508a14641617586bc481a08cb3face0477, the build of igt-gpu-tools
fails with:

../lib/igt_aux.c:1358:78: error: macro "PIDS_VAL" passed 4 arguments, but takes just 3

Indeed, the API of procps-ng has slightly changed between 4.0.4 and
4.0.5. Since it looks strange as those are minor releases the API
breakage has been reported to upstream procps-ng.

In the mean time, we still need to fix igt-gpu-tools, which the
patch added in this commit does. This patch has been submitted to
upstream igt-gpu-tools.

There are no autobuilder failures at this point, as the update to
procps-ng is quite recent, and igt-gpu-tools needing quite a lot of
dependencies, the build has a high chance of failing elsewhere
previously. However, the build issue is reproducible with the
following minimal defconfig:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_IGT_GPU_TOOLS=y
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ....c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/igt-gpu-tools/0001-lib-igt_aux.c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch b/package/igt-gpu-tools/0001-lib-igt_aux.c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch
new file mode 100644
index 0000000000..7c58024f01
--- /dev/null
+++ b/package/igt-gpu-tools/0001-lib-igt_aux.c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch
@@ -0,0 +1,66 @@
+From 17a30d4dbd60c644244d5bc7355eeaa221aaa820 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 2 Jan 2025 14:16:47 +0100
+Subject: [PATCH] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL() takes 3
+ arguments, not 4
+
+Unfortunately, the API of procps-ng has changed between procps-ng
+4.0.4 and procps-ng 4.0.5, with the PIDS_VAL() macro changing in
+upstream commit
+https://gitlab.com/procps-ng/procps/-/commit/967fdcfb06e20aad0f31073474cb94545c9bdea5.
+
+This API breakage has been reported upstream as of
+https://gitlab.com/procps-ng/procps/-/issues/366, but in the mean
+time, the build of igt-gpu-tools breaks with:
+
+../lib/igt_aux.c:1358:78: error: macro "PIDS_VAL" passed 4 arguments, but takes just 3
+
+We fix this by detecting the version of the libproc2 library, and
+adjusting accordingly how PIDS_VAL() gets used.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://lists.freedesktop.org/archives/igt-dev/2025-January/083809.html
+---
+ lib/igt_aux.c | 7 +++++++
+ meson.build   | 3 +++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/lib/igt_aux.c b/lib/igt_aux.c
+index 3407cc4f2..f5bf48da6 100644
+--- a/lib/igt_aux.c
++++ b/lib/igt_aux.c
+@@ -1358,10 +1358,17 @@ static bool get_process_ids(struct igt_process *prcs)
+ 	prcs->comm = NULL;
+ 	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
+ 	if (prcs->stack) {
++#if defined(HAVE_LIBPROC2_POST_4_0_5_API)
++		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
++		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
++		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
++		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
++#else
+ 		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
+ 		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
+ 		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
+ 		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
++#endif
+ 	}
+ #endif
+ 	return prcs->tid != 0;
+diff --git a/meson.build b/meson.build
+index 8b2a2a64a..f3e645c4d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -139,6 +139,9 @@ if libprocps.found()
+   config.set('HAVE_LIBPROCPS', 1)
+ elif libproc2.found()
+   config.set('HAVE_LIBPROC2', 1)
++  if libproc2.version().version_compare('>= 4.0.5')
++    config.set('HAVE_LIBPROC2_POST_4_0_5_API', 1)
++  endif
+ else
+   error('Either libprocps or libproc2 is required')
+ endif
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
