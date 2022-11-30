Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23F8C433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882B581EDB;
	Wed, 30 Nov 2022 07:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882B581EDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4bMSzMzvPHU; Wed, 30 Nov 2022 07:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5BC181ECA;
	Wed, 30 Nov 2022 07:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5BC181ECA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B83831BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 945AD60AD4
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 945AD60AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWTPtZXau5Kc for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:55:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4906B60759
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4906B60759
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:55:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso750467wms.4
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9s1/cZ33n4JtUVcAxETyobwV/Q0RwrIeB5DHKvVARk=;
 b=27mXxMQwwmpVNe7hXd/VdlBhhuCiQOFJHnhgSX1X4zM8rLSiYtMuLM9hTIQDkViez4
 UuWTwruh11Qb4dLLyWwxXU9/XO9uitC3E4q4IBA8Jo/9GfgELsHv/YsluzjCc+8KE6OR
 XplUsEVdiu2e1m6K2f6MQ+I75yjdK6as6ZrDgYvsD4Pftf0N6KBmA0T8Sc5CKyhJ6j2b
 hBg2+CxOUz2BK6kEcWL+0/HS786qXj6scI92Ks5merlGnmG9zmb4bl++s01RJMea55pR
 OhR5Wt44DW1DGdNrWG3iY4FpQ93eTfdHjfiRnMs+LVRxWOm1OSHCFEY8im4t8qXRhAv8
 vSNw==
X-Gm-Message-State: ANoB5pkZjRlCt+4syXzHgT5kdVeyaJ8GB48e4ydQKjgEhDa8eGfbPRtO
 IvlOYmPo1XAInaJidD+lQlTbYRtZK8kKTg==
X-Google-Smtp-Source: AA0mqf5IPDW2c6Ss6T6i5eBDKETiZrmjCYgP51N6kkwdhJ3yxpLtQvbiWQdvvFB6xMxEeJAQY75Q5g==
X-Received: by 2002:a05:600c:5254:b0:3d0:75d5:c64b with SMTP id
 fc20-20020a05600c525400b003d075d5c64bmr336499wmb.12.1669794907203; 
 Tue, 29 Nov 2022 23:55:07 -0800 (PST)
Received: from lmecxl1178.lme.st.com (87-88-181-79.abo.bbox.fr. [87.88.181.79])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm677511wrw.84.2022.11.29.23.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:55:06 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:54:50 +0100
Message-Id: <20221130075452.2507453-5-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075452.2507453-1-etienne.carriere@linaro.org>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9s1/cZ33n4JtUVcAxETyobwV/Q0RwrIeB5DHKvVARk=;
 b=rb+vTbh1UUqExiGV6QStBw3WbtQ5mBOJp0yhXuA2nwh/NxUHVOkxk5HWMkDq1y3yiz
 ANi45uncLSRkBxbbPkqUKouosxvFYmg5UwN7CFuZ58Aw3y6dFfn4P89yVYWKEYTp089P
 mx2hWPHCYgpKWGD5LMORaMTIfSEfd/JtkxAqziCClNCMUNOnC7N7zw6q0xe90ZSPyfJr
 r3x38Y/kMv2K//qkCCh3NJxlpvO1tqdxYY0VRclQSf/aRmcyILxk/n9s04pzdTZkHCzK
 zZmeoeE9J0sI5fzGJ4VMFpJux95cD8Ft0jn58xj5Y1Db1owFAFQObWVEvm+4lEWGWrFa
 VB3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=rb+vTbh1
Subject: [Buildroot] [PATCH 5/7] package/optee-test: bump to version 3.19.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE test package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 2af1768155..4da3807bb5 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.18.0/optee-test-3.18.0.tar.gz
-sha256  cc36a9afb99bd299a3d3769ad634ab7d5cb0e27c84ad04e14c0ff593db0f3faf  optee-test-3.18.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.19.0/optee-test-3.19.0.tar.gz
+sha256  9435901e9329a25ef4de3904e27d80377b8bb4dd6b215e8fb29d66a7b76afa11  optee-test-3.19.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index d522bb3300..7b065b6123 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.18.0
+OPTEE_TEST_VERSION = 3.19.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
