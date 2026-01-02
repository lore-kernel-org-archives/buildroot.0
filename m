Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69537FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B6440881;
	Fri,  2 Jan 2026 17:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yX1wAW-42XZ6; Fri,  2 Jan 2026 17:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED25F40844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374831;
	bh=TBNd5ajwmSChE68Ehu09Qb5RJsGTkA5YYngfJvukoZs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VUP26hJa/2fj7NIKNEcLM0thTDN3s9M8cW6iiw0ErMpszRL0gg5iPb6pTAzjKzAOr
	 NPhgEJQlGaKeLHks713jurxYVT4TNn7XkZ1DxjIhwf3U0C/wQ51wha3rA8rOBSlV1l
	 7iCQAXr69w7TBgpVkilcwmbiNnL153JdqxdcHHim0oM/pk8ee5hW6mtGsc+sRQMcfV
	 /Zz4/+Qfe47Zk702QF8Id+ok6hBMan5o1G3QV3cjcEPpS29JdufwG1cijDSOvB8SmH
	 91BXW4ZxKC0wtrlvEGtrz9uKQzZ5k7w2lAPyhfk0pHdCsVDVl3bxbbv85t+ewrS9rf
	 oHzpTm2SZeXxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED25F40844;
	Fri,  2 Jan 2026 17:27:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B15C119D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97CD460AD4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iy0AYwAkC6h for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B523160661
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B523160661
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A23988803A; Fri,  2 Jan 2026 17:27:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:26:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbb5c740589bd3a969a8de56d6e816706405606a
X-Git-Newrev: 6019df8f99cb30efd6263b93753bd8bc46874b48
X-Patchwork-Hint: ignore
Message-Id: <20260102172708.A23988803A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: override BL31
 environment variable error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6019df8f99cb30efd6263b93753bd8bc46874b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..f5b1e5030e 100644
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
