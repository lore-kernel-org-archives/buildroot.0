Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E8ED2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A8C83D80;
	Tue, 13 Jan 2026 19:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGvQveGj8g6I; Tue, 13 Jan 2026 19:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA3D783D8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333055;
	bh=dzpiv7Q75mszYgAKD9S8vMu1bODaz1EdusfFdI7EGY4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MlUcKkBrH9xjMK48D71ssv+teHTE2E1WGYX/xcE2J1y/2hh9pFRTGSGoFRrwC72id
	 87wzJWlnMIkdGoNVvypWOjfFwmgNee7IjcdLxt16OCCRxeAHyE2EFYkyaVPDmWp+3f
	 Wi1jg5hxhIfh5kTb8XxWLk6d7ufKqsC2ttFLq11E4kDtey7q0c7QoBU3bLb4qfT4Oo
	 0bo72UR60Tx5oxzmZYKLxnT77p/6YQrFOfAXwDBe4CalrUQIrkf5VbV4/Jki/DrH5y
	 s/3Hqs4zXELzR7i8I+L5G0CTAFMie6XFHg9Kp2iUe9AW9etIhCbbJ98SIW6VKowCoV
	 foz5+DivcWiLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3D783D8A;
	Tue, 13 Jan 2026 19:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 264BC1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B64340409
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exc92_hJ8Lhi for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C8F40557
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73C8F40557
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72787873D9; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:02:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5f9c2ff313a34d995d422a770535650718bacc98
X-Git-Newrev: 9ec0fee664187cd7e6dcb17f4016a5ce32f437c6
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.72787873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 boot/arm-trusted-firmware: override BL31 environment variable error
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ec0fee664187cd7e6dcb17f4016a5ce32f437c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When building the arm-trusted-firmware, if the host environment has a value
configured in the BL31 variable such as the following:

export BL31=/tmp/bl31.elf

This will cause the build of the bl31.elf to be skipped leading to the
following build error:

make[1]: Nothing to be done for 'bl31'.
And then:
readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file

To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
arm-trusted-firmware will build regardless of the host environment.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6019df8f99cb30efd6263b93753bd8bc46874b48)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 172a930b5c..decfd4748f 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -162,6 +162,8 @@ endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
+# Avoid BL31 environment variable from polluting the build
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL31=
 endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
