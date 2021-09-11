Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BE0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:37:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B56C611C3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B56C611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C3B607D7;
	Sat, 11 Sep 2021 13:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fjr-tABoI7Zl; Sat, 11 Sep 2021 13:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8913560624;
	Sat, 11 Sep 2021 13:37:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2561BF2B0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F43817BD
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrHRVtyfk40u for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:37:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12C7A8105B
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:37:52 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ho42so10228398ejc.9
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0vwJFLP6zGi7b9zN5uMmGOEwZqUHZPFTo7F2haiW0Q=;
 b=TMD718d31V2pbO8dyaYTRm18Te5VjTPwKWlzyNhzzK8iL+J2Zy2mZlZYn1j9E44BoC
 pvCzRPjN8XJfT+HdPsjBxSBqaKbAoPTw6yyz0/g4LiiOeR7fqwIK8p+sAD6mv3Wpr0Hq
 WhtL52bo/yl0EeB2p8UmpfDkVyQ15bwu+ot64bJ+oI2J+1tht5+hwUqqaVhtWZ+toySH
 t/3dSmGD4dtnj1ZRekrlFlDnVIT3NJvsXsqJUt3IKc8kVZ40jlKBb8Te1zjCz9/mBZ87
 iQhrjNTkROxEBzkMt9cuVqhoZeXRxI06SPaiOjX7kpAH2YCttWvxUmyUp35538BtbBPE
 1yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=x0vwJFLP6zGi7b9zN5uMmGOEwZqUHZPFTo7F2haiW0Q=;
 b=DO1cKi+p5Tm6fAfMChtM+8ejrhZz/RuMUqSXdvWqfDPXD/eUQhJf4IlHfXccUcfpl4
 OYlrOzBXuOj0PPjIDwjzV8lM/OR36Ox61Md00phrW12desDCGEguQOR7hkgOitr8BNvt
 w6CwHo2dFsbfjBZJqWOHLOMxdwsSpVrh/eDVZ/v8CuTdyCVdiFRvv927d2qJPmPpnFiu
 vN1z185NWaHb8qwCBMIcOUak1vixXw29QeyymF8O1bQTvGwk5YlUEKGiyz/QPj8k1tDH
 Msjm8erJp26fOsFggTqCK9NbE1aDA+h+XArkdkxpGWzinRM4RmxuAplKyBtnijh56ASB
 MQ7g==
X-Gm-Message-State: AOAM531tlngM+GDcLYJzZHPnxunK+RzBFxKkRKQCfseBEwpNTgTJz9tM
 nxJLn5itL5E0zVv5U3PWsL9WxhUWwgk=
X-Google-Smtp-Source: ABdhPJyaWq0zeZXyug5ml0kc2GYpoJzhC/yuZndQ/eKdjLmv40bjb9B/OC6iUED0Oqlu8Av5/KVQvA==
X-Received: by 2002:a17:906:1c99:: with SMTP id
 g25mr2851856ejh.521.1631367471292; 
 Sat, 11 Sep 2021 06:37:51 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id 6sm787571ejx.82.2021.09.11.06.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 06:37:50 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mP3CX-0007Yc-Rm; Sat, 11 Sep 2021 15:37:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 15:37:46 +0200
Message-Id: <20210911133748.29005-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-headers: drop 5.11.x / 5.12.x
 headers
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The 5.11.x and 5.12.xx series are now EOL, so drop them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 14 ++++++++++++++
 linux/linux.hash                     |  2 --
 package/linux-headers/Config.in.host | 10 ----------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c550abf419..35a11f4dc6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,20 @@ config BR2_PACKAGE_GNURADIO_PAGER
 	help
 	  gr-flex has been removed from gnuradio since version 3.8.0.0.
 
+config BR2_KERNEL_HEADERS_5_11
+	bool "kernel headers version 5.11.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.11.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
+config BR2_KERNEL_HEADERS_5_12
+	bool "kernel headers version 5.12.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.12.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 comment "Legacy options removed in 2021.08"
 
 config BR2_PACKAGE_LIBMCRYPT
diff --git a/linux/linux.hash b/linux/linux.hash
index e042123438..76bb9fe001 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2  linux-5.14.tar.xz
 sha256  72fe7cc1f0363523061659a21e24754697b27f405cb88a41a63038629636159a  linux-5.13.9.tar.xz
-sha256  e9381cd3525a02f5b895f74147e2440be443ecd45484c6c64075046bc6f94c73  linux-5.12.19.tar.xz
-sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
 sha256  00bbaeaac17f82d9a6d93cbc42cafd39d3b2fa3a6087333503d2344fa5e3142d  linux-5.10.57.tar.xz
 sha256  0471d0ccb7953cdae7d235192588ac5d72344851969962676d1703e69084a37f  linux-5.4.139.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4dfd4a7845..7123caf65f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -58,14 +58,6 @@ config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
-config BR2_KERNEL_HEADERS_5_11
-	bool "Linux 5.11.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
-
-config BR2_KERNEL_HEADERS_5_12
-	bool "Linux 5.12.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
-
 config BR2_KERNEL_HEADERS_5_13
 	bool "Linux 5.13.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
@@ -384,8 +376,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.202"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.139"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.57"	if BR2_KERNEL_HEADERS_5_10
-	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
-	default "5.12.19"	if BR2_KERNEL_HEADERS_5_12
 	default "5.13.9"	if BR2_KERNEL_HEADERS_5_13
 	default "5.14"		if BR2_KERNEL_HEADERS_5_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
