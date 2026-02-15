Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB4AE63F08
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 23:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 528FC606A6;
	Sun, 15 Feb 2026 23:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRKTT0ovU1j8; Sun, 15 Feb 2026 23:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 827DC608B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771197053;
	bh=CUEhTtIxRuuYU2wJELGB5d9JRhjcyX4ZgWQjYl+mKQY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OWxRiLaB0efvMaa9ZuwkxS9d8t+iWEJgGZdBSUrKhqAZ5sZdLd19se4dh04itboYq
	 /V028JjwRc7AlqavKXVX+yDx1wL+LMuqkPvTt4EwcQiFKXkCU0AxDaopIu1vaq1hxO
	 QtOFNKJVUIO0H+pdDGl+ozOFTIotCDmIYyfg4nzB9coOkILcOcavy64HH9QZw8ejXs
	 tgVBdXMI5OdYul1fBDhq645FR2WIf+knybBv5qvE0Tog5N0t69fbxcjglCyzPJbfsq
	 ifZ5FHDU/3OVY0RLl+ZAKQk7WuutU6l1idB9pMBrMCny/SfbJXzY3PLoKw4myQtnfP
	 YQcBe0BFa2BrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 827DC608B7;
	Sun, 15 Feb 2026 23:10:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4B835B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89DCF40A2C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4OTLv2IqVSm for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 23:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 959D940A1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959D940A1E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 959D940A1E
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso15554825e9.0
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 15:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771197048; x=1771801848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xg61p/zV7LEoNqc7uM3WVraCx87tPscvx78wmDd/skI=;
 b=lKHCNPKy0muSfieITPjbV0z/K3D5+nO52p+BSDYPVNgJj8JFo3uQBYYVJ2jAOEpONg
 9bHvM3OFv2rOHnub9cZubrvUSX5rbpKsq4gTa/B3L2tAyBJM4n//8COWjPXbxzFrCKr+
 TcwZN0G74DoVfay9w/JOkJSNSaewHX+YOSBKeEh3gPQQCjKBZkOuo3xXpcVhk3l+1aYU
 9aoht8mTok+oQohMOW8Mho498BMW+oF2sst1b0L5PMZXMXy2RYiKMBfWIJt7Ro33RZJw
 btvEeg7Jcnzhg5WKw9xTHbh6yrY1UJh43tE00nT4qEzbsuVUdKXzpKpkdUH8/55i676b
 uhKQ==
X-Gm-Message-State: AOJu0YwwyF2VoxHi0WGXkkGf+4xYRuZEwn0F7/LbkwTG9IskYk2czQdZ
 XeW9SfEJsDmoqekq3rER81JiBk8FM+IP/TZZ/UI4ccpjYA811V4vZ+TBcbj4vg==
X-Gm-Gg: AZuq6aICLQ8VKcrWFfmoyLZixhZ7ZVCJRFG7i9J5gjgVK7DJGW5z1+ZWUb7IEgINKnf
 Jx0ce3UHiIhX0Ls6U71t5jr8Okg6jRM4yM7VmRH50N+Wzdf7bpRAfO+CpwEn6wdBfWmJpVECYWg
 nVvHvAYxvst8bz4LfYgwfZEmNbfQwsNEgFm/bs1wsm1vmR1U9g3FUDHHgQj+MK6M9/dbS3xcD9n
 RE5yri53AtlS+0cqPwAudH17v5pcrDmCuBi3ZQNqzqsQXY4uEPU6TL12rF7hsCLOsb8Z2V9Lq6w
 7UZjjiCOmou9cMAmPr6qAUHLW4EG6cvGnITLl+A05x9z9Wbnb+FyPw/Hm7Ld9VaYE7jSKH2QkrL
 qkRdB/FDRfTcB1mj6Ch0W65MwDffobtz8RbD+KkB/7i5PjcbbfeReiUOVwc8DN+G1Qbg/evSqRU
 HhTV0lnujwDSxn8tTUrjrJsgL9s04=
X-Received: by 2002:a05:600c:ad0:b0:47e:e48f:43b5 with SMTP id
 5b1f17b1804b1-48378daa130mr82543585e9.18.1771197048324; 
 Sun, 15 Feb 2026 15:10:48 -0800 (PST)
Received: from localhost ([78.208.235.85]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfb28dsm354300305e9.11.2026.02.15.15.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:10:48 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 00:10:36 +0100
Message-ID: <20260215231040.1010538-2-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215231040.1010538-1-mattianarducci1@gmail.com>
References: <20260215231040.1010538-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771197048; x=1771801848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xg61p/zV7LEoNqc7uM3WVraCx87tPscvx78wmDd/skI=;
 b=DL4QMX2xLmIb18qzjUNHnc1pJ/dq2ZMGXkfVtfoDPz67OjQSjq+euDTsanSEiPguJ6
 uFCKJb/HbvYIeJi1U3Dqcfc7l7mXYvJNRr/rrXdl5w49ZJYaYbszB4/7PHqhPY/5SHEw
 D6BqOPhAPG33kHftNMmtN7O54aydDh9TmGaq0rFgIVU7M3C0LCI5XHPwHK/UcqAmqVc+
 DZoE9UVoIUkNLNxTGfWff66MP0v9vv9jBZfGjZ4B7Kkd+YfxsLsI75q5x+2j0dpCvzMu
 jV3jCMvHlHwDR8+6Hdz5keKFceoStaVwvb3xcc5uKvAKeIwqM/eo/zMIhO7jm2sDdyLC
 dXvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DL4QMX2x
Subject: [Buildroot] [PATCH 2/4] package/gensio: add udev optional dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Udev is an optional dependency used to directly control cm108 sound
device gpios. It is enabled by default since version 2.6.3:
https://github.com/cminyard/gensio/commit/c1b5c0a214b85026f1d8c97bd79aae038fef733b

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index a4bf31d181..0a45a872cb 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -34,6 +34,13 @@ else
 GENSIO_CONF_OPTS += --without-mdns
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+GENSIO_DEPENDENCIES += udev
+GENSIO_CONF_OPTS += --with-udev
+else
+GENSIO_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
