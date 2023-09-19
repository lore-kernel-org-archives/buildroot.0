Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD0DCD5BA7
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 12:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA89F8216F;
	Tue, 19 Sep 2023 12:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA89F8216F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9PB370kcajW; Tue, 19 Sep 2023 12:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F264C8216C;
	Tue, 19 Sep 2023 12:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F264C8216C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97DE91BF3D8
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 12:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E21416E6
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 12:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70E21416E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZL3imJq3lseF for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 12:40:04 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A84E4012B
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 12:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A84E4012B
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so751001666b.3
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 05:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695127202; x=1695732002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Z4lA7PGATObml+ivhGFxBeD+IC0915rVDmN12H0Ntw=;
 b=pZpiFN0ViiL/9S0sGwuRcByvHxHaLYG2OFKHEbmMK61vzSiGOuPS4a2DiiJZ4KP1xZ
 zo98MLGmEA/XyeMO677juR5AFDQD7jVKi6wqRUmsgHr2n2vP554dPaVsZQ3Y+Ijxf5Ez
 fhMov8VRxra5LFk+B4eOuPOIAR663MbLHEQitQNBCuRCNbqdvsengXSfD4QkH4I4Gd0B
 NicM59GR9uIed/uNgt/ScrqUqlRSgNk7PaUWMxB1YsxOPmARxSD9q1gU4NFNtym3GsoL
 hausOhlwYEr2xUCVgTPGfp+BaOV4gET/XW0dOtIy19N7QmQzeMdwUBMmqA9TpXMVW3sf
 fhhg==
X-Gm-Message-State: AOJu0Yx7yZiuBr0vs26uXQqS91Lp2LyyrHV9z/XUvMF3MsdRwZZRljf7
 7C7YhVjtEGczOGk1HETWo7cePFsOJWfn9GjW+IAsgw==
X-Google-Smtp-Source: AGHT+IF+VH75wjASuUiKrnkcQR4ys9SAzdy8Gzs2gVnWUYBhD8Hs35QTSgT6iE5ETnabD+BgRhOI7A==
X-Received: by 2002:a17:906:7398:b0:9a1:c0e9:58ff with SMTP id
 f24-20020a170906739800b009a1c0e958ffmr9900247ejl.11.1695127201656; 
 Tue, 19 Sep 2023 05:40:01 -0700 (PDT)
Received: from angelo-ThinkPad-T470p.amarulasolutions.com
 (host185138219236.static.fidoka.tech. [185.138.219.236])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170906390d00b00982a92a849asm7738424eje.91.2023.09.19.05.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 05:40:01 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 14:39:57 +0200
Message-Id: <20230919123957.2614998-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695127202; x=1695732002;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Z4lA7PGATObml+ivhGFxBeD+IC0915rVDmN12H0Ntw=;
 b=pq9KtkYYiKS7xewehgfUM/qTs5ktrL6rmtbwMWo4RqV1tAYT3ltdIeQIG+UqGqQFLL
 DIQtQH/iQRgwc4j8mqyW+U8E6ZMxfOYA8f3T+GdebZs70npouIlQ4zWwhUKhu5oD6fRH
 fErrQP1i6IoYWzdN/fHYqp/gsYgd3D8ce3trQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pq9KtkYY
Subject: [Buildroot] [PATCH] package/python-minimalmodbus: bump to version
 2.1.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-minimalmodbus/python-minimalmodbus.hash | 2 +-
 package/python-minimalmodbus/python-minimalmodbus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
index b29e83773b..635090fae7 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.hash
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/project/minimalmodbus
-sha256  cf873a2530be3f4b86467c3e4d47b5f69fd345d47451baca4adbf59e2ac36d00  minimalmodbus-2.0.1.tar.gz
+sha256  c3f5a56e107d537e4bb420f7e735841ab2939c8ca6fb528f5fe4124571315b64  minimalmodbus-2.1.1.tar.gz
 # Hash for license file
 sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
index b463cf9ffe..5a6e7733be 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.mk
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MINIMALMODBUS_VERSION = 2.0.1
+PYTHON_MINIMALMODBUS_VERSION = 2.1.1
 PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
-PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/78/99/8cd22b4465e697bae2b02fd06aaccd4c5cdfbb18945d728db99f23d71df9
+PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
 PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
 PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
 PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
