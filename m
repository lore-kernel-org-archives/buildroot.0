Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7248C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 19:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF9D6115C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 19:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EF9D6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0F680C6D;
	Wed,  8 Sep 2021 19:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RD2hK2siVson; Wed,  8 Sep 2021 19:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBAF180C33;
	Wed,  8 Sep 2021 19:48:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9F71BF397
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 19:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B39480C4A
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 19:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqYePVXG3J6w for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 19:48:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B10E80AF4
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 19:48:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m9so4975320wrb.1
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCSYKQKZ7296JO1JWTfxiGs4YWMskVCcTt3YfW7DXJ8=;
 b=DwsZop3RpSsd0keJJ7CrxUzpeQVJyVKMlKALsEq80cUf4KjDkyPDYIpMawPb/up+gz
 oIblie0dMExtCDATc3S0uXAhyIWgYodlzgNVuAfGrNIgY7rOqIWJkkLOon/qbSUMVG1P
 TJvABW8aIbKw8HtPidxHwu258T7x63AUGmlPi9l+qGFsh1aRtFxQwN3os0llh1uZxeM/
 Rco4V7yGXCI+E6F4lwscTx0L8rDDbtuq9feXalOaxW3wlnRcNGI+fEXb7QsfOFIWc1a+
 niQChmClDFEG5gxYYJzkN5tRdzoneztNK6exS5Qzc82T+8n+UYWRoGA+GJM+IINd3FAt
 6vNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCSYKQKZ7296JO1JWTfxiGs4YWMskVCcTt3YfW7DXJ8=;
 b=cUrg8AjhTrf1wE6QIPD37C5Mt3gwDpe5um3dc3GTWBBpFgOSa1ic7avQU1hwstxhIx
 UJp35bY2jbP5WVxgqZmkKGCHmPtcg2e8VT7QktxwcXEt4oWy+CLu3pxY8Ed8sWRPV6Aa
 8KSFnnm9dnnE1OqPsS37POvAFf41gGv+Fd9XCJjqocQuxcEwKAamZSu9fEPyW2QW8lT6
 uAJOw+ddcpi/3VDPIcWI/IQGU4VHeYjORNFRYdM2cd5Aj8d8qN6drLebULrWXiKfqLPj
 lO5vKjjqCNxrKEOjL/p5h0wqWlvhzHkUJBcNfmvLXC3kzkLgbI6ilqd8D+IO98u99z9V
 xDMQ==
X-Gm-Message-State: AOAM5300JIfoQBso6AM0dm8JCWHrYFRXf2s+EQCH1bksu12q6KTN+aVb
 yfIbfYaUPgSKty76sfbRtQPVqUyquiE=
X-Google-Smtp-Source: ABdhPJwrDKnheHt63DC6RBLJGeiX/oZfkPbuFZ3IdB6SSZGtWn730at03gI0x+M89JunLuuaq+6qiQ==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr21261wrv.402.1631130533991;
 Wed, 08 Sep 2021 12:48:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o14sm46579wrg.91.2021.09.08.12.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 12:48:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 21:48:47 +0200
Message-Id: <20210908194847.582017-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version 2021-08-R1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop patch (already in version)

https://www.kismetwireless.net/release/kismet-2021-08-R1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-nrf_51822.h-fix-build-on-sparc.patch | 59 -------------------
 package/kismet/kismet.hash                    |  2 +-
 package/kismet/kismet.mk                      |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch

diff --git a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
deleted file mode 100644
index c675654721..0000000000
--- a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b347fea1a5ba0f66bf15e7de56d748e0f0dd624a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 20 Jul 2021 22:27:45 +0200
-Subject: [PATCH] nrf_51822.h: fix build on sparc
-
-apple is not the only target that miss some defines, for example build
-fails on sparc with:
-
-capture_nrf_51822.c: In function 'get_baud':
-capture_nrf_51822.c:80:16: error: 'B2500000' undeclared (first use in this function); did you mean 'B2000000'?
-   80 |         return B2500000;
-      |                ^~~~~~~~
-      |                B2000000
-capture_nrf_51822.c:80:16: note: each undeclared identifier is reported only once for each function it appears in
-capture_nrf_51822.c:82:16: error: 'B3000000' undeclared (first use in this function); did you mean 'B2000000'?
-   82 |         return B3000000;
-      |                ^~~~~~~~
-      |                B2000000
-capture_nrf_51822.c:84:16: error: 'B3500000' undeclared (first use in this function); did you mean 'B500000'?
-   84 |         return B3500000;
-      |                ^~~~~~~~
-      |                B500000
-capture_nrf_51822.c:86:16: error: 'B4000000' undeclared (first use in this function); did you mean 'B2000000'?
-   86 |         return B4000000;
-      |                ^~~~~~~~
-      |                B2000000
-
-Fixes:
- - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/kismetwireless/kismet/pull/388]
----
- capture_nrf_51822/nrf_51822.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/capture_nrf_51822/nrf_51822.h b/capture_nrf_51822/nrf_51822.h
-index cf7fee1e..d9203f61 100644
---- a/capture_nrf_51822/nrf_51822.h
-+++ b/capture_nrf_51822/nrf_51822.h
-@@ -3,7 +3,6 @@
- #ifndef __NRF51822_H__
- #define __NRF51822_H__
- 
--#ifdef __APPLE__
- #ifndef B9600
- #define B9600 9600
- #endif
-@@ -58,7 +57,6 @@
- #ifndef B4000000
- #define B4000000 4000000
- #endif
--#endif
- 
- 
- 
--- 
-2.30.2
-
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 4c986a159b..9a9d2260b9 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f85939c9d32fa72d777db35c68af84c379171b94380acad0db7924f95a81bdaa  kismet-2021-06-R1.tar.xz
+sha256  1c8e31b1babdb0fc93ac38fd0772a24d4b40f865fbc292fa8ec7f4a18ced0135  kismet-2021-08-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 64f9501db8..819ed510d7 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2021-06-R1
+KISMET_VERSION = 2021-08-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
