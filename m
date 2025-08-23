Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A44CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 09:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 301E383C4F;
	Sat, 23 Aug 2025 09:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkGiXiyWdIzh; Sat, 23 Aug 2025 09:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8B883C37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8B883C37;
	Sat, 23 Aug 2025 09:33:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D77B271E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1AFC413BC
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_ZVuSBpHXCu for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 09:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B745941351
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B745941351
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B745941351
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:33:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b990.dip0.t-ipconnect.de [84.161.185.144])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47294A4C42BC
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 11:28:03 +0200 (CEST)
Received: from [192.168.1.144] (port=54508 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1upkXa-0000000067h-2Jr8
 for buildroot@buildroot.org; Sat, 23 Aug 2025 09:28:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 11:28:02 +0200
Message-ID: <20250823092802.3760544-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250823092802.3760544-1-bernd@kuhls.net>
References: <20250823092802.3760544-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1755941283;
 bh=bhtih4Wr5vD+UdCGaGN7UK0M1V8dDDkX/Evd6cyxpJk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rxGXN8vUGjTELDPDbn/cRLzdaAviippVka9mzvlymo5JITKHQh5vS7+YegF6JKsAy
 P11wED2N8/tPk9LV8TDnDHY8ZyNDScR56xN2EpYwzSjoCBb14m2BGWobM6+BP4N4/L
 khfaiyOXwCvj+Lv35hfmnKgD93VwTjuCMu7r30QJbiYwekJ+c8Pv2Ti2FNcPTp6DIl
 Ke1HE4Hr19Pn1X/cNeXQiZrJ2W43cHUNfUSKUtIdTJ5jwonVuDc/YTyKanzsh/7GOU
 Lm7jZJ6A0RzfixOMD3WI9zePePLLb/ug/Q3oEzLtKmhoFCryje1LShgkNeW4TJ6P+Y
 t1X0nVv/IlbnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=rxGXN8vU
Subject: [Buildroot] [PATCH 2/2] {linux, linux-headers}: bump 6.{1, 6, 12,
 16}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 27321eee50..286e7b2e6b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 80181fd78e..6aaa163eb2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
-sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
-sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
-sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
+sha256  b760a6fa793d774fbd3b7fa0bea3efd5c4f5294dfb98ef1bd5f6d5f7cef4f06d  linux-6.16.2.tar.xz
+sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
+sha256  80d2feb7334c30bacbe1e7dafa9ea415efb2c0ea4f4740ecbd1467cf5d94de5c  linux-6.6.102.tar.xz
+sha256  d9a03d3a2771c60fc726c58d3bba61123e5fd22d45ed27f6cf7a308c171180a1  linux-6.1.148.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
 sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 401a41b763..67cf660424 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -451,10 +451,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.101"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.41"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16"		if BR2_KERNEL_HEADERS_6_16
+	default "6.1.148"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.102"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.43"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.2"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
