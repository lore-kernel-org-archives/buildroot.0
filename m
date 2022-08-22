Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3BBC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 22:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD9F5814B8;
	Mon, 22 Aug 2022 22:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9F5814B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVQScf4sp4e2; Mon, 22 Aug 2022 22:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E170F8141B;
	Mon, 22 Aug 2022 22:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E170F8141B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 984151BF3EC
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 22:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71AF54071E
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 22:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71AF54071E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1b04D64xJIK for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 22:15:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE977405E7
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE977405E7
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 22:15:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id be9so9253699lfb.12
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 15:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hbFN+NMgMsIjdcyZZRZA+rqFx03SLwhR28FKe0PD6fE=;
 b=LZbFyREz3IyWUYBuAhNa1m8AgsstJosS9UdO0C82IhcX03Y28JUYNpE0zsp4zTgbnL
 HjotIoSesq5agERk7eupJlRCysDIvLqp5I4PG8amrrx/DxbaCEKQ46nJpXgYd8X5Sh1l
 iCfQdlaWARZcacMFYdiivbvwpwUZQS/fUxQk1f+KmUYww8SYH8EieqkEuCDJg3op2iHT
 aMmLP+6pmNJTdCr3ZjrhoVPJ7u61yVhtsk7fRXJjg+yewaEd6mlW0WMwbfm4ktik+Xms
 cWlGTVkH4P+L7C/xS8VgCKPzxeQuULGyRt93m9y+39nD2h1Btj7s31JK1NIU++XNTz6J
 mDOA==
X-Gm-Message-State: ACgBeo2LcLrWtQIAvQgeMJ7v4AqT0+QNFS/YLDj8jvLsomT3GdRS2ASX
 ZLN7J20lSpSQL0KnArAsSws7g5DjqUU=
X-Google-Smtp-Source: AA6agR7LFi9lqUZmxqZX9l2ciPwrkI2Ya3E7Lqh22EvjERve36GmPq+wYFP3XZG8a5gyEtFSRF8wqg==
X-Received: by 2002:a05:6512:3151:b0:492:f0b1:b840 with SMTP id
 s17-20020a056512315100b00492f0b1b840mr792413lfi.120.1661206525484; 
 Mon, 22 Aug 2022 15:15:25 -0700 (PDT)
Received: from nibiru.. ([2a00:1370:8172:1de6:b11c:c9f6:aeed:f134])
 by smtp.gmail.com with ESMTPSA id
 r5-20020ac25a45000000b00492f049258asm300771lfn.65.2022.08.22.15.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:15:25 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 01:14:52 +0300
Message-Id: <20220822221452.388659-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hbFN+NMgMsIjdcyZZRZA+rqFx03SLwhR28FKe0PD6fE=;
 b=RIM/IfnCvdYm+q7ZWKflEfit0dWbCCqUOIhzYBzx2kr/qSITLCa9RMH27HAXbcuX3+
 AG4KNynrMdqFpVfX6jlwGsGAahwtYreg+qkjrrCj9xo7zv6aGcMlgN8y6V0+lmZGdumn
 weFtFd0a2sLZKlCpjcWZVs5PvhQlc4jseL8JKrf/HcQtlb9JhclDqDY3BhYFajkv2x66
 gFaB0T0J/RQXBCCmGOv97NI/HjOzkR+QhBUzxLNMF4xK0cJIhUqNqPofZxSszOAxyN1Y
 6HiepcDbddyf+Tzaz+TyWzwLZGdTczVzerrZsrrtCe5j3SbVFV8MoVCIQDRvO620KxmW
 C/JQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RIM/IfnC
Subject: [Buildroot] [PATCH] package/sdbus-cpp: bump to version 1.2.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.2.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 3a0e863a86..169fad2807 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  35e939fdd9c796522702c9c8762dd59b5c47f3440c01ba9feb9921c042780b55  v1.1.0.tar.gz
+sha256  7f7231904abb6a996b8c18ddc5fb50078ef5dff5191649abf9f127aff41d24e9  v1.2.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index e0fbc5c856..0e8d74cfcd 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 1.1.0
+SDBUS_CPP_VERSION = 1.2.0
 SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
