Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE677FD5F97
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 08:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9707D40EC6;
	Wed,  8 Apr 2026 08:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UP4ADw9QDi4; Wed,  8 Apr 2026 08:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6827C40F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775637211;
	bh=lOVTW4So2Bz/fUsvyi7lVos6D5ukeDW4ogOQVVp6x9Y=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B1u4U2joOU+cwXAHoTYwTUJc11/F/44VwQ7+JTSfOk5jrSgAbz6QzKaaGDzAMEIhT
	 +fqABlAdMFP3OroY0r59XUrOPIth8XI0UGszUGyhTWxjkV9lwDpCAlGn8NJxYNyn1r
	 RxpML7vW6Q3j7Cnubr/ciFWLNDGXBRdcWoTEML9XMpvqzJAy6vDhelZsuGHf4o5e2L
	 lKoHdCE68tjIpIk3DrmRdqy0+HqVGvVBE1Knj1ey1aB99gCwWJNpGB0XbQ+IjekcaA
	 z9FtNt//zbe081gQyKMDIEPu2Svm72k11OsU1bxYU2r3nNkvYh0WtDWeJeiCJ66kcW
	 Ev8P6gODArvJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6827C40F3A;
	Wed,  8 Apr 2026 08:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D19751F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7CDB40F3A
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mo2fJtvI1hoW for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 08:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=bisson.gary@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8619C40EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8619C40EC6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8619C40EC6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:33:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488a4bc360bso21548155e9.0
 for <buildroot@buildroot.org>; Wed, 08 Apr 2026 01:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775637206; x=1776242006;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SapEA9qC91LmT2uKo9GelrRuoTaLNPPCPfDfJRe7nA=;
 b=BTviHw3VfwpsnEQMlPfdzQYLqNfxiMv/hULtEyklYfv7XJuwj1fz1zwEAU8BjPjAPH
 LMAhvp8r7NrPhattTSnat7jPQpkWOB6NMQpzKIQcetLC3Ej3Q8eZkfRumzJcEAyF6bZX
 2XUeq3CaWombJpWbX2B9sn501isXI6Kx0w/Vaqiqs7S3hOMZuyIP0AijQgJyMly7xzUu
 Ygx8xqDIaRIGY31uQ2lj+YT+bW8yvHybeq/h/gpoXDzQ1JojuqzWcZrPaK8TYvWf46Mt
 1tdOwouB/4zyqcbGMarSI9W8sjoNPk7ezZepEsHb0iQF4MCIpMtOVQmrzFOAXPT9uNLr
 NAZA==
X-Gm-Message-State: AOJu0Ywl2kPMuc5FAd46Se8xUtiVj97dAeiSWh4DZsUAYl43+l6wsqMB
 BKd8jwTbY73NYlvAtsAVI//MfLN3C0endiEeZBI13cQ2OlZJEpylllP+SGc6TVJR
X-Gm-Gg: AeBDietweW121xVaf7VEPw/is7Rk9X+aUFrwWRTQHtpRUBItswF0Az5Y7dLSo6NVra6
 iBvYuBejW8NcWxyMc/9cpbplSF3r2DkbBzwxxIkPTe1DST8RX2LGKK/oZdQWLeCLjhZzgniMR+W
 PF1VOPd7xmUiZ5JzTOB9ghtJPFADJeq/WBd/gU8GbWjp3rqiPdpB66I+ljsSPe29dEIqW3Ge+kI
 vvf8VJvcbUhz+myLSBfqU2Hkuqrf6wpjWvfXdqCEdrDFtOypK2ui8fVSSWL4ljpxzWiT3mmKSor
 0zu92gY0iK0JLaOxfRABi6bA1dU9FzRTr6Pw8MKAYXt4uGzaUxU6AHVkiVRwT9i9xVp0HCupk+j
 OkuB7NvLKfNDaat1AhJXDVkJ3TTczUTAZtF7sfI7Ysr2sGKnZXDr69lsbXywDn8CUxl+5AubnK8
 ZkaLZW1/gDqyVZGBW+1SHgtarl0qM2ZT3sM69MT7h8g3BwnKmMLg==
