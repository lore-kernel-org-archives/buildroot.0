Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C9FE8783F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6203B40BFC;
	Tue,  3 Feb 2026 15:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Hzsj3FU1TWG; Tue,  3 Feb 2026 15:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F69840C08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133004;
	bh=qO4DfZU7iNWGYoaDdQ1m1axKIvXCtvNV7qtXydW9TBU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ph0ujLGEYBzoEtLOzCZvie640o1QCt7nC4qYxtVoXjRXx9vt8KbYVUEJRmE50cruW
	 wqllNcfQp17nTkbQCrnqiGExIDrXebtkJ9wICVmj/OvHPR7T6E1/mqggsyby1IEaT8
	 CA2s6XpiN9frGtVwFpqpyz4tvkczV52mkL6TF/sglAvEf65JjU7eSXSzDxlEHU+aCx
	 27M7JFhF8TirNA6phvj7OooOMns5yOQZ3Kh0EdYz5B06Jvp7z5iVlcWMZQK22NCjzS
	 9/VvPl+GfWRCLFL3YA+m4eK8zysM0dGKfEq7GXzZ5r3UVqRayaCW7MNdbRbb2QP/O9
	 aSpIOJ4Reklug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F69840C08;
	Tue,  3 Feb 2026 15:36:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D85F013D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C473D83C98
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeO5r5k8f9wp for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4F6683C8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F6683C8B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F6683C8B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so61459675e9.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132999; x=1770737799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kFaPuuqUc+4NrEJM83dJiG/2jhFDqONAOxjaRYPTPPU=;
 b=jtL8UVWIfq4G1u1l4u2CYMrTSZC8E0H8jmaxDbhQiddIYMfbIgcnUXM/zoKKBj0UfB
 J7HFLJWuu4HiRdEJplveHOYSv4mq9H+MuR9u+fjBXkCkE+1uLECZt/91GDswPvBsdqR2
 Bnx+Pnyvzqbrg7bUJ4bt2BWfXVbiGD9S1UAYOArIKicqHi68sO2vjFg4Gfm2zZK8Z/OB
 XXknH0IOT/MKTzKdK6J7Itu/9iNw9IVT807jXN2Y9/g46CCNLmqfGVIr4xabaN660ry2
 0t8P4r7bCowXmPmNtBzNoHNhkROE4A6rFPOvUNeBewQJF6Tf+8LNP4MLeDrdSwbNalYX
 3ErQ==
X-Gm-Message-State: AOJu0YxHzke7Pb49DdQawvm40ywu3yHxl2R7n2sIxynMrTXr+7aJQUXF
 WMGO0Vo9GCfgcTjm3zXNUnsZBVgujeRhzWgBMKsMpqOO/MiRC1ERhZDx0oM4duH9
X-Gm-Gg: AZuq6aKadD+VUtipQlobhGVzXSBPiqaJAH/WZqutSATEvo173M5EeOAt18S1aeP6pdc
 xoBmK9YrX3bdAyXZlb97MFtugzPclVq+b5vykdfB8CAgx7eA6OcyeGoIuWt7Ypjtc5Uap0RuREa
 RjI71bzhPHXSvIlJQBpmIYIXZS6xdSA63SJm81YKRRqA1gnAQpQ9tl2Jzr3Kayfu/mnKiQDdrWs
 WioH8AvXBM8+fPt94+6rfIJ8yM6kyDB4X0s954eVSYBKLAiAaSOziErKcZCyFSgaG3l0cTG87sI
 4KtT55FI46M68pJzFbg54xyzGKBQCOwdz5knSa9Iaw4yteZL2wEDTmFEMvAbJRlywAipTZSNK9f
 tqUHsAPogNfec+e8JimgLiFPyCfKAT/S2poQbi8EdcYgSHcrned9xuwF5AoQgtTdCs49+wElB0M
 xawVxA/VOJI6V60z03lzt1xR9wzbk66LCaUyGkBw==
X-Received: by 2002:a05:600c:6217:b0:47d:3690:7490 with SMTP id
 5b1f17b1804b1-4830e940a52mr556285e9.9.1770132999139; 
 Tue, 03 Feb 2026 07:36:39 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:38 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:11 -0800
Message-ID: <20260203153617.80012-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770132999; x=1770737799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFaPuuqUc+4NrEJM83dJiG/2jhFDqONAOxjaRYPTPPU=;
 b=ZS9W8XMOYk03/Rmv5scyeZrJtoVSkDCd2zJxT2Pa7EYUIdbIcyUmRYzkJCnDCItfMb
 +RdzIVZYaNmtiV3MT+PiYgmY6tigvUYw6ElycJmmj8vpOb4qvm5wE7NRdUZYp0lvBYNy
 gFRDIdF86p/QFyjM/I1VV8OWV3nDEdTNz16HlgtFpEUKS8UP0CKtEh8kriPZ3Fs4pbDH
 fwQKz3YzX06nlOxGVnb4cxYa+gIg0VejQSzeNe5S5u3D68rcJncv/78nB1lnKV9fAeYz
 AIUnIuNBn+4dOhAbF1ivh1CDamIHh7EYJyydwjwW+AivB/onqNpLvsDNJ0sJcSEj+tE8
 PBFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZS9W8XMO
