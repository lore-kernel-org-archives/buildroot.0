Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21397D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 09:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 996DE40862;
	Sun,  7 Dec 2025 09:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anU31tfYOL2u; Sun,  7 Dec 2025 09:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FACD4085F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765099162;
	bh=k+ItMPa1+0gWRa84+3QWDbmLj/Qi3oOQyzGZxj+Xz/U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qEVIV+bFZzEPMw2D+aig1SoUtK5UuP4ABGKwFePebz6phtUfOBPzK8cISn2B9JEM9
	 DIt/CBc89savVmtThXM0crQV8NZgVUovHNiuFvxtW47o8eNbaI3s+dpmmWCtxGU+VI
	 CNOnmBGR5pl+MO76hfpvkpI0YEgH9ziksmtzG/JXoEqnx+zJuNdbtVfGXKEK6FvmEI
	 yWt2DdWEDoIRHixXOWpITMWTmdTB0JtiE70TJKHjVVSZu4LZtBU/y3zrSfqCmtXo5V
	 1TMqarZAwuawVSRvVnGmaoqalr6yNO26vDoKYhGrE0XQs+4IkLRo0uvN4arXNTczDP
	 ShW31sd8MGYlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FACD4085F;
	Sun,  7 Dec 2025 09:19:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F0FE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65B8760B66
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_ch-TAy0Qi7 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 09:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5290860722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5290860722
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5290860722
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 09:19:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7591BA4C0105;
 Sun,  7 Dec 2025 10:19:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSAqI-0000000033z-23Yp;
 Sun, 07 Dec 2025 09:14:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Dec 2025 10:14:09 +0100
Message-ID: <20251207091410.28979-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207091410.28979-1-bernd@kuhls.net>
References: <20251207091410.28979-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765099157;
 bh=iANoX5sRPeNBTmHC6OtNeHiYKlui5crZtPuetvXy2kI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LrA/IlO/Y+020EtLqHQCYRwkUlta4GYVg3OFEzCyIDTC58ct1TLTGr7Y2P28ZDQqe
 HPLxaytuU3tlMQz70dBhbOyfY0lc2ZQ3X5nhTGNpg6p3qc/4B5IA3th4CvR9VzP7/j
 jCi6e4fyAbVCNoJ+EmgsZkx5LRDamX45mC9FsB2WTTiIkh2ds9IsYRuxGKQGpjh4Sk
 fMr79wPsPL+CH08xbQUmrLTYSmrEsFUfPrOemeFbf0J42y2RTYgdPglAkkFTD4UCt1
 8ud6d8hwtjthMzRWYnEVqkMi5dGTuKpPOrWkb7FltmYkroQzPN8RMUhZCVW1yTQNlJ
 ETU8L0wt1ODtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LrA/IlO/
Subject: [Buildroot] [PATCH 3/4] linux: bump latest version to 6.18
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

For an overview of changes in 6.18, see:
https://kernelnewbies.org/Linux_6.18

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bde36d33ec..1b1c9049cf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.17)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.18)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
