Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB9DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 22:17:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8A160EE2
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 22:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F8A160EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D1E540205;
	Thu,  7 Oct 2021 22:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCpwaBrrCEcZ; Thu,  7 Oct 2021 22:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72A78402C0;
	Thu,  7 Oct 2021 22:17:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC35C1BF368
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 22:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E919B607EB
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Airgi0M3A8N0 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 22:16:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6671E607E8
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 22:16:50 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 145so6494220pfz.11
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ETtadZDNmvHHodHhARTITRzmGeEoDPVFLkFFyEDOfQQ=;
 b=NYnzqoJo45FFhP8+OMR6MeX6WUvw6SikAlPi6LZfgF/l6Abstztm1lFdZ6HlFq2Dkp
 w06dXsRO9Qs4ae0+2xRwdd+rovGuzNpj57VP6ulGo6gllnUDM+oVpRxakzFIRtJT9SLq
 OrC0afr3xnHEDuexj/FP9BCBnRqwjfSFU6mLZZgqNBfut5V10RMVdUlzfJeOcfKJJMRf
 YFboYjNlpWhwXtBsfIE4inLSDbA/voF/m7vmULMtrOifRQLa43K1xIwF7Ize1gJarAPH
 P1AibbqHIspZCw8FRxOMLmD68RR6DdzicM4TRMcAgOqCkieaBARd7/GrqQGknY+JLU2D
 Uqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETtadZDNmvHHodHhARTITRzmGeEoDPVFLkFFyEDOfQQ=;
 b=ASszLBUY9fzT1PDmPF2SZ49GA+cbm0SOWd2nKXG1fjVwqYWbYwR0xrWnLoqgX3aLYC
 dTP1kYNWV2X4+qWh5/jDFwpmi56o1gfH2AJzxVZCsBPjBNXQrsvR8SEYUbDWIz7kSBmB
 anT8NJyxBYRPuw+hw4XoQSJhxxrGSaMOT/FY43RZ9NolOVEsvFIdFw1ZYy2Iecve0CTX
 ZMr+HaSnpmLfBLzc1wkQ6/zeAyH6QZDCvOzc1+2WU2izoVKYF7b92oOXxjGWRdyhEGZV
 kXrXDOJxvbVqbV1FEMdUfY+1yHiEB+s4gMsHc8Irm7wLcn6QwdIL6HGjVysJe3uOz0Jb
 7sPA==
X-Gm-Message-State: AOAM530rMBfrnWMP5he0Lnx48DPSuZVYTFe/47WdcqyMvR26UyEOUn61
 sxL5hGziG6nPYUvl8mDpxpNMGOaSqbU=
X-Google-Smtp-Source: ABdhPJyloIBcOwiAwNwQfZF/WdZr/CqYeIxjYHSk4np/XZgTbZ8EtUFl/C/HxrvLBNMEYbOZBEZUQg==
X-Received: by 2002:a63:2361:: with SMTP id u33mr1665152pgm.369.1633645009711; 
 Thu, 07 Oct 2021 15:16:49 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id n66sm405603pfd.21.2021.10.07.15.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 15:16:49 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 15:16:45 -0700
Message-Id: <20211007221646.165282-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007221646.165282-1-aduskett@gmail.com>
References: <20211007221646.165282-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/python3: Add bzip2 option to host
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bzip2 module is needed to build the host variant of NodeJS 14.
Unfortuantly, there is no way to build just host-nodejs without setting both
ssl and bzip2 support to default y.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2:
  - Set bzip2 and ssl support to y by default (James Hilliard)

 package/python3/Config.in.host | 8 ++++++++
 package/python3/python3.mk     | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 70b5dacdde..f36935adb2 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -7,8 +7,16 @@ config BR2_PACKAGE_HOST_PYTHON3
 
 if BR2_PACKAGE_HOST_PYTHON3
 
+config BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	bool "bzip2"
+	default y
+	select BR2_PACKAGE_HOST_BZIP2
+	help
+	  bz2 module for host Python3.
+
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
+	default y
 	select BR2_PACKAGE_HOST_OPENSSL
 	help
 	  _ssl module for host Python3.
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3e88bc0ff4..779f6dcb6c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -43,6 +43,12 @@ PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-autoconf-archive host-expat host-zlib host-libffi
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
+HOST_PYTHON3_DEPENDENCIES += host-bzip2
+else
+HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
