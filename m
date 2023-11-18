Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9785EC54E76
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0666E60D53;
	Sat, 18 Nov 2023 19:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0666E60D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S65KP78GMkA2; Sat, 18 Nov 2023 19:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A58760B3F;
	Sat, 18 Nov 2023 19:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A58760B3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5E401BF34C
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 19:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CD6640162
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 19:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CD6640162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3iu8Gc3xMLK for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 19:45:31 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 291F340106
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 19:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291F340106
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-28098ebd5aeso2551753a91.0
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 11:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700336729; x=1700941529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lDcpha3NUhsv3MEc2m0AHylHUbQDiMNcaEMdHANQ9YQ=;
 b=j7xjQJj2lNJxPTk+rJiHJ+wBG39F6PwQzTlsCGJeevf+2WaNp0RAm+0TMvai82Sazm
 Nk43Us1EnF64GnUV2qaDeUBntaiq8DRBGWa9ewtkiqRXp5C1h5RJQQFcjcPiA11/yW7x
 vHyyVQ5PNwdBOtfMk8s1PV/BxjgjO6kYbjl2ueMR261uL7pfWwS2nI7oNUNh2NKq/I8r
 RESvq13zwOIVK98M3AE7XMqDyuGME2xFRbf+9/BtR8kj2GFFvep2y3F6W6q7pBBjIDTP
 QoGnWbT3JGJciqOkt2Ua8u8Q4X7I6BV+J7Rm3/ARdFOyzhfKfxg3oHdonCvOYQj/XKsX
 N7TA==
X-Gm-Message-State: AOJu0YyQqR3k/TELMbCK5WY7ggnFIX7l9FmyNs2BrCOhHKKTdX7LmsfI
 JpIj5SZPhAwaqnnWSnVYUwtCQN0DlQy8/qETiFPYOA==
X-Google-Smtp-Source: AGHT+IHUMndC5Uxx9MSjPFuEgW5gAiN7o2+Ez4++9lT4ClGroCAtSt3FRQcV8EeZdAGaRQus8UDDkA==
X-Received: by 2002:a17:90b:3ecb:b0:283:a71:63be with SMTP id
 rm11-20020a17090b3ecb00b002830a7163bemr2854731pjb.0.1700336729504; 
 Sat, 18 Nov 2023 11:45:29 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 nr2-20020a17090b240200b0027d0de51454sm5137688pjb.19.2023.11.18.11.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 11:45:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 12:45:26 -0700
Message-ID: <20231118194526.467059-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700336729; x=1700941529;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lDcpha3NUhsv3MEc2m0AHylHUbQDiMNcaEMdHANQ9YQ=;
 b=KIUaIaxX9gMybslREz4xB/rSlQAkG3MKRJNKAj7mgSiAOqx7mmxuPJ9dmmw2MDkp55
 cyoHz2VZZ9k7rmYrlWwNvmk0lDJcT2UUQFt2S3XeBMqAcVUOkYZ20QTXzpNJm7fq9xHF
 gtlxt5aZhTD8M0phLYsqnya9P1PoSn8uAb728=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KIUaIaxX
Subject: [Buildroot] [PATCH 1/1] package/nodejs: downgrade GCC version
 requirements to 10
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NodeJS requires GCC 10.1. However, GCC 10.1 is the first GCC release.
As such, we can safely downgrade the GCC version requirements to 10.

Tested with: run-tests tests.package.test_nodejs using Debian 11 and
gcc 10.2.1.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/nodejs/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 72770095d0..50d1360715 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,19 +7,19 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 11, wchar, host gcc >= 11"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 10, wchar, host gcc >= 10"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_11 || !BR2_TOOLCHAIN_GCC_AT_LEAST_11 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_11
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_HOST_GCC_AT_LEAST_10
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
