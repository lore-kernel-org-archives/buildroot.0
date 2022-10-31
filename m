Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D61FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 07:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 170A14023F;
	Mon, 31 Oct 2022 07:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 170A14023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwkJJaM-HUlC; Mon, 31 Oct 2022 07:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3568E4038B;
	Mon, 31 Oct 2022 07:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3568E4038B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63E691BF2F5
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 07:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AB2340273
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 07:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB2340273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnQOKH7L7oZu for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 07:26:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18261400FA
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18261400FA
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 07:26:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so7461329wmq.4
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 00:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krZKM/mc5wuegMNvNTXjCg6kwmfhhL9gpEWJhOHbT28=;
 b=knBdumbqBa5pIyATh3wytQ1DUZj5B4ZWT+WKJf3qTyqV8pzh594B6Z/6e0yhCrPES7
 X2Dz5HZXt8z7GX3rHdxn112xOSH3H7HYwAALmE1c7vpXoWQt4lcv4A8zHVHOS9BFXFin
 Yzioz9CxrQ6rhtgC6pGaJklhLB8Xgk8FYdgvo0R3vZqt8Xuxane+HsLVk/XzaV/hzFdA
 4JPKkchLE0lDHYRbrR9Q1qYwx4ZrTuBv+P6mq+C8OHemykj2k6nhGX4JB2l0sid/GH1o
 tiG0QAJFesN6mAM8vHdH58j4T0c8BH8MjuqnOpLUf4s03SMNG8MvrMeyU66Yn92y4uCM
 fYDw==
X-Gm-Message-State: ACrzQf2a8bgAn9BPDodWcOoQV/JKenbpBoYqGanjNfVuVCXXQsikjcId
 wmJiMFIVinBoS5w3+S39R12wuY7Wzbs=
X-Google-Smtp-Source: AMsMyM57TPK/ljWIEDHN+UFtRpDzA5hrfbrpx08bpJPk6Z/VdRYPab1cLFLAi25FmNHaYN79tlqWnw==
X-Received: by 2002:a1c:4c0b:0:b0:3cf:543e:1ddd with SMTP id
 z11-20020a1c4c0b000000b003cf543e1dddmr13115832wmf.116.1667201196058; 
 Mon, 31 Oct 2022 00:26:36 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b003a83ca67f73sm6572080wmb.3.2022.10.31.00.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 00:26:35 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 08:26:34 +0100
Message-Id: <20221031072634.2986903-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=krZKM/mc5wuegMNvNTXjCg6kwmfhhL9gpEWJhOHbT28=;
 b=inbliobr8ph+q0mir+Nx0JdOtM/TViIWQ3RWukaqkn2VbLheIFyQPiNF0GJi+FfMlu
 nqXAsi7ZPQ3/GDUC5EOypndAHSDA+kXvCzBN6gP4juKlVqeYKdcBYEY62ctCtIPfGbUB
 mRNdozV8Uj3hALLkyzWT4Yd9aCuu2cYUqewnrL0U4P2Vu3/S8x/ASBiX/Ig8Wp8zRvsd
 om19F4i0RFK4f0NPK80Lsy4Nh3Zj6VfnGMeJy5IAdqyGS+3lYV2Z12yIAAsqNSNIdNY4
 Pe0QhqPDfK5svM6YHWktAg8KZFA7T+l2gYTVCHXKs7gWQG6XYQhv0B4VVE16eswtOrny
 TeNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=inbliobr
Subject: [Buildroot] [PATCH] package/gawk: drop incorrect patch
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8cd06967b9be (gawk: bump version and migrate to autotargets)
added a patch that purportedly reduced the installation size by not
installing the versioned program (gawk-X.Y).

However, the versioned program is a hard-link to the unversioned one,
so, save for a directory entry, it does not take extra space in the
final image.

Drop that patch.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gawk/0001-no-versioned.patch | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 package/gawk/0001-no-versioned.patch

diff --git a/package/gawk/0001-no-versioned.patch b/package/gawk/0001-no-versioned.patch
deleted file mode 100644
index c5bbdddeb5..0000000000
--- a/package/gawk/0001-no-versioned.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Disabled versioned installation of binaries to save space.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Gustavo: update for 4.1.2]
-
-diff -Nura gawk-4.1.2.orig/Makefile.in gawk-4.1.2/Makefile.in
---- gawk-4.1.2.orig/Makefile.in	2015-04-29 16:11:09.367925925 -0300
-+++ gawk-4.1.2/Makefile.in	2015-04-29 16:11:25.308466495 -0300
-@@ -1173,6 +1173,7 @@
- # (This is done universally, which may not always be right, but
- # there's no easy way to distinguish GNU from non-GNU systems.)
- install-exec-hook:
-+foo:
- 	(cd $(DESTDIR)$(bindir); \
- 	$(LN) gawk$(EXEEXT) gawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
- 	if [ ! -f awk$(EXEEXT) ]; \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
