Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79708C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:47:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6F8610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D6F8610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06C31403A7;
	Wed,  3 Nov 2021 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_-bOcpaSnVl; Wed,  3 Nov 2021 21:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B56840398;
	Wed,  3 Nov 2021 21:47:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1411F1BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0295D40165
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7S3l4V40Lrvs for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:47:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D31B40134
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:47:23 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id bj27so2182832qkb.11
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 14:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ZxF7pSi+OiBckSytFcWhQjJ8TMaTwy0z7kqBLE0Pak=;
 b=Xjrf1vnT+OzSoPBqLfvRTmwC2S7xq5uiL3QVyf9YnHupzu7bOsbvugxO6550+BPAGK
 9g5AsD3QBcTrBczyVA5YO4Cm/0wjaGq9IrIeC0zLnZ44NXdBQVLpIKzUQzR7+qscriKO
 9UodipbBeTZ6p0Ae5CVvl4fjGQPZEM22Ko49Gn3q4pVinojVfkJpBxa+I1HmLyUn1Y4v
 lvMiluXT+qBOlx7yk8NHGWL7o9RkwGy+Us7nRhGz1AYK4vpO1/T/U6dNCtGtiFW7OL2d
 zsxgLcryXvdvzi8g/uF9g/TFiW9LyTE/Af9OdvZsW3iqz2Z1xkJlNmT5Jp0NA55tQy7H
 l8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ZxF7pSi+OiBckSytFcWhQjJ8TMaTwy0z7kqBLE0Pak=;
 b=vryejsh8dhpLt/LyjDcirL1eAgsy+r+QaAMo7VuJZBSw4aoNmVd1CWyfWEbIhx6NLy
 wTEr4xF5LVkSSLwoKeral43KiVT3tZeQUczDNHhj7zj0ybxYcDCd2sdunzbZpgIhzE7s
 uw/Tx2hq2hMReoXUAmzSfsG0WDljlRJadHq4wFJM5TD2VrRKAnU3II8yzbAoK4Jd//MV
 sEkFX5zxMf11ea3ffX/Y/mOy9YOQsdSmOaHCqy80v+8vWfDCkTPr3S4qZXU2p4+r8qMV
 IBQW4X3+hIjs1IoZzUDM0NXu9SWzr5pc+sTq2rHU5D5kQEM9hYWcL0vHj0vGqF+BYFrC
 JHGw==
X-Gm-Message-State: AOAM532V7gPXnXl7ruBQBnjrLAPu3BOHodGe5lgA7pPApSCLN6a9YZ8d
 sYp/weAHIabRPGjya2Be2HM5MPG9dfM=
X-Google-Smtp-Source: ABdhPJyGmMkvnXInSTebk6FrNwaLQe4bM5oJzW+4XRLXZ3xnnaQi2lCAaI9aJXSB8X/YGy1Jwfs92g==
X-Received: by 2002:a05:620a:3703:: with SMTP id
 de3mr2496510qkb.125.1635976042720; 
 Wed, 03 Nov 2021 14:47:22 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o14sm2645896qtv.34.2021.11.03.14.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 14:47:22 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 14:47:18 -0700
Message-Id: <20211103214718.1149331-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/mender-grubenv: fix grub module
 checks
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3efb5e31fc05705ce3c46b1f0ec031978a5cfab6 broke mender-grubenv by
splititng up BR2_TARGET_GRUB2_BUILTIN_MODULES and
BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI. Indeed, when a user now builds a system
with EFI, the MENDER_GRUBENV_MODULES_MISSING list always returns a full list
of grub modules, resulting in the error condition on line 46 to trigger.

In addition, BR2_TARGET_GRUB2_BUILTIN_MODULES has been renamed to
BR2_TARGET_GRUB2_BUILTIN_MODULES_PC, so this is changed in mender-grubenv.mk
as well.

Add an ifeq that checks if BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI is not empty,
and checks the required modules properly if it is not.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2:
  - Change ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y) to
    ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),) to cover all grub2 efi
    scenarios. (Thomas)
  
  - Change BR2_TARGET_GRUB2_BUILTIN_MODULES to
    BR2_TARGET_GRUB2_BUILTIN_MODULES_PC (thomas)

 package/mender-grubenv/mender-grubenv.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 07df25512c..ce63323f2a 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -31,9 +31,15 @@ MENDER_GRUBENV_DEFINES = \
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
 MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
+ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),)
 MENDER_GRUBENV_MODULES_MISSING = \
-	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
+else
+MENDER_GRUBENV_MODULES_MISSING = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
 
 ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
 ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
