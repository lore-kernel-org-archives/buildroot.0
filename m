Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49EDC54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D8841A04;
	Thu,  7 Mar 2024 17:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4OyXuxzfTsfo; Thu,  7 Mar 2024 17:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D9041B5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D9041B5E;
	Thu,  7 Mar 2024 17:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 773651BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7154C60762
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reJ7zjiYp60B for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:49:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E6CB608A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E6CB608A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E6CB608A5
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:49:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F707A4C25AF;
 Thu,  7 Mar 2024 18:48:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51086)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHrN-000000005Mx-3m2u;
 Thu, 07 Mar 2024 18:48:49 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:48:49 +0100
Message-Id: <20240307174849.37394-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307174849.37394-1-bernd@kuhls.net>
References: <20240307174849.37394-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833730;
 bh=otqFpixhzNshqeNRRDnBh1140pJj6mNQSdDbNubdNcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L/6fh91DeIFyuLOmFlaFMokbNcJjb1TAeeUBAzGhHPG08k9K5v8Rc0sojp1ucYw+Q
 WF/C4jQv7uANMO66eVS6SwyTc6yPnTrE8eNKXHzHD7YxpLAOE97oQjtNxnJbNf4dbn
 JaplcBfdnAz6G3eQoywZ7vk7IkEPf638HWDRsQ/QyjoANEp/KyGlYnCwqwu4Zrhixn
 +ta0zsH5/vlmQ9rxGDDYIX/PV0BsrUfFedVfPYOvzUbGbziZyu9XzSyDCqmC2rJ+0A
 vGI1eNr+B0x1cghC9q5/MXbaVZVXQrKaUYbNhatQ+rQPLNHJcd3zkKrU59OpZHv4Qg
 /T2aAj5TFR6Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=L/6fh91D
Subject: [Buildroot] [PATCH 3/3] linux: bump latest version to 6.7.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index df84cce539..5e18430ecd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.6)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.7)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.21" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.7.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
