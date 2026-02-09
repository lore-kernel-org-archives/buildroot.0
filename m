Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52943E7E0D0
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 19:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E6C181A95;
	Mon,  9 Feb 2026 19:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFAwR723EatE; Mon,  9 Feb 2026 19:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C37081570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770664666;
	bh=pTFBuulVitM/Yy544VvBlMyfgc1zYcCnfWZY8cClAHg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loX+j8XcOv7114NE0zSgHxEgGO6pGpT7+e4ZyognmQS5ug06XogLFJknjaExEDKuk
	 kUrA1jqb9O/Nb2xAJgwOYmS+pD0xicfTXxs37r4Ae0AdMbpPQHPNikcX6vGb2rtqaC
	 AzsTXzfG/dT7KTeU9ZiaoGKIMPVv6m0UrjJEJgGAywVi8oZv5WDNQsxrEBnoGItVC5
	 ciCEVSALhTuYMXMMBcxv8AwEjGF4kme090Vat5SvhLwNjiVOlhX/ko1Mu2SRq6kAEK
	 QcwBeGkwf6UDspbxfjfGxVYWnh8/PR8WmaXCg/4HNYkh9v6tebRfMRUysNcO36wUu5
	 3V++Q9MCcnm3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C37081570;
	Mon,  9 Feb 2026 19:17:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67106219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54EDF612B0
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEQj2c3oMQWQ for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 19:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7159561299
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7159561299
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7159561299
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:17:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a038f.dip0.t-ipconnect.de [91.58.3.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 729A0A4C06BA;
 Mon,  9 Feb 2026 20:17:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpWlN-000000005CW-2sUq;
 Mon, 09 Feb 2026 19:17:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Feb 2026 20:17:37 +0100
Message-ID: <20260209191737.69445-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209191737.69445-1-bernd@kuhls.net>
References: <20260209191737.69445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770664658;
 bh=7CaPhrQiY2ldwffZfyWqVqvBAYq0aTSkQpl6jzNaXPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gc8U3SLVBA7bcyZnSZk8H/A3iXurYEY57Rs/GoMMEL7BQ3l8GeXbjL1q3ly1z30z0
 dXM81Ul0vZvxOhFUDxRB1EQZJLvA8o5Qv17LWVtwDpxkcnhX70fOWchN4OzRhLQnms
 3/In/HOF8Bo4d4+bHaWX7Ia9XVDDt7dD29m3RJhck7NhqfHBwm7PUu2a0hMHkVuIIq
 btW4qbXBvHouExRTCdtQ0jPF7aL+3pOYHUS/bZ1NaRrv13chPrwp0LuVQnYksEBchW
 DWbrulvixYIcAPTlIKRWO/1ENIOhf0MH/14SeXDqp1TUMoNTTfGe97khJ9G5q16LU7
 orYPC2tCxSh/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gc8U3SLV
Subject: [Buildroot] [PATCH 2/2] linux: bump latest version to 6.19
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
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
