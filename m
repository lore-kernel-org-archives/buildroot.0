Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB89EE64AB5
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 14:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0603A812C3;
	Tue,  3 Dec 2024 14:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnPBPxDjDKXq; Tue,  3 Dec 2024 14:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D56DC812C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D56DC812C6;
	Tue,  3 Dec 2024 14:39:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D55EC2365
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B4C40260
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpERqAc3s03G for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 14:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=becher.jannik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 660EB401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 660EB401D8
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 660EB401D8
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:39:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa53ebdf3caso290243366b.2
 for <buildroot@buildroot.org>; Tue, 03 Dec 2024 06:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733236770; x=1733841570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AHTdLeVGr/yTp3uwzh4qFDtGV/xIyEFNO44EMiei9DU=;
 b=ZXULoaGdXUYzlFVoJmWLzqyGE6GaYGWjaQc2ducP9yQOrOuaJ31u1/vA8YjbSG+a7P
 P0tmLBGeWEpD7dfyUJniwEO728yi+dLrq7UruumChJ4zHvdNul5gK5c1OKZVgB60Px2L
 PTdkrIYWpo09NS00CrOGhsRQNkPfqYWDTSPw4Ham9CKxIXrOe/xXF1M2AQGrbr62PcKR
 PKQunvKHrdeli2mB2bDjq7NvgRYmOPFt3Pv7ncbF57nXHWDIGGObH0Vb7yIuE8Z0+73R
 9HBR7R+OmZbjLmoxPDSmOnEHLwc8p7vvqp2+68jm9H7MD3jN/UD95q1kOB7euSVFatgm
 slug==
X-Gm-Message-State: AOJu0Yx58HLKc5K7pjCJHSexwZNjjIbOPNHgKrHXLMYy3q95qOba8OOy
 eVkmD+iAoSRrfi9xizaqbonVMHpRAIVWl8o9mAtbe2zPq/ucV/LD2nE1XdQP
X-Gm-Gg: ASbGncslxDRnRUYQvXwYkaZAHQajTS/L7LmYGTSxByJcJTjhUb1a9aKHoJgYYhYYZ9L
 uS4SvSTZVyUGVDtB/uDIR3UcfrEpOsiCLVpLHUIJDWmuOrIw4kLVyzssNWAuNrpAvwEIStzRVaG
 0R4nwxu0SUIA0ApXlnB2nMa7EClhQeRqJcUj34CpSEUte5XOG03f3mIAn9EiEfoJXey6+VozzOq
 wgS1hy5CBkquJtjpezui8nQUR5Gm9HOw9qPRDHIMtRUtdzSOrz2PnK1+9JApJMPnPD8YWL7Ab0e
 XtLF23gJNrgOGcUI3uv+iIY=
X-Google-Smtp-Source: AGHT+IGIlU1Yn7/kB1E7COXffS4A0viPPNxDsm2Sy9eIJpzjgaY4wT4v1Sp4ujehIZ32Tq+A/5SMWA==
X-Received: by 2002:a17:906:32ca:b0:aa5:3853:553e with SMTP id
 a640c23a62f3a-aa6018d89dcmr52540966b.47.1733236769871; 
 Tue, 03 Dec 2024 06:39:29 -0800 (PST)
