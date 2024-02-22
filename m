Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E33BC48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E37241D19;
	Thu, 22 Feb 2024 10:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmNVBtfvU1TQ; Thu, 22 Feb 2024 10:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3CF041BAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3CF041BAD;
	Thu, 22 Feb 2024 10:17:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16AC41BF98E
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C5AB41B8A
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B16KtFR89hJp for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25D6C41B8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D6C41B8B
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25D6C41B8B
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:17:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512b29f82d1so6379605e87.1
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597021; x=1709201821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrvPIaevHtX45ycIuy4yh6S0QBUC7cY7QdUV1fA+/yU=;
 b=iZETp7quX6UYiYuaCCJdx187785BGzdmF/1Wi7DGNa1si0/CPNmGLnaqtR7tzgwuKa
 1e2zmHosbXcajjxNi8F/njTQxLOKT3gXlwhGyeYcGWXsIGPeM8rJr3nvz6lr+rSjXP+G
 aja50RE6cPURWMCykYHRafbb+dAkJOwl6E6yEAuXZo4Xqa4/+iX5cUPD7hmxrYxa0rj1
 sEt8Rn2h4CZ8+/1gK/mFKc/AgqK46h7ph/lwb/DlnVk5RdV+lKSWybM/kuLjEtDpNf+8
 C2Wmjy4nTAUxKqWJ1Ffvw/awyc4BgXVAwu/NXOGZ58eMQDweXs8VGVUf1IFEDgJ6GUI0
 dPhQ==
X-Gm-Message-State: AOJu0YxfWYclqmjM+IlUYIXrQJqDVkfx9BhSdwdvhvi3wsjd7xC/Ewhm
 79z56LBckpAIKS76HBMhoGw3/UHnUXYOrAp5g159d1W82/pZZ2CiT8gDkdlXKnp+z1EOaBF97I6
 x5Bs=
X-Google-Smtp-Source: AGHT+IFO1Sy19k5D1VY1qQiCQmMVTDNDZAVws1pzrhKWLILcpJw8RB2UlHETBcWSqFEUVdms+tYyFQ==
X-Received: by 2002:a05:6512:3d16:b0:512:da6d:23aa with SMTP id
 d22-20020a0565123d1600b00512da6d23aamr1374832lfv.67.1708597021589; 
 Thu, 22 Feb 2024 02:17:01 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:17:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:13 +0100
Message-ID: <20240222101617.18422-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597021; x=1709201821;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrvPIaevHtX45ycIuy4yh6S0QBUC7cY7QdUV1fA+/yU=;
 b=aep0M26pmNFtdwpGuM/hYzyXo+dHCzZvjX9RCRHM0oK3s+ErM7WMa/JyWihhaZUgKe
 LqUn4Y8+Y6iZnMtv3hULC/UPbbrt/x0OKYV7ZQU8mjWqnH/OzW2CPsKtmpkECG0Uqei+
 CrJnQfomVqLmdpmZTCyOz6kf7iV4jAuRhr/+E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aep0M26p
Subject: [Buildroot] [PATCH v5 12/16] boot/uboot: set BINMAN_INDIRS for TI
 K3 DM
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explained in [1], adding support for AM62x LP SK in U-Boot, requires
binman for building bootloader images. The BINMAN_INDIRS environment
variable is used to provide a space-separated list of directories to
search for binary blobs.

In this way, the previous setting becomes unnecessary, so let's remove
it.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20231030110138.1347603-3-n-yadav@ti.com/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Drop "DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f"
  from UBOOT_MAKE_OPTS.

no changes since v1:

 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a88059..70982a87719f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -189,7 +189,7 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
 UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
-UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
+UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
