Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C063CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2DDE82532;
	Tue, 30 Sep 2025 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0dVixZtvsVJ; Tue, 30 Sep 2025 20:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F287182512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F287182512;
	Tue, 30 Sep 2025 20:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37654111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2966D610A2
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fhyxnQm0umu for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7EEA6109F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7EEA6109F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7EEA6109F
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:31:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c14e.dip0.t-ipconnect.de [79.214.193.78])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1365BA4C5939;
 Tue, 30 Sep 2025 22:31:46 +0200 (CEST)
Received: from [192.168.1.144] (port=59878 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v3h0j-000000000W9-2AmN;
 Tue, 30 Sep 2025 20:31:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Sep 2025 22:31:45 +0200
Message-ID: <20250930203145.1197559-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250930203145.1197559-1-bernd@kuhls.net>
References: <20250930203145.1197559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759264306;
 bh=8n6NnC1SDkjbck80CQouNzUwmLoCw+x7jTaxtNIbSbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lTFPXO9CVXQMII8APGh8dbrlddX6DhL/vZKfhn1yPwau++RNkVbtOjtzfu9i0tWBp
 /lOPuvoQCzEqXECRABDpqYz/py08vg02AYUV3HCkVM98YdN/8xJx0cCBppIhYXmvKF
 dNO7kNAeQ/SFw4YNMD6BonoeMHxyo3LYrGnLga+j+N5Hp3i0JaFsqiPm+4xdaqCceu
 TITMYsllg1j8j9mLeI1hY/y+YpD/wuIHxUN1BeinIqFtIBc2YDjXZeZjpzfkankxLH
 u0fLtZV4+XZcVquGvr6MIJvgYnzQQmPhVL2SQo4gQn8sAvJ5kM950IXV2DJoTupDTB
 MgGglt8hmOs/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=lTFPXO9C
Subject: [Buildroot] [PATCH 3/3] linux: bump latest version to 6.17
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
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4526676432..5c2264e5fe 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.16)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.17)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
