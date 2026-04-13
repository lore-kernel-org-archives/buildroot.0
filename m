Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7CCEBFD16
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 08:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011FB60B73;
	Mon, 13 Apr 2026 08:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKBp75BDMz7J; Mon, 13 Apr 2026 08:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FBF60BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776068939;
	bh=GUYiUO+Tgw3muerrtF1eNctArb2ccpN7590rn3tZx6E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eRvGH+zNIywhrBJHzT9uFEHphCSBgLdr6e/aSBf4ICIi+doH+lMIkTRNbjE4mhhKX
	 T+p6KZ522yuFrW7X61EV7pHPmVDNrJvKNcIp2HcXvGIuA4gRLmXGL87Gtsv7bkSVnP
	 /OgYVh7WbPXlOmzoQelCIh+ZejlvvN4fnnc4F6KgmJaBHjXynjkC6RTPiiCM0vVNSl
	 GiEh6vTtokqJT+KQyRrb0aPUvjVb83UDcCALWsMRIYy3ZH/X2eBIsgdUoOeqhU3bMV
	 IoJL1m4K/u7ZOhXVshLrT1Qum/BvSp2VOYDUutUjXDwX3jYxVXZ7Fc6rk29peGS9+q
	 g9P/dUHIW8ucQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FBF60BB3;
	Mon, 13 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8660283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA5C14262B
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYVAf0yIyYun for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 08:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C680B42619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C680B42619
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C680B42619
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:28:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccdb.dip0.t-ipconnect.de [79.214.204.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A273A4C21DE;
 Mon, 13 Apr 2026 10:28:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCCeX-0000000008w-3LJf;
 Mon, 13 Apr 2026 08:28:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 10:28:16 +0200
Message-ID: <20260413082817.3553573-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413082817.3553573-1-bernd@kuhls.net>
References: <20260413082817.3553573-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776068898;
 bh=6qFDjhwv7g07psUfhqwbioqP/SSrFzRLa8p2ojIus0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BZVY/TpXOGq24Dr6QuZ0QXH22JyjuXigCPjXmy+wbYXLgamC8qsfLmiCzyBOsYBoa
 9j961XE21HvXJAJwNprbFeMDsqtIfj88D9e5J5uhszdhBlKc7TFXvgtrRjm+UTII/B
 4ENbQwVgxSgBlfMXjJS0TjP2mb9YzBCWI6dKNx6SsqVZLDGfGp5mUhPeXRQa50pSXX
 hW1qcEvgp/x8zNHoiBOy7ZNxOHuPEIyMIz3geNujIEVhENtnyooDbW4AxKw4C2jl8b
 0t3fLrlzhDjU/FlXFwEL4KEMlqdHJKhEUm6S1vWJudLP216BYDEwbb07MX4lVRt8/t
 nHBRGQOM2ebvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BZVY/TpX
Subject: [Buildroot] [PATCH 4/4] linux: bump latest version to 7.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{6.19.12 => 7.0} | 0
 linux/Config.in        | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename linux/{6.19.12 => 7.0} (100%)

diff --git a/linux/6.19.12 b/linux/7.0
similarity index 100%
rename from linux/6.19.12
rename to linux/7.0
diff --git a/linux/Config.in b/linux/Config.in
index e846bf6d4c..0a63ed1728 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.19)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.0)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
