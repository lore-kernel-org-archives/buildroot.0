Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C851C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:41:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C9961994
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13C9961994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5CCE42590;
	Sun,  3 Oct 2021 12:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ENu89dYywBC; Sun,  3 Oct 2021 12:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05935426BD;
	Sun,  3 Oct 2021 12:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE5421BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9E11402A2
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgW9nzV7bYjd for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:40:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5936340269
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:40:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s21so24914992wra.7
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZv733Z/KVqp3WZaIkqGluzn3VgGgCtQ7GMwI9Tf4ms=;
 b=lGvOLVasHd2AI8WCKOvtt9ZnYd6E44/Ecub7xxhv9TaPzi+5udv7LWgc6X5ktI9+pF
 VMsMYhWJL1ZatMskdEbeKU1JHsh8zkWMQ4Xqb9ep0XFur4j1JCHjvhPyl1BiBjNfnwu6
 2XT7gUTNpI6E6BcB/6mQfJPmedz8k1Lm45PkvJmiGrZwHoqmjklfVUvapPsYAddb3Qe/
 L6wka+Z2PCROXaG1cAC18jSEvkWtkgj/8aY53EFIorDqny0OVFzgq0Bwo4P9yZ1Tj1y0
 5D3z05buKR8bRLWsmaRJdhj52ukzBYSZZiig1rDjuRMG9Qapf+LUNWJZGXKlCraz2Cyo
 2xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZv733Z/KVqp3WZaIkqGluzn3VgGgCtQ7GMwI9Tf4ms=;
 b=Z9jr72xP3w4ZRG0+zxCDZ6tzRdDPKP0GnWVZ7lw+YH0u+T9KUHtHvkQSC3e42XZcQR
 WdbsCZfpqeCLc46PNzBfd2OVVcSFcCrHxmnxWUFxcsfdCUDANOXxfFFLDctSqUGmgpnt
 BMjGbNe4fHG0pqMgwn5G8JuGj+0G+ZIy6+LLCdOc9qWzxU9IKjwenfnoPStbdLtwdqnl
 w1twfy5jYkkQBPGZcwjbhGxlm6GIIYlHXXgUkpkD2oJzHEojVN0XPeCpscWgWKTkW5yc
 f0VwlxBP5aiBTbO7aYI2UzuknFXGVKYYBPpzs4uT4gstooTWqRatZD+94HRMEkmP53NA
 2NNQ==
X-Gm-Message-State: AOAM530sgdfeyqhH4OLKynkkcRX/GHf3HRSGb5isr5U3C46Ts51hySQS
 R0QZvQyummd/tZMePdIyZmhsP2csrus=
X-Google-Smtp-Source: ABdhPJxJwTUSB4BpB5eKhyMkoTlv0G8iXBd3QtCgZCuDOWQAVHWtGdAeIlCyYYNE3rqR/qk1frTfbg==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr7079753wrc.135.1633264834505; 
 Sun, 03 Oct 2021 05:40:34 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 143sm1258704wma.37.2021.10.03.05.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 05:40:34 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 14:40:25 +0200
Message-Id: <20211003124027.343390-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003124027.343390-1-romain.naour@gmail.com>
References: <20211003124027.343390-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/glibc: remove glibc csky fork
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Before removing csky gcc fork, remove the glibc fork.

csky support has been merged in glibc 2.29 [1].

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5f72b00591ce4d1b4c0418294ffe1623983d5679

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash      | 2 --
 package/glibc/glibc.mk                                       | 5 -----
 2 files changed, 7 deletions(-)
 delete mode 100644 package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash

diff --git a/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash b/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
deleted file mode 100644
index a61bd65f80..0000000000
--- a/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated (fetched from https://github.com/c-sky/glibc)
-sha512 9deb2deceefe347d72de13510a5baa3de00f94c684f3b25e136ca3660f61e65a69f2115abb488c2ab0fa93cda8535853ce1e13e186efcc8434ecc4049efd82b5  glibc-7630ed2fa60caea98f500e4a7a51b88f9bf1e176.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index c911c29554..3862e0624b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,10 +4,6 @@
 #
 ################################################################################
 
-ifeq ($(BR2_csky),y)
-GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
-GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
-else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
@@ -19,7 +15,6 @@ GLIBC_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
 # *NEVER* decide on a version string by looking at the mirror.
 # Then check that the mirror has been synced already (happens once a day.)
 GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
-endif
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
