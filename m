Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6236C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 11:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1437E4174C;
	Wed,  6 Mar 2024 11:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qb1sQB9W1wsX; Wed,  6 Mar 2024 11:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1567541744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1567541744;
	Wed,  6 Mar 2024 11:37:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6554C1BF955
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 11:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51AFB60797
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 11:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBnG60LRUdYY for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 11:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=dgouarin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6260E60733
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6260E60733
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6260E60733
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 11:37:30 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d3ee1c9ea9so25294161fa.3
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 03:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709725048; x=1710329848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzrS7s1m3qtvAtfZjTmZWo9mrr2EaDR/MkmjbL66dEY=;
 b=JInhZdPWYL5NNfB4MtdfkZ9QvoS4woDKnMs/ZDr5QB4vT1bnfvQPwUdhelxICEA5AE
 981hz1mjNx//Sybct39lw5J3z5Zz0wucbiETEIXn6iFN3zHiPRI79Idf7WOiaRoa5K5v
 GIbF2tynhOb6wi6g1UgTJE+f5a7WfOa5FcuMgVYJVWieeJHiqNDsDTq1QYWJ38MZPfQj
 ug+2ZYpPJ8niziu3JPZEUYWMp6dho3LDYNdtuxiP5D5P0+U4oMJPwJxAZONaMnac7xoo
 tSjojP+6axW7C6fUro2W9tc38vE/7bUh+YqBp446Y4hQy8DbGHmYAWazH9q26PHQ0J7P
 FXHw==
X-Gm-Message-State: AOJu0Yw6wRdwyHmh5uVhE4NpyU05MqYh7rr1TxAx7G8L2JmXYcj+7pb/
 X5oBVJvzhazZLBS4rZvvYUwbJkckb2QNRiw/9VEvFLqltWM2W+obA3Oiq3rEOWM=
X-Google-Smtp-Source: AGHT+IHju8AzavAfTz/qdPi6HT4O/3fbOe6laQszbXmPfapfW93n1sm05NyDQpSgICyWOdo6hlnM1g==
X-Received: by 2002:a2e:924e:0:b0:2d2:71cc:253d with SMTP id
 v14-20020a2e924e000000b002d271cc253dmr3146341ljg.25.1709725047319; 
 Wed, 06 Mar 2024 03:37:27 -0800 (PST)
Received: from pc-de-david.. ([2a04:cec0:1024:d009:aa3c:6112:1dfa:2ac2])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a05600003cc00b0033e451a9b64sm6010436wrg.61.2024.03.06.03.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 03:37:26 -0800 (PST)
From: David Gouarin <dgouarin@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 12:37:24 +0100
Message-Id: <20240306113724.121900-1-dgouarin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709725048; x=1710329848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dzrS7s1m3qtvAtfZjTmZWo9mrr2EaDR/MkmjbL66dEY=;
 b=SMRJOilwxeuJctn01c2Wr9lLZ6wwu1bzpULqAqArbi1m0ZiSO9WLgp/8sEpaEFcePs
 qDch7uJDzi5kXPXkGyC42SsPdRQgWW/ahBGs6M3mg9PL/pI0UdaD0IvWYuXYg4dIWIeG
 U3z+uigDWSBpixQ7cDxwKTf1x+ypz63f/RCUFktV+4lwzHTy7PPe42MbjBHCYxsTuU8y
 twgZs6ZKvRWvtLjttiAl9KTSKnGO43fnWAXLevKBJDrmCUAHmDWVf1C0GkoJRYQitOGt
 qL4SQSVRGyyKionKWpOovnkD6RYfdqAfMzo1QeXZqkCK9jNRBxPosXiJmFPFS0bXz+mO
 6mVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SMRJOilw
Subject: [Buildroot] [PATCH 1/1] package/fmc: enable also for aarch64 QorIQ
 processors
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
Cc: ju.o@free.fr, David Gouarin <dgouarin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QorIQ processors family also includes LS Series wich are based on aarch64

Signed-off-by: David Gouarin <dgouarin@gmail.com>
---
 package/fmc/Config.in   |  6 +++---
 package/fmlib/Config.in | 10 ++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/fmc/Config.in b/package/fmc/Config.in
index c89a87c99e..1c6ae5e80a 100644
--- a/package/fmc/Config.in
+++ b/package/fmc/Config.in
@@ -1,14 +1,14 @@
 comment "fmc needs a toolchain w/ C++"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 comment "fmc needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMC
 	bool "fmc"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LINUX_KERNEL # fmlib
 	select BR2_PACKAGE_TCLAP
diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 97d55d1250..459d5bf102 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -1,10 +1,10 @@
 comment "fmlib needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMLIB
 	bool "fmlib"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on BR2_LINUX_KERNEL
 	help
 	  The Frame Manager library provides Freescale PowerPC platforms
@@ -33,6 +33,10 @@ config BR2_FMLIB_QORIQ_FAMILY_T2080
 	bool "t208x"
 	depends on BR2_powerpc_e6500
 
+config BR2_FMLIB_QORIQ_FAMILY_ARM
+	bool "arm"
+	depends on BR2_aarch64
+
 endchoice
 
 config BR2_PACKAGE_FMLIB_ARCHTYPE
@@ -40,11 +44,13 @@ config BR2_PACKAGE_FMLIB_ARCHTYPE
 	default "ppce500mc" if BR2_powerpc_e500mc
 	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
 	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
+	default "arm" if BR2_aarch64
 
 config BR2_PACKAGE_FMLIB_PLATFORM
 	string
 	default "P4080" if BR2_FMLIB_QORIQ_FAMILY_P4080
 	default "T4240" if BR2_FMLIB_QORIQ_FAMILY_T4240
 	default "FMAN_V3H" if BR2_FMLIB_QORIQ_FAMILY_T2080
+	default "arm" if BR2_aarch64
 
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
