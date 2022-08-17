Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A9CC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 08:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C3D40D77;
	Wed, 17 Aug 2022 08:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C3D40D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AETvVUvbqbyg; Wed, 17 Aug 2022 08:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EECEE40E08;
	Wed, 17 Aug 2022 08:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EECEE40E08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E38D1C113E
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 08:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7538841981
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 08:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7538841981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_3O1uD371cZ for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 08:28:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ED0E416B9
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 08:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED0E416B9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E610287943; Wed, 17 Aug 2022 08:14:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 08:54:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f17eee169ba533a2e7b8cb4b85ec490957b09bc7
X-Git-Newrev: 0fa5de37f1b2b864e04a22314f43a6aaf13db6ec
X-Patchwork-Hint: ignore
Message-Id: <20220817081402.E610287943@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nvidia-driver:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fa5de37f1b2b864e04a22314f43a6aaf13db6ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
