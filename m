Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16ABC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 11:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D873440363;
	Sun, 28 May 2023 11:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D873440363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yE4yRBoc3Uv; Sun, 28 May 2023 11:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 044E140111;
	Sun, 28 May 2023 11:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044E140111
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD921BF2AB
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 11:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 363C660ACA
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 11:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 363C660ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tpoIv226MZE for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 11:30:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5890E60ABD
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5890E60ABD
 for <buildroot@buildroot.org>; Sun, 28 May 2023 11:30:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5147f5efeb5so3519414a12.0
 for <buildroot@buildroot.org>; Sun, 28 May 2023 04:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685273452; x=1687865452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6qffcTb2s+auAQRagubYzHBQO3k76ZYl/PgFzJsrpQ=;
 b=VWdV1K/h9bgsJwDjejZcDz0j/uKeqeKQtJ9LgMsHLU+Go1QsnXzGRZ+8zNvB46FZkz
 ihCmcAB04i4cZ+T0sXMSxq7f6ZTBGNxElTJ0Jw/TaPHr1jsXrhoWYWzv23/oqk6WNvoo
 TVeNr6je3Mb4uBpzrUzuwBwIPf1FwahuxHb7Ypu3Saa9IjR39YI4W7FDBVbuuZI8/kg4
 ESof4OPEJdkJDUgwwe7A7kClpgoevVcoWmM0OT4Ye8NJYsbVH9y+p6rBcffi11APPTxO
 XQPq2FlZHnM/D+DMcn+2irJcVTIfXKhZcPgiX79i2ZTeQ+cg93BlTFlAbuSJFfYsmD9p
 DxEg==
X-Gm-Message-State: AC+VfDz2YQZ6BflW3LuSukMNUrRR3AUmeqESg8Q15L1dNLnhueuW2KOc
 O2SFLfFJu6uIPOKeNlwmKww+4PBQM2R7fWgF3h+yXQ==
X-Google-Smtp-Source: ACHHUZ40ng6yyqgzAPzoB/kEY8tsbJ8ZhNORDkojtRik4vuTEJLZZWEIiDEeAw3VSDIOEhrvmcM6Vw==
X-Received: by 2002:a17:907:3f82:b0:959:bbda:fa51 with SMTP id
 hr2-20020a1709073f8200b00959bbdafa51mr9782627ejc.41.1685273452053; 
 Sun, 28 May 2023 04:30:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-38-128.retail.telecomitalia.it. [79.31.38.128])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a170906714b00b0096f89fd4bf8sm4561532ejj.122.2023.05.28.04.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 04:30:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 13:30:42 +0200
Message-Id: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685273452; x=1687865452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n6qffcTb2s+auAQRagubYzHBQO3k76ZYl/PgFzJsrpQ=;
 b=N5dAuXsyg/CYvGuu3CRXjeo2XQ9K2QnM3gxBqfnUTcLEgNUOMbiUqD/L5gGt+7aAGU
 QLqpIlgMYlke6YHrkdtesTfPIsNnMID1p/p8rjXK1sd/EO5Zv1FGeWGTyjwSzGPLqZg5
 STOAPUQJKY+vMMuU+McvcjFmSHnGkjNizOOfk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=N5dAuXsy
Subject: [Buildroot] [RFC PATCH 1/1] package/automake: include .m4 files of
 autoconf-archive
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch expands the number of usable .m4 files by including those
contained in the autoconf-archive.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/automake/automake.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index fd7933dd74f9..fc235784641a 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -34,5 +34,6 @@ $(eval $(host-autotools-package))
 AUTOMAKE = $(HOST_DIR)/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/bin/aclocal
-ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
+ACLOCAL_HOST_ARCHIVE_DIR = $(HOST_DIR)/share/autoconf-archive
+ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR):$(ACLOCAL_HOST_ARCHIVE_DIR)
 export ACLOCAL_PATH
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
