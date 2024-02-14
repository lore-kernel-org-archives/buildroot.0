Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475A1C48BC3
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 22:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF08418C2;
	Wed, 14 Feb 2024 22:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McyUH0KqWv6F; Wed, 14 Feb 2024 22:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E21EE418E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E21EE418E5;
	Wed, 14 Feb 2024 22:44:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BF511BF57B
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 22:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 458F2418E5
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 22:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgP1A28P0wM8 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 22:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=vineetg@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26374418C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26374418C2
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26374418C2
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 22:44:00 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e0a4823881so238619b3a.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 14:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707950640; x=1708555440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H7v4PILcv6wjuaNZG+G+euvfsHPNa2vxKEu15/gDVq0=;
 b=pwb5/FDNLdJHonZ2yMmr13gF1yFVfN9FypEu5298kwdg5PWEb7ACAyconwVALO7apZ
 II85dusCbHSASvAH38coouVcHkEsyHiTWbtm44tthdJOXrKMuTv4ypyHqUKyvC+fEx/k
 KJbtE0pD3SZdb7VOau7bfcPQIXBmjQNa1bHUkWFdgv6lMbx5QaTDtRTdRrgH/wR0inoB
 BoMKyLpDBSn2JV9xHtHSRqR/5FxRbsOjbT8VYaqFrmPSt5jyy6IyQ5MLLrDCoVzy20VM
 SRq2wjxD+GQQqeibzh0zOtUPjbpB6Yh8UnB7l2jQG0NOk+lpOUj76nf+z9qSttslviNZ
 34lA==
X-Gm-Message-State: AOJu0YwBRZYIn0dIyUJr23N0AWTaQmp2W65mG4ze9qszNTVVyJ6U4aAt
 rOyg3Yv0HoGl5Trutye/kdXknQeiYLevSPHfXkfBZOVciAntQaIqm1MhVecYiO290PkHrNbjmL9
 /
X-Google-Smtp-Source: AGHT+IFVHKoqWpk2/muSYhN4bDkBWpQHt4psgnfXhdG9TY7emiJNKF4hT7PDCEJYXhTxNNpcLSV2ng==
X-Received: by 2002:a05:6a21:1690:b0:1a0:6856:d128 with SMTP id
 np16-20020a056a21169000b001a06856d128mr229261pzb.9.1707950640048; 
 Wed, 14 Feb 2024 14:44:00 -0800 (PST)
Received: from vineet-framework.hq.rivosinc.com ([12.44.203.122])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a17090a178400b002960e3745d9sm2175152pja.13.2024.02.14.14.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 14:43:59 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 14:43:55 -0800
Message-Id: <20240214224355.551010-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707950640; x=1708555440;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H7v4PILcv6wjuaNZG+G+euvfsHPNa2vxKEu15/gDVq0=;
 b=yQ57VFpW5uxkQWcDB3ZBmIU1j9VqYiAPalJ5wIQaW1Gv1ZN/8mFAOx+q7RqJi41Ujd
 zQnrojkJGw+Zhop/zM9agGYaLKrMI2w9V0gbMegC76u93SNM8dXFeSZI2wI2H0qT5tcF
 IEMrnnQyWDLfZAjDrAF5XnI51gLpBjvwkPsNcxkwJdjbOw+dSYvjYQ0ld//X6fNi01SH
 n4PTxr/GU6isTvTBQ6WQIVsdWY1oq4/PzXZlGDQawnIlYR0/SA/XQuTZCleSVtVIFbRu
 /4GPeMJFhJwJuJgzOj5BG3J5y1E8/3k5bjWKaoZ+RylBz1QgHZyRO7X7nZOMygxvMU1H
 dUCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=yQ57VFpW
Subject: [Buildroot] [PATCH] glibc: build: honor toplevel
 BR2_TARGET_OPTIMIZATION
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
Cc: Vineet Gupta <vineetg@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

glibc though part of toolchain is technically target binary and thus
needs to be built with BR2_TARGET_OPTIMIZATION in case users want to
force a certain build toogle from top level.

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 package/glibc/glibc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d198d6f04cb2..72031907c252 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -80,6 +80,9 @@ GLIBC_INSTALL_STAGING = YES
 
 GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
 
+# Seed with any special toggles user may have setup in config
+GLIBC_EXTRA_CFLAGS = $(BR2_TARGET_OPTIMIZATION)
+
 # Thumb build is broken, build in ARM mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
