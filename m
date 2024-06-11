Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C716AC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C78C60B6F;
	Tue, 11 Jun 2024 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwNwFwF3Kugf; Tue, 11 Jun 2024 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A2E60B74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A2E60B74;
	Tue, 11 Jun 2024 18:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F29EB1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E072281F90
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEBR5aJbZVdR for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1C8281F8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C8281F8E
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1C8281F8E
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:52 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7043102dcc1so2837337b3a.2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128851; x=1718733651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwfhN+j5n8bRGH7gx78IZ/xj8p7n0Z5dhJF+BMYmyyM=;
 b=mcPzc/V1r1ncq3kf9FauRbYsdHuekSZSqRtu6/rUsg9psR2AU6qwHvgXo4dMxI77xv
 cmNerR6vpXU+aUfItN1T1YHWsLLEN1kwpv3kw0ZuZjFuws+QGhVcLjcUWUpeOaVSR29+
 SflPdO8D23rC/wGGpNpizl3rei0zNlAGwOpLDgyLvIqEJZIlB8uVBH+jrWofVmCyGaQA
 q0HbnZdPfl/YOekdkgxn3E9OwZD9y2gyu7BWSand+mb5yxW2bNIxGi/uWtLPp4Ta/Uw2
 OWZo6+Jf89a1AA6RnoB3MNj47rdvyFWyjxVMrRyfGHM8iVX8Wj50hovPPql5Qk/9U5PU
 ACiA==
X-Gm-Message-State: AOJu0Yy/qFhxPPvkUS1/MonSsHMg1dp0krmbqMKADl8eDx7h2/aqimVt
 +F7G50yxiEhX7weC8LnTUy7o4Ycu5+h/KjQV8L09In5b2e7QgGht4DBHeA65
X-Google-Smtp-Source: AGHT+IFvPJkGikOs5xn91yA3D2TMsjOWwFhVUKS8CNif90zc/IAL+t93IdFY87F/Ni2RqHze73dSww==
X-Received: by 2002:a05:6a00:218f:b0:6ea:b9ef:f482 with SMTP id
 d2e1a72fcca58-7040c735824mr15824923b3a.24.1718128851406; 
 Tue, 11 Jun 2024 11:00:51 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:50 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:05 -0700
Message-ID: <20240611180007.2127244-11-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128851; x=1718733651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwfhN+j5n8bRGH7gx78IZ/xj8p7n0Z5dhJF+BMYmyyM=;
 b=LweONbV7zdgMdt6FHSdOAvK+40HNFEPyixhnnyll/n+1Nq4bZo6zemmF9L5E/Tmn/8
 CvhuyM1CwPPJ0Iidmqh1M9j+DEVqQtaPtQNPpOvTpe5w8sTcdNpnmfwmO23WebRb4fz3
 vm0RfE/RnvIAQEoji2QlMj5+W/JbsmY/oAtNYy4qsJ8b1BtIeu/amKFdZG++3neXUwNX
 B/l8CNa6FulFmHlgFAr3cLNHncsEP772bMLfYipwNOyx19by9e6FCtpK7UD+wGMewH73
 sJiIplJOZd/HMil87a8XFzu3KeTkVRLjolMo8h0gQhEzKaleKc1nRWerNtIKWx5nQg/3
 Ctkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LweONbV7
Subject: [Buildroot] [PATCH 10/12] package/freescale-imx: add i.MX 8ULP
 support
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

More details on the platform here:

https://www.ezurio.com/system-on-module/nxp-imx8/nitrogen8ulp-som

https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-8-applications-processors/i-mx-8ulp-applications-processor-family:i.MX8ULP

There have been 3 silicon revisions of this processor (A0, A1, A2) and
A2 is the current production version.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/Config.in               | 31 +++++++++++++++++--
 .../freescale-imx/firmware-ele-imx/Config.in  |  3 ++
 package/freescale-imx/firmware-imx/Config.in  |  1 +
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 3211592468..34ce1d1311 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -55,6 +55,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 	bool "imx8mp"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
+	bool "imx8ulp"
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
 
@@ -70,7 +73,28 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 endchoice
 
 choice
-	prompt "i.MX Silicon Revision"
+	prompt "i.MX 8ULP Silicon Revision"
+	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
+	help
+	  Some packages related to the selected i.MX platform need to
+	  know the silicon revision of the platform they will run on.
+
+	  Note - mismatches may result in a failure to boot!
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA0
+	bool "imx8ulpa0"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1
+	bool "imx8ulpa1"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
+	bool "imx8ulpa2"
+
+endchoice
+
+choice
+	prompt "i.MX 93 Silicon Revision"
 	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
 	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 	help
@@ -104,6 +128,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "IMX8ULP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
 	default "IMX91" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 	default "IMX93" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
@@ -130,12 +155,14 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
 	bool
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
index a99cbc3392..e8369f0102 100644
--- a/package/freescale-imx/firmware-ele-imx/Config.in
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -15,6 +15,9 @@ if BR2_PACKAGE_FIRMWARE_ELE_IMX
 
 config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
 	string
+	default "mx8ulpa0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA0
+	default "mx8ulpa1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1
+	default "mx8ulpa2-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
 	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
 	default "mx93a1-ahab-container.img" if \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 63990947c8..4a9986448f 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
 
 config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
 	string
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
