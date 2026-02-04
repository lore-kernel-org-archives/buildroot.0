Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD6DE9D408
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18AC60FA2;
	Wed,  4 Feb 2026 16:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSqZDGubmrfr; Wed,  4 Feb 2026 16:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9174F60F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222269;
	bh=x2K/MAMFPJdPp98KhDb5ZmUdeHxUYv3C7EeQDfurxEQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Lt2fpKwNp7ykRyUOJvRNJPeGo1qsyF8e1/gb2SlmITmG8mCACOUFMLmXxbA/DEPS1
	 0KH53O9HofHJ54KIoNVgp0za6o1pGAb69HSMuSRApBCNmzdKAkTdzLNbusckIVgEV1
	 0bUd5nJstg2PiOzYg5KZWVQF3WrEHV8PJNlgIqf50k0WXblKZTY48rg7Kn7AnENkj+
	 NEz2jo2cNloDRDbn5YyzgrqMEzqU4yAlrtcp8vfWJ8u2kQmkT7dTssH/ifcT2qyHY4
	 bjc7KON0eDLR54qod2MzNzObvNHy45JvA8ITUopG5fW5gP+XEO4pbyYTd8eaarD+B0
	 f63uqk3ANiy3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9174F60F90;
	Wed,  4 Feb 2026 16:24:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 986BEF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8547E40CF8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Fa5wf8jRD2H for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 817AC40CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 817AC40CEC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 817AC40CEC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9B3591A2BEA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69A0560705;
 Wed,  4 Feb 2026 16:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC8EC119A88EE; Wed,  4 Feb 2026 17:24:21 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 17:24:11 +0100
Message-ID: <20260204162412.159086-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204162412.159086-1-thomas.petazzoni@bootlin.com>
References: <20260204162412.159086-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770222262; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=I1dOGiu0wn58JqmEMQC+2xyAqz1hG+XLJWs6nd6OUmo=;
 b=pLRYVoFARIIwmE0oZ1UylZR26xtCbs+kb1nUN6dYzpDrZV0BiGigWuiLZIv1ebticZFdHO
 6RTuRuc3Lt8+0W2e4lARttdax9RJS3o2XvB6ggGG4HGsXPL2+0iHYwznrVr2jKnpVm2Xbf
 RV2KIXDM0jWEal7cp6PlH4Fj3SPxK8gcF8DHwtjAGY8wVEI1MlKdcdePDgBJw3nbIce9kI
 Vp0pNuPcLBAFyeVaYB8NapzEwdiwa+s3GvTjAiCFtaerpfEy6L5ks7sV6FgxTqQfuaEfI5
 FIf0i0rc8NUun+gQJsD502HOvut/uRTLJgUeItTT2UXqOwJGhqqmVMUdARYcVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pLRYVoFA
Subject: [Buildroot] [PATCH 2/2] package/uclibc: also install utils to
 STAGING_DIR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_UCLIBC_INSTALL_UTILS is enabled, utils such as getconf, ldd,
locale get installed to TARGET_DIR. However, they do not get installed
to STAGING_DIR, which is annoying as it means that they are not part
of external toolchains built by Buildroot.

This commit adjusts the uclibc package to make sure those tools also
get installed to STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index dea5445b16..69eb73510e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -449,6 +449,14 @@ define UCLIBC_INSTALL_UTILS_TARGET
 		PREFIX=$(TARGET_DIR) \
 		utils install_utils
 endef
+
+define UCLIBC_INSTALL_UTILS_STAGING
+	$(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
+		PREFIX=$(STAGING_DIR) \
+		utils install_utils
+endef
 endif
 
 define UCLIBC_INSTALL_TARGET_CMDS
@@ -479,6 +487,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
 	$(UCLIBC_INSTALL_HOST_UTILS)
+	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
 # Checks to give errors that the user can understand
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
