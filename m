Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E34C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 222484299C;
	Fri,  7 Jan 2022 17:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lB5pbywAWw2V; Fri,  7 Jan 2022 17:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8694D42997;
	Fri,  7 Jan 2022 17:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA101BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89971824DF
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COZZejOOMn3b for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:13:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73CB0824CB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:13:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5DECCC0003;
 Fri,  7 Jan 2022 17:13:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri,  7 Jan 2022 18:13:13 +0100
Message-Id: <20220107171318.1423075-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/7] package/rustc: fix
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 90ea56f626..05324ad755 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -102,6 +102,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
+	default "armv5te" if BR2_ARM_CPU_ARMV5
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
 	default BR2_ARCH if !BR2_ARM_CPU_ARMV7A
 
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
