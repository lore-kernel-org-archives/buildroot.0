Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784F6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 183D3422E5;
	Fri, 22 Jul 2022 08:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 183D3422E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nObYhbYiG1_s; Fri, 22 Jul 2022 08:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA85422BE;
	Fri, 22 Jul 2022 08:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA85422BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87C241BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6034340BF1
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6034340BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id od0c9GvFy3o6 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:54:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 684CF40A1B
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 684CF40A1B
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:54:44 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bp15so7463825ejb.6
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 01:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+N2AkPGnbp/n65wWvbgBi65N0YykBETytuMkQVXO00c=;
 b=MmEDgD3xI+lbioye6x147JYr4NqczFdvtVe7dfJgEL+hDvPgvxJUGbhgBsE+AcCCK+
 dLwbSHYbH2sDUyLC4kGnJFOK01wZf55qmB+CgnE3Xgei0jtLbWj/UxFITKkvjKGFz8P3
 PaD+3mOtAAn/rC5tB2vV1GNFTOma/5dhLvHfy5V1N0knK196YG9s9x7Q7w235niB+mho
 mbdInCgqYWDqpKxvC83WEJoH4rue7iRtB+GvFsq+9Ht6bdY9VORsVTDjuamCAAl2+DMl
 /zvut8+W4GC4YdnuxjC4lF4OWJpVD/BkWtiJmG6WbehB04eoIfXoPeG5UZgY5aNADQ3n
 MyGw==
X-Gm-Message-State: AJIora/pwA1jEkJBofqQg4e5cfq7Rf2TE8it4u8gD6pjHDZr1dv9Y9Sk
 WnOvvksOURajRWbaJrAeGprdZJIFLgqSYDey
X-Google-Smtp-Source: AGRyM1uqqPp4OskOUSQwKcV3Db2YD8Aun4r814mSH6LwAMyvDrCxHjFdOCUtzXR5WRJ/C247wpsaeA==
X-Received: by 2002:a17:907:2d8b:b0:72b:7152:aa8e with SMTP id
 gt11-20020a1709072d8b00b0072b7152aa8emr2202699ejc.377.1658480082296; 
 Fri, 22 Jul 2022 01:54:42 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:10fe:4180:33f2:cfe8:3447:ab97])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa7d719000000b0043a6c9e50f4sm2205718edq.29.2022.07.22.01.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 01:54:42 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:53:48 +0200
Message-Id: <20220722085348.645793-5-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722085348.645793-1-etienne.carriere@linaro.org>
References: <20220722085348.645793-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+N2AkPGnbp/n65wWvbgBi65N0YykBETytuMkQVXO00c=;
 b=woz/9xu6U8hgXQ+eQUol6TZgPWNRZpCcpu5QoM2nt5bV1nOA3xfMi5iqmEB7c2a7p/
 8q/jC42hpjM4roG7oQANLFEob7bs8eY89T8UxIqWZdCb+gFEFwvucujD1FrB4nXNj/Fc
 CJNJ0euLRHHFxu5IzklUSnGyQO3QW20aLBBBwi+QxgUOvwOhb67R9VNYH3t9oZJMNQAY
 cJvzH9RM/Cxkbs0NdbrBogCgSe4Jnkxw/LkemN6PsBESRt3yYycXC5+RYLNVl2+9B6/G
 5snpOVwi6hfsadHDw7sXfjklTkSE9qkUmeVNJHVptKQo8748t8HdO4O3PsGeMNwqEOc+
 wE4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=woz/9xu6
Subject: [Buildroot] [PATCH 5/5] package/optee-examples: bump to version
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

Bumps OP-TEE examples package version to OP-TEE release 3.18.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 0433c72752..876584c5e9 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.17.0/optee-examples-3.17.0.tar.gz
-sha256  03d18a0439cfe99ed1ceefc9af000b39b28424c8747e0d92a2701e7fbb6c519a  optee-examples-3.17.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.18.0/optee-examples-3.18.0.tar.gz
+sha256  6c64fbc6c5d1282b6311b4076351abbbfab10ac918c6cfc60e45ec705bb5a9ec  optee-examples-3.18.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index ebb0688af5..17adce0fe0 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.17.0
+OPTEE_EXAMPLES_VERSION = 3.18.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
