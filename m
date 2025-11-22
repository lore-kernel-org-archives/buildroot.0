Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E2ACFC522
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 17:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB76941EA8;
	Sat, 22 Nov 2025 17:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veTuv9GlLezl; Sat, 22 Nov 2025 17:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E7941E55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62E7941E55;
	Sat, 22 Nov 2025 17:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BC3350
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76EDE60BB5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekk0EHiML_iQ for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 17:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6845760BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6845760BA7
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6845760BA7
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:07:26 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4ee1fca7a16so25911051cf.3
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 09:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763831245; x=1764436045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40uT61ONDR1cq1qEkFuP44pdyWUl1DommrZpMqDSu8E=;
 b=NERnfz0PRF55luKAVzLAfXnelGSpda5XgTCNgK8HlxEPCrFQReORUUrvArdCJKxPBw
 Si3RfTrS2WhynVvb9nkKY2vwvTBOinr+RZrQnV/+sGkd5zzGmQc/oL4plEWhFpAS2kGd
 myBjS1UbZxOW/5ZyKwsaqKrSauB2IIOwRUjE1NsEbZaWKUChUAoVPZzK7A9UeY0uQ2we
 eQWrQHjgGNYSXHFFc2trUX66Nbb0g/6s5K0VHhsJ5AiKRFDZxXM4rQlm+IdzNNgc8JwF
 Is0s8c3Xi5uDITYY11lwUDYZNhfhE/qYyX36Bym819SdtAIvTKebRjMJcn+U5I59N+AX
 yQ/g==
X-Gm-Message-State: AOJu0YySDhBxojJQ8ioQQNfqHYIeFE/+jX+BUwI3igRW9O8F+rZ7r8OB
 j5YTT+K+Ye7kC4K/88ASKw3IgZdOrwKdBCJHx5+7znyXHbJueJR1sWzx5NQiTg==
X-Gm-Gg: ASbGncvU2Qx0aH581eHMthr8KgzOFc5wXeRsbRPcAknv6urGJXrgSeW1RVCUqH8PF6+
 vAVAJ83rMWjcir/qJJ/eGpeGiPxfFGjaAnzHfUv702UHucPdEKeCDuu1wu3tNltEcTv7ngAKxOW
 iyvypUyW7j/s/8nArZ2grAD71QSpEgIdhf9YplJPKYsUqvPkDO79tb/McpnyICW/jAnWhkVJgZc
 1hVzs9MiNOnVhV1jFhXJ1iXeNhU63UQ+XoKAioI/DuXi1/Iw4BEbKCNNMQZ7PRgr4GVFjqYzNQA
 W0tiDr1mW7kh/Li1Q+MAhKKtUA+2IAEtpgg1aH0y81GPnuk++SZKVCEQcX+AxH4PE+nQvQJTe7Y
 ErUKQOfp2d20bPT6kqh4XpGAyABsBB8jI2iAnc8ZGcZQdw8LA5/L/UU+1WwR7N7QmbbwcWVDU2W
 PTXQBab28n/2NQpcktAwqpfYfm05JJPYxeXcsCWIv9Ci8gZiE7sHkOp6tom4M=
X-Google-Smtp-Source: AGHT+IFuRcjpzzmJhD+1iOe1K15UgSIK1ZNaGQUytwQLzZ611YhBMi8dMLbIKRBwIVShzjjYM4gxDw==
X-Received: by 2002:a05:622a:3cf:b0:4ee:7ee:df72 with SMTP id
 d75a77b69052e-4ee5883b0camr88896411cf.28.1763831244960; 
 Sat, 22 Nov 2025 09:07:24 -0800 (PST)
Received: from zgyarmati-t580.. (C3E45AE3.catv.pool.telekom.hu.
 [195.228.90.227]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48d571d0sm56745601cf.12.2025.11.22.09.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Nov 2025 09:07:24 -0800 (PST)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat, 22 Nov 2025 18:05:03 +0100
Message-ID: <20251122170503.2020720-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763831245; x=1764436045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=40uT61ONDR1cq1qEkFuP44pdyWUl1DommrZpMqDSu8E=;
 b=SKiVVViWjwq63m36+TlOyjpG9Whw7TLqjB60/l5VRmi8zoeqbwJWpD/nlwjQ9V1ahq
 nl+9i9MkpIoIkfSaJ0Bq0CswveMua83vg637TRe2KVewy7YKxqOYkiCkGB6zW+n0H1Xc
 1hvbsGsBz60e6BwtdlsgLv/+qn2dr8kT3tJ9jRsRVf3434ngBc2k+8bRvL2nVwJjqBsy
 Z6JNHmR5t3LrBy1hn6AQkJggyLKScEs8LRQRl20diq2B1t7Sy5ohZmYDvJQZ1SRplP/r
 oqmJJkiUnLZaAHAS4QvFGbnFNINhv6+vi9HqyxGfADMwBg2USyUOficSJRAKNTYzW/gK
 vlFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SKiVVViW
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to 9.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We jumped from 9.5.1 straight to 9.7.0, for release notes, see:
https://proj.org/en/stable/news.html

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/proj/proj.hash | 2 +-
 package/proj/proj.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 5249f52c10..4ac7b444f4 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
 # Fetched from https://download.osgeo.org/proj/proj-9.5.1.tar.gz.md5
 md5  07c44ca4a65a0664ce823c8448707c78  proj-9.5.1.tar.gz
 # Locally calculated
-sha256  a8395f9696338ffd46b0feb603edbb730fad6746fba77753c77f7f997345e3d3  proj-9.5.1.tar.gz
+sha256  65705ecd987b50bf63e15820ce6bd17c042feaabda981249831bd230f6689709  proj-9.7.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 361c1e50b1..4840824f69 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.5.1
+PROJ_VERSION = 9.7.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
