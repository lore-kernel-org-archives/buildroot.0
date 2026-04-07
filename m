Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739CCFB519E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 07:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26DFD4083C;
	Tue,  7 Apr 2026 07:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFfkkc4IC7vf; Tue,  7 Apr 2026 07:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 353F440A77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775545455;
	bh=1SkCXU2Nt1yLILrSER78r81PBDayM+vecUzNGLlvdRg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c9Kssdhz42O7fywU3TjsCV6/UDpm0C8Oqr7+iaNKC2YgtZKdmUnflSmE1GxvP1Ufp
	 +V5Z0RaDXd9UeUeexP0bGLguXQx1VdPQ5p23JbzzbKisCMYOXa4e7bpus99C0mljWi
	 gVLPRAJD4SmBbDW6zDw3B9LxU1eohTmTWls7x3HFUExEIO6zDhCrDDAacZdF5k4oVD
	 dSEamvSKfg304K1T/f++JPuL7Pi3my8kzD/UZNevumKYQDYPCD+bzDa3isM+9lgfVN
	 3RYN/H1v4QALodnUai75BXFgyHsZxAuV9UiUrDB2zgXQj6JGv25GPFrIvuDUhuwe8C
	 QTvgyop0jbJ6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 353F440A77;
	Tue,  7 Apr 2026 07:04:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3641F6
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 07:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8030B810FE
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 07:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ltIpBethHj6 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 07:04:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D98C810F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D98C810F7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D98C810F7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 07:04:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso25964745e9.3
 for <buildroot@buildroot.org>; Tue, 07 Apr 2026 00:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775545450; x=1776150250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9m2yEr4AGDcL6HF1c1Zq0Bfl6f3R4KF3xABRsEr8rFg=;
 b=HRR47bFDMe48hSr4w1GHhl5sIM0NyURioE4zcV4PArtQEga88rf7WGH3VugdGoljUA
 mHBcX9SZRpdzFQhP5Y+IVNEWtlUUx90DzxoZho3novXV+dRUhbXGsLUSZuHARafU95Ja
 PkuDULzGEwCgF8ZbrgrrNLProEjdvk9Br9yUMgiZP+XCvDhPS2nP/oztlt6FLt0ctGOg
 FVBjaJ3YLOKtSJNQe/Xgmaq/593N/06pq+X0Ly8E08nzvqoPXIj+oFIMfnbJQfIpA/ie
 U9Zs6lIDsJveBeZCFOMYLxc8rI6hsb2WO5EzxDluS7QmqJU77VCxtzMmxayhZbr4FOWk
 zIpQ==
X-Gm-Message-State: AOJu0YyFfzi5y+X5pdlaBVB/zwhK08wauDA5PTSZrM9Qm878/0vOA0UC
 Z8+CMYz4lshthcw7oDlMvJZECAl9LbrpxkgKxnl8DyKmp4DYpkhClb6JoqUHydkDBWsG9xXf7Ft
 u0s4L
X-Gm-Gg: AeBDiev5ekTyAWCyC+9AsCLHnv0bzgQSN1JbKX4sGIfV8FvqbfFgoRoGT+VWDzhJT7e
 T1E0Pmbw+cJjeWYSTGWVccJ6KqEOuHnmafMOXrHlSsJEWZ7GbldO4kFoyL+RiwhzYmykz8bMzXS
 qusq1yTwGQybiLsficPDicz6t3n4QETqDqsHp3smYasC733HFh0/x+988kQ5FQ5pllTjwUmoy1S
 aTtOmQjWeT1sUi6Cm3+dKAUxKiVU2XIqyUitXO0utdWvptuZOYeBi4CayHoaOIh8+Xc1a9F6LRL
 yhLUC9BPIA4WDZ4zR3ynZzkMYQgcc4MCy6RgWI3H+b60qlK0xeYsHWhSy9jpGvCZX3bSfLSmEms
 0bp77/FfrwDbuca5Tpf2keipW2nv6C2Plxc3rjzBnhSFpdOkKTC8TizAr9WRa9W+QXM7eQ8vjrg
 JLMPrwW9YXo5I0dy8iFAZ66v52b0o4Kw+asn8BSge+/LZbC0hcp+PrmFaXupKW2PM6BQY2ITS3L
 SWbqhH4VLGMVXQyct8dtNzqKaXgnPENiK9J4psFMfoEZwLZRbRWdDxCATJOM1qVAsSZjhQDWedg
 e08exOF9YlDrc6OHL1G4HdCN
X-Received: by 2002:a05:600c:4ec7:b0:485:30f7:6e88 with SMTP id
 5b1f17b1804b1-488997ed834mr214926985e9.31.1775545449627; 
 Tue, 07 Apr 2026 00:04:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e9630ddsm540058105e9.13.2026.04.07.00.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 00:04:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  7 Apr 2026 09:04:01 +0200
Message-ID: <20260407070401.322480-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775545450; x=1776150250;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9m2yEr4AGDcL6HF1c1Zq0Bfl6f3R4KF3xABRsEr8rFg=;
 b=rzRv5YlECJ3ku3/zbLiUf8zVQw3RX3TxO2AL8rpjB8XXUlM3xemh4v+dr5AnNeegv9
 KGFAoywsnX36WIiXxOKFPcTrFI+BxXfeSDK/LPrkmWkWUJYI8yt47EsPU90BDhlIRQ3Y
 vo9RvcefbqmNPQrJh4LngNZ/dvC1cJThSr1Xg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rzRv5YlE
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2026.04
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
https://lists.denx.de/pipermail/u-boot/2026-April/614160.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2026.01...v2026.04

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3331b81e8c6c..2d2c3f9d4154 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2026.01"
+	bool "2026.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2026.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -368,7 +368,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.01/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.04/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 39b894fe9ab6..691649825605 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
