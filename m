Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08582E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 07:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A967780FB8;
	Thu, 12 Dec 2024 07:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0mkRMoDJavY; Thu, 12 Dec 2024 07:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27FC8144E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27FC8144E;
	Thu, 12 Dec 2024 07:34:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E111B113C
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8EDC4028E
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW_7fx7kUh_s for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 07:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0CF21401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CF21401FB
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CF21401FB
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:34:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so443701a12.0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 23:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733988892; x=1734593692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fyj0TLau4PjQERN66WFAi0tiZHYoSTOB2ZXg+6s5nNM=;
 b=oPw3Gcgmgpj3yi6EhOAbaSWBiv8a3wJZuMekEJrSim9PG4IY7TVwo3eow19aZMkg7V
 bhMHR8FrBTP075RekYoCUf+drmaw6f9YTmo6sNMSBUqBH9q/jhdnQAvwYUc7qOfYqa2m
 oEXLikQlvTnk5GEiS5QcORpN2cRBXo1f3IPFhkaveW7lyhoL/dW+jqmwkBczRkeVJ3/b
 BHoMPPWoEHEmd3AI4qJSiN3DiTidBtbeq3kzVgCV0SyPSQTKKsreWv2Ce5/TlnYZmkjr
 MOZyhhPiIZAxAXpSDeVRY2RLtv9trTv2GTQGtuPV3AElDKu5gy94HWEOUOK5ugIB7t+x
 kAnA==
X-Gm-Message-State: AOJu0YxV7S5RZO/x1a+MC0Q595O5+mm50C0gZNeWNRjwfhH516x099/6
 9Yr1b0hSjLn8q8wZpzhMcmy2u+J0xVvzupdnYKtIpF9zSUs8TLPA3YcGn8K8YjkS/6/HS5mBZSk
 5
X-Gm-Gg: ASbGncu12QoKJHKwc7f9a43FZolxUyq2aHYqBb/M3MkwvnjcY8UeGleEWn/jFJfumC/
 62iSEqz7KHlptyg6D7UAsBB5p00sZuOOpe6dxN1sH4crszalbQOwbHURdXbe929YUJR7Ctl0Qh8
 yAR1pHyHBrAjpm5X1CtoM2nrEe3ewcKt94IQV4e1+u1wwPiaBvGOIQ/T/r0bCbyaETMEPoFvSZo
 UUmH+241MFXfk7kNdW13hJ2RvPFbQmdC9ccfc927fdf/WeGwT8qnwr6Yvj32zcdZ8gFcWxbQlin
 xtvY8DOAAJlnwNJma+s/I7Uv+GVG8/V8TfRfVdRbJ5rMNg==
X-Google-Smtp-Source: AGHT+IFeN1D8b89x6dXc1ZdwoABQC+tWTQIPPjJmNpt94VT0k2QTG3l8aQPAVcqT2kdSVlJTDIP/yw==
X-Received: by 2002:a17:907:7742:b0:aa6:94c0:f755 with SMTP id
 a640c23a62f3a-aa6b10f590dmr552799466b.1.1733988892569; 
 Wed, 11 Dec 2024 23:34:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa67770d264sm663385166b.64.2024.12.11.23.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 23:34:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 12 Dec 2024 08:34:49 +0100
Message-ID: <20241212073449.449807-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1733988892; x=1734593692;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fyj0TLau4PjQERN66WFAi0tiZHYoSTOB2ZXg+6s5nNM=;
 b=RWc2ibAJ2/7KQS+iLXmXSJYEPvM1jonJqlBpg+N4fET4r/U2w2zdgYmD+qSmUaKmLX
 CiipeCm1oM50rktKLUyK+scPUrs7E9Ae8/syV4JeUvX1kRN3OsF6BVix/2jgLUDrb9LB
 Zh3UR16MciGM9ONbGFW5tXycMSZYl3aOoq2Rc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RWc2ibAJ
Subject: [Buildroot] [PATCH 1/1] package/armadillo: fix static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

By default, the library is generated as shared. Therefore, if
BR2_STATIC_LIBS is selected, let's require the creation of a
static library.

Fixes:
- https://autobuild.buildroot.org/results/fdaf2028b97f60bc01d22d3caeb9a6432d92b598

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index e2d7c3968f2a..0d2e85464f6a 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -30,4 +30,8 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
 ARMADILLO_DEPENDENCIES += lapack
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+ARMADILLO_CONF_OPTS += -DSTATIC_LIB=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
