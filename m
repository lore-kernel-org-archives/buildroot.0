Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBF0C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 16:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F29140AD6;
	Wed, 28 May 2025 16:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wq1PylsQOVbV; Wed, 28 May 2025 16:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB7B4081B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB7B4081B;
	Wed, 28 May 2025 16:04:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF7F19D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70EE740FAE
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUOXXvCkG54W for <buildroot@buildroot.org>;
 Wed, 28 May 2025 16:04:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66FA840FCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66FA840FCF
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66FA840FCF
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:04:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so777945f8f.0
 for <buildroot@buildroot.org>; Wed, 28 May 2025 09:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748448245; x=1749053045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ls/QVXzV7nrqeGENlh+nfbsm17axUoGV10y3ZFDL0Es=;
 b=HBrZuCECx/Nyn8eQwEHYLjjGoJ2stJYlZYNtBPoQ+zL5tfg7i36CL5lQ0YER3V0P84
 lv1a10mfRt7/gnTHpqJzdIBEucLnFkrBkRx7XzQYvevKln4ilih7Ku3YUEvj9nlboRmy
 crhVuGwJzPupOU9p6A4eNnZ5dr/wrpT/4UShuBIzfChfbSnPkXwKcp1jz8BiDmHJweFW
 pJhc5AXoxOBXiTJQJRZwgGnlHl2qHJzSLQW9tKcH6W2USJ3o6VhpbstybpYWN4x9HHG5
 TpUDvonDNHaTIg5VU1ArtzhfwtXTIT1yFpA4/xp7TGv7lzzhId2FexyzwolATdGTsXCT
 sH5Q==
X-Gm-Message-State: AOJu0Ywb6oEbRHuxB6wWeDxCwrMgFYkJzfzAd5qhbPz6Jcf/W7sEmIv+
 dU2H7U7knSLvmYMuocRT9Td/9cI0ZxKWqNca8FTsdxOocau8m1/koDa4f5uYuw==
X-Gm-Gg: ASbGncsRap4oB/HQEWOCeHn8Wlv0p2Lj5dj9PiNW+J7qZvdU+L2d2vQz20qt0NkGMNl
 UKKcsjKNY+x2OSNGlud8m8mJ1BQi+pSEtoH43kfunomWUDuDxipeuiy6rC5auE/ZpQ0U6rMm0nm
 AiCgTD8E5oQhv7lNxzepvqoZX27g5136Ed4Oogdsv6oUQQldEFv2+ooi1K3bj1gNXi8h89czdgL
 yvrBQdmSG/RjyXKYouAsuYSCJ3pVrmyVfA8sugvN876yZVb8tRK8xiCyAFaykHrwthM9/mfM13H
 LaVWZBU6PkjgV40cqONXMwWRzKAF3p49Bs1ZPMx2Cy9EiBUpswAFa5pG3+nIyqM=
X-Google-Smtp-Source: AGHT+IG2Rttrr7xKUvGCsb93lAt/K4nNopHBigfNbprjqmAGN9Mu9tVIq8YmjD8ASGI4FzKjzTzMYw==
X-Received: by 2002:a05:6000:2891:b0:3a4:cc8f:a3d5 with SMTP id
 ffacd0b85a97d-3a4eed9914cmr80745f8f.15.1748448244850; 
 Wed, 28 May 2025 09:04:04 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4eac6e615sm1880572f8f.19.2025.05.28.09.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 09:04:04 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Wed, 28 May 2025 18:03:55 +0200
Message-ID: <20250528160355.1607644-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748448245; x=1749053045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Ls/QVXzV7nrqeGENlh+nfbsm17axUoGV10y3ZFDL0Es=;
 b=IRk1e3ylbr1+v3sZcBFEhTGsrPmxaWy7H6MTMrXO3lMwN0M9jTZ5Mp+IqfkRyjjNor
 SitVb3H7HXK/eSYHL7+ARDitCD0isJsZGUzru8Zc4l4aFdeo7O3RTUSaBU0AyOSENaXu
 eo+KDyDbjMH38W9JL8DjnZQXEYd+WrpbqhmVFO57q3QirAF89suSy0/y6wtCxJXFSKGe
 Z2eKzBA0aSm43eivWqLKXmT8kpsW/j6mzMY4Og3OrWtCOMMgdHct8y9hgS8QAyxWmOYc
 0uOE+qIWFnWj7hJcHVXEEOzmUb1afKuwL2Xqm0e7iuGUzeIvy/gO1/8wCWHeOhEjmiFr
 3QTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IRk1e3yl
Subject: [Buildroot] [PATCH] package/uacme: drop unneeded autoreconf
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

Commit 8c9c1222b79a (package/uacme: bump version to 1.7.6) bumperd the
version to 1.7.6 which includes the patch we carried, so the patch was
dropped, but the corresponding autoreconf was not.

Do so now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 9a2c972604..fc5b97d23d 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,9 +13,6 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
-# 0001-Fix-cross-compilation.patch touches configure.ac
-UACME_AUTORECONF = YES
-
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_LIBS)"
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
