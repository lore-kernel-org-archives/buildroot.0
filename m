Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1A6C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 20:44:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA7660F24
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 20:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDA7660F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F9AF83EAB;
	Fri,  8 Oct 2021 20:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrZqGBvXi5jK; Fri,  8 Oct 2021 20:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3E483E5D;
	Fri,  8 Oct 2021 20:44:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 905E91BF337
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 802C783DBB
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 20:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIIr9nvFykNR for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 20:43:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5A3F83E5D
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 20:43:48 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id u7so9108950pfg.13
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S6DKUp/JqtcfgcXQ5khOu/eJ1pv1sqqTyYnKHHIq5fA=;
 b=lYgI55fCpMSt0DQjM++p058MrAtslwwtd7YL8grGsxdhvF8WHq81uqp3yx4DeyyfVG
 JPBjzDHTZtTG1eRQ1x0NoE6qA32J0CHvf3iB0LmlTzym233PWJgbq8pJknTsYHWN1V5T
 Fel5Y6ggNdD+ZYCth3QBIAhKxZDP8CPOVdQ1Vie60Hl0Z/F2HwlBKpJF2IdQ/phjtQSH
 xQ4NG59EgYsomyRpZdsMHoKFe9DQYPvYP8RU4VbSNO/q3UXu/tN8N++T4Q3cdBFYgsJH
 9gBUXlhTlgOzpud2gKMm3ywbTmSLa3lA2jskgLSdvoudptS5crvxiPGIZWJrenvIznot
 t+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S6DKUp/JqtcfgcXQ5khOu/eJ1pv1sqqTyYnKHHIq5fA=;
 b=fk4mqGcKeKPlI0+IIdiTb4OoHfOC0b1CvFYPWepnnnWpsFmOtFfr+4FY6mNru8TMqC
 mUyBDRwHJJflbsCW0eHQL87uOpOcGNN1D/TKFHZTaMq6RM+L6P+LlGCywOaq3wuPxbtg
 uTum4X7IvfLQPl/YD7vMNS1YjNJcYXJXJUYJmZpqhj7vb+easiycjjovpgyTcn4jpvIs
 7LsqSLzPzwifabWUR3Z0nlLzAoFjfTqAaAsvK4xnBC6JPBIqsK7pFxPpow6vHzplj6vl
 0Z/NtNTowJTSw5fX/MsFlx9/NXnhNSL/gV0y5fSzVkWCFqeZCtIZ6gJ7NOA/kWEK+Irp
 Ht5w==
X-Gm-Message-State: AOAM5334nmTBCAOQOxU9D/FcMasmCFtuGfSISIazS/aNospXWOQatjgx
 hS6AJ5Eq/AqECU9Y8Z6XwRnZ78plKAw=
X-Google-Smtp-Source: ABdhPJx7c4mWCiCHtGZ+k2kSB/t5sHXZF7AtDEJKngzHSnoAtqmXd8waOjGqEXsytgfiXN4Px/gFIw==
X-Received: by 2002:a63:8f06:: with SMTP id n6mr6428281pgd.315.1633725827933; 
 Fri, 08 Oct 2021 13:43:47 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id z8sm204626pgc.53.2021.10.08.13.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:43:47 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 13:43:41 -0700
Message-Id: <20211008204342.370220-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008204342.370220-1-aduskett@gmail.com>
References: <20211008204342.370220-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/python3: Add bzip2 option to host
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

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python3/Config.in.host | 6 ++++++
 package/python3/python3.mk     | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 70b5dacdde..65a8df0754 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -7,6 +7,12 @@ config BR2_PACKAGE_HOST_PYTHON3
 
 if BR2_PACKAGE_HOST_PYTHON3
 
+config BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_HOST_BZIP2
+	help
+	  bz2 module for host Python3.
+
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_HOST_OPENSSL
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
