Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C5FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E18611C1
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9E18611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D8454016A;
	Wed,  3 Nov 2021 22:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gn3dcg_UTsLK; Wed,  3 Nov 2021 22:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 828664016C;
	Wed,  3 Nov 2021 22:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65FAD1BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55A3880DED
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3N_AieyRH-O for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:59:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7C4980DD7
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:59:37 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id br39so3968420qkb.8
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 15:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxIiWi5WqrXsaw3YL7HfhTUk47B+SiGXoWTymcr2pc4=;
 b=MD6guuUZ3zjSulSh381RBl7t+4uil8JLgp/KfRq3CX1kEklnEMeuH96a2YiuE8FdaG
 a9znUb0Jyn1VTQOHv74MGoPK2oQGBtnHcF2ku/Fs7yFZEO3Vw40PqvHnX0apRw+JKKTP
 qI5OxY8WUEpiZ3jywO5wyLAZSQyUtUpy4o2pN+sYmgbr79msa44fDQEveK+d4efZPQ/W
 PXlK+2eQQjTZmRL8HWZ273QD0IA7b/MqCBXfyXKetnBkBdN20dQ2cGea52l6G8EQHTHI
 PM10aLA6NeAqX2nLkCew3VBrDXYbFRXple503fDfnIky80EoqVcW+eCcOhzPZV5GyvSK
 /vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxIiWi5WqrXsaw3YL7HfhTUk47B+SiGXoWTymcr2pc4=;
 b=7QvAwQ12LqwGa1gf994WKyzdchqNb/G3y0HF4k1az1LzvpDkeVTGSd2Qn3NEkQjOjj
 c/j6w9m2arn7DoVYCH9G4qJ9cihWtIvfIG7EwELdWMIbIRr3b6Layveqi2IoD8wrw2Xs
 lKE8b4BZw+bOdgKyPOoOJpZOysGMSv49LDKknetFgdjzMPlAkkgausjALclr/UeJN2WR
 T6AyUsa/TREtjyvs6u+MzXXnsDAfe63gvMeFM1rh8UBFmte7bU+DrJTzdm3m6DnuO/0U
 zeCsP334ykGqywC249LLYUVzbaiEaYdlTBquLHe8Qx9QsMvXcRrQeWTayLG+omNllSTm
 GAXQ==
X-Gm-Message-State: AOAM533qJsp1SatDdOvvimKNws1zXhGT2ICNBgB815uE3l2VRGJZC6wU
 wQ+xKneNmkgaXFSdBsfWNz5+j7IQ4os=
X-Google-Smtp-Source: ABdhPJycN9nLKYIwF9c+4tULISN+GkjrWwvj0i78VlAJkBOdAib7+0AM+ovs8/ZeQhyagh/rEBsAIA==
X-Received: by 2002:a37:4152:: with SMTP id o79mr37996574qka.169.1635980376278; 
 Wed, 03 Nov 2021 15:59:36 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id i11sm2436973qtq.44.2021.11.03.15.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 15:59:36 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 15:59:33 -0700
Message-Id: <20211103225933.1189009-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/mender-grubenv: fix grub module
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

- Add two ifeqs, one for BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI and the other
  for BR2_TARGET_GRUB2_BUILTIN_MODULES_PC. If either is not empty,
  check for the required modules and error out if either of the two
  have missing modules.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2:
  - Change ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y) to
    ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),) to cover all grub2 efi
    scenarios. (Thomas)
  
  - Change BR2_TARGET_GRUB2_BUILTIN_MODULES to
    BR2_TARGET_GRUB2_BUILTIN_MODULES_PC (thomas)

Changes v2 -> v3:
  - Check for both MODULES_EFI and MODULES_PC (Thomas)

 package/mender-grubenv/mender-grubenv.mk | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 07df25512c..0dfb82971c 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -31,14 +31,27 @@ MENDER_GRUBENV_DEFINES = \
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
 MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
-MENDER_GRUBENV_MODULES_MISSING = \
-	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),)
+MENDER_GRUBENV_MODULES_MISSING_EFI = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
+
+ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC),)
+MENDER_GRUBENV_MODULES_MISSING_PC = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
 
 ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
-ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
-$(error The following missing grub2 modules must be enabled for mender-grubenv \
-	to work: $(MENDER_GRUBENV_MODULES_MISSING))
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_EFI),)
+$(error The following missing grub2 efi modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_EFI))
+endif
+
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_PC),)
+$(error The following missing grub2 pc modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_PC))
 endif
 endif
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
