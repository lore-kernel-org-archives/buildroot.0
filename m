Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED08C001DC
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 01:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7513A408EC;
	Mon, 24 Jul 2023 01:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7513A408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kMhWmw-Gqev; Mon, 24 Jul 2023 01:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576A5408F5;
	Mon, 24 Jul 2023 01:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576A5408F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75CEA1BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4893C81E58
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4893C81E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNwB6vyW2wxi for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 01:18:15 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED1EE81E4D
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 01:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED1EE81E4D
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b8ad356f03so18558625ad.1
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690161494; x=1690766294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CDjMbNtZFoO/cV30XSEAHb/mf+N4oZnnv/anUGBYLS4=;
 b=DQr6J6mF7iQE1r++P6EdA1IsTTWQUQ9qE0UE3iodc6HXGI1NcHPZvYFIJqyIADjExB
 rNY1igrGA6X1nOw4jrjysOO6zwpqjLK/z3t3LfYw6TLB/7pf0NDxOLo7Mvcw+8qmbBXL
 CzmusoQ/ITy9JoeoHwQ61v+bMdmqTBkK8uvMg58AA0GqAJFn5w4bXzpvSknr+Ooupx+A
 HMtPbdt/jx9kQ4lEgSXOdiGW8zMJSKINjTphe7+AIn+V/Rh3r9snK37soOZ4Xc5L17v8
 SCXs4JY0wGJEQoxujVJ2/o+tv0E6VVRszwk32mAq+sCjs4ga1MoUHJlJT7xVciyGqmWr
 rCgw==
X-Gm-Message-State: ABy/qLaUZza8hWDQoR8slJ2QGD69/w8gWa5ryG8iiMoE9q3boHwZGdDv
 gFm25yJSi9gGUUGBfq0+mh3EiT9vrZXMVJgM+bqEs5Mw
X-Google-Smtp-Source: APBJJlEf4GQN2s8cRLCO8M+7Pe+d6OwVApkbFIhRr68WA+33QqO+gu7nQpsYh8HfDuw4sHdyKiL18g==
X-Received: by 2002:a17:902:d4c1:b0:1b8:7625:3042 with SMTP id
 o1-20020a170902d4c100b001b876253042mr7329999plg.10.1690161494101; 
 Sun, 23 Jul 2023 18:18:14 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j6-20020a170902c08600b001b9da8b4eb7sm7495073pld.35.2023.07.23.18.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 18:18:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 18:18:11 -0700
Message-ID: <20230724011811.434148-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690161494; x=1690766294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CDjMbNtZFoO/cV30XSEAHb/mf+N4oZnnv/anUGBYLS4=;
 b=EHaDiFq2RLGFZDOtOPGzt5ygSgciLQHbc8zxX2OCER2xeG0f0RX0mMEG59+7R2huN5
 0yxeIWI0KRSrycIff8FV2286MmgMFfnBVU7ZZbU8WDjLMRGePfppjmsBgJf2+bjIT8Do
 DfHVtyiizzQ7pEjMnYegrdtjU4mCuj5GliAqdVVhk60fOgM0Sw0GkIugncYqrnDQZFvX
 vEZ7pf1gS21Z6dRJA0psDh7HJbWCMyBAI6NwmGsRA/N480VL+N78TfuKT2vjUPFq5IA6
 TKCFQpHMSB+TzKIOlM0Ad9dILNSDKStJReVHJGlbAvfs+MaeyV4MONMMCUF42De4d2ko
 9dfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=EHaDiFq2
Subject: [Buildroot] [PATCH v1 1/1] package/go-bootstrap-stage2: bump
 version to 1.19.11
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While it's not strictly necessary to update go-bootstrap-stage2, we can
continue to update the package to the latest 1.19.x until Go 1.19.x is
discontinued, at which point we can leave it at the final 1.19.x
version.

This package is only used when bootstrapping host-go.

go1.19.11 includes a security fix to the net/http package, as well as
bug fixes to cgo, the cover tool, the go command, the runtime, and the
go/printer package.

https://go.dev/doc/devel/release#go1.19.minor

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 3 ++-
 package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
index 874737ea2d..a698adaa23 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
@@ -1,3 +1,4 @@
 # From https://go.dev/dl
-sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
+sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
+
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
index 477c24299c..72f3200a2e 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -6,7 +6,7 @@
 
 # Use last Go version that go-bootstrap-stage1 can build: v1.19.x
 # See https://golang.org/doc/install/source#bootstrapFromSource
-GO_BOOTSTRAP_STAGE2_VERSION = 1.19.10
+GO_BOOTSTRAP_STAGE2_VERSION = 1.19.11
 GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
 GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
