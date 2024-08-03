Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D2EC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 15:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2211940112;
	Sat,  3 Aug 2024 15:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNnbZNnAB23x; Sat,  3 Aug 2024 15:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C3D9402E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C3D9402E8;
	Sat,  3 Aug 2024 15:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB991BF3B8
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 15:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F3160675
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 15:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdfmsoaTRtOc for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 15:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D3576066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D3576066E
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D3576066E
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 15:55:32 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so1158260566b.2
 for <buildroot@buildroot.org>; Sat, 03 Aug 2024 08:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722700530; x=1723305330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxStaPn1iiCg5LHSxLFyUHT5xaRzvGCEApRpEx+9i50=;
 b=LDOOrWNN7lyatf4cxDMfYvWo/oejYHEOxc3II4kSkGKofo/1o5qE8uIv5asHWrXGj+
 hGnXRW5kyQeO5tk8/HA22oJj4Cp8jkGnqgsQ8FALxU4Bcbx0f5iwu9/oQp9rUVo+PDWg
 58ErGXOwgpNmd8aC3ZXErX1dYs1Q/BuDnPenrIq80XFgs1hMxFrkTgor61XuxiFUaXCz
 MintKGAHaGRfaQGtnDZw84KMrPuA+eq7J0yAi9KGV2XHA0F2Fc4EoM4xqAHm5E6W0SZ/
 xO/YBaTbN0R+pCQivMgNKKKIe2+ratyUL5pclEgur6JZUYzPN3IYMu6c0I/Iyc1YlpK6
 MynQ==
X-Gm-Message-State: AOJu0Yzd+kCORhAVdfcQwrPCX44PIVu7LhDTLOx9c+oPYX0jrzbFW9Gn
 THiOH+3PlkfbX/6/N0PJthcy904iAGrhqCBwaf/c4KD2/VDmaWDKm52SMJKpsSbV/t7d+QjudiH
 y
X-Google-Smtp-Source: AGHT+IEV5GSFmQGoageU118/QRYpXdYnSPcmspwFsts3ePKgntqAxEfxmmGPQZly03iML8CqNA+x1w==
X-Received: by 2002:a17:907:9451:b0:a7d:a031:7bb8 with SMTP id
 a640c23a62f3a-a7dc4e4ae82mr471742166b.20.1722700530331; 
 Sat, 03 Aug 2024 08:55:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-17-93-104.retail.telecomitalia.it. [79.17.93.104])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc9db6sm228584966b.8.2024.08.03.08.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 08:55:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 17:55:15 +0200
Message-ID: <20240803155517.3499273-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1722700530; x=1723305330;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxStaPn1iiCg5LHSxLFyUHT5xaRzvGCEApRpEx+9i50=;
 b=Cs1X4/JT2K0qSWJ37RGRxjYdiwZX11BXt51V1L3y/iltbzurnSQBGhwlPs7P+Ae3n6
 4mlEsVLTwhc80IuPjqIjKWZOMs8sf0BzqMyfWkS2eUL75Azz9qSVNau8Ey8Kq52d9jfa
 k5KrxVlzgEWjnPYqNAZJTu4Sh6kHB4KJUfgBo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Cs1X4/JT
Subject: [Buildroot] [PATCH 1/3] package/tinit: new package
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
Cc: linux-amarula@amarulasolutions.com, Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package contains a Linux init script suitable for resource-limited
systems which can be used as an alternative to the one provided by
Busybox.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/tinit/Config.in  |  9 +++++++++
 package/tinit/tinit.hash |  3 +++
 package/tinit/tinit.mk   | 17 +++++++++++++++++
 system/Config.in         |  5 +++++
 6 files changed, 36 insertions(+)
 create mode 100644 package/tinit/Config.in
 create mode 100644 package/tinit/tinit.hash
 create mode 100644 package/tinit/tinit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 68729f721b6f..5fef1fd3da2f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -797,6 +797,7 @@ F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/sscep/
+F:	package/tinit/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index e21987717f16..818d96e3b1b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2866,6 +2866,7 @@ menu "System tools"
 	source "package/tar/Config.in"
 	source "package/tealdeer/Config.in"
 	source "package/thermald/Config.in"
+	source "package/tinit/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
diff --git a/package/tinit/Config.in b/package/tinit/Config.in
new file mode 100644
index 000000000000..e711b37e89f0
--- /dev/null
+++ b/package/tinit/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TINIT
+	bool "tinit"
+	depends on BR2_INIT_TINIT
+	help
+	  A Linux tiny initialization script suitable for resource
+	  limited systems, which can be used as an alternative to the
+	  one provided by Busybox.
+
+	  https://github.com/passgat/tinit
diff --git a/package/tinit/tinit.hash b/package/tinit/tinit.hash
new file mode 100644
index 000000000000..e8c6d1386277
--- /dev/null
+++ b/package/tinit/tinit.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  27cc4dbbd88df00dd98b64cbadf3d1de6062d8a4ea7bc405c445e560c6dd23c1  tinit-0.1.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/tinit/tinit.mk b/package/tinit/tinit.mk
new file mode 100644
index 000000000000..5fa9ad8d2329
--- /dev/null
+++ b/package/tinit/tinit.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# tinit
+#
+################################################################################
+
+TINIT_VERSION = 0.1.0
+TINIT_SITE = $(call github,passgat,tinit,v$(TINIT_VERSION))
+TINIT_LICENSE = GPL-2.0
+TINIT_LICENSE_FILES = LICENSE
+
+define TINIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/init $(TARGET_DIR)/sbin/init
+	(cd $(TARGET_DIR); ln -sf /sbin/init init)
+endef
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index bc0c6eb6bc82..a4543b104769 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -145,6 +145,11 @@ comment "systemd highly recommends Linux >= 4.15"
 	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+config BR2_INIT_TINIT
+	bool "tiny init"
+	select BR2_PACKAGE_TINIT
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+
 config BR2_INIT_NONE
 	bool "None"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
