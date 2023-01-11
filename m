Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DB6C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 01:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2CF82062;
	Wed, 11 Jan 2023 01:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC2CF82062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jolL3-UexJg; Wed, 11 Jan 2023 01:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F80082056;
	Wed, 11 Jan 2023 01:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F80082056
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 611851BF40E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 01:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4978A40476
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 01:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4978A40476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAIMk6HCzc8w for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 01:25:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526C840106
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 526C840106
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 01:25:05 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id a3so1353792ilp.6
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 17:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ikkAtcm5fmBBFWJqD1XVzTwMqerBHX4md1FOKmvKfro=;
 b=7SwO1iBGvxERzmdKzzxB070BX/avIksH7BzUhhZv2zSJ0Pa3o6qsimjQ92MAg2d0pq
 daBiVjdFDokYZtSnByIgZ4GiNeuN3kO+WKhTFvD2Ar/KbuCoxpZdSwi5b7ZAbohbAPF7
 qFRYz690zUzgpdl59nM2W/K9fsTN2FUeWdxNXz/1wq4sP9hQ403n5PtYLZTN/pRqmC99
 CsjrMm5BmDwDwKOL4pOnXkPJimjJbJAP+2pHWOKtfpDVhl250/9sWEUg1eesqxCtEXBd
 Wa/oRruS0O6la8ferN7QwP2Lq9bwvsvS7XuelGG03hpmbB05AZXkyP3vMQwZDE2KPll0
 OzBA==
X-Gm-Message-State: AFqh2kr36zMVDV4HNL3bYb+rGAvzm3+l9/jnKccHE/nJVRwKAgdFJXsc
 Z6fecoY5hl+258Y5JNUq5PMihfzLc7vL7r15
X-Google-Smtp-Source: AMrXdXuC3ZO+cZ/exTK8Vt2CFpsMLs4gzyB+ZN51z3c6ulArIK1JoIEjmNLg0ysEKj+y9VfzSL6cmA==
X-Received: by 2002:a92:6512:0:b0:30d:afea:fd56 with SMTP id
 z18-20020a926512000000b0030dafeafd56mr4481070ilb.2.1673400304220; 
 Tue, 10 Jan 2023 17:25:04 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056638216200b0039e9628324csm1211754jak.20.2023.01.10.17.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 17:25:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 18:25:01 -0700
Message-Id: <20230111012501.4090446-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ikkAtcm5fmBBFWJqD1XVzTwMqerBHX4md1FOKmvKfro=;
 b=Xoi8h5FZA+XlG+6czmcR7NoTL6KEY/vvMwqHEdiYCLQn2ZRjkYJuWYCvgFYE+b1den
 DBa4hR/A9IjUmBnOufvg3ofyxUchX1XhCys9pYxmcQr1+sp+eg9FYA7iDPpH5yXd9IPH
 lAmIfwd81nZcw58S4WuSXcMWKWxU179CQH35GHSOLtjdv6U8gR0LzvZ090NKZSZy69M1
 v69nt4Jgx9qcaK5wF8yITa4MfAPEnFwLdJaCHbX26iq2t1P79fxcJtwDQw+Ys75+p7YU
 2tgakEXJc2RhMu9fO1Ftja/2DBipro1I/TRq8bTywypgA0lDxD35OLK4OU6A6MPMwraW
 iwwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xoi8h5FZ
Subject: [Buildroot] [PATCH v2 1/1] package/python-orjson: bump to version
 3.8.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
 - fix vendored archive hash
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 515590795b..f1298c05ce 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  0c8d161dfd8b9e4133beabd81e3e1473c246efe55abec571845f72a2ba7b74e4  orjson-3.8.3.tar.gz
+sha256  b932fc1e43598fb91022b1dc651afeaef650793a2a590ca4fbeef57a3808abf5  orjson-3.8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index bda0a8ab48..8eeadecb3d 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.8.3
+PYTHON_ORJSON_VERSION = 3.8.4
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/1c/b9/a0b4fb195ded02820e0a933ffe28b782b7e5ef7a4f8c1e1c742d619548e4
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/8f/2d/ae31eddf7e097eec5e25c7da954ef6e944f4dbf79153676f94cea3dc5116
 PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
