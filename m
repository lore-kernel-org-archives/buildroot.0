Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D626DC88E4D
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C6A6061A;
	Fri, 11 Sep 2026 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8Y6sylXNC31; Fri, 11 Sep 2026 20:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D03B66060A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789160257;
	b=l6SPBWb6bDqKPV0pDGUUgZBpTq0gl5n48Zy3QDyCy75KX8nNFbWwrvCUwHlvi2CLoTr3
	 bwws3fkjFGt2SMzS9JORep0uFmpM14b5lKBPlYg684Z6o+4luSDBqAQH+59xlMa9FoUPP
	 PMt9f6B6xpYApRDx451KROPEs3hMO48F9os2OWVOi5VDJ687DRx5EYvlUv26Q07f6t1qf
	 qTFnqZte0tO32+MM18cP9bcQ5yVsTOeDn9t7ZEqpLMkyj6D4J0/N/ZLJnaD4cxs20J+5s
	 T+QHhF6RwfKqxms4uMtVeGNmTH9a1PAPRmhViJZkgWHZ0kVZ4VX9lidMiePwi2A4klQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789160257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=hyEZV46ucZYWW6XjzzfgOn/T4Rj3XbRxz2rL9pxVprU=;
	b=gRXDCmA7TbhIFiAHeqT/ndS613cXNXhDEyHOzunsSP9tmBfqL+i4e37SQlvEA8qCS7WT
	 NPbtLHm+i8S6hty3RnVmydcL8pGN9Um0dEpzEFE0DHIUfuB23W2dTT6xYR+m26vpmgQLD
	 pZ+tuLN7dS8ukdmwyxHBzdn4U5uFWY1LTLYFtYx8kAU6rh5wtBxxzYSDPzLF+kCNW5JJB
	 O7B5OOVCGH3+o30M+PjYboVHZOUKUzyUFNk7nhXgRdsCqfVlkFcCWKmXVRHrITX1RbhTy
	 TmmZ+0Mx54ffIFGFidIzvyLtbc3EFw80Wt7wayjHQW2yep2bF3kVG+DqYW0Q+xL9GPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789160257;
	bh=hyEZV46ucZYWW6XjzzfgOn/T4Rj3XbRxz2rL9pxVprU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bSBxhVqPjAp2OsORgmY1MY/kIidQvCh/rN/kzc4bLD1f+wijchMk5kjPOxtL0Rk+i
	 M5GbLrRVtlZfIyViucHLLKgNx1FirfbdQa40ajHQ4hngF5iix+XL1+zhSS2pE35KYh
	 pJOsYACjbYRL7csMK3P5thfDHeXYnTdMsUFGmBJd+2yrydoeJHrUhZwLQ8gHxYabJI
	 oppStw1DaAuG4pVYzQwNaXgQ7ADIQGRCVu5rZHFwrrGaz5VeS5ixiulktVRAYkirWX
	 OJVgOoowQqXXquUwpQ1L9vRRbtEkG2Toz3hD3c2PDVyo6apLUjBc2A72NJSJ7kFKO3
	 Zci+fH8p9LbpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D03B66060A;
	Fri, 11 Sep 2026 20:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1691749D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 20:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F089A407CD
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 20:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSixObOQKfMQ for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3B17E407C8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789160255;
 b=VX/0XhOHnyJW9p0cIULfe/AhBi2986Y9NXhMCbKmSMSTQanm1SbCoHsOExW33YoQZnWR
 UC9bZELBH1uK8J6Q+PCvBhgOZIOlvxCTNPX39OguQoWfaY7YECMK2yR2KgGgLAGpBXb9a
 bUU2gdHHPjcdsqlGDZsxTplscDyGsCRFbx35qDmV2OcBLUm4foofqXlAv9gPrxpcnY2OF
 EiqoPAgYR7VWqkmEa1caqkWidGjKL71s5LSXzA8/ICvjEoZZVY3lgJgiZv7x9XSkpNbEP
 o4osFDN4w9C1fyhCZOm1Q0twbNuiaVoayTLzX6AVXOiW74AfhXhg60UrOCU5M4j2QEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789160255;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=XqMxEEc29MeERMrJGlBJgP1nfDLx6gjpVqg2RW99dOc=;
 b=sYEA+vfR6jkBARac0Z2e7hlTTa/JAU8uCvNjam/HJZ7IIZnRKHGCXhT6fINb8UErOWnx
 4Pf/YWJOmxdKan8KsEzkX8Ny461zn8Mpz62F/o8DxbDMWG+ropHQV4FwnqzazU36Mrpal
 wMwmSfK82qdcNQe4AGW9od+MQDsOIpB1xy3cLQe2TerRG9B3JIsLvv+kXcmMTZC9YMcMN
 2PPvAGE3duxiqByL3Ch/F5XUB8FBAL00karkE+0Ow98qjRq8Igfb2Lb5wGf4dj2g4XU3o
 nuDESkEu8AohaFt4o5cvhtAVLg/f8vNMuymY3ZbogcxMLLMOKX/CR/MAPavDxJnMoCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ibUmISo5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ibUmISo5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B17E407C8
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789160252;
 bh=XqMxEEc29MeERMrJGlBJgP1nfDLx6gjpVqg2RW99dOc=;
 h=From:To:Subject:Date:From;
 b=ibUmISo5V1gCjshNmhwNI87YvwsBKi9BkPb8jpY2EuEwlsuquCbE89zMfN8CEckzx
 w8buezS/lrqopNfpP/MmedtYtPM2UBE7e7SGhcTejoSYfeuukTH6lkUG1Bjx3aleXo
 BM+//0nrQwTO4s8DduaMLM1oBOovPvTiTXyVz1/iB+sjPd8ED8UkKv9+Tgm0o3NBA9
 n/NkE0ps+TRRGj8R6zOUo4agjdu0Z78HEek0zOnSX7ZXO9V5Fs6RyyThVKxsLWGplQ
 MFk+3IGC2BWXqw480J76V43gDVKnAKfel0Ufmf3js8AW0W+CgwOctCVu/2ZGqU+QXI
 pRJ9eUckDQP8A==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80978A4C3D23
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 22:57:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45296)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x58JQ-0000000024U-0QZA
 for buildroot@buildroot.org; Fri, 11 Sep 2026 20:57:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 11 Sep 2026 22:57:31 +0200
