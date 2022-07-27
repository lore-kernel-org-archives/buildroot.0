Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E693CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CDFB60B00;
	Wed, 27 Jul 2022 10:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CDFB60B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cnL0uoBxHvP; Wed, 27 Jul 2022 10:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA2F60B8B;
	Wed, 27 Jul 2022 10:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA2F60B8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 095C11BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 786D560B6C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 786D560B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiRANxgwKBLq for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC9EE60B7D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC9EE60B7D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:58:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v13so15867461wru.12
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 03:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KPYzfzMNGYLu368/kVjhfox6eSMo+UIw8ryfkqN+/5o=;
 b=cLw4tXiwE3xM/Sqtz3nvP/r/Cv23tU7TKllbZacBSdenUMFSlzmh8thW7n5YxhOa53
 KuiC8c7WEou5569jYwpo4WRUdmf+lp+POvSLLY/IRFrMiN/HIVRsJoqMO2ZYpwzqfd4V
 FMYiXz6OZ0UL+XZwnu60uuJiC4dFdz61dRGF5Ok1Du1SRPM+gWbleI0ZHJGtxRkPUA5L
 +Srnm4xYGdasaXGzD/NB+FWNbAuxgwp5S1+76fHVdY7BlCiJk8CoLUWIzHruUOnLGbgr
 ramY1nZuDXl9clxQdsJGFIs7eBAwTS8+AyJmU4f+j9wsXDdub9ymcgGBoh17i99vdE1Q
 562w==
X-Gm-Message-State: AJIora+Tv+Gt5TjRfS5cXkpfT0tSLr+//6PK+0pLOtjsuaoUP9QT3PpO
 YjscQhbsP14iWsVCod6DdlzDuNIflbs=
X-Google-Smtp-Source: AGRyM1uNQTRAYMa6dsE3TuqLyL5x+ILt/f3Ny2u4xdFnbx54/qyf8hDQ+zx6/6xXSgZfEXYeaiINbw==
X-Received: by 2002:a05:6000:986:b0:21e:939b:a71 with SMTP id
 by6-20020a056000098600b0021e939b0a71mr7668669wrb.256.1658919490975; 
 Wed, 27 Jul 2022 03:58:10 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0021e47386eb8sm17005038wrw.2.2022.07.27.03.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 03:58:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:58:07 +0200
Message-Id: <c400a8fda3cc193d641577a7d20d49882d26b9fa.1658919469.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658919469.git.yann.morin.1998@free.fr>
References: <cover.1658919469.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPYzfzMNGYLu368/kVjhfox6eSMo+UIw8ryfkqN+/5o=;
 b=NufO431bygR80Gyz3NrGRj8ZVrZ4xkm5yGe59fb61AENVVvlWajsEe0iwL09C0RSy/
 blp0Vvbgyc+LblrjSI58JWmG/n+qcFeAHtTH5yeHQBJQ26VNAmV6VepmJ9Y3wvfTsohs
 p0sEhvLIgwte0woMGz+qn9zK02iBY4c2xSy1lys+S8VvrY3dlVvZ24UjKhE5X4y5ir0m
 fUtXRNU3SrwjoMMbgMtHM92MAqaKBwA9XkJJX+DYIbKyCtzGUr1xlGa5w7Lar0YDhMNt
 nDCCvyE/0FHsnn+CZZkUKQO8gOrdZQptK6FE5Q9xPPqyv7MmnKy4EbsKUcjMoCdxO71z
 ckCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NufO431b
Subject: [Buildroot] [PATCH 4/5] package/pkg-meson: drop csky reference in
 ackage infra
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-meson.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0835e08e3a..156b005fdd 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -36,8 +36,6 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 PKG_MESON_TARGET_CPU_FAMILY = aarch64
-else ifeq ($(BR2_csky),y)
-PKG_MESON_TARGET_CPU_FAMILY = csky
 else ifeq ($(BR2_i386),y)
 PKG_MESON_TARGET_CPU_FAMILY = x86
 else ifeq ($(BR2_m68k),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
