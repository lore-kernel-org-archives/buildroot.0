Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68759C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14BB284B52;
	Sat, 23 Jul 2022 19:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14BB284B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mm1PDdPkFX_J; Sat, 23 Jul 2022 19:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C34D784C37;
	Sat, 23 Jul 2022 19:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34D784C37
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD0451BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97FE584B01
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FE584B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efBAj1Y7lOn2 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:39:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A7584B52
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A7584B52
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6D14784D8F; Sat, 23 Jul 2022 19:25:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:35:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd524a6e968274225f0645ff50bf129af9e550ce
X-Git-Newrev: 30a79ffdb0d1197fb4304c46ec60f71040d68eb8
X-Patchwork-Hint: ignore
Message-Id: <20220723192530.6D14784D8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-driver: define
 IGNORE_CC_MISMATCH
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

commit: https://git.buildroot.net/buildroot/commit/?id=30a79ffdb0d1197fb4304c46ec60f71040d68eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Leverage IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
where NVIDIA's `cc_version_check` in kernel/conftest.sh may fail due
to matching on the pkgversion substring of the GCC version string in
the kernel's include/generated/compile.h.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
