Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCF2C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 22:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE3440396;
	Sun, 18 Dec 2022 22:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FE3440396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4u1p-tkhDk99; Sun, 18 Dec 2022 22:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65E954038E;
	Sun, 18 Dec 2022 22:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E954038E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 022B21BF286
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D03F9408B0
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D03F9408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15BedOc6pADS for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 22:22:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50021408A6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50021408A6
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 22:22:53 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i7so7063911wrv.8
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uGOajdgGLuGo4q+vaUtpVAv1W3LQ7LNRm+5Yr8pM6v0=;
 b=XNu0VGrjRviqHW6SxR7TP0zBu9XN+kfyiM7Iz/ZAXr1LGE95BTZ77JjF35RyHcjgTi
 mW2dAjalVNVHlx/sntHni3iAyFu4Z6OET6UY1cU80t2WdyNj9QWgMWMZ62e2MgZcJCCc
 gkrOIyNzG0HfZQPEfPhe3U4vk9wpVMgl3han9xr5ViCxROCYOrRgMhBlxa7yjV+RmKa6
 70yzxaqbUowOATeBaRqldew4fUadlGY9u6IU2yxlokhAISA3/TIp7ezV7tjQI0A1QdOV
 pDx5fA/3qXyFizS38dpbNvTQbExsg1n3t3/t6kQ2r8p8jWGOFaRwAm1ry4R+m95KALEV
 mWkw==
X-Gm-Message-State: ANoB5pmumvHctZzLWiMYp9CeQgMZRysBYPKDlE7hNlew0du7P0A2qXAU
 TZdmUtvUZUfz5I9qAwC9g909h7wuSls=
X-Google-Smtp-Source: AA0mqf4wzcKiyniLCUi7acUbLogpRe/J40NnPpfauXAyCBjMLMSWRIT8ZFvdx2uW2qPOuRy7UOxtZw==
X-Received: by 2002:adf:fa89:0:b0:242:3ec:629a with SMTP id
 h9-20020adffa89000000b0024203ec629amr27866377wrr.69.1671402171261; 
 Sun, 18 Dec 2022 14:22:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k17-20020adfd851000000b0024194bba380sm8357829wrl.22.2022.12.18.14.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 14:22:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 23:22:47 +0100
Message-Id: <20221218222247.61581-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uGOajdgGLuGo4q+vaUtpVAv1W3LQ7LNRm+5Yr8pM6v0=;
 b=jgeWGissRWqnep21kBzEThJbZx62F/xwan8M/tcB8uew/c0MVtVpS1yCfnLlXhDUP4
 Eg0kZ64CtGJ6jWiTkutMGfRgO7/t8oMqmw2pQlZxFh0ZOGCP4H/VLP9/veds7zpm7M8h
 LPj8Wh/b2qH8vlxbP+VNretLb6iRc7PWPyhS60yC2jvQqvPggNiXuirOLUBZk2YGa1f/
 hKBeVzWaGnToGo8SzQw4hDJnB1jt81CdSkFkq8iMnU1whjnQNxt3yjziCEUI6EDXJmKy
 0d7s0XMy4qhZe6JaJIZmuA0DbJXF+MPYSeg5ouT4h5o3rtCiAtHqS7oiooi2eGhLL/Qk
 gK4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jgeWGiss
Subject: [Buildroot] [PATCH 1/1] package/libcoap: bump to version 4.3.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE file (update in year:
https://github.com/obgm/libcoap/commit/43bfbea924e0f5220c4121487df980afe7159346)

https://github.com/obgm/libcoap/blob/v4.3.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcoap/libcoap.hash | 4 ++--
 package/libcoap/libcoap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 4a5bcaa7ff..e0006b62af 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1a195adacd6188d3b71c476e7b21706fef7f3663ab1fb138652e8da49a9ec556  libcoap-4.3.0.tar.gz
+sha256  074a71deca01e06d3acb00a1416d0fbeb87d130f40a3c0f6fda3a5c711855dca  libcoap-4.3.1.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  c5625e704d52deade1c9b2d7931ac8593be147ba63af62b53b8c7e309b7eaeb9  LICENSE
+sha256  5711e8bf7e94b59fcf0681d0f73752111bc196563b60f8568f19dacd0213192b  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index edcc1bbef8..c0a941a0c8 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.0
+LIBCOAP_VERSION = 4.3.1
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
