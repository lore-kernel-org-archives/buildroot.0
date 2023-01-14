Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523EDC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C12414C2;
	Sat, 14 Jan 2023 17:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C12414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v81AkSNlc0Lk; Sat, 14 Jan 2023 17:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A911F414C5;
	Sat, 14 Jan 2023 17:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A911F414C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFD9E1BF3EA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7B3440390
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B3440390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4CCZXafpDxuA for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 17:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9526840122
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9526840122
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 17:37:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g10so17189016wmo.1
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QWufe/43VVBR2KwRk4C+7FyTqlkjwcXmqeVOWSCxl7M=;
 b=r0AnfLwCcfKcKQtgdhTCtjU9iHQAQ4tQjRpyQ0CFATQ0nQp/oigwz6XYfQE35yuiln
 Pim8Zdqj6+rN040DLEXK5WrouIHmfuDeJZH4/ZR4vlVic7cvkB5ZkKxld1ILdIJ3HPym
 ThHO0Y/021hoAxwX8KyIc7ybBa6lY36fhHV9xtdqdOPraqx/Ho4vbcCl+FLEMQ7bsSg0
 GzzkQmeLqYgFj9iuxzkvLXM0SWnGiXLcm8bfM73bTdotFYDpKNS1h+ODWtOU/jO4ETLQ
 2n4vTOPmaLlNj/4u+4ebLonMPGKtx3tQVw89eYIccrgtDmPCVMoDMzUP+67F0OmbhWkA
 Mr1w==
X-Gm-Message-State: AFqh2kpX734mOFDkW7EIDYZ9NpIsVsIp4VvhHBR4v41kO0rlwdOo/ovj
 THX6GKKjWI0Z4pPQLF7R2MRAvNiOblA=
X-Google-Smtp-Source: AMrXdXvYGY7GsHmSxvPnQhofwtova6/swzhAb0hmCVV3b1NboS/0weP2PNykhSlb8+MpOaKCugCPzw==
X-Received: by 2002:a05:600c:21d9:b0:3d0:8d48:2993 with SMTP id
 x25-20020a05600c21d900b003d08d482993mr60626087wmj.36.1673717828546; 
 Sat, 14 Jan 2023 09:37:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003b4cba4ef71sm38739781wmb.41.2023.01.14.09.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 09:37:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 18:37:06 +0100
Message-Id: <20230114173706.1276006-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QWufe/43VVBR2KwRk4C+7FyTqlkjwcXmqeVOWSCxl7M=;
 b=f2Jra7qGW2eCzBJ1S/D+ip26GNY0f0UACfvsF99GPTeoOEG4wsL+VFGWetjzVJG6q0
 Ylio858h5DbU59McafhragsJXFdo+1kVC/xNdj79esuc6A0W9leQifbk6w1kZVeXmRox
 ZQ7fSIc/Zw9qyRYqnoIyhiR8C8CRLhhhaa9admqPEeUu1UjfclNZl/kRHt2m5Ql+uIv1
 M4lkx6EYJrLdcT5ITktrDtQJBiRCEBy50DfxiRNSUL2jP4Y3Pax4MdlBRVZpiXj9iLez
 G0SrnBeMw2d6wYX/FPgCI03fKj5/HGyCSYjUrWRq2HDPpz0ymvwyk5UHdHVfQWZ80tVe
 9JaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f2Jra7qG
Subject: [Buildroot] [PATCH 1/1] package/libraw: bump to version 0.21.1
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

https://github.com/LibRaw/LibRaw/blob/0.21.1/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libraw/libraw.hash | 2 +-
 package/libraw/libraw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 3076810cca..58bb1b4753 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8747b34e8534cc2dd7ef8c92c436414b3578904fd4bf9b87ea60f17aa99fb0bd  LibRaw-0.21.0.tar.gz
+sha256  630a6bcf5e65d1b1b40cdb8608bdb922316759bfb981c65091fec8682d1543cd  LibRaw-0.21.1.tar.gz
 sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
 sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 176acf6a44..b6616f0c10 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.21.0
+LIBRAW_VERSION = 0.21.1
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
