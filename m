Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D060C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 16:07:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4072861019
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4072861019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BC8606E6;
	Sat, 31 Jul 2021 16:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zTWc84nc13R; Sat, 31 Jul 2021 16:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4879360655;
	Sat, 31 Jul 2021 16:07:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D38A11BF2A7
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 16:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C336040411
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 16:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0yinlJRNPqz for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 16:07:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C695D40410
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 16:07:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b13so4660941wrs.3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t9AFyVBL0+N5h9d3JlBORYqM4bMGLNru6Aa17I1SStE=;
 b=ZLp9jKjr3OyGHxceYCKIPdGmPhQxpV+Dmx4h/HwLGh/Nrt5pLBs3YYzHDYfzTQaf8S
 wJGhDuAuLK19lA1ze15eYck1Q8I6beYonmBd+d7r7NNrhaQbVQau9LN1d9AjGC6PnlNk
 BgE3t3YFEFB6X19CpDrQv7T+eOCs/I8EswbZ6JYS65hFPv6uE8U3J3IliSX4i2IZvmz5
 ipkIm2PE/rpMnSr8N234CtWG8hREYvi/J7dZ6Vl7YQlqgk+dsOPRTDvVQJuw/78MiMg7
 EwCcSZhI2pdt+rzc2DMJGplw/31q0l29V2r470LXgwWAYYBUA25WDPibo4H+zxHPO8ka
 sqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t9AFyVBL0+N5h9d3JlBORYqM4bMGLNru6Aa17I1SStE=;
 b=pZMwuVdib0ydomam+ZY4NoLS+tBVbDHaVeFu/hmAkCJ40AVmTveUVd06K8PLDR3W0y
 QtC1ZnQalBYI5Gs54r1KNTLqYfKRxLgW+kTQQ3KeGvCGlF8BL4DA8x63mqbRy5HwvsXm
 q1BcjX9FzvGF6qc48Y5Uj9Da7VchaBtLx9J15Vej2X/0LbnuMi6E+2max898KkIbOQmW
 4prtFWBD8xpqwRcM3hOZ0AxyjTtc5i14FfA7P1FC4dN3tjkt2+9w5UtpwD+CPNTl+17q
 03p0LXF3RULT5MswivYO4iVrd6UTL2o7/Gtdi2HkQoK+92EIcrFPFEPY4ugpB3BCQdNt
 63ig==
X-Gm-Message-State: AOAM531y+1ToYGhW+vcjepDRO3d9ZMDHz4Wx+G0ttGVh3bwY7H6wXwU1
 5yhQgqyEBULOoPRVo5wBC6wFLY34qs517w==
X-Google-Smtp-Source: ABdhPJw3kMwSPB4BcO3ES9WhUiDD/28D0CnOOJGJbsichqj+vjDTRYU0C3no6y7AhEqc0zf+oVBeog==
X-Received: by 2002:adf:f590:: with SMTP id f16mr8046023wro.162.1627747625413; 
 Sat, 31 Jul 2021 09:07:05 -0700 (PDT)
Received: from kali.home (pop.92-184-116-145.mobile.abo.orange.fr.
 [92.184.116.145])
 by smtp.gmail.com with ESMTPSA id w13sm6370770wru.72.2021.07.31.09.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 09:07:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 18:07:01 +0200
Message-Id: <20210731160701.1234967-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ibrcommon: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from ../../ibrcommon/data/BLOB.h:25,
                 from BLOB.cpp:22:
../../ibrcommon/thread/Mutex.h:43:40: error: ISO C++17 does not allow dynamic exception specifications
   43 |                 virtual void trylock() throw (MutexException) = 0;
      |                                        ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7a9a4319916efe8cd7e04b8686a9ae0b233b017a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ibrcommon/ibrcommon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
index 4d2d351c88..d9e843ebc2 100644
--- a/package/ibrcommon/ibrcommon.mk
+++ b/package/ibrcommon/ibrcommon.mk
@@ -10,6 +10,7 @@ IBRCOMMON_INSTALL_STAGING = YES
 IBRCOMMON_LICENSE = Apache-2.0
 IBRCOMMON_LICENSE_FILES = COPYING README
 IBRCOMMON_DEPENDENCIES = host-pkgconf
+IBRCOMMON_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 IBRCOMMON_DEPENDENCIES += openssl
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
