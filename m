Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA22C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F9BF40289;
	Mon,  9 Jan 2023 03:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F9BF40289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2OcejVwJjdt; Mon,  9 Jan 2023 03:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 711234013B;
	Mon,  9 Jan 2023 03:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 711234013B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E93031BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13D9460A81
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D9460A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qs8fKkXLRAOR for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:23:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C1EF60A7E
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C1EF60A7E
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:23:22 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h6so3968444iof.9
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xv/bq7E1CNJVzGM1OZ9j27MXyjRdb/K2s8ia4HNA960=;
 b=DvWY8WiWQahqA9MCJlZKjKeU5nJ4S2k8i3WMhpWSET+5kCI+xAlQJUmO7aATc8zItg
 wErh7GZVPQUu/liwa5RlwdcbAfYA8d6j1e5I/WrWVkt60Y+DAGQ9+8oOw2L34fFLanPI
 ufYutTpfHtE2Czx/xs7h/JDDC9HYqUf+eX2EwZGhB2I78QvtxJIKjHMg+fFu9aTXTUS5
 nmHnp6t34Diii8M9918BHd2dliiczRfR7bBT70QZ2YLgoRezj9pWy4CpAY4j/bi7tR6N
 44LtgDXqn1N0yP0d566sKfCbUBUAZWKt8ef6DTqKTActL49A0/5R581ODNU4kq2ChnDj
 dL3A==
X-Gm-Message-State: AFqh2koaxOFzxZspnnTPL7K1hGMC5HFbPsn2vXeGC+magz0voqaZchm8
 XZFLnQ5SxONuu8emU2giZn2RJVN1ik34qg==
X-Google-Smtp-Source: AMrXdXu8Ce0bquPQIDBw3HT4oiWKebneGiYK+i2Tepgs6Opi13NvofxWlW5cZTQdDpKfpuGrSDFy6A==
X-Received: by 2002:a5d:8b45:0:b0:6e6:3314:7b0c with SMTP id
 c5-20020a5d8b45000000b006e633147b0cmr51308218iot.1.1673234601054; 
 Sun, 08 Jan 2023 19:23:21 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w189-20020a025dc6000000b0038aa3699c9fsm2427723jaa.95.2023.01.08.19.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:23:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:23:18 -0700
Message-Id: <20230109032318.2073576-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xv/bq7E1CNJVzGM1OZ9j27MXyjRdb/K2s8ia4HNA960=;
 b=efBY3dvpmU6fttJSlYylUou/ZPWMze5vPK1Sb0NlpX8WiBgzwBpDIkwDJjba4omQke
 K9TjZ/aUzCNL04BDFTTcZOZf3OBl8jZJ2YmC6jdXG2tjPyM9zKam/UPaSurQ/BhvwL/F
 RDlAy8aNYb0zEF+T94eMaFqHDymwvbjG3IqPX/JT2ZOkDxAesruZzcBg/8U1BfnTIbWO
 EBnm/mHojYOwa4Kq6Kytyrymw9FZ6c/euzCdZA8l9YhFjtZ7xtxYuiyLZS4/HGOLL2eF
 pn06uaAGp4cTjOs18YRzaEDaUvRqck4s+jJdUmFkUOsLFAG1V85/vbjq9gkraSuRT3Q7
 joeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=efBY3dvp
Subject: [Buildroot] [PATCH 1/1] package/python-canopen: bump to version
 2.1.0
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Verified license remains MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-canopen/python-canopen.hash | 6 +++---
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index 610dca3f34..e6485e72f0 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/canopen/json
-md5  0719b73bd8ccaeaa9fb758c5338fd030  canopen-2.0.0.tar.gz
-sha256  bcc8aa9ea83f7ada5da0dade81038977be52a93802c2657649729eb1f82065d9  canopen-2.0.0.tar.gz
+md5  d51443bdc8a55faea63c9da82196dd47  canopen-2.1.0.tar.gz
+sha256  bc126bb1dcb62e3b34d8a12e38a07b5aa8319c17457c9bfe208f0bbbda90ff61  canopen-2.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
+sha256  d9035caf7b8b135899da92a2730e2ac2e9f5ae3220dc98bd661be18045fcf689  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index bd0a3bfba7..a0f5220ded 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 2.0.0
+PYTHON_CANOPEN_VERSION = 2.1.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/9e/d6/6ced4b410b904aeee5f7d0227187eae95a5ad769f01014a74fc0e016845e
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/29/d1/54462c949c384b1a9a2bd260143a8ec6f4259a18d119bd122e8f8a791b50
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
