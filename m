Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5649EECAAD3
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 05:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDD360A9D;
	Wed,  7 Sep 2022 05:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDD360A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIyvUlNx16oA; Wed,  7 Sep 2022 05:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136CB60A92;
	Wed,  7 Sep 2022 05:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136CB60A92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73FDA1BF5A7
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 05:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B84881831
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 05:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B84881831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfRCrwFFlyep for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 05:22:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF1681826
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAF1681826
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 05:22:01 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so9883049pjp.2
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 22:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=1PgICrY0PdM7dboNHzoqV/9LIbAKRx/AoYGkApQhm7w=;
 b=rTE69kf0cN2xnsW93FCMRkF8dPeE0uTZvL/oIHAcRh5MztE48s0j1l5t6NwYQYEoiN
 Ci070EDvcXmvx47rknBPGl+dT9gSLitBNqhKnelrN6vbSapd6S7Rk5zQf8pZGiXnwWKS
 H1PEWWQwq04te3tBU5mn6HoG6Tdq6CoiR0UyrRYRh++GTR+fkDVE2cCc6ZRRfLrVwuFE
 mKHO+M18XkMXs8D+8Djn/pSEGGVL/kR3eWfkEwNirbxDYCdpih1zmEZWtamgg556EGeb
 2A27HrPYkBuFlc18ILg/xDVMO0V4xotC9OI0QrXTdZHV2qJhh8xeIaAK04x5h/3tt4LI
 KMEg==
X-Gm-Message-State: ACgBeo0oCXdRA7lTwHNt1FPe0WrYAVCcEarIKgCFnRz62eczpIrpew3i
 baqeccn1ixqHoxjZNAOAH9LUg/BRPi6coQ==
X-Google-Smtp-Source: AA6agR5jZEv1AFWes1ZkImEhNyqCt6T7wRlut8tWTrkKBXAc3+JDdNapioKAKpDbL2zRrY4vRRePrQ==
X-Received: by 2002:a17:902:e80e:b0:173:23e:d5a6 with SMTP id
 u14-20020a170902e80e00b00173023ed5a6mr2140674plg.85.1662528120496; 
 Tue, 06 Sep 2022 22:22:00 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 x11-20020a170902ec8b00b00176b63535adsm5267300plg.260.2022.09.06.22.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 22:21:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 22:21:57 -0700
Message-Id: <20220907052157.156275-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v1 1/1] package/go: security bump to
 version 1.19.1
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.19.1 includes security fixes to the net/http and net/url packages, as well
as bug fixes to the compiler, the go command, the pprof command, the linker, the
runtime, and the crypto/tls and crypto/x509 packages.

https://github.com/golang/go/issues?q=milestone%3AGo1.19.1+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2b877145e9..657475adef 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9  go1.19.src.tar.gz
+sha256  27871baa490f3401414ad793fba49086f6c855b1c584385ed7771e1204c7e179  go1.19.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 2220953e55..9f0fbbde00 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19
+GO_VERSION = 1.19.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
