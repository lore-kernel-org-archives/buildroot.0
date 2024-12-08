Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A980E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DEBC406FA;
	Sun,  8 Dec 2024 14:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2wLW16imziL; Sun,  8 Dec 2024 14:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E154E406E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E154E406E9;
	Sun,  8 Dec 2024 14:38:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6E546F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70FF340A47
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id turjf5s7qMRl for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA62540A45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA62540A45
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA62540A45
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:28 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa625782fb1so61117366b.0
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668706; x=1734273506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPiXM8sWrisDYwtE8IZ8uPlmppXlU2Alv0k7FW2+owI=;
 b=JiYv0nqRUzB4ri/jP/BNBkuICI1OaTNtSsr0thZiobVPMrWF6hHDlSYCUKUCrDFU91
 AJVggRkr8LVL1n1ullgNDcUyV7ZjgjSeywezuTOW5uTLesrUYylJHLWJMwS75ApB3/3p
 s9Z/0uC7cVGtZVXYe3srLwhpzBSfOwUItjNGj/HdnapL+C68py2nZIEuP6agqqg6ioSQ
 oKX3CwtFKU9ZIfxusj+P4UUOoZiYMBRCXfcgXhivL913LB1r3aQq77xP0U1x0Kzj5+s+
 qt8oFmUCQS4sGYg3HjcHN4zP9dj/awgON1vp7QnopwGi1cYLoBTzSmuT2O1GJw0IZPTR
 QfsQ==
X-Gm-Message-State: AOJu0YzyOc6WEslhCrOCdBoEMOWRfYSfmay1/kjT/l90Weq3gvn3BYWh
 1G9pBdG5AfovEw8TB2FBGAbHo4h9YXBdVAqFT+zhiUuPf6F1kicesDevZw==
X-Gm-Gg: ASbGnctVcrbm9SNaCdY185Bfi4K654nl7AevKKPO/7k50irKpl27d/F1mh0SqwcBo/T
 sBV06fgHTvzwXhaMZXIjzZbNy9diT89v9tMY8U7vpB1B3sT5VfKpKTUgRoQ3TP77ZtkZVYWDzbM
 uMWnbfn4ZlAUA/jnwbaZZL+waFDOiaFgc9sfgOo6sxrD60BLP3SkvZiPIGBs/5dejpNRmpEnMAr
 woQNHhxiOcxehrBq3g35DZmJVkA41B3wwLmSEZ1YJ0=
X-Google-Smtp-Source: AGHT+IGgAn09ehqBX6hervsHgQSqt7mXYIxtdm4enP44fTSH6hTNGlcUCahIFpGegYdSg+AbhmHETQ==
X-Received: by 2002:a17:907:7205:b0:a9e:574e:1aef with SMTP id
 a640c23a62f3a-aa63a02555cmr351956666b.2.1733668706035; 
 Sun, 08 Dec 2024 06:38:26 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:25 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:53 +0200
Message-ID: <20241208143802.1048266-3-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668706; x=1734273506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPiXM8sWrisDYwtE8IZ8uPlmppXlU2Alv0k7FW2+owI=;
 b=fCbHkk8VM27HVJiYI3+DkDK6rzPd/1YgCI+dwc89SlXnLLxJKTVSI1S+3eiygYwj0l
 yN5r76v8V60sGY8CS5p2E0STtjTr0zwZ3Wjx3RPx9orqDzx93ntjs2cNUoLV9fJOEfs8
 TLwvqyekh1xQ1XcCJ+zDet9OBbUJ+Kmx9SIe6+cicg4M0eLd6ADu4e/kDXMUuLlK9Qru
 AxHLFWeMSRREoPxXZprjtr7kW2mh8ttOtzKbCK1kk0z4eHifp7bqpXWdpRxdHMrVIZxr
 BhryK7dmfOFMA9zWyYLsgVv3BwLB+ObCUhOnY0suG8IsxUZ00r7lmVdWWy/MzFiG2wYn
 jw+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fCbHkk8V
Subject: [Buildroot] [PATCH v2 02/11] package/qoriq-ddr-phy-binary: new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
as prebuilt binaries by NXP through GitHub.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: none

 DEVELOPERS                                     |  3 +++
 package/Config.in                              |  1 +
 package/qoriq-ddr-phy-binary/Config.in         |  6 ++++++
 .../qoriq-ddr-phy-binary.hash                  |  3 +++
 .../qoriq-ddr-phy-binary.mk                    | 18 ++++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/qoriq-ddr-phy-binary/Config.in
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index aedd73677257..0260fc52e4e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3301,6 +3301,9 @@ N:	Vivien Didelot <vivien.didelot@gmail.com>
 F:	board/technologic/ts5500/
 F:	configs/ts5500_defconfig
 
+N:	Vladimir Oltean <olteanv@gmail.com>
+F:	package/qoriq-ddr-phy-binary/
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e0208f..53e3170ea0f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,6 +454,7 @@ menu "Firmware"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
+	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
diff --git a/package/qoriq-ddr-phy-binary/Config.in b/package/qoriq-ddr-phy-binary/Config.in
new file mode 100644
index 000000000000..301a2c197421
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_QORIQ_DDR_PHY_BINARY
+	bool "qoriq-ddr-phy-binary"
+	help
+	  Firmware binary for DDR PHY of NXP LX2160A family of SoCs.
+
+	  https://github.com/nxp-qoriq/ddr-phy-binary
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
new file mode 100644
index 000000000000..7357e741fcfa
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b49cb34f941f7e534ec31d3d14d18d4e565e4875b690ecb0d7e2992b72c64dc7  qoriq-ddr-phy-binary-lf-6.6.36-2.1.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
new file mode 100644
index 000000000000..ab25ff541d9c
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qoriq-ddr-phy-binary
+#
+################################################################################
+
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.6.36-2.1.0
+QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
+QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
+QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
+QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES = YES
+QORIQ_DDR_PHY_BINARY_INSTALL_TARGET = NO
+
+define QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/lx2160a/fip_ddr.bin $(BINARIES_DIR)/fip_ddr.bin
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
