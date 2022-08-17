Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4093FC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F8E83096;
	Wed, 17 Aug 2022 06:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9F8E83096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3oGQ5O7yQXE; Wed, 17 Aug 2022 06:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F02D83004;
	Wed, 17 Aug 2022 06:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F02D83004
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A600E1BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EA4E83004
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EA4E83004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcoFpYXu1j8v for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:57:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE5EF82FD5
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE5EF82FD5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 85D0D87971; Wed, 17 Aug 2022 06:43:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 08:55:20 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 686d5ba78193f0a96f395dbcde58ccfc9b22c936
X-Git-Newrev: a224b41b8da5f20f20eaf3988c124faff74f67d3
X-Patchwork-Hint: ignore
Message-Id: <20220817064325.85D0D87971@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/nvidia-driver:
 define IGNORE_CC_MISMATCH
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

commit: https://git.buildroot.net/buildroot/commit/?id=a224b41b8da5f20f20eaf3988c124faff74f67d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Leverage IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
where NVIDIA's `cc_version_check` in kernel/conftest.sh may fail due
to matching on the pkgversion substring of the GCC version string in
the kernel's include/generated/compile.h.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 30a79ffdb0d1197fb4304c46ec60f71040d68eb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvidia-driver/nvidia-driver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 54c2aa46d8..ec070e3ca6 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -137,6 +137,7 @@ endif
 # because they don't recognise the usual variables set by the kernel
 # build system. We also need to tell them what modules to build.
 NVIDIA_DRIVER_MODULE_MAKE_OPTS = \
+	IGNORE_CC_MISMATCH=1 \
 	NV_KERNEL_SOURCES="$(LINUX_DIR)" \
 	NV_KERNEL_OUTPUT="$(LINUX_DIR)" \
 	NV_KERNEL_MODULES="$(NVIDIA_DRIVER_MODULES)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
