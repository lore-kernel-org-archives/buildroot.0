Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCBEC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 20:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ADDA40527;
	Sat, 29 Oct 2022 20:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ADDA40527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkGNtXsCTAvp; Sat, 29 Oct 2022 20:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54F2440545;
	Sat, 29 Oct 2022 20:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54F2440545
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAAC1BF421
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2517140519
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2517140519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gb2W4rktLtkE for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 20:01:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F2E440138
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F2E440138
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 20:01:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v1so10728550wrt.11
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 13:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HaVI4ziuSQoJ+DnlNG6vEWm+0bmClieDUo/mUImtrZQ=;
 b=chwCmxGObUt80U6tDV/5l9Lakcc8Q5lzekkPThI8upV2t85Wzh1wVD/MJ0sejT90TX
 YHdnkXKPhvkmgsImOsCuMe+o8H3ETwXh5nMrZY4Y2/wivLqNmAdrw/B9MjneEX9zyYVt
 3UAeX1DMbtOgMp3xIEC2AGUa//yrvUZCF3lqRtK4G0NnpAcdJ27tHUI1tKCqwwEUsKG2
 nb1T+uystCNybBpR0mC9e22jSXYDibY4bJuP3yNs+g8V7hJPVXJJdqyv97dfVX/T40YA
 qLRklHMzkw7gH/3tdAz+A21945CMhwDkcNTxHg/L3w6WZhrm3yBo9Brv6RrTXsjNmYxT
 jDtQ==
X-Gm-Message-State: ACrzQf34A2d0jOzB9RnLF5agtcR2Olsc4IaU5f+nrGKcG91FZlHFb9Bk
 IBu8Evh1IQs/hfjEuZESZztD1DRTfUE=
X-Google-Smtp-Source: AMsMyM5lXFWZaBTQbGKFAUSqN5NQOMSe45+8ByAessaNM1E5LW2udQzYebYl81vmNs9R+K3yoaE97A==
X-Received: by 2002:a5d:4c43:0:b0:236:547f:bd3c with SMTP id
 n3-20020a5d4c43000000b00236547fbd3cmr3183441wrt.380.1667073670115; 
 Sat, 29 Oct 2022 13:01:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003c6deb5c1edsm2629286wme.45.2022.10.29.13.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 13:01:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 22:01:08 +0200
Message-Id: <20221029200108.90174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HaVI4ziuSQoJ+DnlNG6vEWm+0bmClieDUo/mUImtrZQ=;
 b=J/GIU1YjYAGccm/ItjXJabTrM/wgMfiEE1RmzDZEKI4RpwQt8K/Caq3ROIdtyTsuHt
 s3Ms2OIfeNwFxtC+1wi2nQf8v8dqSl89094muur3m5bXyVqfmbX+Ku9AjlIpS17qKaqq
 xV2NTinOB5xHl2VvnrG5EYPE2arfrfWnxNWW2DYYiL7V4g+hI6QTZLxK/ZzNSpY84At+
 OaZs46P3hl0ic1k+5yVObUJNZwhf8AZmUKKIlQQ1gazLifYw/PwT6OM1KsZdHsXLxYdY
 UfRaBalW0I6dY2QiBxcdRzRUk8eufZDKAqkpFIua+yiXbOOEOXQKmudy2IwhT4DnnEMZ
 nRvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J/GIU1Yj
Subject: [Buildroot] [PATCH 1/1] package/libidn2: bump to version 2.3.4
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

https://gitlab.com/libidn/libidn2/-/blob/v2.3.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.hash | 2 +-
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 919c9b18a5..1051231bde 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,5 +1,5 @@
 # Calculated locally after checking signature
-sha256  f3ac987522c00d33d44b323cae424e2cffcb4c63c6aa6cd1376edacbf1c36eb0  libidn2-2.3.3.tar.gz
+sha256  93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f  libidn2-2.3.4.tar.gz
 
 # Hash for license files:
 sha256  73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76  COPYING
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 2dd27acde5..666dcdc50e 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.3.3
+LIBIDN2_VERSION = 2.3.4
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
