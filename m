Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CCCC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 19:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7BF80D05;
	Sun, 21 Jul 2024 19:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMuMcZijHy-g; Sun, 21 Jul 2024 19:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE188119C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECE188119C;
	Sun, 21 Jul 2024 19:47:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE0651BF2AB
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 19:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9963D606B4
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 19:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yl_PO0nx16eM for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 19:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 853F460605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 853F460605
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 853F460605
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 19:47:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-36865a516f1so2393985f8f.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 12:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721591264; x=1722196064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Lbuxl6th6b87CSJp6CVGkfRT5QfwBH/+mBODy/0o2M=;
 b=Q4JK+mdhzeUb7vdEqL8wlWyfkM902arwaLi03TrT9O5zuqxLD963u6BhKJFTlQXKLJ
 vQzVRg/ok91KwkxXuil7i/4GKLvLNGV5zhbfIE/D+AxOgMBVXJIZ7drppcjN48J1iANi
 dF9x85hV/TT7XIco2JPWYSTPntdWC3nCNobTz5J8oQ9/xQBfAI8SA3JjbQNqPNmT14ou
 VPXHuo1GblhYWY/M9Trr6JEbSheS0ZpFGUfZIhlMACvkG93owlQinoFx+YrYHKRkky4L
 12KPmMSGaAsoA/fnAQB07AMbdI42UpW49AesvxyO9s668XRDY1n+BAWzZZr8F98MwKiS
 v5ZA==
X-Gm-Message-State: AOJu0YzVU/Ks3hL5/kKeuN3G8jdTxHVziGIGGfgLv7VTs8mbw31e7VOC
 U98ko/lRy8O66uvjMIpQFmub8qD/SE0gr90bvb1lu8q2QmnCb0AwlBlwYQ==
X-Google-Smtp-Source: AGHT+IEBQZ721SVvHcxU83Ly39k4kFyTlc822O9zIAban9Fexit20fRtGFmX/9Obg1F1HHfPLYhxGA==
X-Received: by 2002:a5d:5744:0:b0:368:68d4:94 with SMTP id
 ffacd0b85a97d-369bae4d53bmr3748903f8f.17.1721591263778; 
 Sun, 21 Jul 2024 12:47:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868b26dsm6604665f8f.34.2024.07.21.12.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 12:47:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 21:47:39 +0200
Message-ID: <20240721194739.3040259-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721591264; x=1722196064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Lbuxl6th6b87CSJp6CVGkfRT5QfwBH/+mBODy/0o2M=;
 b=Vun6XNAag70ukFJa0sUbpo/nueBGLt3hOkAFiAIIFuVj+oasMLk64lmgTepzZZ9zMi
 rfy+wWrVaGosEQGkSSOkJhHYTqDuFZRJBPMM9ajwsVrCMWyi06+HFRN72kVJliY74QeF
 D771tcLwvCf4+f8WvB+WbcTOABHcWYkDPagzB865/qXwnwfIMmHWCiohGKlN//zdjoSw
 lsoY8ieDaLQlZ3KrQWCwnG3uQbUfHmaMS2wrsCm0u6mskiu+mYdxf2n/dvQ06wOOn+o6
 5pxxvZcWbjanhNhQHBh9lvwSxRgF530vwlIfXFsP/pUR4aJXb55pMZ1PcrEgA5jLC/eB
 MbEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Vun6XNAa
Subject: [Buildroot] [PATCH 1/1] package/libp11: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libp11 unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

eng_front.c:25:2: error: #error did not get engine.h
   25 | #error did not get engine.h
      |  ^~~~~

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/b03cc27a60f9e6794b3341517196fbf8dc3ec2d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libp11/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libp11/Config.in b/package/libp11/Config.in
index 3c7ccdee27..3bf13a6051 100644
--- a/package/libp11/Config.in
+++ b/package/libp11/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBP11
 	bool "libp11"
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
