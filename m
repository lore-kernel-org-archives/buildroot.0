Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A05C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 01:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5FFE40CA7;
	Wed, 22 Mar 2023 01:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5FFE40CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWwqrZJQmm0J; Wed, 22 Mar 2023 01:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1C7B40A53;
	Wed, 22 Mar 2023 01:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1C7B40A53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72CD11BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48D4940A53
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48D4940A53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tM7iVBlLQSFv for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 01:34:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD1F401C9
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AD1F401C9
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 01:34:21 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id l15so7612101ilv.4
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 18:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679448860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qrUmIju8CLsZPAf2uZ1CNzgAU12dnFVKywut0CQj6vw=;
 b=hKB+w/Q8v1eA8egfZWhntPaYssQWP2zgGSlR/fWEQonkp1i3ruKH726hqjG+ePHpGz
 /GgKeX2nWs0aheSmfFZ7pJlfsBTTK8IKsImThnhwYcjA+SVnvWpNYoxTNFD8ik/Hl3Me
 pje+RIK0HGGrCvosr2tsFdfyXKI3MEd1UY1k7XHuruFhJDmblUdgyduxellNQ1VrArbJ
 fJc3JBNBQNSAc3U4/Vcx6CohsyfmGHnrQw58mPOuX0yVBmtfRRhP0HA1iQ7uHQVimplE
 nB/8QFnLTURH2TzzMcO+U9+XP+gDvVShHAWtzmB0YK5xwBIzzDmAiagDthUkAUxa6yol
 awjg==
X-Gm-Message-State: AO0yUKXWG3okIrCRJdNd8xTdubuG+0amr6qxzyhewpcV7zwshiYc8dDx
 CL39ucNumqqS6oaIPXm2ldPEYUosVlz+NA==
X-Google-Smtp-Source: AK7set+mUSLQv8X6hjDR84ZgT1g6Pcfo05DPrWRsHfL1YokwHg1gJvNA4Lk0B6osH20m0daPnDqhjA==
X-Received: by 2002:a92:d244:0:b0:316:dcfd:1b6e with SMTP id
 v4-20020a92d244000000b00316dcfd1b6emr2816305ilg.30.1679448860041; 
 Tue, 21 Mar 2023 18:34:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 i44-20020a023b6c000000b004054d7eede5sm4578039jaf.22.2023.03.21.18.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 19:34:17 -0600
Message-Id: <20230322013417.51209-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679448860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qrUmIju8CLsZPAf2uZ1CNzgAU12dnFVKywut0CQj6vw=;
 b=jrI6Yh/2J5LRC6M30IFT305phFFDpO3lhg7Zw88qJB8ycSd9f4nHNGLtEjxAz4X3wv
 +Fih4lLC55vS1opC5k1kaDsJvoUYTEHElDX6zUiCxcaANGSvgZCvFTyZLf+TZU+s2pUx
 QRoW9koNXxlHEFHtw8v/gOy0c05UHIvCubVDtMmk006VRkIMDCAJRfD3LLgZ/VTGW3g5
 rIDwq88iLdgMcTMWgUfJAuXHD1Vtp8TAFbfR7uxMK4h7qKaeSAYnHdK350RyHcMUhoCv
 wM7PNqvg+sX0KNpVh2ahEhyc5BxhsKoQyK166Hrj7Tv5wT+apk/PWPbKDeZcw0VHHCHZ
 s/+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jrI6Yh/2
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.12.1
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/python-babel/babel/commit/9beda0bed2600af47827ad200b0c5864c542c617

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index 2b2f56d8c6..f2026cafb3 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  9ee7784fd452d456206ecd3a12694010  Babel-2.11.0.tar.gz
-sha256  5ef4b3226b0180dedded4229651c8b0e1a3a6a2837d45a073272f313e4cf97f6  Babel-2.11.0.tar.gz
+md5  9ac7d8aac42c17a1e6d922017058d2c8  Babel-2.12.1.tar.gz
+sha256  cc2d99999cd01d44420ae725a21c9e3711b3aadc7976d6147f622d8581963455  Babel-2.12.1.tar.gz
 # Locally computed sha256 checksums
-sha256  2499aec3c5f041c3ac2c448a15fb233314e4c20cbac1530be04ec31b2788631c  LICENSE
+sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 35857dc127..890a8b02b9 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.11.0
+PYTHON_BABEL_VERSION = 2.12.1
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/ff/80/45b42203ecc32c8de281f52e3ec81cb5e4ef16127e9e8543089d8b1649fb
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/ba/42/54426ba5d7aeebde9f4aaba9884596eb2fe02b413ad77d62ef0b0422e205
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
