Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A24EC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEACD80B1D;
	Fri, 19 Jul 2024 21:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVBKWvhSeuW7; Fri, 19 Jul 2024 21:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A69380BAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A69380BAD;
	Fri, 19 Jul 2024 21:15:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C6261BF4E7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57025608DA
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eb_OpsChYZo for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 21:15:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5642D608B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5642D608B6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5642D608B6
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 21:15:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-427d2c8c632so14758485e9.2
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721423727; x=1722028527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H0KXtquILHGhnHQ96nGpz/9rHGETAjlmR6TCnyn0b1c=;
 b=ckA75j1x94ICxIxcuZa5AGYQkMo4YeM8VPDYuQ6FGf/EYFfA8sWNvpaqt32dIPWKJN
 R7kTyV54NE5qm4C4UtrW5sILXioTmZTATAL52aFWJ9SWqHOI1xqAhWeaQ6xOLcpMyKKy
 GoN3p0YQdG5D7df4rP1TlnocI7jWMmZnuK9i3T9f7dlCr05hddD6IDLFsp4+ma2bQAZX
 A5wPcT8+WHbYcIr3DnOurGpz36sZmPJbKAcQDaBKgjrwMS28OQPiaHszGy6PiYea/h0/
 ZjjU2ZrlzNbMojnyyRxp12xPZcV1TckdIO+WppBRIZWOXMb1RUGiGdid3MtJFsDjdNUh
 0XWw==
X-Gm-Message-State: AOJu0YwpYaUI/lW/Oi4dXU5/H0+kqG62qVre3EDvb6eyEIsSZ4wldQIw
 8EwyEgf0PjMNTXE6xMVenySKRSC3QADt4Zod/XLa/lZ2DmuXURMB1gs8ZQ==
X-Google-Smtp-Source: AGHT+IHO5dZqaFaZ+DZS5CqPUiOipD9FtgosuOTLi7qrMAQP7Zfn8yinG9U66rZKvNc6rkuihTeHbA==
X-Received: by 2002:a05:600c:3d18:b0:426:8ee5:5d29 with SMTP id
 5b1f17b1804b1-427c2cb8a26mr58123035e9.9.1721423726692; 
 Fri, 19 Jul 2024 14:15:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d692ad62sm37511475e9.38.2024.07.19.14.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 14:15:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 23:15:24 +0200
Message-ID: <20240719211524.10419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721423727; x=1722028527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H0KXtquILHGhnHQ96nGpz/9rHGETAjlmR6TCnyn0b1c=;
 b=PCmfecZ505CWF1hvC9oO+TU26y0Wry0qhWPct3yQwtYHW1hZTsjwa10zkozDQ5aBIV
 8jH4VL6WNEhIhdvv7sIeGpdAWRue6OZjy8zrOJtjAEGZOnjKPrTGpi9+c99DdLbgBTGn
 kD3kTKsaGnUFfmuV5A05SUkwjUQNA5lz+0b2aeDV0uZ/kH7DN0/zkL0fXzXzlHt4uyy7
 ZOhaB06VcV8DplD1NmyqzAhiynSWE0bX1WYPMFDgva2B2G0NIQ2zE0TDhlmZ6EuDOv1f
 iSv+HgYfqQpquCXd6fmlPNDb+FHUTzjdQo/EYngQHCRy6XByng7ZvP0lSqjF0CQ1oAC9
 ZMoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PCmfecZ5
Subject: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version 1.10.0
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

https://github.com/maxmind/libmaxminddb/blob/1.10.0/Changes.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index f5c84fc905..567a428e42 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a80682a89d915fdf60b35d316232fb04ebf36fff27fda9bd39fe8a38d3cd3f12  libmaxminddb-1.9.1.tar.gz
+sha256  5e6db72df423ae225bfe8897069f6def40faa8931f456b99d79b8b4d664c6671  libmaxminddb-1.10.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 1a1a2e302a..84fc3d11dd 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.9.1
+LIBMAXMINDDB_VERSION = 1.10.0
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
