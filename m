Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491D2C3ABA9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 13:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAA0B40484;
	Wed, 30 Apr 2025 13:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSqmi2W1MwiA; Wed, 30 Apr 2025 13:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C33403EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C33403EB;
	Wed, 30 Apr 2025 13:01:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56DEDE4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DCB2608B7
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqGEIDM9nt-Z for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 13:01:54 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=amer.alshanawany@openpixelsystems.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB58E60690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB58E60690
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB58E60690
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 13:01:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so53887285e9.1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 06:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018109; x=1746622909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUCY3IAbBCHPMvYGgmlUj8KRvtmHPlhXYGiuoCFSPys=;
 b=D+k1oDUjuBnItLnqDu8IDCHb5KQVtheIz45msKoRnTi30rpq1EiW9sy65kUMekuRHA
 Njo0LF/mRFIVHHNjKsWvRRjkRGev/+WkNjx5/rqBdGCNq7bKbC26tevMJkZmXdYjLEJP
 ldfkI5dK8HUsEAvbnVqhY+Bnjfrk1CFAr75hLbaFb/cyYWdNpG7hfWU0MqujYdb4AFHr
 6WsGPOPF/58usmqe4tPf49jRw/HaQYHq1d1oSzTD0tDB3MdIkzBTNZ3/fTMEyrn6hI1A
 2kSuyvZhG59VF9Kxg2AlCHRF+Bun/U+M1Xy18aU/a+cR/4yslVOg3gKc5kJ4NVUPksrv
 64xA==
X-Gm-Message-State: AOJu0Yy+Jxe6B8h1HbXRFne1M1Pq24PmgyO4D2SvVwP5J5gR/Ml4vQWZ
 4Wd/fg7VGvlR8dhc7itHEYMmVTSrY2pN7h4s+XCDofPOZVLeJqWKKuMlc5llG0HsgJLYEXEKWEV
 LlmQ=
X-Gm-Gg: ASbGncuMK3DtbTjOsNHBuMx4NocGSQnAyC8Q/2mznLqgg4pq8X9T+PhQfDZF43iuxGP
 MD3rUuMIWvE6kFLjUDof1wUA15sT1SPXLEnjyI1DKMwjkpSNrgsAN/ojI+OlHmwuVajJh0ogWsH
 fUOQPcuTS4PDpc2P8vnCVVkrxtBAAZrYRBuwCZwlVToXv0HrXndir0s874aFcRWBIfyKmpWX7L+
 8w2IJ5ylETp09AewEk8V6pOoB3v3Lw7i8dDd4PveprQg6rSmJbmObusx4ZiJsELO5IJoZGeMBrQ
 Xvdx3rtA2OvOIBbcs/qgsEuje59mOcM+4wMHPy87opYEx2FTH2R0kxYS7iTNnaJwx53RNfe7HMR
 pjvLomi2yt1a1nsiZ3ioj9iK9li5vBuiIukFLAIp4vajbVM2EuIKlexmYWA==
X-Google-Smtp-Source: AGHT+IEtJmm9zli4mQjfBaFYTZYu07H3WQsQmK+AOWnt2VV4OrGcAgq3OrsH1ykOg6bxyP7tThAD7A==
X-Received: by 2002:a05:600c:35d2:b0:43c:fffc:786c with SMTP id
 5b1f17b1804b1-441b1f3ab0fmr23556005e9.19.1746018108760; 
 Wed, 30 Apr 2025 06:01:48 -0700 (PDT)
Received: from ips5-amer.tailda1017.ts.net
 (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46454sm17052344f8f.78.2025.04.30.06.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:48 -0700 (PDT)
From: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
Date: Wed, 30 Apr 2025 15:01:42 +0200
Message-ID: <20250430130142.47069-1-amer.alshanawany@openpixelsystems.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1746018109;
 x=1746622909; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IUCY3IAbBCHPMvYGgmlUj8KRvtmHPlhXYGiuoCFSPys=;
 b=Jgs8R75xPUEdJURWFU+T59ogH3PDStIM2kKEq7t/BJiRZFfFbh83TCK5RS49j7jhgi
 c1rTmUag2jqkUDIvuXp498qUf+vzJdwBF//Y2AI7opNxjAxoI5blpDBFACDMZivh591N
 /pltgrXp/0wLsxRIED6nkg+qkshM9Y4HfqZ4oouZmcFnqQHcE3IMeNLspfpil1wV1B4r
 PzkwJXN33dZ5+vycrAFjzqzHYhO6ilmyzovBAhTqQmnypx6neM13bqbcNBzZwcUQKS1F
 frEfCWCDBNdO2ROFXo0tIgjQvov4QrfI47lYCyLtXvXtkHmg4RZkg7qlqHZgiStGBt9x
 ACew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems-org.20230601.gappssmtp.com
 header.i=@openpixelsystems-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Jgs8R75x
Subject: [Buildroot] [PATCH 1/1] package/uuu: add target support
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

Signed-off-by: Amer Alshanawany <amer.alshanawany@openpixelsystems.org>
---
 package/Config.in     |  1 +
 package/uuu/Config.in | 19 +++++++++++++++++++
 package/uuu/uuu.mk    |  2 ++
 3 files changed, 22 insertions(+)
 create mode 100644 package/uuu/Config.in

diff --git a/package/Config.in b/package/Config.in
index 167965d64b..1730898247 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2809,6 +2809,7 @@ comment "Utilities"
 	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
 	source "package/ttyd/Config.in"
+	source "package/uuu/Config.in"
 	source "package/which/Config.in"
 	source "package/wlr-randr/Config.in"
 	source "package/wtfutil/Config.in"
diff --git a/package/uuu/Config.in b/package/uuu/Config.in
new file mode 100644
index 0000000000..bccb96bb13
--- /dev/null
+++ b/package/uuu/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_UUU
+	bool "uuu"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libuuu
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_TINYXML2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZSTD
+	help
+	  UUU (Universal Update Utility) is Freescale/NXP I.MX Chip
+	  image deploy tool. UUU is an evolution of MFGTools
+	  (aka MFGTools v3).
+
+	  https://github.com/nxp-imx/mfgtools
+
+comment "uuu needs a toolchain w/ C++, wchar"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 4683cbeec1..9c27c4c1d6 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -9,6 +9,7 @@ UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE
+UUU_DEPENDENCIES = bzip2 libusb openssl tinyxml2 zlib zstd
 HOST_UUU_DEPENDENCIES = \
 	host-bzip2 \
 	host-libusb \
@@ -17,4 +18,5 @@ HOST_UUU_DEPENDENCIES = \
 	host-zlib \
 	host-zstd
 
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
