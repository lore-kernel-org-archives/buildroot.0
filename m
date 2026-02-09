Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBCAE7E0D5
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F252683BC6;
	Mon,  9 Feb 2026 19:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkbGAqKU0SAU; Mon,  9 Feb 2026 19:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2224783C1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770667011;
	bh=iVYjrT4U036wZ/VmoltMddiyR2BROo49K3WbKTINjIg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JvLQKgzUYDvghyvMlpftT/b6XoaRovd6oYGTKJhramyZ80pIkPWWBcBStrwaN9kID
	 MQo7TDkESmoKjVJVucmPbVsgxvQ6jgLcNp3k7YvJZZ6z06Q6MRcUKPaynsxl5beNSJ
	 DnIpNylb7zXM2WNYi6dtDQZ9U9Vq3mVzP4heWd5KvyxvsHAsWDO6A08KfbK28Z3WAw
	 qQhGAA/S0lwWotqLjaMODaqw0m057QPAX1aPT/BQkRdi6ItPEjGA7hMpJB4uxPUYw7
	 N39MRWcN5pGIjoow3iYqzaLVseez/xGDuYjdd1O3i4+th9xt2+BQEkIJI2QkZc9tXa
	 AcsyYcHcS4NVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2224783C1E;
	Mon,  9 Feb 2026 19:56:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D135B1A9
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B691283BC6
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJruS7pWNITe for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 19:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7886483C1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7886483C1E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7886483C1E
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:56:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a038f.dip0.t-ipconnect.de [91.58.3.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E2643A4C06BA;
 Mon,  9 Feb 2026 20:56:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36644)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXN3-000000003gY-0fet;
 Mon, 09 Feb 2026 19:56:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Feb 2026 20:56:33 +0100
Message-ID: <20260209195633.384345-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209195633.384345-1-bernd@kuhls.net>
References: <20260209195633.384345-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770666993;
 bh=gmGm1ia1oSyvTXuJgoSZ7MyfEaxCB50DzjkTgFhbmDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XD33ERyPfcCLDJZyTalybnHcn+80Z4pdz9eCOzNLCGhGrEiPVep4nB5lkVNWc+wMP
 UXqCmK5gKVVUCDoasHOq2ilVCAvgis/RgkF40XLjMSVq4DdivnIpZiHlzIOi1Wy6gv
 yaKOP4CdXmhwZhilo+7dojoCix5cMsXRSBMpCefvGVxjqbYvRA6BtL0RPw+fVA7hqF
 XczRC4j9qa1xukThYWMzoSpPL4x2U5Vmd6+bs474W2OdvtPTKQRY72HBOjdow/tEOW
 TcljXAXSxU43Hvb4CyEurP8hwKM0mTLMYdI5hW0kuWLOxftfybtgHyQBxYUzxBmR71
 uWjuSkHxD/c4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XD33ERyP
Subject: [Buildroot] [PATCH v2 2/2] linux: bump latest version to 6.19
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

For an overview of changes in 6.19, see:
https://kernelnewbies.org/Linux_6.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated symlink (Fiona)

 linux/{6.18.9 => 6.19} | 0
 linux/Config.in        | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename linux/{6.18.9 => 6.19} (100%)

diff --git a/linux/6.18.9 b/linux/6.19
similarity index 100%
rename from linux/6.18.9
rename to linux/6.19
diff --git a/linux/Config.in b/linux/Config.in
index 48e5fc57ab..b4bb1263d0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.18)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.19)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
