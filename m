Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F49C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 02:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5CF442F3B;
	Wed,  1 Nov 2023 02:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CF442F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alopiuXwsHL4; Wed,  1 Nov 2023 02:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED5644BF1;
	Wed,  1 Nov 2023 02:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED5644BF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC0F1BF277
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB6C844C65
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB6C844C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnvMv3hmuuz2 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 02:21:23 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B993E44BF1
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 02:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B993E44BF1
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1cbf47fa563so50046335ad.2
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 19:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698805282; x=1699410082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fu4dFX9nz05Kf2GHMQczZs6dfRsQqga2w4m+P/fA65w=;
 b=HMRsa4hDWIgzeuiNgSu06n2UA0gvRyLR7GtGtDVDBjQ1DqgFLqpY8v0B00LNeSGuh6
 KtrpVTIXYWlIVUcqXsYm8qhFTaPOlzpGT53J4iCy6quZBqSzrfe3KJVFkNOLZhGXvJF0
 FRaSeIGQ9llhcPl+hNgmstdjUysgrNYGn7Fl0PjcHSnGwVaXyd2ZCuGMNUqpN64RnHip
 cQU9iTte7T+p7QbmMvr3Q+gg4VESQILEbL4925gKxeMtfKMy5eTAWIpdJYg9Wz5jAHsJ
 oWLMofWrmDbcT76wweY0f7sY49uXWQIOwDCOILkxFXGw4P0KigDQDK9s0v7KnClETqaw
 SF5Q==
X-Gm-Message-State: AOJu0YzZJtpv94WPVLrpToT+olvYw0ydHpDMgN7A6Ip5jpKZ7UtcJBnf
 UClNRBTMnIYd9NESAnXAvA6U7+R7o8M=
X-Google-Smtp-Source: AGHT+IEM140Dhu5x6cUOsyBbjc7tvFFsLoh3JlJ50IEy/R8cGjGe4NJmuThuGy5HSj7BgTqlOBIikA==
X-Received: by 2002:a17:902:db0e:b0:1cc:476c:896c with SMTP id
 m14-20020a170902db0e00b001cc476c896cmr7362038plx.60.1698805282218; 
 Tue, 31 Oct 2023 19:21:22 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 w15-20020a1709029a8f00b001bb750189desm215195plp.255.2023.10.31.19.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 19:21:21 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 10:21:16 +0800
Message-Id: <20231101022116.17161-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698805282; x=1699410082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fu4dFX9nz05Kf2GHMQczZs6dfRsQqga2w4m+P/fA65w=;
 b=mNT/6d14Ycm87H1tx13IFNPEClyQJGNbZ/Xt+QQul+NZMvq4HWx6Vq32MOGzLrxLJz
 fhUksq4zmy4Vtln2FKPCATN5Zv74iGuIdXxMHoK1TItUO51cZYgAFOZg6zwsWdkEQJjy
 S7/wVdkkgURFmCB/ertDXVtruVXCNVDxnn42lg8YVmyzExflrDFpwSO+cjDs1EiBxI6S
 /lO4SQLYWuBkjXdZ5haPCgQl5Q8mBijbMqftyeXmKeHhj65D0mTjf2d64BcThcCYaCHj
 sa3G4PiIYghB9OjMJwDphRBkHrm5I+z7bKYaMNbpU/WlDA1FCmNFoKuLk/DAMCyBDw6D
 kksg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mNT/6d14
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.2.2
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
Cc: Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/htop-dev/htop/blob/3.2.2/ChangeLog

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index d43da13441..12dc864de1 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz.sha256
-sha256  5a17121cf1c69d2f2e557c0b29d45a2c353ab983f644742e1c2e4ece15aa6cbb  htop-3.2.1.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.2.2/htop-3.2.2.tar.xz.sha256
+sha256  bac9e9ab7198256b8802d2e3b327a54804dc2a19b77a5f103645b11c12473dc8  htop-3.2.2.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index df2ec25908..aafda5d48f 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.2.1
+HTOP_VERSION = 3.2.2
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
