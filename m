Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB71C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 16:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540D081AEA;
	Mon,  4 Sep 2023 16:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 540D081AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4h0S646P0mx; Mon,  4 Sep 2023 16:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5522381AAB;
	Mon,  4 Sep 2023 16:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5522381AAB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 136111BF364
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 16:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E084981AA7
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 16:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E084981AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvG40FwH5nds for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 16:34:48 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD0568145A
 for <buildroot@busybox.net>; Mon,  4 Sep 2023 16:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD0568145A
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31c6cd238e0so1565723f8f.0
 for <buildroot@busybox.net>; Mon, 04 Sep 2023 09:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693845286; x=1694450086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tvMqL7iwkfNee8Aumbb1oHwgbbme593ikoHyeI2/Z+M=;
 b=JQOfM9Hbq7sBRNkjdv9zX71GAVFvdcqtcv36PIzK1WmcmGBgwRkYbkawnRGWxx3jnN
 iqe3Gb0VRTJX/h6GOpFZCZ4vhi+vE2xw9Cd6xgseZVt2aJa/rZIIZuE0L+B6KwSvqis7
 ZzlRyI4PpUPJIRbBOCnyAzA4D3RjCRffc0vpNuo/pthV5jeQ+r2i4WjFC2JosjGO+0fE
 +oZZ8MCCzSskSAknEa5EkYjIVRgU7IbhVc7PT9+j2WwXn5K5epmifRFuEnxEcVosZK9D
 LWrurCT+JEfyo5H3cjBHNyeKUMd37ka1VZC1qJiz1xZ3qGEKH8bhIo/n+oBw/LmdqHUH
 pZzw==
X-Gm-Message-State: AOJu0YxHUgF5v4jif2r9GlHLE45A6HDph12GiWRoYEEtX7LyABtoq9Xh
 zPniY6WBZDfbaArA11M/L93hB3taPZk=
X-Google-Smtp-Source: AGHT+IF8rxGTHwEBps5Ne1rQGC0ZudSYmiEGf/RoTPuVl+tk0QfpJ6Gyr03vnQq7utqavcnTAbj4rQ==
X-Received: by 2002:adf:f10e:0:b0:31a:cca0:2f3a with SMTP id
 r14-20020adff10e000000b0031acca02f3amr10873378wro.0.1693845285621; 
 Mon, 04 Sep 2023 09:34:45 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c1d8300b00401e32b25adsm14863991wms.4.2023.09.04.09.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 09:34:45 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  4 Sep 2023 18:34:36 +0200
Message-Id: <20230904163436.1131078-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693845286; x=1694450086; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tvMqL7iwkfNee8Aumbb1oHwgbbme593ikoHyeI2/Z+M=;
 b=Uybb5lQvZas4aV+tM6/MzpOxVwVq5AX+zmJ7TFOsyj6EaQ3n5A7pQXpmXeFktzI6Gr
 9ijL2qg6VDKr3mjxo240Tnw79XAwsK32SlrFXf3j0xxFe1kC2yeN3JVeyGEkH+F+qYfj
 FDAULBwwCGMDx6Qdqk43oVv+XlvCDX1+k8lcGIJNqryKnFGeztLoijZwYjqItmrMneg3
 pUQoXA0npO5uZuE+jRS/a8ZeQZxU5W036pVRHIII0uGgL/ADv8km+ZZzF6wjF/ETlIM7
 dTzBn71bgCe854/4ICiq0xRy4AqvrL7fqQOKn2oQpAFBrrDWIgN0oF1Ejb9q/38bMVcD
 v/ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Uybb5lQv
Subject: [Buildroot] [PATCH] package/libtommath: security bump to version
 1.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bugfix release only containing the fix to a potential integer underflow
which got assigned CVE-2023-36328.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch  | 2 +-
 package/libtommath/libtommath.hash                              | 2 +-
 package/libtommath/libtommath.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch b/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
index c25002ba7..1cf411b39 100644
--- a/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
+++ b/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
@@ -20,7 +20,7 @@ diff --git a/demo/test.c b/demo/test.c
 index 998f14b3..f719709d 100644
 --- a/demo/test.c
 +++ b/demo/test.c
-@@ -522,7 +522,7 @@ static int test_mp_invmod(void)
+@@ -625,7 +625,7 @@ static int test_mp_invmod(void)
  
  }
  
diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index 9af489ef1..4f5dd4023 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  b7c75eecf680219484055fcedd686064409254ae44bc31a96c5032843c0e18b1  ltm-1.2.0.tar.xz
+sha256  986025d7b374276fee2e30e99f3649e4ac0db8a02257a37ee10eae72abed0d1f  ltm-1.2.1.tar.xz
 
 # Hashes for license files:
 sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index bd3957d6c..25d4e836b 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.2.0
+LIBTOMMATH_VERSION = 1.2.1
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
