Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39280C61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 00:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D2E4004A;
	Sat, 25 Nov 2023 00:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94D2E4004A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDYa3UrTPxE5; Fri, 24 Nov 2023 23:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70025400D1;
	Fri, 24 Nov 2023 23:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70025400D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF6DC1BF20B
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 23:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9883A60B0B
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 23:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9883A60B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONh_8Md9hXqu for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 23:59:56 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E7EF60AEF
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 23:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E7EF60AEF
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35aa6107e9fso8128035ab.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 15:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700870395; x=1701475195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tNuHaL4H3S6bucnMs3XooL1lYsnSrUFWyPiwmMi9JW0=;
 b=PB5qMIzrtLbjJTWmuw8HBjS/ulpA2sOm2Di9NcL0y+kWmUqwUuYJIvryIzEHp1p9Pf
 KqQCeApLgM5X1e2f2HSsSL1FlSzUI7WaYmwaPzzfJtEYFiajdU6zq/gd42ST0Csw5b8m
 HCbusXspvIwjqdfALyexAcTL/zcT62y+SCl16vEILiwdw9MQx9LVwKW5XD5grbcFgje3
 KtyGVraDhGpEau/GWnu3QG8M0bzIDUa8nYWQyIWoCwxtrXG2whWB0+YTBG1Hf04BUgDj
 wBaRLDm3saXICWOJhZZLYceX0+kCxBUVsxSpRI5QQzZhkhNN9+V8vux/z7Oaf4YrNUo3
 yBLA==
X-Gm-Message-State: AOJu0Ywz4s52DQZhBG7wMqqsw/4bqL/0Irj3p1rfFEemaD1dGEaEuJrq
 lVTHcT7abhhM4sATSuwPq9sfHXP55TM=
X-Google-Smtp-Source: AGHT+IGiIw1OJMg9ABZiseuNaRfOgwairHvpqJsMy4KQ0qo27cE9+oQVklyjljihqkp2pK1IGxcBrg==
X-Received: by 2002:a05:6e02:1a45:b0:35b:2765:4e80 with SMTP id
 u5-20020a056e021a4500b0035b27654e80mr6014381ilv.31.1700870395330; 
 Fri, 24 Nov 2023 15:59:55 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 ed20-20020a056638291400b004667dcd2c04sm1073836jab.43.2023.11.24.15.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 15:59:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 16:59:52 -0700
Message-Id: <20231124235952.12924-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700870395; x=1701475195; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tNuHaL4H3S6bucnMs3XooL1lYsnSrUFWyPiwmMi9JW0=;
 b=GeOZouZh2Cw0LRJ33B2cY8oWHwHgjKdAeeu0gm6Tau0XH8/S+2ixDawAyZ3P4DaAgy
 QGMRPRrCMZXoSIYSML01OuXFVR+YTb7+8QiMaY7gDD5rQ908Q3ooGnPfzq1ycDajclSD
 w9XnKZVgMu6QyjeOnYa0Gj1hExovHEe0Vh6bK2zgIB4OzSSrxF12K6ZL6QX7z/ZPJxDz
 5HYoxFUMl8cKCy2zb2ip/YpvhLqwj9rgcrJT8+QMm0wC3UCXNaYYwolshvkYcqlO7iYV
 ujJZhkgJfZF4moXBoE7kG/EKnUnsseFaX9FahLmtod86R/0qO4EdzZ+1zXwKoO1Av272
 B4Jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GeOZouZh
Subject: [Buildroot] [PATCH 1/1] package/python-mako: bump to version 1.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/sqlalchemy/mako/commit/272f5d8cc97aee829e3b285486f33c9c8e604c74

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index a010e8d8f6..03651cf956 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  651f365616611fcd4f2702a9002e2195  Mako-1.2.4.tar.gz
-sha256  d60a3903dc3bb01a18ad6a89cdbe2e4eadc69c0bc8ef1e3773ba53d44c3f7a34  Mako-1.2.4.tar.gz
+md5  90da23903468efe9aa88dc88081579ff  Mako-1.3.0.tar.gz
+sha256  e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b  Mako-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  760f22b3e9ea4a50eb99201bd8dd118869f28108cfb64ccce6d1b305cf9ae9fa  LICENSE
+sha256  0a326e448dd22f220dd30796677ddbdf3ddaa6427a9744fea9deaa51d9d74fd9  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 313fbfcab2..1f7a0b0657 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.2.4
+PYTHON_MAKO_VERSION = 1.3.0
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/05/5f/2ba6e026d33a0e6ddc1dddf9958677f76f5f80c236bd65309d280b166d3e
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/a9/6e/6b41e654bbdcef90c6b9e7f280bf7cbd756dc2560ce76214f5cdbc4ddab5
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
