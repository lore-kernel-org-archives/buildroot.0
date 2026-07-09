Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327EBC44501
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 13:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09E4410C5;
	Thu,  9 Jul 2026 13:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1OySHU-Iig0; Thu,  9 Jul 2026 13:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18BAA410C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783603054;
	bh=u4x7DuYjf3l34+14NbMI/03XGEUP+HITVZuG9smbti0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVB8k2oGptlvgsSsVWIwpDzwHC6WYNaTEO9n7b8sfrGiWnZ7DkIY5IC/9KzDkhrtN
	 NHG9YABsJgi+BQSCka2BtZ5jxPLGSZNa7ozRrKLO5rcF9umab+HxVjAm8NZYs0R7UB
	 WgX81ukARmUCUWdfZtzqud+DAFBy+GyCSGgtlN4bPQJzJOluNJHDErJlrgpWcz7A7p
	 QtrpPr7W6Ef6fDqdm1f+rAN/8mod7N6RpRXPR/7RhsgIihpZXH70sT6CB7hDVuhrlB
	 HHn5Q+lAqLm4zQZKL4EQsCRUm0yXOW5gaQ4uL1SnwmBZ0XwognR6rSu1G8egAWT5MK
	 JRwUmkHjEI6uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18BAA410C0;
	Thu,  9 Jul 2026 13:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D495D2E5
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F7182179
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CHEUmuQQF9O for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 13:17:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EB0882171
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB0882171
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB0882171
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493f140ca8eso2735e9.1
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 06:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783603049; x=1784207849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2sET5MWAJz/xS4WMDTPyszbBcZGyGssf18cMFEl0YlA=;
 b=iAQEno3P0RXMHnyMqM3dCbx/xeJfzO0JQ/BFcIx/uHmD4QYVLJSz7YGquq7ok8VGiS
 2zZEBHLxZYgnWgJhn1kU1+2Y+kY2coLrUlNXvY0QbsrbPNcuXfTScIJeOM0l/CO+wbqv
 1/sUQnikePATYONU1WQdawtciyiJEvz/Mm77WPNFi0GV8LWxUBAIMxoeE1P1P7d/FDAJ
 qP5xAf2aeQMVy/C/RDeuEc4Eljh3GC7ajLAMnSuxBdwX0uWPaWIG7FBQfTR7cMO6sVnQ
 Cimf3VXXF+wiuhnwXGG03YS5dfaJvB67O83AUWfTlPfMovNkeIlDBB6yORlGdeq4X/hm
 Fleg==
X-Gm-Message-State: AOJu0YzB4aecfzK/KZ53YEx7/lzwmi3EZ/Dul22SEhjTMGM+WLDyqqVb
 qA9SqMWenRHNulXcjEJap0PSYqdAqhwm8X2mu+roSByv6IHU0R9X+mee5HQgVfD4Z1+gqaPgqGa
 UiOmrBUk=
X-Gm-Gg: AfdE7cn+VIVvtIb52E+KZRKS93MHDi1SwecYr8Akve+hF/vYo/LwV6ZKOiwZ6yGNHDG
 daX1Btsg34q3yE5RMhI/8x7cWUFwOeb0EtF37JkJOXw36Yso/DYZuVblufYR+Gt64dreI4C2/S2
 K9rfuqzr2QrAAwtkGBu0fv4je0Ag9qySp4IXaQyB2yoJBTuNysrvLBU+2mw7OxQJNG/zmfh7cWB
 Ad8NC/xs+XgyoaJFtl8cnxxzJabcxgnTR3CdkI6i6pbPJm5vKtF1LHJN4yv6q9+Toe0mhZ5HhIM
 dFZXJgi31aBb1aFWF+Neu1GS7hTPFZvOh0AjerwcTzhjQ7BJnuSqeZxX2Rxht4WCURJzyhjMrPv
 qicIR88bmwpynU39H87dvlZ86cWwxwF696FeVsRnxRR1b3mTQ3Mw/7YasVcnREhtL3hlaEi7ahi
 ucaTCdUyQKUjER5jK6WGA/8+6YjAJclY0ia8laToE6TBT+x47iFhjdCzb3FExUR5DFhA7SsBc8N
 pgksN9q27nh3Th4FcJmJTOKAyJz7ZdCD8jYNYLJXevmox2yjphHFpo=
X-Received: by 2002:a05:600c:34c1:b0:492:7083:e5a with SMTP id
 5b1f17b1804b1-493ee0fe824mr22361255e9.31.1783603048990; 
 Thu, 09 Jul 2026 06:17:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6cccfdsm61486195e9.1.2026.07.09.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 06:17:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  9 Jul 2026 15:17:19 +0200
Message-ID: <20260709131720.1250301-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709131720.1250301-1-dario.binacchi@amarulasolutions.com>
References: <20260709131720.1250301-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783603049; x=1784207849;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2sET5MWAJz/xS4WMDTPyszbBcZGyGssf18cMFEl0YlA=;
 b=JlABHTII70fOYxXF6Qpr/GC5Vgnxs6bhgQ+763RSuCdkFqjuFCQ4kbze+jH+LMROBQ
 sS6JX1UbGgpxaEtsHKKdtrE2t7WCYAIbI26yR3emo7ZsLrlK9R5n5WX50ENiOl6dCcYz
 GkUxKIOZWXcb+pzMeWiJDTGYxhi9ieMxUg42c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JlABHTII
Subject: [Buildroot] [PATCH v2 3/3] boot/uboot: bump to version 2026.07
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

Release announcement:
https://lists.denx.de/pipermail/u-boot/2026-July/624082.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2026.04...v2026.07

Select BR2_PACKAGE_HOST_GNUTLS_P11_KIT when U-Boot requires GnuTLS,
since U-Boot 2026.07 adds PKCS#11 support to tools/mkeficapsule.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 boot/uboot/Config.in  | 7 ++++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2d2c3f9d4154..69d4e97e7af9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2026.04"
+	bool "2026.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2026.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -228,6 +228,7 @@ config BR2_TARGET_UBOOT_NEEDS_LZOP
 
 config BR2_TARGET_UBOOT_NEEDS_GNUTLS
 	bool "U-Boot needs gnutls"
+	select BR2_PACKAGE_HOST_GNUTLS_P11_KIT
 	help
 	  Select this option if your U-Boot board configuration
 	  requires gnutls to be available on the host. This is
@@ -368,7 +369,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.04/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.07/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 691649825605..e992835582db 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
