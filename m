Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C21DC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3D62405C8;
	Mon,  6 Jun 2022 09:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id We4Qw7bQG0Ny; Mon,  6 Jun 2022 09:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6FC6405B0;
	Mon,  6 Jun 2022 09:31:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55741BF3C6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D42D9405B0
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-yjbMiT0oEY for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:31:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1855E4010C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:31:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3910686C74; Mon,  6 Jun 2022 09:20:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 11:22:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fe77cc29c85b3541261c7c08ab82e3789fd1d4e
X-Git-Newrev: 211a4848b73303b246f82f1aff899748dcfe902f
X-Patchwork-Hint: ignore
Message-Id: <20220606092003.3910686C74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rustc: fix
 BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv6
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

commit: https://git.buildroot.net/buildroot/commit/?id=211a4848b73303b246f82f1aff899748dcfe902f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with ARMv6 raised since commit
d69d40c029dc7d8199b745eaee759d92b66c5d17:

rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz: OK (sha256: 83c3fb8645379ec308192fa713df87044892639495722077e07aa779b310239e)
wget --passive-ftp -nd -t 3 -O '/nvmedata/autobuild/instance-20/output-1/build/.rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz.rnWGvt/output' 'https://static.rust-lang.org/dist/rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz'
--2022-06-05 12:30:08--  https://static.rust-lang.org/dist/rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz
Resolving static.rust-lang.org (static.rust-lang.org)... 108.156.120.70, 108.156.120.75, 108.156.120.122, ...
Connecting to static.rust-lang.org (static.rust-lang.org)|108.156.120.70|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2022-06-05 12:30:08 ERROR 404: Not Found.

Fixes:
 - http://autobuild.buildroot.org/results/4b187767c233f0dae3fa7f8fea9dd67e2b5bb7d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rustc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index a86d95236d..9ce0f62592 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -114,6 +114,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
 	default "armv5te" if BR2_ARM_CPU_ARMV5
+	default "arm" if BR2_ARM_CPU_ARMV6
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
 	default "riscv64gc" if BR2_RISCV_64
 	default BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
