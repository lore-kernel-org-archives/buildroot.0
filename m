Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ED1C07E9B
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1621C60FF3
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1621C60FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2FAA8303C;
	Tue, 20 Jul 2021 20:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8ARcAdBnPVa; Tue, 20 Jul 2021 20:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38CBC82F06;
	Tue, 20 Jul 2021 20:43:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA2CE1BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D67C66063F
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVMw8qkMszFb for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:43:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E84AF6062E
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:43:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id n4so120762wms.1
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 13:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oPI55YQo2vSJydmg57rZK8ArUT9ekW/kbwwb6ClWHDU=;
 b=tUns2EEBxyqKl7ECy70p26K6dLfBzFnP+InU5R4t2uHtXk1nf98oW43Vcd9RtefNOg
 GCV+1tJhNl4fzlANRb5EsTjihVqvcd3vND1nqiNCVALnehXPc3g96KyB6p5MXtXjxCDs
 j/rbVTPm3yW5XilW/d+hWhbCVGdv0OTLMOJ8JSc4jIn71XxI1vEneeRNzLjmE5FzFXA8
 QxfuotIy8KOYHZC1rGaZl3f3z1NQYoeEWu9ImPG7cCCdfnmRrbr8j5brU9+XtiXS/LMB
 fF+qnLRdaQJT7jQqT6xtNGP1NQIinFg/93EynV01FYefPyuzfCv8yCEwk3O/AXfQKXyG
 q6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oPI55YQo2vSJydmg57rZK8ArUT9ekW/kbwwb6ClWHDU=;
 b=rIj7FN1O2aFUNCvk88hINbpxiXIf/MDyNNhjgQhQVESVursInw5FIntVHVwyXPLsQt
 kd3o2dXoUKXoljryzTRCtYaWQsS/btXRaQBNiwS/oABrKI6EVOcEXgU3qYWgzZM/l/GQ
 rHuQJg9hSMLxjgpbFXmyVM0mZJa0kJkJezoLYVI+87ex0to0GTQrQJbaCpZ03uU4pFby
 NN3MEBUFNVT/Y3d9TuPfNpSj3nOtz/Pl9bHH0SM8DiVorJvdCr+9ro6Mr0dYQwummL1l
 4fYwpV2eqAZSCVO5F44K7EoBHlU6X/GEg/beHJyYfyh7RsZWLVR+44yj0jG0zV0KqgCb
 jbyA==
X-Gm-Message-State: AOAM533Apu4mxkrEnjbpxCpEs0cmHQ2TV4sNEAG/4diJXT07/fJG4igk
 N37QAuuwJ5wqyTJcJsE5XxWAlYWkGAIC8g==
X-Google-Smtp-Source: ABdhPJyDyVqtBJNrFQsf64AsEPGpDyUZBUwiXIhHKPTJBy3aG2Sh5j0YKlrnQIVZDLlsPJyTj0BKeg==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr295862wma.185.1626813806719;
 Tue, 20 Jul 2021 13:43:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id k24sm25709259wrh.30.2021.07.20.13.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 13:43:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:43:19 +0200
Message-ID: <20210720204319.79578-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build on sparc
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
Message-ID: <20210720204319.WgybfJFdaJI7kI6Jx_nSoeerTPKOyRH3T5BXzP9KwV0@z>

Fix the following build failure on sparc which is raised since bump to
version 2021-06-R1 in commit 5e3a1e6c7cc3e42b222ecbe30b9afaaa9d6b1c33

Fixes:
 - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-nrf_51822.h-fix-build-on-sparc.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch

diff --git a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
new file mode 100644
index 0000000000..c675654721
--- /dev/null
+++ b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
@@ -0,0 +1,59 @@
+From b347fea1a5ba0f66bf15e7de56d748e0f0dd624a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 20 Jul 2021 22:27:45 +0200
+Subject: [PATCH] nrf_51822.h: fix build on sparc
+
+apple is not the only target that miss some defines, for example build
+fails on sparc with:
+
+capture_nrf_51822.c: In function 'get_baud':
+capture_nrf_51822.c:80:16: error: 'B2500000' undeclared (first use in this function); did you mean 'B2000000'?
+   80 |         return B2500000;
+      |                ^~~~~~~~
+      |                B2000000
+capture_nrf_51822.c:80:16: note: each undeclared identifier is reported only once for each function it appears in
+capture_nrf_51822.c:82:16: error: 'B3000000' undeclared (first use in this function); did you mean 'B2000000'?
+   82 |         return B3000000;
+      |                ^~~~~~~~
+      |                B2000000
+capture_nrf_51822.c:84:16: error: 'B3500000' undeclared (first use in this function); did you mean 'B500000'?
+   84 |         return B3500000;
+      |                ^~~~~~~~
+      |                B500000
+capture_nrf_51822.c:86:16: error: 'B4000000' undeclared (first use in this function); did you mean 'B2000000'?
+   86 |         return B4000000;
+      |                ^~~~~~~~
+      |                B2000000
+
+Fixes:
+ - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kismetwireless/kismet/pull/388]
+---
+ capture_nrf_51822/nrf_51822.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/capture_nrf_51822/nrf_51822.h b/capture_nrf_51822/nrf_51822.h
+index cf7fee1e..d9203f61 100644
+--- a/capture_nrf_51822/nrf_51822.h
++++ b/capture_nrf_51822/nrf_51822.h
+@@ -3,7 +3,6 @@
+ #ifndef __NRF51822_H__
+ #define __NRF51822_H__
+ 
+-#ifdef __APPLE__
+ #ifndef B9600
+ #define B9600 9600
+ #endif
+@@ -58,7 +57,6 @@
+ #ifndef B4000000
+ #define B4000000 4000000
+ #endif
+-#endif
+ 
+ 
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
