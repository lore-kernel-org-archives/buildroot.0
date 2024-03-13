Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8E1C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1325415B1;
	Wed, 13 Mar 2024 09:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5X3zNYqaeN-Z; Wed, 13 Mar 2024 09:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC49F41723
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC49F41723;
	Wed, 13 Mar 2024 09:16:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 726291BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9E45813B0
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sr27U7t50Log for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F1CC8137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F1CC8137E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F1CC8137E
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-413ebefa168so958995e9.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321278; x=1710926078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgA5wvTDyr8jYQBb0LPUQIsjMBoXJtmzpX//Hjo/qFQ=;
 b=pioMj6TVUKPHzZH7oyV0u1afCxNsN++07lCV5gy5azf9updAf3kiBweHqcN5a3gpN2
 ZfdFNqZlmswXjDzKlt9tS7WTUQD37Mg5uIMgFhwyVEocgAEpkNJMOj4NF+vyThqEqXLH
 xBdfwO624v5d0i/gAZJr/An2p8SunNZ917z1tmGVfSJ/tZg1dySYr6UX4rQvzqDH4cNa
 rWRpx48Alj0B5k0hbMeyq/9IpDD82q5Gxt4e/Zs26c2gZitA9k6U2jg9dLs+ZJ2/pu2R
 m3UrAbDIkvjzh03XgWztv73UQqO38OOmnT81Zvt1j5L/FtOV/QGqzkPjWhMd2qp4NtP+
 mSWA==
X-Gm-Message-State: AOJu0YxZItA4mTZWkRXtI0NVNyy0Eu+3AaKvPFF9MNkmMAWPpoNuv6Ff
 BcCdDM6B3QivtBZM2LHNrWzCm+XOMxThSKjTwz8XRdxFZLFaJG6mY245r6DgXfk=
X-Google-Smtp-Source: AGHT+IEOgeDPIPcuxL58iEmDALWu2ldqMESspPKn4fpNdM7WYVrQcCV9sYcZOvIanoJkAO2loyMMnw==
X-Received: by 2002:a05:600c:3111:b0:413:160a:8112 with SMTP id
 g17-20020a05600c311100b00413160a8112mr9625800wmo.34.1710321278218; 
 Wed, 13 Mar 2024 02:14:38 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:11 +0100
Message-Id: <20240313091412.20865-30-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321278; x=1710926078; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgA5wvTDyr8jYQBb0LPUQIsjMBoXJtmzpX//Hjo/qFQ=;
 b=g2SRdPXMhu8MLvEfWgE8xw0w8sPNCYt81W7shkpjMqUtwpvnt1CJR0h4B60VGnafmZ
 FuTF9WmGHnH9X67yyF8H5cMIDTJe8oCj9q1kDGTw2LjDYYUK33iYDHtwpIuXSRH0KiSj
 X87FA04Qo/VCgI4oGipV679x7AwTc1V903IFoy0ZAFOg/ls9heGHsKj3yW3CcBkKulNi
 Et6d7p2KgKJWj/ssoUYUZ7wdpGsN/z6y5GDabToHkG6nYco78bKluNSOiw1s5acKrbCk
 mdg1ZqT4aOhHDroQyg2UBQJh9pHq+Gv/vqTpmTLxRazeJ9d5vgHG/k1KvEGzI5HTq2PJ
 pjsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g2SRdPXM
Subject: [Buildroot] [PATCH 30/31] package/which: disable busybox which
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/which/which.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/which/which.mk b/package/which/which.mk
index c96e89375..fee32e5c6 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -9,4 +9,8 @@ WHICH_SITE = $(BR2_GNU_MIRROR)/which
 WHICH_LICENSE = GPL-3.0+
 WHICH_LICENSE_FILES = COPYING
 
+define WHICH_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WHICH)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
