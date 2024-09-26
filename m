Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD206CDE03C
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 22:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4545140182;
	Thu, 26 Sep 2024 22:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjYg60x_y9BU; Thu, 26 Sep 2024 22:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA01340462
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA01340462;
	Thu, 26 Sep 2024 22:01:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D020E1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 22:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEA3040462
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 22:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HPe3Ib5AcMF for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 22:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7CFB40182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7CFB40182
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7CFB40182
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 22:01:35 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82cf3286261so65586439f.0
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727388094; x=1727992894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUa9eHqraUikfIx0hElESpGZnP0Pu6gVDE+4Vxom08c=;
 b=KyD3lpNTYm/ssZpkbq/oHidjR/2g0Wy5C7buyp9Tr0ehtIuCOETIF0T4rG5MDyV+e2
 Nhkc6nuWS2CBWIbW4uLW4HyfY2XucBJKMUfkpxijDa8A8gSoaIQFUthMAEjDJnRMeLSP
 O/kx4xFD8eemATB7Mjsy30ACdR/yM16UnIKU5Bc4JqM7PuEDeKm6XyVkM0XEyVDvh06Y
 I7EXUQY8sSbr13NdvON9thvNxU5Iza5gZrMQL6K+YYnjCc5NihYfKYnZVsEyo5HCDJRM
 VUXto5CuZTXczdg0tthzUFBWSh/A6FjoDA6fzAD/V2QNM6M4rNOJdXWO30LmMWH9c4s5
 jYCw==
X-Gm-Message-State: AOJu0Ywx7P0FtK6R9c1u1fJADzoP1bQ5kyPRpBUdtkqvSi1DY1fXFZZv
 ml8/r1nBwlOiep03IqrgbpwJMW+gy4Nhg/cvppGIujXG++1fSmMeMSY1Sg==
X-Google-Smtp-Source: AGHT+IFz/ihV3poxHc7ReGhXHPmH5p/V4tssrojQ7X7mkPjhsyYe3zUmAXwdRS/L4LEpB5PiKtHuRA==
X-Received: by 2002:a05:6602:3fd5:b0:82c:d794:4695 with SMTP id
 ca18e2360f4ac-834931d145fmr124801639f.7.1727388093434; 
 Thu, 26 Sep 2024 15:01:33 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-834936e23a7sm14825039f.23.2024.09.26.15.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 15:01:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 16:01:29 -0600
Message-Id: <20240926220129.206507-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727388094; x=1727992894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UUa9eHqraUikfIx0hElESpGZnP0Pu6gVDE+4Vxom08c=;
 b=Vl1nUlxp+9xAMf0aA+FmP165dLeUy1hK9YesdEsKJep/ww5IlFRhGH+2pGhzcWaMsL
 CmSDWl0bB5nf+LNws8t1QZR4wl8dMKRBw7K/ry/0uBrWlFG7CEmBGAG0btBtL1yepZlx
 rOqIECrI+BL5Jszze3lazSuV2mR6kuFUyXKTypiisU70sOYeou6YJfXmY/RofYlZ8YAg
 LObTMkoBb5J+4Zlz7LWe2+tHZpwsaF2I914Ked1RpfcqbZkD+Zqa0ZRbsaFdKhiTS8J3
 WMxFM3wMk+qwz9YEsgrrpo2i1ErWnYMjNQdEQzzh7XV6MTdqDpFILrYM11AdhRyufIyu
 7qrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vl1nUlxp
Subject: [Buildroot] [PATCH 1/1] package/python-smmap2: bump to version 5.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-smmap2/python-smmap2.hash | 4 ++--
 package/python-smmap2/python-smmap2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
index 424fa58e8c..ee9c1ec570 100644
--- a/package/python-smmap2/python-smmap2.hash
+++ b/package/python-smmap2/python-smmap2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smmap/json
-md5  82b22288dcabfe257d4c1f04c83c7fdd  smmap-5.0.0.tar.gz
-sha256  c840e62059cd3be204b0c9c9f74be2c09d5648eddd4580d9314c3ecde0b30936  smmap-5.0.0.tar.gz
+md5  9779723a7cbd7498d07b2c17b0d0442b  smmap-5.0.1.tar.gz
+sha256  dceeb6c0028fdb6734471eb07c0cd2aae706ccaecab45965ee83f11c8d3b1f62  smmap-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
index 489cf0f758..e43296912d 100644
--- a/package/python-smmap2/python-smmap2.mk
+++ b/package/python-smmap2/python-smmap2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMMAP2_VERSION = 5.0.0
+PYTHON_SMMAP2_VERSION = 5.0.1
 PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
-PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/21/2d/39c6c57032f786f1965022563eec60623bb3e1409ade6ad834ff703724f3
+PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/88/04/b5bf6d21dc4041000ccba7eb17dd3055feb237e7ffc2c20d3fae3af62baa
 PYTHON_SMMAP2_SETUP_TYPE = setuptools
 PYTHON_SMMAP2_LICENSE = BSD-3-Clause
 PYTHON_SMMAP2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
