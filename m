Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC41C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B3461095;
	Thu, 27 Jan 2022 07:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnQt2L82ovSv; Thu, 27 Jan 2022 07:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E17C6103F;
	Thu, 27 Jan 2022 07:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 474B21BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34CC340B41
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnv4Hex5y7d5 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:55:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E23C40B6B
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:55:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D80A0825CC; Thu, 27 Jan 2022 07:48:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:23:48 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: fbbf702f00d7f92bf3a33ac880b1c8942998bbac
X-Git-Newrev: 6a45747f72f8d5579eb29ee71ed82669df75c964
X-Patchwork-Hint: ignore
Message-Id: <20220127074809.D80A0825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/rustc: fix
 BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a45747f72f8d5579eb29ee71ed82669df75c964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

BR2_PACKAGE_HOST_RUSTC_ARCH only had a special value for
BR2_ARM_CPU_ARMV7A, but it also needs a special value for
BR2_ARM_CPU_ARMV5, as the pre-compiled Rust standard library for
ARMv5TE is identified with the "armv5te" architecture name, see
https://doc.rust-lang.org/nightly/rustc/platform-support.html.

We noticed this because Rust binaries wouldn't work on an ARMv5
platform (Illegal instruction). This was due to the usage of the
arm-unknown-linux-gnueabi variant of the Rust standard library, which
is for ARMv6. Thanks to this commit, we correctly use the
armv5te-unknown-linux-gnueabi variant, and Rust binaries work properly
on ARMv5TE.

A better approach would be to do the conversion from architecture
options to Rust tuples in a single string symbol that also defines the
supported architectures, similar to how it's done in e.g. openblas.
However, that's a much bigger change. So for now, just do the easy thing
and fix this one issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1ed4147e76fe56322c47468be8a222204c459adf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rustc/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 90ea56f626..fe7404b3bd 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -102,8 +102,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
+	default "armv5te" if BR2_ARM_CPU_ARMV5
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
-	default BR2_ARCH if !BR2_ARM_CPU_ARMV7A
+	default BR2_ARCH
 
 config BR2_PACKAGE_HOST_RUSTC_ABI
 	string
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