Message-ID: <20260911205732.773058-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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

Update the latest kernel releases to:
 - 7.2.4 -> 7.2.5
 - 6.18.50 -> 6.18.51

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.2.4 => 7.2.5}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.50 => 6.18.51} | 0
 package/linux-headers/{7.2.4 => 7.2.5}     | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename linux/{7.2.4 => 7.2.5} (100%)
 rename package/linux-headers/{6.18.50 => 6.18.51} (100%)
 rename package/linux-headers/{7.2.4 => 7.2.5} (100%)

diff --git a/linux/7.2.4 b/linux/7.2.5
similarity index 100%
rename from linux/7.2.4
rename to linux/7.2.5
diff --git a/linux/Config.in b/linux/Config.in
index e22a6ee9ce..8cae599484 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index a5559ae547..6f0de8b94a 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  01710ee01737dac492f1bae52becd057e08d20d11589089aa06accff415c28dd  linux-7.2.4.tar.xz
+sha256  55ddf0df8325d9dad96fcff7bd93977d22e3f50af06527572af59b77c7632b78  linux-7.2.5.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d2fc041dab4e11d9645e3ba53be058faa52b8ce28a8a97c889bb2cacee170461  linux-6.18.50.tar.xz
+sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.50 b/package/linux-headers/6.18.51
similarity index 100%
rename from package/linux-headers/6.18.50
rename to package/linux-headers/6.18.51
diff --git a/package/linux-headers/7.2.4 b/package/linux-headers/7.2.5
similarity index 100%
rename from package/linux-headers/7.2.4
rename to package/linux-headers/7.2.5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b865602cdd..613ada58f3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -481,8 +481,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.50"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.4"		if BR2_KERNEL_HEADERS_7_2
+	default "6.18.51"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.5"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
