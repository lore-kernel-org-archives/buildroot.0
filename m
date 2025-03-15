Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB88C28B30
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C911A41147;
	Sat, 15 Mar 2025 19:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIwozlJ5lwu2; Sat, 15 Mar 2025 19:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE8AF411D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE8AF411D9;
	Sat, 15 Mar 2025 19:57:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A28812C
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DB07411D8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuxIIYkLUnAp for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7DF7411C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7DF7411C8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7DF7411C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso2078147f8f.1
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068633; x=1742673433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qXGNYX22garWouezf19o0UCRKCRKGGkhBU0LvfBk18E=;
 b=DKCWd0iRQyhmMxMdzq3nWmJsSCYgT6U8H9/DWKzgmObVoy5z4Q585I0N1KgkoEOA4/
 afPyUkQ3Nh2IBglSde9ocHG8hAn5BETcakdSkeQ3jLVTIzkvWbWhvfGRGK+/UvEOEWil
 hZukHxhRAFC0IFVDY1Xmbx1FCPIrIRaurCTWftUiz4nWTvubgdg8ywAubQsopzhClXkW
 xwBZyBNOc1FitJx+pmbel3FSxjR6iQv2888hg6ymJ+Yz6cnnM8bIMSgHp61y4PL4Hq3u
 phpvHmcb5Zfa0ABy6hdG0GRcCfusJcEQBFedISdqZYwhwi7Y+fewcUmS/BvEn+4hZ56S
 /ang==
X-Gm-Message-State: AOJu0YwD2IaPv2neIU3FuyclRI5+d0PfNSOVy0R/WHojIMwWnZ1oWlzH
 8jOhA8drSffLrGsWGtK3otbYOmad/XC3oNxup87ub5ZeSPJwes5+at+Q3A==
X-Gm-Gg: ASbGnctVN9D1eY4nhKXv0rSFkPjITzIuEnlKiASyotZE0mPclg2Do+hXNSM3fe8Oui6
 gdTULeA9nw6ewkE1n3c4calwpT7A77SJ8CMnz1Q9EMcF7zA3ScMmoUJk56zbczrdJ4IPlu6HBgA
 3Zk4MsHCiDrPBMdvguNTmo+mgysIPd/GbkEKHc2ZJfZqJelzMuLuzXka5NxLhPzYWLmjh9MrSuR
 HsPd5Dyp8TS/7HfasH99RKfdQVZ/CCk7v2fO63fIvaaNgFD3MHM0nFJQ+CICWAvKqAsAW60Bd9e
 U0kB+57sMyA6XIyDL4uS/P254d35w7x4GS6tmF1zhXNgwT6rJ7tJBBY=
X-Google-Smtp-Source: AGHT+IHWcy1omi3Tl+4PzYrdjgsKmDs2L/qvqd3M4QNC3IK8oHaqLPYBshDOHnl59N2WxGKDosShAw==
X-Received: by 2002:a05:6000:18ad:b0:390:f394:6274 with SMTP id
 ffacd0b85a97d-3971fdc2108mr6400397f8f.52.1742068633503; 
 Sat, 15 Mar 2025 12:57:13 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:13 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sat, 15 Mar 2025 20:57:00 +0100
Message-ID: <082c48a8de273de6799f67c601158d30624f8aa2.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068633; x=1742673433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXGNYX22garWouezf19o0UCRKCRKGGkhBU0LvfBk18E=;
 b=Fl86fEboQSkKK7tUuD8v2DPSuQF/kjyrZqE/YFaWMr5/bgFj1j16YOVUYqJSpqjBDD
 25x9+emCPsyH0C4sIfpNvm+lYYy346tCNQAqHV9uXyQNOK+S+YKo7fgIZin10SanDbXz
 811sOzXS9FWjlJWRu9GWVdWJFmnsDsi0xktwDZ4+vp4U+Ojv1vV6v/NkIMBzJuP9rZEQ
 ZHf64Nxcg3adDvN0nyo0RjfTGxOjL+eKfXSmw5gkjnb/CrveNX4+frihsWNfM0kcvE5d
 OYT+zvVfgPP9+sWpWbHMPYR7ivktUwLKt31rzndhja344kjE4u3aD4aZR2I09x+969Kr
 2QEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fl86fEbo
Subject: [Buildroot] [PATCH 02/14 v4] package/shadow: install to staging for
 subids
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

When the subids feature is enabled, shadow will install a library and a
header:

    $ sort output/build/shadow-4.16.0/.files-list.txt
    [...]
    shadow,./lib/libsubid.la
    shadow,./lib/libsubid.so
    shadow,./lib/libsubid.so.5
    shadow,./lib/libsubid.so.5.0.0
    [...]
    shadow,./usr/include/shadow/subid.h
    [...]

Install to staging in that case.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Reviewed-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

---
Changes v3 -> v4:
  - add Raphael's reviewd-by tag, as per:
    https://lore.kernel.org/buildroot/cover.1740841539.git.yann.morin.1998@free.fr/T/#m61860669691f25a893ddf851a32c3860edaf3ff7
---
 package/shadow/shadow.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index cea984012d..c598ad88fd 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -46,6 +46,7 @@ SHADOW_CONF_OPTS += --disable-account-tools-setuid
 endif
 
 ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
+SHADOW_INSTALL_STAGING = YES
 SHADOW_CONF_OPTS += --enable-subordinate-ids
 define SHADOW_SUBORDINATE_IDS_PERMISSIONS
 	/usr/bin/newuidmap f 4755 0 0 - - - - -
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
