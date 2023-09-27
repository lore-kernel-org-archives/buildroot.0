Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9DBE82CCF
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF2B4018A;
	Wed, 27 Sep 2023 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF2B4018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbhJsMJ9sui0; Wed, 27 Sep 2023 20:09:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D58740518;
	Wed, 27 Sep 2023 20:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D58740518
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46B3F1BF267
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2001C40518
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2001C40518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_UiDJZF6OVq for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:09:42 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB8864018A
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8864018A
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso10195271f8f.0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695845379; x=1696450179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=klhIsvB1xVWx7UhszJfl/CP3fxqF3jRxdNkDZQQhe1I=;
 b=M1Hzhf5M5lXe+FT/EHqXZH5iy7Dz9vY4rG/LRhtXdUiC01Em/XOwLZfLvntmEQGiUW
 tvRx/UU3TLLjXi2O5/L/OszbgCjiVXlOYOHYK9Qs03EGozYBEoPvY2lFwPKMfaSbvJTv
 2lUoul9tMT7azWSAfJminDeMwIMrmFBlTH5bJjNrPcUVacQBc/y2jGdHTmri13nUcYdi
 UyLhAKrHthv7EPVzljbLMjhIglapcV7T1iFc+dXMfk3sZdWe8QHc7mOMp4dElZElSE9H
 YZWQnjc1LpimMOiMkz139ZO0CqJYwkV7eOtj8Hh68PZwIpIreKElDYO69nbkYU3EZ1ck
 DqGA==
X-Gm-Message-State: AOJu0YxNobn8/r9QqwZiZjF8W3XERvDE4lUZL+kyLPvt2wPu4dwit66k
 ZtgeEch39YiMv9pi71fAFdBupDgFstQ=
X-Google-Smtp-Source: AGHT+IFWeBq8f3FwtbsQgzSHny7BacloQErWJfm0VzLhlUnjhg9PtB7408nJBgmNKZT2Ww/xF1/1iQ==
X-Received: by 2002:a05:6000:4cd:b0:317:df82:2868 with SMTP id
 h13-20020a05600004cd00b00317df822868mr2693349wri.26.1695845379565; 
 Wed, 27 Sep 2023 13:09:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i11-20020a0560001acb00b0032415213a6fsm2740111wry.87.2023.09.27.13.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:09:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:09:35 +0200
Message-Id: <20230927200935.495305-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695845379; x=1696450179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=klhIsvB1xVWx7UhszJfl/CP3fxqF3jRxdNkDZQQhe1I=;
 b=X9dGFYgh+BRJ2QvreS2cuPHYYXoIkd7vS6ORZGofIBQ1mKoKtfJ6/RMvedrY6Yb2ID
 5liWt2yU6FahlCOupalID+ptZ0aWm9nCVhuQvIqbQw29yN2Nz8n49eVMnrotKjZgfmy+
 CadZdSrAnTsRwV+73FGocNbADDpBFxWWrydiljUQmxdzWk+a7ij9Nf6wdt1mukLyokHp
 6LMjABESYzeVqSFFKXWdaLld5Loe4jts5hkEeAArQMDjgxNpN1GQ8iiK+6bT6nAsfDs8
 yhj0hWJPYYJcXpO8p7x5bIP3kfsZNj+htDGxSKTyVsUi1pV5B8kVgJfegNHjpVUvlbJh
 sXbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X9dGFYgh
Subject: [Buildroot] [PATCH 1/1] package/minizip-zlib: bump to version 1.3
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

https://github.com/madler/zlib/commits/v1.3/contrib/minizip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip-zlib/minizip-zlib.hash | 2 +-
 package/minizip-zlib/minizip-zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index df5e8d723a..23bfda8474 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98  zlib-1.2.13.tar.xz
+sha256  8a9ba2898e1d0d774eca6ba5b4627a11e5588ba85c8851336eb38de4683050a7  zlib-1.3.tar.xz
 # License files, locally calculated
 sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 4367a2420f..259570f75c 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.2.13
+MINIZIP_ZLIB_VERSION = 1.3
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = http://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
