Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D3FE7716E
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 15:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C006085B;
	Wed,  4 Dec 2024 15:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2i8774YnOPMe; Wed,  4 Dec 2024 15:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C674E60B51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C674E60B51;
	Wed,  4 Dec 2024 15:53:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73631D8F
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 15:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 543A14031D
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 15:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvmT33KZd3Va for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 15:53:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=becher.jannik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 075B940305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 075B940305
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 075B940305
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 15:53:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d0d71d7f00so7094155a12.3
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 07:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733327629; x=1733932429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mQwb5txUSxp3E60PYG2Lhcsz4xshvhgCiKsWyqd/2U=;
 b=CVXfSaLmvMloHPtxYSD48xVeYEPtmq7PFqeOXpFtb55JvZwAKbW58Knfa72yw2yaxu
 Xgi70HLQCTjp3nuVcMn08ubTPWs8wkTRrSMO7b7kK3H/KEr7zEdpFv9zEJzKhSe4qR4P
 lc4CEGpnpSrkfEqvWv2r6N+NRd3IU98lj7nPtT8t/bzSqD0DpYyZLNstziOIWd9iEIiw
 o71J0FcXUTd4OhbYyHjxbPZBDvaPq2iACrWV2AmMNypl9kQM89jt9AQ3LXn/vAlID/cN
 ZG0QG1rS5lrYrdt40LZ0VdbwbOLczDOxDXOLsZNEK9RmGmW5M7bea/or59It1Qxi+d8p
 bazQ==
X-Gm-Message-State: AOJu0Yyag+8Vg7cDqCv5OBhQP9SESv8d3ZAtZdDBogfsftmxJeT95JWU
 Bvkz8lv51TIHOGpAQiO62vrbZ3eYPvCKE19992JIRCi+f911329MBogWhNiqzjo=
X-Gm-Gg: ASbGncsgK/1UmxOCHLii8l3WRIJMYPuXftIUw8bVBAocXyhAbdGsTr1lSJvttXoVaCh
 8IzfbapLHlsUSGrD1lQ/ktmGwKnd0+u7NMWCefqE6iK++AErXIJSMtYnXQUrQvm3Esvp8VpWLrw
 /DyQ29PBZL4tPQ81oUgFNjMw+g9/xK83LsfLM/LMfU9HnMBoYitdFmTvY4YugQA/pR2ULv9XPMB
 NakN9Zk4g3QfX5T8UgV94caHNz9DoNjMpSYWByv0hIresAR0/D5Jk8BxUXgtuQ1SIZW83wdZARn
 rrhSiO5Tmo6iNH2AtgSzy5w=
X-Google-Smtp-Source: AGHT+IGb5Mbz7yHKwEYbPcy/duAV2yArjhSPcQB4KS3lvmp0n6+/c0yFpTXoi9IVchPBap45lozsXQ==
X-Received: by 2002:a17:906:2182:b0:aa6:19f3:d083 with SMTP id
 a640c23a62f3a-aa619f3d189mr69105266b.30.1733327628616; 
 Wed, 04 Dec 2024 07:53:48 -0800 (PST)
Received: from localhost.localdomain (p5492bafd.dip0.t-ipconnect.de.
 [84.146.186.253]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996de782sm743518866b.56.2024.12.04.07.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 07:53:48 -0800 (PST)
From: Jannik Becher <becher.jannik@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, Jannik Becher <becher.jannik@gmail.com>
Date: Wed,  4 Dec 2024 16:53:42 +0100
Message-ID: <20241204155342.185278-2-becher.jannik@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204155342.185278-1-becher.jannik@gmail.com>
References: <20241204155342.185278-1-becher.jannik@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733327629; x=1733932429; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0mQwb5txUSxp3E60PYG2Lhcsz4xshvhgCiKsWyqd/2U=;
 b=bNJWGxYA3oevy1lYBvmAcZXNWiPTzzRGYOtw0nwHu4pkZfcRB436oDvV4eEa37cxtU
 Q6rFMHDHCv86kvhFspqDjFJGZ94NY0hi8f59l9YQWaTtYzJ/G5NDAwdEjfYAuVFtGm3M
 lPbkcI2/mihh+bH6sr9qNLQ7wGkA/y2rRAD44L1Ez0tAbl+yrEkgvrvQkLMT8SuPXsHA
 HQKXLFBxBd0WFBJ8kAmILXOcFOzEA4RvH0WUT27GuffIKxD9nM3omfwJ549KLmTSHHOJ
 EroOWNDploaqy/0jVeybJeQRzxiaiDTsvD24+Bj4YeFHayArelqPp7GlZwB1Af7hsC0W
 nokg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bNJWGxYA
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

Add configuration options and description for EtherAT userlib, clitool,
tty and additional drivers.

Signed-off-by: Jannik Becher <becher.jannik@gmail.com>
---
 package/igh-ethercat/Config.in       | 77 ++++++++++++++++++++++++++--
 package/igh-ethercat/igh-ethercat.mk | 14 ++++-
 2 files changed, 84 insertions(+), 7 deletions(-)

diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index e600ef5fcd..49be9d13bc 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -11,19 +11,86 @@ config BR2_PACKAGE_IGH_ETHERCAT
 
 if BR2_PACKAGE_IGH_ETHERCAT
 
+config BR2_PACKAGE_IGH_ETHERCAT_CLITOOL
+	bool "Enable CLI Tool"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Enable the EtherCAT CLI tool for testing and diagnostics.
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
+	  Enable Realtek 8139too-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E100
-	bool "e100 driver"
+	bool "e100 Driver"
+	help
+	  Enable Intel e100-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E1000
-	bool "e1000 driver"
+	bool "e1000 Driver"
+	help
+	  Enable Intel e1000-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_E1000E
-	bool "e1000e driver"
+	bool "e1000e Driver"
+	help
+	  Enable Intel e1000e-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_GENET
+	bool "genet Driver"
+	help
+	  Enable Broadcom GENET-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_IGB
+	bool "igb Driver"
+	help
+	  Enable Intel igb-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_IGC
+	bool "igc Driver"
+	help
+	  Enable Intel igc-based EtherCAT driver.
 
 config BR2_PACKAGE_IGH_ETHERCAT_R8169
-	bool "r8169 driver"
+	bool "r8169 Driver"
+	help
+	  Enable Realtek r8169-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_STMMAC_PCI
+	bool "stmmac-pci Driver"
+	help
+	  Enable Synopsys STMMAC PCI-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_STMMAC
+	bool "stmmac Driver"
+	help
+	  Enable Synopsys STMMAC-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_DWMAC_INTEL
+	bool "dwmac-intel Driver"
+	help
+	  Enable Intel DesignWare MAC-based EtherCAT driver.
+
+config BR2_PACKAGE_IGH_ETHERCAT_CCAT
+	bool "ccat Driver"
+	help
+	  Enable CCAT-based EtherCAT driver.
 
 endif
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 374f8891e5..0fcba65cf5 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -15,12 +15,22 @@ IGH_ETHERCAT_INSTALL_STAGING = YES
 
 IGH_ETHERCAT_CONF_OPTS = \
 	--with-linux-dir=$(LINUX_DIR) \
-	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_USERLIB),--enable-userlib,--disable-userlib) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_CLITOOL),--enable-tool,--disable-tool) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_TTY),--enable-tty,--disable-tty) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_GENERIC),--enable-generic,--disable-generic) \
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
