Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ADC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 688E14F317;
	Fri, 28 Mar 2025 18:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnWXYdgfrqyP; Fri, 28 Mar 2025 18:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA324F325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA324F325;
	Fri, 28 Mar 2025 18:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED7491B8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF7E84F2E6
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jA1Fq4rjkv0t for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE3BE4F325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE3BE4F325
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE3BE4F325
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so236865f8f.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185096; x=1743789896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4R8nGU3uItwqCRui2Zk2HFyzKovgFlrQpq4HS5kZrmg=;
 b=VT03Ti9x36g5kVQeQX2/Cf4flgcxnGFNvyRgPidi7VDxBJ76qZXxU4P/HU2RZaoRfO
 WsexjmQqK6PEOMBsGiWki517LhDlt96NBt0lETBR5mkJuXcXZs7BtftvYdb+p4IRvJ2d
 fP50JIFi4UCQYQ+cGvSWbTe86quqGDNP5YTWQA4/iVbNqD83A2gPR41Puq0AnajMX8/3
 34+komQCkO4FTpU7/9binUwrLLhi+XKuMMA0hxT9ieF8UJOKbzbl58BwLDf75/Q747QK
 2eG1K1JgulDjbibindJo/mxlcdj3p2tm+y9oototK1XTEV2NgbgoXVY4NaE3m4zUzBGM
 MLUA==
X-Gm-Message-State: AOJu0Yypfd+qgh6ZiftCxwl4ufVcB0j8nEz6tJk2kmOTfkqf1N6lmhAw
 vMbLddbzi56jmP2YfffciR7I5eaCYtZd+ANAGoWMVjwaT6PBP9Oz383jTtJ4
X-Gm-Gg: ASbGncvAupF53zYTH89Zt9lh0ChTBfUEglA5tdHUc0JyRYkFOHbjjNh9sIDtYv7u/mt
 Jv9DHDKB+f3RRHCw9hdnT3ItMtXLB20fpDDUHiBbYsRDcX0u31yZwE38g2VPuLgm55jUHuuFRGD
 HCIco3+CPbGidHuMikC2Cxc61t/HqZkvkIWicjNXKOeuUGyxtjzZa4S8ncqn9//+1E+T2fwigbn
 TzoP29X+MtDSemuwmp9jx05Z8nXPb5S1vA6kIgIqkTg+wsmTTZThfryMPul/lSfGddLnUq1qvRl
 ySO0mFJOe/o5WGg/pn9VOF9KSSuqvmmQeSD25A==
X-Google-Smtp-Source: AGHT+IFKWAY5+9Q9QOhjL0IshzAcvh5x0Mj5E0Z3vqTnyrWChrCTgUMWgGX9K+SivzxyLBH9h+ofFg==
X-Received: by 2002:a05:600c:1d1b:b0:43b:ca39:a9b8 with SMTP id
 5b1f17b1804b1-43db61d9379mr1276825e9.2.1743185095540; 
 Fri, 28 Mar 2025 11:04:55 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:54 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:21 +0200
Message-ID: <20250328180427.3434693-14-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185096; x=1743789896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4R8nGU3uItwqCRui2Zk2HFyzKovgFlrQpq4HS5kZrmg=;
 b=lSEeYS+J2qG/Kq3CL0aOYgNm53uw1uvyIF6N5zndMWpm/k47mQet/UaRCCOtHzgoxL
 R+JxYnT5vV41ucNFxCeLd6xhnq0bSM6pw1WU6e71nowEZVL0j/tGqzEhawXO6kiOfUkK
 xURrumMLCUQQWKATA/Frvw3omGaYbobi1nyEQX+GDcFu7052kzLXOU7dzJon1HGCQmHX
 iJXtBzc5JAvJFWqBvZ48nntTrZbNlJo+iS/TC3VFXJFdjqb2ZV9qJHxn3lKuCoVKW0K7
 2KZa/0/sqTTnggiJuHG+a3//Oj+rIPQ5qwmYd8P+B7SJZdVn0CPeMjxs8VquJDusTCgC
 CZFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lSEeYS+J
Subject: [Buildroot] [PATCH v2 13/18] package/qoriq-ddr-phy-binary: new
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
as prebuilt binaries by NXP through GitHub.

There have been discussions and other opinions on previous revisions of
the patch on how it should be integrated:
https://lore.kernel.org/buildroot/20250318163228.9989-1-vjardin@free.fr/

But I haven't integrated any of that feedback. It is a simple package
which copies the pre-built FIP image containing DDR PHY firmware files
to the images/ folder, to be used by post-image scripts.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
v1->v2: add one paragraph to the commit message

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
index 44f7684c974c..a1c7f867808e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3369,6 +3369,9 @@ N:	Vivien Didelot <vivien.didelot@gmail.com>
 F:	board/technologic/ts5500/
 F:	configs/ts5500_defconfig
 
+N:	Vladimir Oltean <olteanv@gmail.com>
+F:	package/qoriq-ddr-phy-binary/
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
diff --git a/package/Config.in b/package/Config.in
index d8751fc19f54..b6aecf7d7707 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,6 +448,7 @@ menu "Firmware"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/panel-mipi-dbi-firmware/Config.in"
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
index 000000000000..7a689d42a5ad
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  475bca55d8b05463e75f6d47a8ea7e3def8505a614170b0a3976bd342ca3d759  qoriq-ddr-phy-binary-lf-6.12.3-1.0.0.tar.gz
+sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
new file mode 100644
index 000000000000..5ce990b75b76
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qoriq-ddr-phy-binary
+#
+################################################################################
+
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.3-1.0.0
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
