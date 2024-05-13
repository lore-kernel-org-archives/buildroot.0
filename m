Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682BCC25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2159B835ED;
	Mon, 13 May 2024 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CR50yeSis0WX; Mon, 13 May 2024 11:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2675083546
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2675083546;
	Mon, 13 May 2024 11:22:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2779B1BF479
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E500608E9
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opKITKQGefh4 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 11:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 931ED608EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 931ED608EF
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 931ED608EF
 for <buildroot@buildroot.org>; Mon, 13 May 2024 11:22:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51f174e316eso4992210e87.0
 for <buildroot@buildroot.org>; Mon, 13 May 2024 04:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715599333; x=1716204133;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFtLDPkL6I8+PsyEtmQdRITGJ/b2B0/MN9CGv7CLrY4=;
 b=DLA8CNwNPuEI6WrYo+oEMuC1U+LxbSDj65SzEtnskTxcu3NioCTWP5b77erO3GVenH
 3QUA0N+AERCexUP6qfi2KqNF4O/KQSgWDoxhs+IPoc5r34SKm9ohOXXPTWFKDahLE03L
 As3hJEVekEnNjTVWSuMWMJXNUXtr9rjZSRuSDgncF0YQ4LXlOCi4VnyqcyLaEu4blPqA
 6YLw8oV+ky7o4jvXapvwu6e/rQYZvYHe1UOv8LvTdQlq7BAqv6cAaiQnQQlFGehVTR2b
 UNYz3iyfKurES2vXQgR7kG27fHw+1sgus9OCnHCjRJ0xIib4/rWv8RwBoCqHVYBGhzue
 mbIQ==
X-Gm-Message-State: AOJu0Yw5ITliOuJ6ZuZySVVBzkrtGs5ZBXapL61w/fBQxthdKSzD/W7X
 c4MRrKJuAj3Zx5mFrgouG5FQ3NAsff2Spy3To46D5lKobdZI2ylCy26ovA==
X-Google-Smtp-Source: AGHT+IGuKf025qawyosQ/aX7Olbn+z5WYqzhiIWVEkMgRe395OkfKPfE43VW5csVsvIXqYgRjlrgqw==
X-Received: by 2002:a05:6512:36cb:b0:51d:9e17:29ea with SMTP id
 2adb3069b0e04-5220fb6ae4bmr5382796e87.15.1715599333154; 
 Mon, 13 May 2024 04:22:13 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8ae2sm1764866e87.204.2024.05.13.04.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 04:22:12 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 13:22:05 +0200
Message-Id: <20240513112205.985165-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715599333; x=1716204133; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rFtLDPkL6I8+PsyEtmQdRITGJ/b2B0/MN9CGv7CLrY4=;
 b=jTxMqWO2fd2ExgkaqUxOeT3+xAfFXCz7VedVryntitzDrGieWXfIb4vMc6HRK+E83O
 bHbbOoUAdfUCIZN/sqCgy61pklMuWlpUoiLQfirCPXHF+z6jpSlBMUdkqtPF241VIioD
 keOARoTV7IfTZ1Ufs6AHnzWVee2NZLrJbkf9D8l9gcU4OmoBq6Ucay3JBQs2SDXZTV4g
 2oR/PXoTevXuvlfohcfZ7j8TPiT7BS/EyVsG8Oc1JCLk7sVBYuTrjtX+qiM9hLxaMaHU
 tvef9TR0E+rY8K8PBGoGNAV4IcWJ5ahhO6dJ0cIWiYE3vHh5CaNiUGEVzw6ofuojrZ6g
 SUCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jTxMqWO2
Subject: [Buildroot] [PATCH 1/1] pacakge/smcroute: bump to version v2.5.7
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes segfault on kernel without IPv6 support.  For details, see
https://github.com/troglobit/smcroute/releases/tag/2.5.7

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/smcroute.hash | 5 ++---
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index b472dfbc04..d51745c076 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,4 @@
-# Hash from https://github.com/troglobit/smcroute/releases/download/2.5.6/smcroute-2.5.6.tar.gz.sha256
-sha256  0be38f617e322daafaa941c02423239f5c117b940cf0f45bacadb6733c4b3916  smcroute-2.5.6.tar.gz
-
+# Hash from https://github.com/troglobit/smcroute/releases/ generated by GitHub
+sha256  7d2c83e11908fe37844fa9b49ae50924555c4e1bb440fb059a95c94e442ea8a5  smcroute-2.5.7.tar.gz
 # Locally generated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0c4f88ab1b..f7476f1100 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.6
+SMCROUTE_VERSION = 2.5.7
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