X-Received: by 2002:a05:600c:6986:b0:485:445a:87d1 with SMTP id
 5b1f17b1804b1-488996ecae3mr255251855e9.8.1775637206111; 
 Wed, 08 Apr 2026 01:33:26 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:3201:3d10:c096:de35:9848:47c9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5db2ba8sm12567845e9.24.2026.04.08.01.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 01:33:25 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 08 Apr 2026 10:33:14 +0200
MIME-Version: 1.0
Message-Id: <20260408-nitrogenfix-v1-1-fc4471caaff2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMkS1mkC/x2MQQqAIBAAvyJ7TrA0ib4SHaxW24uGRgTi31s6z
 sBMhYKZsMAsKmR8qFCKDH0nYD9dDCjpYIZBDVYZNclId04Bo6dXGqeNthu60Svg4srI+r8ta2s
 fE4HGU10AAAA=
X-Change-ID: 20260408-nitrogenfix-4a3436bea5f0
To: buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775637205; l=5705;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=yfwPt1TNs5FKp2Mq/DHVCdESvZor3tl8e/ROX3bVvT8=;
 b=+jxi037asUer8ONV/t77hLwSgU5KDi4/iQ1ui4YBVTUWvgtjXrBTZmQ16hOVAHbB088MwXq3O
 XMSfcnk6nJ9CU6yXLGfsedtATxrsdqH30A7bwx5qMdWnD0iD/2lTCyF
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775637206; x=1776242006; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3SapEA9qC91LmT2uKo9GelrRuoTaLNPPCPfDfJRe7nA=;
 b=Yk8EXwNlTdjxx8Tx3xmfq1P/CyuiGa1RwNCvRUjMyRmCsGWnjSiHfVeUvnbnT5gT8T
 Ui4dfTzwE6LA90KUtCeFQhuoDO9Qe0Rla3gxJDjPwEgijpjZjrKYI6Gn9OQMYndC2U5l
 XjLduLA05aoOI/HdEoPJeQCvW+uGV7VQ9rI/xlCVYnO9paHiTJP1Zj1IVErquSh0p/1c
 fjTljAw85rXK8EkXXkmLWTcku4YP/jfJ4o/T01WTxWc4lBmVsYCzVfT5Po8TFMO0+fTo
 UY0uuN/VHePY6oHtycAXfXH3QTmjC0z+bK/affPEJaoCKayqHHminue7eDFRMt+W3now
 YxzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Yk8EXwNl
Subject: [Buildroot] [PATCH] configs/nitrogen*: bump u-boot revision
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

- update nitrogen8mp SMARC rev2 support
- update LPDDR4 init to match latest NXP spreadsheet
- update binman support for newer python versions

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764611
- https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764638
- https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764687
- https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764734

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen6sx_defconfig | 2 +-
 configs/nitrogen6x_defconfig  | 2 +-
 configs/nitrogen7_defconfig   | 2 +-
 configs/nitrogen8m_defconfig  | 2 +-
 configs/nitrogen8mm_defconfig | 2 +-
 configs/nitrogen8mn_defconfig | 2 +-
 configs/nitrogen8mp_defconfig | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 03103567e9..5aa7465720 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/ea37a18c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 4d5408a474..bd108f24d6 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/ea37a18c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 65aff36860..b3de6b758a 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/ea37a18c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 9a90cdae54..4c2cd5a258 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -26,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/ea37a18c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8m"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index db4af070a8..4f80c781a6 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -26,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/ea37a18c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mm_2g"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index dc54d24008..38c244019e 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -26,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/ea37a18c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8_nano_8mn1gr0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 72884d97fd..482603c2b3 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -26,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/ea37a18c.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mp_2gr0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

---
base-commit: 52ee2f5644da5389634b2465f1dc31deb5a4807c
change-id: 20260408-nitrogenfix-4a3436bea5f0

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
