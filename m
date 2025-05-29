Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D32FC54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 16:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589A481EEA;
	Thu, 29 May 2025 16:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkV_foNx27xp; Thu, 29 May 2025 16:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76B4981ED3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B4981ED3;
	Thu, 29 May 2025 16:01:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10939CD
 for <buildroot@buildroot.org>; Thu, 29 May 2025 16:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02446612F5
 for <buildroot@buildroot.org>; Thu, 29 May 2025 16:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9YJi2XFjyrW for <buildroot@buildroot.org>;
 Thu, 29 May 2025 16:01:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21E8461396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21E8461396
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21E8461396
 for <buildroot@buildroot.org>; Thu, 29 May 2025 16:01:04 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-86cf9f46b06so16256439f.2
 for <buildroot@buildroot.org>; Thu, 29 May 2025 09:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748534463; x=1749139263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1lVtnDfdLx9TNyEdLvFTIhsaBt+05+db+51BPYYdvE=;
 b=qndW+gUCzUnnl77hwCbgPuBT3HO2cQjIdCd/xTpRdvfwe0QUGAFJXf+6NH3p0zcMom
 sY6/A7azDUk0n0TGuhkATCXVWH1ASP+BCr03MOYfF1XO/CXZU2VmNaN1Xzand31WD8sU
 zY7XjLTTe4v1TZBBTiJy6/cyu3dFA2Odj1CExRHcw6VZkoVr3STW25WqErC9aln8Y2jI
 JHJ3AfMgEP8nbEDfzd5cx10lyeV0UUuhpXsucuZJOH94StwdklauErxzs73IQVNtjss3
 tRKPUj3lIGuh5wlf9cuprZ8iHwai0g4tdA9f8KH9QGNkby3jeJU2t50/RbG4WyxikKn4
 3OLg==
X-Gm-Message-State: AOJu0YzUTHh0H5CKQCgim2JNaBTvMpQHVid0AxA+gTvBMzpv6RCyFhun
 Yo9u8IVuQJ2csv5vX7d8zmzB3Ey0nSZr9LRmqdiFXjAl9SFTlfGEgW06kYazrme8
X-Gm-Gg: ASbGnctxGjtPjOzcxl4TnyolVKdA6BOZ6H9gEgUhb+XeIT0IMZLzk2GTeIgNxCbK8dF
 YSpiDkbxrogBMKyoQW2aLHuqUaNzsvI9OnAr/p6sjeKD3psEkLHJVFpRVRyWehsRpWekbkCj2Of
 dtpU319oo+PzvDePOyGKuAtylSP3DHnrZtzz3HflV1XwGeXLv+xKhuCkwiMJcwdFHrqGJd1yyn+
 JpptwY1jKkIFPhuDPF42n4IlwmcFkZL67Yi4hyhjv8VKXXl0RF4BrrCJm92fA7+95ZGciBKdxUn
 OG7+dz6GkKZCBKjcUSBoFEtTSZ24xXnarGPwNrneH2Teqn1M6sui+KzUg5cEI139zACdwLvj2W+
 crEYGVt6MbrDNN1Y80qoCwOw06ZGV8w==
X-Google-Smtp-Source: AGHT+IGMTG/kOsmwhHMUnwGSRe+/Ct3DnRjNbV0nOM0zQilKBMp/bjNK0OZSlDj36+nv7+BeJzaRLA==
X-Received: by 2002:a05:6e02:1fec:b0:3dc:83e1:15c with SMTP id
 e9e14a558f8ab-3dd99be1f9cmr3547005ab.6.1748534462746; 
 Thu, 29 May 2025 09:01:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3dd9353e3c0sm3761415ab.28.2025.05.29.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 09:01:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 May 2025 10:00:59 -0600
Message-Id: <20250529160059.3657634-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748534463; x=1749139263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1lVtnDfdLx9TNyEdLvFTIhsaBt+05+db+51BPYYdvE=;
 b=VaI8Aq/fylapCPvZrgzoWBcE20V7tFfsuDuJfYYQaMO7exqaojJzR7sW3a4Sn66E3R
 62PaQFR2tmmxwg2GxTZ2KsZDHSwy10Vg9qTWLgU0Iz27UnsKuV3k5ZYZWGc8BQp21mT8
 LSh/ioTb7LOfOL6+/pRfP0MieYwVS9uwjf2qir970EmhxVQZy7r7yTXoYddZlnYYE+FB
 0IDTt+tS4stSb+u/+czQeYeg6BHu0JZCaMrhi3Y6a/+6jnzjCnio3Y4iv+o32gYV/KFo
 eq4AFfC4t8qpV3ttxcvYeaj+fRopTQEWwNWDDAI6tAC7fivYycUqX+UdwJAh8AbMIUhT
 /41A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VaI8Aq/f
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.25.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index db7e37c13e..7538056cd0 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  fa3177acfcd186ccdef0936dabc79f90  tortoise_orm-0.24.2.tar.gz
-sha256  83d2373efafc1c5d668c3c5bd4e1e7f4a219526e850909ffe88f184da3808fdb  tortoise_orm-0.24.2.tar.gz
+md5  4ae41f379c4ede60df7705d1c7fe71b5  tortoise_orm-0.25.0.tar.gz
+sha256  7d0aaf31c33a25a9efad8f94b44ee50febae15889f4da119cf184ffe98002673  tortoise_orm-0.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index e3c1fd5d90..bf250007ce 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.24.2
+PYTHON_TORTOISE_ORM_VERSION = 0.25.0
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/49/e8/ac7cc41c297f20b3642351e5ff16f53beddea37be285f33f30308838d704
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/d8/02/89777797d2c74386e21fca4a879d15eef6a0a789e4b9564355e94c367e6e
 PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
