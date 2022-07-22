Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CE9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A5CC41B3A;
	Fri, 22 Jul 2022 08:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A5CC41B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6Ydx5-fiVys; Fri, 22 Jul 2022 08:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFAB641884;
	Fri, 22 Jul 2022 08:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFAB641884
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B897B1BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A00F241924
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00F241924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xv3eqYF4vJb2 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:54:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6265A41884
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6265A41884
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:54:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mf4so7489721ejc.3
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 01:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHY6D2rDm4yUVo/BSjw5LD84u9UjJwXXoukNHjti8eE=;
 b=mAITpLEHwMsULAx0mRUmtvpNghGMfhtXVgNKSfkDgQQ83UyaLqBQoc2WMgOOsm7hQJ
 /2TKZ288YU3EGjxNhONnC1pJwa4iIVhpo/DufbSVYbzEpP/d+T24HhcRbYrQb2EXkQpZ
 o8fv7bEOUwXBjCjKlOwOb0tTXKUbPJXnBjKaVdKFl/TzrYs2gvjC/JZglOjRJT9DFMIa
 enMF3NGbK8WackazLpDdQ5qKBT3kuhjyJlqMzNthqCCuxSSWqmTqdZdeiEmmNrkgqZWN
 83GdHqxHh5ow06Zo0fq5ZQ8zJEmd3HVEc+n0djZXUwFd2M1w40SIBwQsQ06FKvn8C+C4
 1YRw==
X-Gm-Message-State: AJIora+dOu8xu5rUxD2Re1/Xx/t2vsKfUODvdI+N49Fwc6lIPBKuVhie
 ILdNIJYNxHxTVvjGbVTVFx10p7xoL3myF0lT
X-Google-Smtp-Source: AGRyM1tw6g5ddtNxZCUMaIIwjuZCIGNxnVUWlmtgBceYOza3MohrZGhbxgXmYZLxtU1kUQ9fEbuTZA==
X-Received: by 2002:a17:907:7628:b0:72b:4d6f:ce8a with SMTP id
 jy8-20020a170907762800b0072b4d6fce8amr2309371ejc.59.1658480081292; 
 Fri, 22 Jul 2022 01:54:41 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:10fe:4180:33f2:cfe8:3447:ab97])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa7d719000000b0043a6c9e50f4sm2205718edq.29.2022.07.22.01.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 01:54:41 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:53:47 +0200
Message-Id: <20220722085348.645793-4-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722085348.645793-1-etienne.carriere@linaro.org>
References: <20220722085348.645793-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHY6D2rDm4yUVo/BSjw5LD84u9UjJwXXoukNHjti8eE=;
 b=q3f1aZxnbX0JUoJ9th7UUadM3lJfcszoAXbdxLJxhye4P2dS7meKWnEH48Vu+/MIL7
 +tdJLTwifM2WdIjcd0tQFePf/4yZUq49VvD3PMw5UhAiLK0Ftx4MqBOJNiwuQK3dM1H3
 goDVeuqjwodkbiutetB+OLFU+zhSsv3UY6rf8KiUU+JuVzbKvVoM5kFAyy+Lx3uMG6Xj
 2zhcgc7ig1FypJV+n/skvO/A6xTe18yXbP7sC5ddwfyouqkek1SCNqS3Mv47TpKilDw2
 uFp4eq99bLDZdq63APtVG6VxHFjMJbXJ6kmBDo+Gaqx/mzkgIXhfY6MrN1/toCFap6Hv
 oopg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=q3f1aZxn
Subject: [Buildroot] [PATCH 4/5] package/optee-benchmark: bump to version
 3.18.0
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

Bumps OP-TEE benchmark package version to OP-TEE release 3.18.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 54981c9d2c..27c91e0fb0 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.17.0/optee-benchmark-3.17.0.tar.gz
-sha256  50a4623a4c34909e722d403381e4077c84d7189ab3a7ed57a402a3461bee13e3  optee-benchmark-3.17.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.18.0/optee-benchmark-3.18.0.tar.gz
+sha256  2151aa5da062402518f35823d9c9dffa2e012f924625d2f7123e0d21d350a86b  optee-benchmark-3.18.0.tar.gz
 # Locally computed
 sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 1f5e01b868..1071c4bb5c 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.17.0
+OPTEE_BENCHMARK_VERSION = 3.18.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
