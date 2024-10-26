Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6085BD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192C2401CF;
	Sat, 26 Oct 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOO51HELvHlU; Sat, 26 Oct 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C55DD401E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C55DD401E1;
	Sat, 26 Oct 2024 20:51:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1D405C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D29E6605CF
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGYrl1_6qNmt for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F11B7605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11B7605CB
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F11B7605CB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:51:28 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83aac75fcceso113038639f.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729975888; x=1730580688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl/pW70s225Mh2QDjqxKFxCs6Ofy4lay9e4w0xxXDRQ=;
 b=mLKanPI2vRVFyuD25kyNLiSZ8O1C3v8JgzF3oOZcgaJRj5j40x8SjoYfYw8MN5EylP
 Z6RtCOhgveLsD1UXNLi2G7GFRmgoN5+D5zYOOl+kg2vzN5UTOosfsIpDQQ6Fs7piLIkj
 Fr5NiqjWiPeUxqJZCIlbno9nitYxchmMxi8xci3Gu1LfwVyRFEN2CQsVQFuAZGBSfAm/
 sVctWQQ9RT+LZXTFEwRSn7IeYIKx3m3MzzyrWhDhbPSKIud+ShSceOR26sAQX08Yqw5p
 DXtmtibJ4vkgEqMXQsqxEQmJ77vtdlfAqfoH3ERHJu0VXFskBfuaSBj/fiHd5J+WkMFW
 MZmg==
X-Gm-Message-State: AOJu0YwMJKz2juQTE5kljl2W/ENJbuIX8KNopv60K8QKItxs0871O8c2
 YSkjQAZXK6az5U2ymWLdmWQmjKkiUo5wjgC+zqcW34uWHHIdersusykCrQ==
X-Google-Smtp-Source: AGHT+IH/m40m806FH3pWS5CR5ip4N4TcanrlBHg8qf0AmHpaBK3wr0iL0X4BS/L9BbafaBRw8uUVhQ==
X-Received: by 2002:a05:6e02:1886:b0:3a0:8d60:8ba7 with SMTP id
 e9e14a558f8ab-3a4ed2f666amr27526585ab.14.1729975887680; 
 Sat, 26 Oct 2024 13:51:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72618212sm875290173.53.2024.10.26.13.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 13:51:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:51:25 -0600
Message-Id: <20241026205125.3624149-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729975888; x=1730580688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wl/pW70s225Mh2QDjqxKFxCs6Ofy4lay9e4w0xxXDRQ=;
 b=YCG97wy52417HGvGkHh9Ty6zMZh45AolOIQZpS6oR+dXHlJgQZtaLHlZs/jarqtYov
 16gDweXi6357i08qqFxNT7avrvm6SJ6nYRLE3oDxiHR/DYVORgITMdNW6gsV+kscebUp
 rRn944aqY2mAxtNMAXuPgkk6qHBTk+2SXzZJbeV2wIFIsubdHv2j3tZxcBG6fgsig5z4
 jnSSwvoeL8H7rkkNrmuRYvWm3pV50/VC8A12CefjMsIjP63keMT8kkrMmQp8YNL3vdEi
 1VqSS+ulusB6ro4PGpsyyEc8eFATm91XlPLA2BAAk+4m0AkQBFKJSrHdQQVbGTMjcHSN
 lP3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YCG97wy5
Subject: [Buildroot] [PATCH 1/1] package/python-markupsafe: bump to version
 3.0.2
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
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 8902d3d0ec..c5ba015592 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  202a35d8c8309cd6e70f8b03c5eb7b61  markupsafe-3.0.1.tar.gz
-sha256  3e683ee4f5d0fa2dde4db77ed8dd8a876686e3fc417655c2ece9a90576905344  markupsafe-3.0.1.tar.gz
+md5  cb0071711b573b155cc8f86e1de72167  markupsafe-3.0.2.tar.gz
+sha256  ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0  markupsafe-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index c96207d14b..11e8708270 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 3.0.1
+PYTHON_MARKUPSAFE_VERSION = 3.0.2
 PYTHON_MARKUPSAFE_SOURCE = markupsafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b4/d2/38ff920762f2247c3af5cbbbbc40756f575d9692d381d7c520f45deb9b8f
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b2/97/5d42485e71dfc078108a86d6de8fa46db44a1a9295e89c5d6d4a06e23a62
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
