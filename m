Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3B4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687C440509;
	Sat,  8 Jan 2022 16:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4vxzd9ICWar; Sat,  8 Jan 2022 16:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A40C40474;
	Sat,  8 Jan 2022 16:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ECBE1BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AFE58142A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ESKJsZdHncl for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4417E81423
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:52:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9ABE7832B4; Sat,  8 Jan 2022 16:46:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 17:51:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9bf97cf16fa6945466a6712028c9a74104ff426
X-Git-Newrev: 1ed4147e76fe56322c47468be8a222204c459adf
X-Patchwork-Hint: ignore
Message-Id: <20220108164622.9ABE7832B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rustc: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ed4147e76fe56322c47468be8a222204c459adf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
