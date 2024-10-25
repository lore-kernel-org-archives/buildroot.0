Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C94CD149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2CF34122C;
	Fri, 25 Oct 2024 17:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpe9iz7aGXfr; Fri, 25 Oct 2024 17:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 815CF4121C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 815CF4121C;
	Fri, 25 Oct 2024 17:23:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69CB82316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31FE460DF4
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhdAQLUyEvdL for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BA0460DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BA0460DE5
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BA0460DE5
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:23:35 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83aacecc8efso108617239f.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729877015; x=1730481815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b1iU8D0Vsy/GDGiOW353VfaeEVHIOioFCbtOix8OS18=;
 b=TWRjSIMzX4gv4+drlNu7/RA77teITceMRnC+AntGbXDoPtlPp23T97dvOexgSTtggI
 JbGRvIBUR0c+THIe1mV+P/W6grW/QZ6ktNZ7jpBKmgUWzJIdIhQsc29KZdT1oPUwibND
 zS/2QoaU4omBt3cDfs3VX4vlPo7POCse1/xCGcCuWkz9dawa5EHHn+YTafqZ4ycMV+gX
 rX1Ti63cxbjITRQHy+4yJg4oz9d7eGZahm/d/iBvVX2KNVkt40DQARduiLxUINuSTTMt
 2zZO63I6WHZt3FrhU/eICCt6ViF0LP630+oYQrEmnGDsY18fUuVt81NJjYsCs/xKDyMQ
 QMaw==
X-Gm-Message-State: AOJu0YzyemR/DfpHs1PawCtqWId4CYwtB4vUJa9QSmMeemFaQjz6/1wX
 ejrQ5RPddhGUP+sAATUXINlHq0h2IllYRD4s9qNOX+ufCcf8l/6xCli9QQ==
X-Google-Smtp-Source: AGHT+IGTmagi2VrG+8ssyR69F3s1Hd7HjQHn4/06Kfyp4iq2QmI4vvkuPRMeYIi0vdWxa9BhcGnDtA==
X-Received: by 2002:a05:6e02:20e8:b0:3a2:6402:96b9 with SMTP id
 e9e14a558f8ab-3a4ecdce721mr1958935ab.9.1729877014791; 
 Fri, 25 Oct 2024 10:23:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6de0af8sm3628025ab.20.2024.10.25.10.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:23:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:23:31 -0600
Message-Id: <20241025172331.3575046-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729877015; x=1730481815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b1iU8D0Vsy/GDGiOW353VfaeEVHIOioFCbtOix8OS18=;
 b=P/iSnyn27BpEaKRC8PSDtLQvGS6QPviK7+yVA4DtqGJCL6XWYRKVsuhFGuV8/SSiMd
 vFgfX+tyFFoN4nvmdxS3pu8Bat13+TtHfAj11wxlUb1bvNUrskXwCM6H4TWWI2jU3k/6
 ggMx6Ejp4uAHp+nHbD/NyEFaYbS3PUt16SPkNKXhH8KPfiqXLXzwuNDX0f4nAkCo4l1u
 kBOXMMoF5cCFruXsHrSwLVTyYtrQXJ51S8HXyuCtAeZ6Qi9OuCga8YaMOb9Gi6Bkpzdu
 0cfnTMRTE3PSkvnctvduVV4DmZBsbAJq56ST8gTrVhl1Pn3KqjGDaw42SClQxWvHrOSJ
 wcWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P/iSnyn2
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 4.10.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 61c0dfe47f..ecf4d2898e 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  3d1aa3e72ff50c1d779f6a6f543a438a  python_engineio-4.9.1.tar.gz
-sha256  7631cf5563086076611e494c643b3fa93dd3a854634b5488be0bba0ef9b99709  python_engineio-4.9.1.tar.gz
+md5  3e45a23dd8df2d611681cb6970c1fd27  python_engineio-4.10.1.tar.gz
+sha256  166cea8dd7429638c5c4e3a4895beae95196e860bc6f29ed0b9fe753d1ef2072  python_engineio-4.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index d291364705..49d5e298fe 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.9.1
+PYTHON_ENGINEIO_VERSION = 4.10.1
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/50/01/94faf505820f1fb94133a456dad87a76df589f6999de563229a342e412fa
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/9e/d2/b985b0affc5944620e1f812969322f40204f75297c5087fc4cdd44f1a14e
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
