Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1998AC021BA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9041404F9;
	Sat, 14 Sep 2024 21:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrowYkUDKC23; Sat, 14 Sep 2024 21:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA40406ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA40406ED;
	Sat, 14 Sep 2024 21:08:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4D31BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5945240190
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0qdBgJoLFnv for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12CC84014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12CC84014D
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12CC84014D
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:08:18 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82aef2c1e5fso70669839f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726348098; x=1726952898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=677bukMLdkILmwKylamYZ7AESR9QD/fuZeh9MQlVlDc=;
 b=WPWnwZF4MgZtHGl1kz0/aHWR9JTT9WxZxgJdaOqEg/ZG6BYCwYCe3sYKwahfgrQWHn
 QVlJOrGbtq8QD2szxJeCmKjWnmyxMTfTYcsIea9iAkDCcPaGeHthNvUeMsPOoO+MwGBp
 IIDjmwnESjzzWSabM/+/dMqcAglxsUn0haRP5MseOgcAfil6AT7O259lnyxHns/zu2L4
 TGWU9U2aTwOhhLry3AJrx4Pojw/XPSVBfUFOYWZ3tMUSLvUZKmBVXSGMHAsmigHtcZD/
 8W+vuzIO2bVJ6UK4BsKFC69/pvzFZd38ERBIP360Xk3EQNnTWlUlVxM1e9+fbMDC8B5Z
 71EQ==
X-Gm-Message-State: AOJu0YzH9WnFZyXBc3nQfor92eOO0wqRCXiV4J4DzkSU6BWXEptvnQV4
 ia38MUk7v/Y03glDCPzh453qqOlPBkeXti0m6kU9VszwWjVdWh5T77PV3g==
X-Google-Smtp-Source: AGHT+IE7dhpwbQYu58hgz+hs18IOmw76MJzPFsQzIDWjO2saLSviUFM0/TXDyPRxxbH/d1Bx3Ph2yQ==
X-Received: by 2002:a05:6602:168a:b0:82d:18d:bab with SMTP id
 ca18e2360f4ac-82d37842cb3mr833749339f.15.1726348097621; 
 Sat, 14 Sep 2024 14:08:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b733asm57502239f.25.2024.09.14.14.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:08:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:08:15 -0600
Message-Id: <20240914210815.1178351-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726348098; x=1726952898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=677bukMLdkILmwKylamYZ7AESR9QD/fuZeh9MQlVlDc=;
 b=cKon2EBPBlWX4QtYeIvKIuQWRmSdW5sS5rJSvnmIc3ywpdtE5PTl68OJe1LQelY4Z8
 EoH2larvLzMQ4uId5bDtdwxAevV78iqD/ky/XX6BjIg8Ppmg9O9uD2Hmo8t3n0JnvIHB
 kHuVHBwvh+9VzwQzhiFoB+n7IZozDeTQh6r/kUUWaD1i522C+Qm7zWh54TIFmeJQMBOG
 zyZr8NzecC1jORAUEC/swm3L+EKzrzsOnvmuXjv8bilVZGebFeglLHzUNqvFVBXl3/3B
 v/PvN5FscAaBbkxQGMZa4/MM0LRAMM1kSXuSlaJQzwF5Boa8yVxbxYp/htW0TzD4vCit
 Zolw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cKon2EBP
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.13.2
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

License hash changed due to year update:
https://github.com/sqlalchemy/alembic/commit/8829bd64a70708ef9144604ea0f0a5179d07ccbe

Pass --skip-dependency-check build option due to python-alembic
unnecessarily restricting the maximum setuptools version.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 1f752ebc7e..6cfd327f6e 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  29579d34ea694627280b52a3d3116664  alembic-1.13.1.tar.gz
-sha256  4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595  alembic-1.13.1.tar.gz
+md5  0118e72e5ffaf9752d995fa7d6c2a565  alembic-1.13.2.tar.gz
+sha256  1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef  alembic-1.13.2.tar.gz
 # Locally computed sha256 checksums
-sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
+sha256  ce19e7ba2b77ca584b82a6792856e138eb30b311c896b076c09a405ee45fbee9  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 52e30e39ba..79ec56ab65 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.13.1
+PYTHON_ALEMBIC_VERSION = 1.13.2
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/7b/24/ddce068e2ac9b5581bd58602edb2a1be1b0752e1ff2963c696ecdbe0470d
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/66/e2/efa88e86029cada2da5941ec664d50d9a3b2a91f5066405c6f90e5016c16
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
+PYTHON_ALEMBIC_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