Subject: [Buildroot] [PATCH 04/10] package/freescale-imx/imx-oei: add OEI
 package
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add Optional Executable Image (OEI) package.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 DEVELOPERS                                 |  1 +
 package/freescale-imx/Config.in            |  1 +
 package/freescale-imx/imx-oei/Config.in    | 21 ++++++++++++++++
 package/freescale-imx/imx-oei/imx-oei.hash |  4 +++
 package/freescale-imx/imx-oei/imx-oei.mk   | 29 ++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/freescale-imx/imx-oei/Config.in
 create mode 100644 package/freescale-imx/imx-oei/imx-oei.hash
 create mode 100644 package/freescale-imx/imx-oei/imx-oei.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a31458f9d7..a8a27e1498 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2112,6 +2112,7 @@ N:	Laurent Vivier <laurent@vivier.eu>
 F:	package/petitboot/
 
 N:	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
+F:	package/freescale-imx/imx-oei/
 F:	package/freescale-imx/imx-sm/
 
 N:	Lee Jones <lee.jones@linaro.org>
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 30c0d69970..dec6042f42 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -208,6 +208,7 @@ source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-m4fwloader/Config.in"
+source "package/freescale-imx/imx-oei/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
diff --git a/package/freescale-imx/imx-oei/Config.in b/package/freescale-imx/imx-oei/Config.in
new file mode 100644
index 0000000000..03ca091ddd
--- /dev/null
+++ b/package/freescale-imx/imx-oei/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_IMX_OEI
+	bool "imx-oei"
+	help
+	  imx-oei contains the source code for the Optional Executable
+	  Image (OEI), which is a piece of code executed by the boot CPU
+	  that initializes various aspects of the hardware
+	  (i.e. DDR, TCM).
+
+	  https://github.com/nxp-imx/imx-oei
+
+if BR2_PACKAGE_IMX_OEI
+config BR2_PACKAGE_IMX_OEI_TARGET_BOARD
+	string "Target board"
+	default "mx95lp5"
+	help
+	  Which board to build the OEI for.
+
+config BR2_PACKAGE_IMX_OEI_TARGET_REV
+	string
+	default "b0" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95B0
+endif # BR2_PACKAGE_IMX_OEI
diff --git a/package/freescale-imx/imx-oei/imx-oei.hash b/package/freescale-imx/imx-oei/imx-oei.hash
new file mode 100644
index 0000000000..8de2a2c756
--- /dev/null
+++ b/package/freescale-imx/imx-oei/imx-oei.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  83e28f7e02321ed0ca6d0c4a83c85f8dbef564325b6232fcc9fa609bfdc45903  imx-oei-lf-6.12.49-2.2.0.tar.gz
+sha256  38e5f362f6141e65856fbfd9f3e0a1b75c897e58f08050186c6af0f6b23f6a3f  LICENSE.txt
+sha256  4f20bab3e1176bddb4ce8494fa3a12301fa243db755a549443fbbfd979a237e3  SCR.txt
diff --git a/package/freescale-imx/imx-oei/imx-oei.mk b/package/freescale-imx/imx-oei/imx-oei.mk
new file mode 100644
index 0000000000..d27919c473
--- /dev/null
+++ b/package/freescale-imx/imx-oei/imx-oei.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# imx-oei
+#
+################################################################################
+
+IMX_OEI_VERSION = lf-6.12.49-2.2.0
+IMX_OEI_SITE = $(call github,nxp-imx,imx-oei,$(IMX_OEI_VERSION))
+IMX_OEI_LICENSE = BSD-3-Clause
+IMX_OEI_LICENSE_FILES = LICENSE.txt SCR.txt
+
+IMX_OEI_DEPENDENCIES += host-arm-gnu-toolchain
+
+# TODO: for now we only support OEI for DDR intialization
+IMX_OEI_OUTPUT_BIN = oei-m33-ddr.bin
+
+# no TOOLS variable - see rationale from imx-sm package
+IMX_OEI_MAKE_OPTS = \
+	OEI_CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi-
+
+define IMX_OEI_BUILD_CMDS
+	$(IMX_OEI_MAKE_OPTS) $(MAKE) -C $(@D) oei=ddr board=$(BR2_PACKAGE_IMX_OEI_TARGET_BOARD) r=$(BR2_PACKAGE_IMX_OEI_TARGET_REV)
+endef
+
+define IMX_OEI_INSTALL_TARGET_CMDS
+	cp $(@D)/build/$(BR2_PACKAGE_IMX_OEI_TARGET_BOARD)/ddr/$(IMX_OEI_OUTPUT_BIN) $(BINARIES_DIR)/$(IMX_OEI_OUTPUT_BIN)
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
