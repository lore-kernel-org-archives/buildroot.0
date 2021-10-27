Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCE0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 21:11:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C50C610CA
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 21:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C50C610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBB0760859;
	Wed, 27 Oct 2021 21:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXNvgECzmyKN; Wed, 27 Oct 2021 21:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B69E26071D;
	Wed, 27 Oct 2021 21:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC93F1BF34A
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 21:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A523400FE
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 21:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMFSZ6ZOuPtf for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 21:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE0DF400DB
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 21:11:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 192so2267156wme.3
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 14:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AeD040rgVNq4HfCatl5dStTVrQqOIdWciVXkogS3oq8=;
 b=BgK7gF0qtgnxV7sxC0uXYor+9udksACeECJoC3yxB6VThImw0UmQ+YPH1Uj/YPl6WE
 yF4wB2+HWq8RfNIDOOpSda1ONOziJFSkFVg2bKY+cvxYqklNvv1a4GC9vF1e6kQjKJ9Z
 ycve7zjRBlihO5dq7kLUwBGEKFySDUZk6GiYKH4SbWrJalG/O3gSfGliQwz3BBNG8cjs
 3Hh3au0HE9chDlanpj2jikzJNWAomkhNP/BlPT9qP6h4PtUYtIcknnpOMtExXuC4iYDD
 OgV0dI8X2d16AfKhH98C6w7HkIoi711gsyHfrXaobagPOZ5xMp12/6R+Ogj/Y98FdnE9
 jHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AeD040rgVNq4HfCatl5dStTVrQqOIdWciVXkogS3oq8=;
 b=esX1tZ7hMl49vIS4KQCgeIWVgJYGiGncaeoHvqx3swgsC/T9NckOZooP9wgKfAHS5C
 8cPO4rVJX49xbxzIQcc4JOBz4zgfL4Zt+yaUkLh+to5PUFo+Pr/2+VRGvtAIwu6M47LV
 47SjSbnYl+R1CEc5wx5Nk5SFPbGQ/TjJ0FEL7IBU6WuojUZQvxBkD2cMzYR76FJJnhXE
 ieEbP3fxkXtSRbX9HQlr0Ub3V+HfqHHJ9scsaOAJVyoA6e+xosOg8YjYtUYGMjICD4xT
 BLv2zkTrI0tUsydQoIiJ0hrO0jxwdQHDmCi3grNEckCmdpLOlEBwQVFCDkZj/++Llrck
 ZZ/g==
X-Gm-Message-State: AOAM5331OP/qTkzxcEjQDDBqpPKMQJONwlU3qhFm+Laz4vSGf28U2dn0
 xLAgpyKKiKc6+emcXuG16msBvRSWOAI=
X-Google-Smtp-Source: ABdhPJz8DskEqnF0yNaBXCyjxbX7P0jSYEvMFTPS/nnRSVNRtBUjdB4YBTR1K2mwLKQ0CBVWN6R9xA==
X-Received: by 2002:a05:600c:3654:: with SMTP id
 y20mr8247654wmq.108.1635369059729; 
 Wed, 27 Oct 2021 14:10:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l5sm980616wru.24.2021.10.27.14.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:10:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 23:09:14 +0200
Message-Id: <20211027210914.528339-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qhull: force Release build
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
Cc: Davide Viti <zinosat@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Force Release mode to always build qhull_r library instead of qhull_rd
and avoid the following build failure with python-matplotlib raised
since bump to version 3.4.3 in commit
23ca2efef1528c73f04b5db8aff66a826fab1b9e and
https://github.com/matplotlib/matplotlib/commit/2dacb1c9090eda4b3c202db80f5e3ce340850760:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lqhull_r

Fixes:
 - http://autobuild.buildroot.org/results/c2b/c2ba407275863bafe42faa4b335a20c6fa9e1d55/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qhull/qhull.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index c11bed0373..72f6270434 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -11,6 +11,9 @@ QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
 
+# Force Release mode to always build qhull_r instead of qhull_rd
+QHULL_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
+
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 # although BUILD_STATIC_LIBS=ON is default, make it explicit,
 # cmake and static/shared libs is confusing enough already.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