Received: from localhost.localdomain (p5492bafd.dip0.t-ipconnect.de.
 [84.146.186.253]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59990a848sm623829466b.150.2024.12.03.06.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 06:39:29 -0800 (PST)
From: Jannik Becher <becher.jannik@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jannik Becher <becher.jannik@gmail.com>
Date: Tue,  3 Dec 2024 15:39:21 +0100
Message-ID: <20241203143921.32446-2-becher.jannik@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203143921.32446-1-becher.jannik@gmail.com>
References: <20241203143921.32446-1-becher.jannik@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733236770; x=1733841570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AHTdLeVGr/yTp3uwzh4qFDtGV/xIyEFNO44EMiei9DU=;
 b=I/rRXsk5pYIE2eF71vpR82tROicOR8moF04S+onX2qaUsR9s42qNPGZWBSvq3JbE6/
 gwg45PcFl1yc/SJk8wfLzZpEjhtWoPpm9Sqk6/SPBAm6w+a46lYXmdeIbQbBx6sSYuUa
 Ko888ODwjzZ9sj/bifYqTmiDQNpjKhbtI/uBVmcFPm3wf4vUS0+aQbkH8dsVl66R7ZNq
 hrk5x2HiyfsU5kynvMxrxv8tih3d0PtBydOR7M2F4kRK5PMzClzRN+0yEOsElx1lGcck
 XYkQrwOv2RB6iysRiXrELrwswoV6Y8V6I+k84GlWXWFNgh/H4HVFGju/keofDTouaHa3
 WA0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I/rRXsk5
Subject: [Buildroot] [PATCH 2/2] package/igh-ethercat: add configuration
 options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add configuration options and description for EtherCAT userlib, clitool,
tty and additional drivers.

Signed-off-by: Jannik Becher <becher.jannik@gmail.com>
---
 package/igh-ethercat/Config.in       | 78 ++++++++++++++++++++++++++--
 package/igh-ethercat/igh-ethercat.mk | 15 ++++--
 2 files changed, 85 insertions(+), 8 deletions(-)

diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index e600ef5fcd..21eca46c80 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -11,19 +11,87 @@ config BR2_PACKAGE_IGH_ETHERCAT
 
 if BR2_PACKAGE_IGH_ETHERCAT
 
+config BR2_PACKAGE_IGH_ETHERCAT_CLITOOL
+	bool "Enable CLI Tool"
+	help
+	  Enable the EtherCAT Command Line Interface (CLI) tool
+	  for testing and diagnostics.
+	  This requires libstdc++ to be enabled.
+
+config BR2_PACKAGE_IGH_ETHERCAT_USERLIB
+	bool "Enable User Space Library"
+	help
+	  Install the EtherCAT user space library.
+
+config BR2_PACKAGE_IGH_ETHERCAT_TTY
+	bool "Enable TTY Driver"
+	help
+	  Enable the EtherCAT TTY driver for serial communication
+	  support.
+
+config BR2_PACKAGE_IGH_ETHERCAT_GENERIC
+	bool "Enable Generic Driver"
+	help
+	  Enable the generic EtherCAT master driver.
+
 config BR2_PACKAGE_IGH_ETHERCAT_8139TOO
-	bool "8139too driver"
+	bool "8139too Driver"
+	help
+	  Enable support for Realtek 8139too-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E100
-	bool "e100 driver"
+	bool "e100 Driver"
+	help
+	  Enable support for Intel e100-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E1000
-	bool "e1000 driver"
+	bool "e1000 Driver"
+	help
+	  Enable support for Intel e1000-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E1000E
-	bool "e1000e driver"
+	bool "e1000e Driver"
+	help
+	  Enable support for Intel e1000e-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_GENET
+	bool "genet Driver"
+	help
+	  Enable support for Broadcom GENET-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_IGB
+	bool "igb Driver"
+	help
+	  Enable support for Intel igb-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_IGC
+	bool "igc Driver"
+	help
+	  Enable support for Intel igc-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_R8169
-	bool "r8169 driver"
+	bool "r8169 Driver"
+	help
+	  Enable support for Realtek r8169-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_STMMAC_PCI
+	bool "stmmac-pci Driver"
+	help
+	  Enable support for Synopsys STMMAC PCI-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_STMMAC
+	bool "stmmac Driver"
+	help
+	  Enable support for Synopsys STMMAC-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_DWMAC_INTEL
+	bool "dwmac-intel Driver"
+	help
+	  Enable support for Intel DesignWare MAC-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_CCAT
+	bool "ccat Driver"
+	help
+	  Enable support for CCAT-based EtherCAT driver.
 
 endif
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 0d36b6d725..3e6101b570 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = f5dc109176400f540a8682a2c9ee20d411d14d61
 IGH_ETHERCAT_VERSION = ca66cd6ae9b821bfbec6d68ee1b43da359c5894c
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
@@ -16,12 +15,22 @@ IGH_ETHERCAT_INSTALL_STAGING = YES
 
 IGH_ETHERCAT_CONF_OPTS = \
 	--with-linux-dir=$(LINUX_DIR) \
-	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool) \
+	$(if $(BR2_INSTALL_USERLIB),--enable-userlib,--disable-userlib) \
+	$(if $(BR2_INSTALL_CLITOOL),--enable-tool,--disable-tool) \
+	$(if $(BR2_INSTALL_TTY),--enable-tty,--disable-tty) \
+	$(if $(BR2_PACKAGE_IGH_GENERIC),--enable-generic,--disable-generic) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e) \
-	$(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_GENET),--enable-genet,--disable-genet) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_IGB),--enable-igb,--disable-igb) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_IGC),--enable-igc,--disable-igc) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_STMMAC_PCI),--enable-stmmac-pci,--disable-stmmac-pci) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_STMMAC),--enable-stmmac,--disable-stmmac) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_DWMAC_INTEL),--enable-dwmac-intel,--disable-dwmac-intel) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_CCAT),--enable-ccat,--disable-ccat)
 
 $(eval $(kernel-module))
 $(eval $(autotools-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
