Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDEEC678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 22:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89DCA60F7D;
	Sat,  4 Mar 2023 22:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89DCA60F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjZZpUMF7agW; Sat,  4 Mar 2023 22:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B298560C2D;
	Sat,  4 Mar 2023 22:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B298560C2D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E290D1BF591
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8E8360C2D
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E8360C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54HaQfzYmo7g for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 22:38:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA90860B35
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA90860B35
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 22:38:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so6005876wms.2
 for <buildroot@buildroot.org>; Sat, 04 Mar 2023 14:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677969497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zMSY0fT13mStyRtSm6XIYXCGkfaLp0iZdyBiUbfpaj8=;
 b=d2LWuhGdhfHfzt8ku4D2x3TJr2PTDMROJ+5Pif4S5L5Y6sRhe7Xpa1ih3dNqqwPXVY
 jiu8WeL/u5Atw73J7IgYQvanJvuca3qZFKuRaEvTm1Hqs8VfU245cvVgRQ1BMn8NGJr0
 bddGzZ6DZ24DiNcAnMUPXiU4lsxBvfZZYnLBxbZxNd5YudkxCEFc3YGGmDy3jGr4YSR1
 2NDtbUBROau/kcZV2YoivgjcZWTfYzfNyDXOp5uhBs7trY2dLNNny/nhl7r5hLeaCWge
 5Pp03qmuxk4ug1vmmi4vRidIqMzN+vLB0L5chxTQ/vtqJyrXzGprXK6HPZnKR647xOvQ
 8RiQ==
X-Gm-Message-State: AO0yUKU7wG3wxZk4A6GhGOk8pL3q2AiQCTlki6KaN5D/61qMqO5XS3TU
 dE2EeV2LRrnIhgO77CZxeeATskdqIQ8=
X-Google-Smtp-Source: AK7set8oo+HxV90U33mh9w5fQJ8grDatM2+XNaVHi+9w0f3rT08AK/dRAFM7Wr0keBqTwS8vsh0Mrw==
X-Received: by 2002:a05:600c:4e0f:b0:3e2:2057:b9d6 with SMTP id
 b15-20020a05600c4e0f00b003e22057b9d6mr6983596wmq.20.1677969497184; 
 Sat, 04 Mar 2023 14:38:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003daffc2ecdesm10502301wmo.13.2023.03.04.14.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 14:38:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 23:38:07 +0100
Message-Id: <20230304223807.27864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677969497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zMSY0fT13mStyRtSm6XIYXCGkfaLp0iZdyBiUbfpaj8=;
 b=SDT3Lm6voLpMW4aoCOkXky0C2LcxjIFMyQBuxwLrTiUeWZWy+7+0shHH6G7q8aIFlA
 7VPAcLZOgnb7Ewo49ytZHAiAvnEz1k2QWLMQ5kFkqbfx9xMArHXCQidRPLPbKxn1jiHc
 dVi712Xgpx+kfBs6VH3koKElhgzBzupCuig6shfauIriTELKizEUYOpp6YuwD21sPDfp
 EEWXsAO4KhuXtNPDC/F/IH8W/uZLXV64NUWW30I3dWcTuwGZQ2TUm/T9jX5Cdf/9dteJ
 9UOe+Se2/KtoXL5rfXCAInlJQ9IvUwj62uf0oqdmWdVHsmWkHCnTVMZZOcttLNXeIoaF
 STxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SDT3Lm6v
Subject: [Buildroot] [PATCH 1/1] package/libolm: add CPE variables
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:matrix:olm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amatrix%3Aolm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libolm/libolm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 607e50702f..6f06686555 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -9,6 +9,8 @@ LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
 LIBOLM_LICENSE_FILES = LICENSE
+LIBOLM_CPE_ID_VENDOR = matrix
+LIBOLM_CPE_ID_PRODUCT = olm
 LIBOLM_INSTALL_STAGING = YES
 
 LIBOLM_CONF_OPTS = -DOLM_TESTS=OFF
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
