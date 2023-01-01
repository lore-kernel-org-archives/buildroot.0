Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C020C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944DB60C11;
	Sun,  1 Jan 2023 23:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 944DB60C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6L9kIolGnbU; Sun,  1 Jan 2023 23:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE4E060E82;
	Sun,  1 Jan 2023 23:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE4E060E82
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 532611BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BD5160BFC
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD5160BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id og3Zo5Ytvfqw for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667F760B2C
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 667F760B2C
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:07 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s187so23796798oie.10
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDJhF+g2N9s4NBRuYNro0l9qItiShDUFaQPS6skD0Lo=;
 b=62EZbob72mUmdzE1Dv6RNVd8fHgi/GI4WGbEmJfxg97bYjvMEFG0TAfaTQ26QYWNq0
 2UkMbXGAJa0N5xjyoa/AaQSccMLEeYeVLgjOOl3pKc6egVfvC9iVOyE6reO8e2j9BNBM
 4aVOEwNMTbGhgQbjTgs1rpF5EMrqPYPshk4LNA0DgVamL//P6DhM6fQSHK1COjV8y5FF
 XGCQs26yI8fei7vAiRJH5ko/SEhR8mZmCGjEenskwwyPrMOv+PD+iRDwTuxdd2FX3e0i
 sBOQP4xBN5Aupe/qtP5Pgrei5ET+mw/P7o89iVXWlAlCSGVBLUnAi5yU2jAKtyq4nSvW
 8Atw==
X-Gm-Message-State: AFqh2krmXf8FTTVTogcYgFnovqGcBR18KQo/Njuc1oXzbt0sRLjFVsTv
 QF0XyRDy4WKwrjwMKW0GUpXtLKEdl44=
X-Google-Smtp-Source: AMrXdXugED7WOzK8+WcgPCFh1mDX0S2foR9MZ9LxhfFHqQWNA3I4Hgg4c/THiPvBqaE0PFGNLkIw+A==
X-Received: by 2002:a05:6808:2982:b0:360:deee:d141 with SMTP id
 ex2-20020a056808298200b00360deeed141mr17043474oib.14.1672616346298; 
 Sun, 01 Jan 2023 15:39:06 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:05 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:26 -0300
Message-Id: <20230101233653.487175-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDJhF+g2N9s4NBRuYNro0l9qItiShDUFaQPS6skD0Lo=;
 b=LAuFg0kGgxKY3YD5qlXucFFDHzLOMTeknF+UoUaiYtuFNO1VJhAPs0vOr0WoTcwFqL
 J6EUpuA1EgnsmhV1N81+5aZG+naR5Y7uFCcDejGVbp5blWJ5gnGqks20X06CARUK1lOt
 14ywaTF0il6hXyc54tb7+qV9kUa6R/plbfl6ed1GkKi/GeAfjmge8RqFT6g+t1/QdL6V
 PcnoyL4eK/hN0+66BTp+Tejejsb+D1/zhOLyIxw7pxizDtdio/6afRsyzsxglHcyFKWS
 62fdJf80OFGKqXTpcAxIJC5HKLIekhIv3LNY56kM5SBmvVIK+/29mf9gJRKLVGHywSOx
 r8Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LAuFg0kG
Subject: [Buildroot] [PATCH 02/29] package/libmng: fix optional dependency
 to lcms2
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

"0ce9b533e3 libmng: new package" introduced a typo that makes the
optional dependency to lcms2 ineffective.

Fix the typo LIBMNG_DEPDENDENCIES -> LIBMNG_DEPENDENCIES.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Tested using this minimal config:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_LCMS2=y
 BR2_PACKAGE_LIBMNG=y

before this patch:
$ make libmng-show-depends
host-skeleton jpeg skeleton toolchain zlib

after this patch:
$ make libmng-show-depends
host-skeleton jpeg lcms2 skeleton toolchain zlib

build test:
44 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/731769914

test-pkg config:
BR2_PACKAGE_LCMS2=y
BR2_PACKAGE_LIBMNG=y
---
 package/libmng/libmng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmng/libmng.mk b/package/libmng/libmng.mk
index 090fe18380..8ffd74c05b 100644
--- a/package/libmng/libmng.mk
+++ b/package/libmng/libmng.mk
@@ -14,7 +14,7 @@ LIBMNG_LICENSE = libmng license
 LIBMNG_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-LIBMNG_DEPDENDENCIES += lcms2
+LIBMNG_DEPENDENCIES += lcms2
 else
 LIBMNG_CONF_OPTS += --without-lcms2
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
