Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6378CC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A03D81AC4;
	Sun, 15 Sep 2024 08:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1-0HGWpDn3Q; Sun, 15 Sep 2024 08:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2674581AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2674581AD1;
	Sun, 15 Sep 2024 08:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1089D1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CAFB81AD1
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EzGi8agSWpr for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:38:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E62481AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E62481AC4
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E62481AC4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:38:55 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a09d785423so902985ab.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 01:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726389535; x=1726994335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxCSIl0sVmie3i/E+ESutgvOClFhNhIrUW5+9GYzNFY=;
 b=v/NTevy0sgg/7sESa1wLpUYPhoRIt72HMTlZCqksCuNMprRMJGak8rIIMexqKLLufV
 hPcQH7QhnNb5yQ+hDv65dk6LhSTEFoJfwNdUgf+TTiaxjqNBOFKM+4CZHLWGrmkkkgH/
 qu87YyFeNlMYEYQopGsXqTHy1rR3yUP4y7+HmOAPyL02gGg8Mnf9e8JyAm0WZI4Xt50Y
 WQx0/HwiBYGut6ruWsE0otEn6b4Ayh9VzGPtA3iSiNhdqyD8tZUIIYwvScCIe2jtomyO
 CWm0HJ6hQNeDE0+DI6gsFMgaaGgCl0c+CLwf2+XJjnzB+Xy300BxS60lwmYLkrzb9nYI
 yQYg==
X-Gm-Message-State: AOJu0YzT+VdnSJW+LfTeBOLl3iQom4GCU9Km3wg8XcMBKTKVi68XbTDI
 74IDfVDhD3qDwGYjUCdSPnN6L6/LS5+3p1fewTgZNu7M4TGoGkSDI8iWfw==
X-Google-Smtp-Source: AGHT+IEocKkvS4i5+cPEy39dofdQAWTszN3xkoVRK+7v+L2MfdQd/jeVTDCZ0AmPvdDaLXtzhWhKaA==
X-Received: by 2002:a92:b74f:0:b0:3a0:98d9:257b with SMTP id
 e9e14a558f8ab-3a098d925f0mr27914325ab.1.1726389534706; 
 Sun, 15 Sep 2024 01:38:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfdd82sm8933625ab.5.2024.09.15.01.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:38:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 02:38:52 -0600
Message-Id: <20240915083852.1578142-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726389535; x=1726994335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AxCSIl0sVmie3i/E+ESutgvOClFhNhIrUW5+9GYzNFY=;
 b=U5sTIuASszO/OfAFbSvTe+nQLIzVfHICf7Vqu7WXqPAb1fbswCYkNPZdX8OmRahwMD
 FK67p7Vcxj3bOlCFeQw1AtHRIi4cEQmNAreJV0tWnueRsbeHth4DsbsBioQ8xAtXSeld
 AY80dLqyd+wxzUVHdKhzvMYu48y2botciPu0cTbeXZoetmp1PikLM4q2QTOIwPEkQYkv
 2alGuDc0N/McTY4kGhDG3IO2i62KfuzXx54plxgyli3H73q2AheaV3rscSukGxkwNbsQ
 dmqez/jNxPyKEAKeynDJv4oVxA5w8p/AB3DKhkooaaR3Ty0I8iv8Yqvy+61PDAO20NUc
 kSvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U5sTIuAS
Subject: [Buildroot] [PATCH 1/1] package/python-influxdb: bump to version
 5.3.2
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
 package/python-influxdb/python-influxdb.hash | 4 ++--
 package/python-influxdb/python-influxdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-influxdb/python-influxdb.hash b/package/python-influxdb/python-influxdb.hash
index e86bd8c2ca..b8aa5f9737 100644
--- a/package/python-influxdb/python-influxdb.hash
+++ b/package/python-influxdb/python-influxdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/influxdb/json
-md5  e5888a7023e9a49d8a372538b625f908  influxdb-5.3.1.tar.gz
-sha256  46f85e7b04ee4b3dee894672be6a295c94709003a7ddea8820deec2ac4d8b27a  influxdb-5.3.1.tar.gz
+md5  6e1b7c63785720c72b901e2a8c1aca96  influxdb-5.3.2.tar.gz
+sha256  58c647f6043712dd86e9aee12eb4ccfbbb5415467bc9910a48aa8c74c1108970  influxdb-5.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b654917e2c25a69d2bd56e72dddbc6eb29bf7e40384d7c46bb291d5c5185213b  LICENSE
diff --git a/package/python-influxdb/python-influxdb.mk b/package/python-influxdb/python-influxdb.mk
index d77cb89d2d..47bc0e7d20 100644
--- a/package/python-influxdb/python-influxdb.mk
+++ b/package/python-influxdb/python-influxdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLUXDB_VERSION = 5.3.1
+PYTHON_INFLUXDB_VERSION = 5.3.2
 PYTHON_INFLUXDB_SOURCE = influxdb-$(PYTHON_INFLUXDB_VERSION).tar.gz
-PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/86/4f/a9c524576677c1694b149e09d4fd6342e4a1d9a5f409e437168a14d6d150
+PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/12/d4/4c1bd3a8f85403fad3137a7e44f7882b0366586b7c27d12713493516f1c7
 PYTHON_INFLUXDB_SETUP_TYPE = setuptools
 PYTHON_INFLUXDB_LICENSE = MIT
 PYTHON_INFLUXDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
