Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D24EC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 21:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F11882062;
	Fri, 19 Jul 2024 21:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG67zUld6f0I; Fri, 19 Jul 2024 21:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430AD82064
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430AD82064;
	Fri, 19 Jul 2024 21:41:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77F1E1BF4E7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6567D40BE3
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DESm0gEQKYpo for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 21:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0770840B4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0770840B4B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0770840B4B
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 21:41:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so15900415e9.2
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721425282; x=1722030082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dTf7QaQ+yp+caDbNoL+XOXmq2yJQcE46QI/I7mLy6po=;
 b=RqL19j0/pLQIYBwNRbTaf3tNokMz2g7VXOZruICAKLz0tyff1Hgs5lDlsWtvPMMPHo
 2sAEsLkmU4DLxquNdvynG/di2weNpZqAU7298O9m/yK5RAl58934o9UXycGwIAgiz9hJ
 nQAbAbfWqHI/Zef3RC8worppD3Mj0HOpYFux63M5ZB3sHCYSJqkcPaJlsxOy0+j/xdfD
 bGwuwyWWzj2oC9hYQwWWJ1HJi2yssbyeZiNW59Ai0hbcAYQs1AO3qEoze32U8aha3rf4
 SiosB99iunrweVVPDRl9M9Q0b3sglXeRsjyfH9Af2Q2TO0DZV+TyRoiuwDUXKHya8A7u
 H7Uw==
X-Gm-Message-State: AOJu0YzpB9v4wKkbXV71uyHd/8e8oqak5LJjPkgKXxCi4c2IjmDVHwUL
 7Fdx8GZDGhP5PDRExGzZkAspuCq4v4eIUVtEr/b2E7BQjZkOvCj93i/G6g==
X-Google-Smtp-Source: AGHT+IGQc8Mj5k4VJGoOROySKeV8hQLBluyeir3oiqcteaKu0tr72T3b8Xaf6td5fdkRwpuJYJ/xUg==
X-Received: by 2002:a5d:410d:0:b0:368:4463:1548 with SMTP id
 ffacd0b85a97d-368446316c7mr3841412f8f.64.1721425281746; 
 Fri, 19 Jul 2024 14:41:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787caefdsm2580053f8f.66.2024.07.19.14.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 14:41:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 23:41:18 +0200
Message-ID: <20240719214118.261441-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721425282; x=1722030082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dTf7QaQ+yp+caDbNoL+XOXmq2yJQcE46QI/I7mLy6po=;
 b=VjglrUwqqofD3pnMOM2Yj3YZcrGygQxgV3S0pjKrSkijVW+4he3oNoAHcErunc5YYv
 i1G5D1gaYRbc02wLYf6d8E+yI6yH2Gg8ceh6ewSi1zVXSs8doc2V1z/C4wdNEA+pPtSi
 Vi5hm8ZTzS8tVqVTB70SsWAOrK1W4Gu5nX065Me1+2IfQ2+t1Oo+HUay+XVAwkK1zuHu
 1j/CmvhPw1ImBBJt/VGanPIOLMXJHhzrvYU5dmp48LL1vdRmZSzHkDw+dDA5csxqUe+K
 ApMLKoBD1i5Pt2ql+vzYmpSzKpRezZ8G3FjI08zp0NR/440n2KGTopNxfErFwRgwyXfc
 djTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VjglrUwq
Subject: [Buildroot] [PATCH 1/1] package/libxslt: bump to version 1.1.42
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

https://gitlab.gnome.org/GNOME/libxslt/-/blob/v1.1.42/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 7597e7954d..dd67940c8a 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.39.sha256sum
-sha256  2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0  libxslt-1.1.39.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.42.sha256sum
+sha256  85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb  libxslt-1.1.42.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 8098937ef3..b5bb22f9ae 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.39
+LIBXSLT_VERSION = 1.1.42
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
