Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554F4C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 22:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD91D81A4E;
	Tue, 28 Feb 2023 22:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD91D81A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7amTVHX3oaR; Tue, 28 Feb 2023 22:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28DE5818D7;
	Tue, 28 Feb 2023 22:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28DE5818D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFC01BF580
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B5880C2E
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B5880C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PoNk9fYXYMqs for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 22:07:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 713E580C22
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 713E580C22
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 22:07:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so10623088wms.2
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 14:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQk2Amgp2abkVhlKlSAtMhFyVIk00s4GaZ1QJ/mq7nY=;
 b=rYIgDorp9xpbUFexqsU1CZKSGuZ4XY8XgB0LDOBSaMb4hRpK+F0Jn/uXKuwb9dX3gF
 pCJfyqXh2YHouEjoBCncKjvjtRFrVpcviZ49f9TzHhlrIt8w1oxt/mEThRazeCu3Q0Cm
 Dqnqz7BNAZQFDIg/qt+jJtd3mGvKPP6GOA0pSCX9DahT2stBAZ9Of/FVXc0XlPfp/q5w
 RTSIAjHPtrV4viEAelwuEI/Y0kBD8RC8CPryKV1njonJbIZKTfPDKBOG8snDbQS2GvQM
 i7B3bOuzd9S8WD2nRXwMV3CteoCo0mzcwgzZLi/sfPOI0Nh9/fmr0/Lppd2QZ+AIBsdh
 lpfw==
X-Gm-Message-State: AO0yUKUGFeuRk2QqVxcp0jv1tZEYwfo2a305pj0sekLxN34Jh8kh6ozn
 PrXcLDGkrYHBqUhuGvZJRAllqrITo3U=
X-Google-Smtp-Source: AK7set9xADi9CQKJdxWgcSMZ2OXuOTilgWws3PtSHpFaHGuaWrm5ZQvWxHJxTJCElJj8WmfVz1yQvQ==
X-Received: by 2002:a05:600c:4a9f:b0:3eb:2da5:e19 with SMTP id
 b31-20020a05600c4a9f00b003eb2da50e19mr3411089wmp.27.1677622069231; 
 Tue, 28 Feb 2023 14:07:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003dd1bd66e0dsm13588380wml.3.2023.02.28.14.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:07:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 23:07:40 +0100
Message-Id: <20230228220741.54827-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228220741.54827-1-fontaine.fabrice@gmail.com>
References: <20230228220741.54827-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677622069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQk2Amgp2abkVhlKlSAtMhFyVIk00s4GaZ1QJ/mq7nY=;
 b=iQBzC3aei6CwWHIVOjS0/6UzSKQQgFR69SpYjDkRrxaBEFHUFZ8SQsvKHgzwI2zCjg
 4fDjIUn8SFZ9Uk62cyg99cQpxcZqN83EJKAI9w5+9CkBfXmaHRS1CNJp6QLFoJH5NNI3
 RxtFRnAOk4IUJP8iBnEzRbOarC7Es451m0R4CLro9+QvrxS6v9fWGKxjc8xtf9G8aoqD
 cpO7mPYaPabUnKmAx/SB5dHQAO+nOV8/Xwem0KlmhGOrdrUiHHPPUVApu8I3cjzDacPz
 W9zZUKMmwio5uxUS5lk+kzD2ayU5Aa3sD3gKpL7Xaj6P5qquGdmk9Yk86Sbbiof+7fMh
 DWCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iQBzC3ae
Subject: [Buildroot] [PATCH 2/3] package/proftpd: add pcre2 optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pcre2 is an optional dependency since version 1.3.8 and
https://github.com/proftpd/proftpd/commit/e63cf016f574890c4096d587b8b1f55d87ac05d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proftpd/proftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index d3b6308185..398155222d 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -31,6 +31,13 @@ ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 PROFTPD_DEPENDENCIES += libidn2
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+PROFTPD_CONF_OPTS += --enable-pcre2
+PROFTPD_DEPENDENCIES += pcre2
+else
+PROFTPD_CONF_OPTS += --disable-pcre2
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_CAP),y)
 PROFTPD_CONF_OPTS += --enable-cap
 PROFTPD_DEPENDENCIES += libcap
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
