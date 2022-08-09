Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D0FC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA649818D0;
	Tue,  9 Aug 2022 07:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA649818D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrXkTz7TpkhL; Tue,  9 Aug 2022 07:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA67E818A7;
	Tue,  9 Aug 2022 07:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA67E818A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFF331BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8C77401A3
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C77401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Okh2SLHnFqOJ for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB484051D
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CB484051D
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:35 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id tl27so20838723ejc.1
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9xCx5S11cacW05pfSkBy+06ys7IiwyQBm6enHSmhCI0=;
 b=dQTeEhzBcOjboBlEAjKXFv10vYCoYeiZqwnhL5JDYCWPtkifYLa/fdhGsk0VqDQoI4
 4cZh95NlesUv4QpOrd7oz4URXNTdWDPyXq6vVSDIeqWvh48ebJEzUsSGQwX/UbrOIAkf
 oeIEugmJOLbj5F2hq2yZDhTx4zxBZzRQKQJI8XVmlD2IEgFnJC3lAUA/mCsQ3EaceTCF
 6h0pcz+wI/zftI9x/fzkI8FqgPMHEKy4PpD4YZkF+Y4CWqbtS/MyCPIrR9FpkJAJMz9p
 kzj0QpTEUsGNzUE6h3nI7lXDmmL7JQAIMJWYRwwoz1GSArbiad3xLIh39UOaXYPY0Cae
 uzhg==
X-Gm-Message-State: ACgBeo39HkazrUS4F0BQcBR3Hy8bUoBUYk24//ALj50nXJxsZsmAM9Jb
 gdYqyC9cZt+V/1dyj6huJ9wl2TGk9HI=
X-Google-Smtp-Source: AA6agR7PTXP28ZZ9z0cT7dzZ1TldyMakHBZaCRWlg/J70Pv+2OkXhPDiAmgdDY1S7lawphxYtw/MnA==
X-Received: by 2002:a17:906:8475:b0:730:d374:de79 with SMTP id
 hx21-20020a170906847500b00730d374de79mr16633736ejc.69.1660031853875; 
 Tue, 09 Aug 2022 00:57:33 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:33 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:57:02 +0300
Message-Id: <20220809075704.86472-12-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9xCx5S11cacW05pfSkBy+06ys7IiwyQBm6enHSmhCI0=;
 b=bt0jbkUjJe3T+3II97OgLpkNKEJq8KeGzeqJEEHnmcxWwmsvTVea4Flf6lNMZ6niXT
 7FLXG1KEifh/2c3me3G9c83KUpZVmwb4apFzI4ASysxs7cAOoP87TzG83gAIAHKJPP0c
 o7EErFnVyA+QK0CcRaSd1ONBQn3ws+TZ7SJWp6KHDcCmny5kPzLm8xLLBjES07duH4I7
 IQONkPK8pCcyM8o0N4yVR9lTCD66ZsSnNVs4QMTdndcdTi2d3Otshbn+DqgEa3UuKHV2
 AB08wO7hfKv/xGhLNPD/Ka0SGfVC3OUduk8t4h8GxQqLWvxF8F3nA/JvGPoiAfqXu5Eo
 3k4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bt0jbkUj
Subject: [Buildroot] [PATCH 11/13] package/nodejs: fix ARM build with VFP3
 instruction
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Error is:
```
../../deps/v8/src/codegen/arm/assembler-arm.cc:179:2: error: #error "CAN_USE_ARMV7_INSTRUCTIONS should match CAN_USE_VFP3_INSTRUCTIONS"
  179 | #error "CAN_USE_ARMV7_INSTRUCTIONS should match CAN_USE_VFP3_INSTRUCTIONS"
```

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3cbae8cb61..6988df3d84 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -146,7 +146,7 @@ NODEJS_ARM_FP = $(GCC_TARGET_FLOAT_ABI)
 ifeq ($(BR2_ARM_FPU_VFPV2),y)
 NODEJS_ARM_FPU = vfp
 # vfpv4 is a superset of vfpv3
-else ifeq ($(BR2_ARM_FPU_VFPV3)$(BR2_ARM_FPU_VFPV4),y)
+else ifeq ($(BR2_ARM_FPU_VFPV3)$(BR2_ARM_FPU_VFPV4)$(BR2_ARM_FPU_NEON_VFPV4),y)
 NODEJS_ARM_FPU = vfpv3
 # vfpv4-d16 is a superset of vfpv3-d16
 else ifeq ($(BR2_ARM_FPU_VFPV3D16)$(BR2_ARM_FPU_VFPV4D16),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
