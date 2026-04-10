Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1878E9905B
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 09:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ECE560BA8;
	Fri, 10 Apr 2026 09:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqnJuiqESuVV; Fri, 10 Apr 2026 09:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB7A60B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775812026;
	bh=y+NrPAmPIglmatGcFkFubuQ2NUn/jvUrZJ91myrOMQM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=pI0iAkor9kCeRSRggjuZmiwePp9ubYHdVxLCTUh1zns8ngnJV+TFbVdQXxjlWU8TC
	 b/PsvBzmFTZqm+ekwW81tw59DBls1ESlOmbJ08nI6zl29xRayNSkpkU4wz76pEXu/B
	 VLg23RAiIb+z9XFLvju8WJ9nqge+ACoi1iXICpAQ/Ei+rvvob0VpE0wLrLpa+Px3LV
	 4eKM76aOgVb9YFaOlI43URD3UJM5UmE8CLKgaHksdResdITfaTGS36XnBgtZZNpPbW
	 5xQSLWtidvzaTYV3poMESAsH6/0dgOsdxC9qDEkosS3bmCs46ExC0N0NpnnTWaNsuv
	 3BFgHvoloPWbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB7A60B5B;
	Fri, 10 Apr 2026 09:07:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B9A194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BBE840176
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwHDwkC-2589 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 09:07:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06EEB40165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06EEB40165
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06EEB40165
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:07:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-65c4152313fso2374054a12.1
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 02:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775812021; x=1776416821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3oBqoeQlRP5GgZf7cYt4L8+RG9bYXgI5tiXLjo/UgVE=;
 b=fq7Eqq4IETnrUiBLuUEL06NZ0+SS2u4d56N/SpO4UA2wrJjOK8Wy6ICJSLogjllI2a
 ElaGsL5T5Wy97oPFCovJIn594mcAPnMyeWJ8SBd3CPVDgiEHG4WrmFvNUI6h7j93sSlm
 ugOzDI/BNORh1z+DbYCBKrMnJD/WqVC6uG4TCOx5zb4OHEVTKgOup9QrZZ0ohiPV2+ku
 X+deOvT1kYcTvl0y1XBeWoq02Z0eA8XHDlyMJkiC8+plJ6d9Zb7YUpuoK8TpjNSMnZ6n
 UcrqO6Zicg9T6u27OKUWw5Mnz3QPfKyOzH4VKi9r0pjKZuuROR7I8FQHgMGUeU9f9sz0
 LyaA==
X-Gm-Message-State: AOJu0Yws9MK8mQTMMWuBwuRRzprchOEabG+qKCFGT/aFMscElsaF11sl
 5u+t/sjA03yIad3qZUHlUjixziByV/9vtA6YTtBF8VU8O9C2PqSFVZOlJiTpBg==
X-Gm-Gg: AeBDiet2/6D0obyFhXq6HKoXYrXMneJO5EQeKfaK7mHowV71BGIeOMgyPWs+kkVqDcm
 O4mCkglw6lrZ8noBQN3eHq+Rii3MTCUHiZTilmGU2IZVt10iJxs0JsBi+snal8YnvFHQe2Rm/v1
 zgVxb+ND2QBL1dbSeIeAnweMLoWasLrUdYo71axxN9yforaWK/lmjtQ2NjF47vddMYWzxP2xcYs
 wawh1NPZDB5HzpHT8HzCHr8xo7NUvQs/vgzqbVvOBgNrgS4D2efzH5eoBZq8lQKLtgcSF6JUQ8d
 68L+xMIxKLxpKAuGixWe7zJuwHnL2LyHafoyF6WPEYLgPGrcROt4OEkMVZgZvFfXtfZPXaYzllJ
 45Nn5ltnq9tlWyAHt0pXTgeQsfNdCLywf1cgf+HHvcNQ3ohJsgvMw4GNMmP8E54GCxO7hdCMHB6
 k5nj+X9dwM4CeG63SR8mQXbXl7MulI1tYWxkBEG9eSMYPpi5Yg9cYGkF58b6bMMSFR/orlpodbT
 2C4es4=
X-Received: by 2002:a17:907:97d2:b0:b9b:308f:d9b9 with SMTP id
 a640c23a62f3a-b9d7243f00emr148342066b.5.1775812020242; 
 Fri, 10 Apr 2026 02:07:00 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6de97e88sm63404166b.1.2026.04.10.02.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 02:06:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 11:06:49 +0200
Message-Id: <20260410090649.3029441-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1775812021; x=1776416821; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3oBqoeQlRP5GgZf7cYt4L8+RG9bYXgI5tiXLjo/UgVE=;
 b=OT8ZNkO2JbxXHSBYhYb7gXWaaH5CQTeLLRgqDriRt7vZJV9neSoBdMNq8cxHcuvBt3
 yNBppYscQulTq2Hd+HwLV19RE4JNt+PVMyoMRVQmkyPD1CVU6x62SkRZRDGu6wkSIKYv
 FCjFW3shosTgDdC3HtqBh2qiA/zIBZ3pp+7ZxzczwsDU7MkslEcAF38tJ/XQtWjRmIE1
 m99VrOJaeV3YyLx0nCkCznIQzy+qdsdCiRaQMClyG7sgDNF6waRvoHm3EIjZpyYtY9bC
 odRgGx+kV6Wjm5HS142E8FS95FbFLcFXLN0NghLOqJz9K2Avuc9WC8nkJBDdIFgf5ndK
 WPAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OT8ZNkO2
Subject: [Buildroot] [PATCH] package/libftdi1: enable static only build
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

libfdti1 provides configuration options SHAREDLIBS and STATICLIBS
that allow any combination of static/shared libraries.

Fixes:
https://autobuild.buildroot.org/results/d7b9a45ccffc1c9e3fd796c3e46ee396b7d88272/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libftdi1/libftdi1.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 31ffa1aca3..0595ccf963 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -13,6 +13,14 @@ LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=OFF
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=OFF -DSHAREDLIBS=ON
+else
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=ON
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
 LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
 LIBFTDI1_LICENSE_FILES += COPYING.GPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
