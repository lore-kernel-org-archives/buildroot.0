Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF45C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 06:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1752E60E86;
	Mon,  8 Jan 2024 06:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1752E60E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5F9aUvJJNEv; Mon,  8 Jan 2024 06:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D6360D88;
	Mon,  8 Jan 2024 06:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D6360D88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 424DC1BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 156B540545
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 156B540545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wimxjdse1cDC for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 06:38:48 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFE95403E7
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 06:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFE95403E7
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3608402ab93so7049185ab.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 22:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704695927; x=1705300727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=usAfeugyVJTaB8IXZfAg8quUGsP05TZRRdSEM29U6TM=;
 b=Mxaveg2CIYuaBvhJNVLP3jB4/aGRvVAkz/t6f4a7uy/DfaXSadphckj7aj4p2Fv0O2
 UUBacV3nZLPMUS4cu8x/LpjwMexwKgRcAeBYpUehlYMzmgmsQ1m/Hhgb2rxjumFGfgdp
 HyX6EDnQGVdKKhPkULzM59ydnyBXWW6hFgyCjj1l6ZT2xYrhW0uhOjp/PXOE/kXJE+nk
 PZRGQK34d2A1DctDK60Z02KfL4qg8u6MXuI5oUTokXxWo7jFGrMAVqifA/8Hcfeu7I+R
 8TCWwvj+wUKhNjlj33InKWh1ydimhDo1E0xM3aBjiFOjTObASGefNn/e3JRdzxnVeJ5D
 LrFg==
X-Gm-Message-State: AOJu0YxJsYabrCBiapcWlLTWIsRwgPYRnctJM+nCzq12nJiXWf6nrtBR
 htnfdYPN44xZkIvnJ7UvnOlUxZuPaEjvAg==
X-Google-Smtp-Source: AGHT+IGm44fVwQzaCh2ZZIUSa2gEf37dWibtlZyUhl3C728B3R7K1JwjHsMYVSZWsUoa7K9ljwKZIg==
X-Received: by 2002:a05:6e02:3886:b0:35f:d2b7:f5a9 with SMTP id
 cn6-20020a056e02388600b0035fd2b7f5a9mr3923938ilb.42.1704695927246; 
 Sun, 07 Jan 2024 22:38:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cb10-20020a0566381b0a00b0046e25dde777sm423586jab.35.2024.01.07.22.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 22:38:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 23:38:45 -0700
Message-Id: <20240108063845.3446790-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704695927; x=1705300727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=usAfeugyVJTaB8IXZfAg8quUGsP05TZRRdSEM29U6TM=;
 b=LO6mdwuWSDJ8K5LJ0aAvS6sMenglrpFxKlEgzHPBNaciHpwAi2pExw/X+Oyt7KrT8s
 iADKQjTfrs1c/rU9KmCNMAhHihFupw2hcxHFAmYoep3yGovEZ/9TGm24/L7EzQ8II2gh
 wbWOyzjpuPVUA46FBcpVmwvIDDtSVJ/sqrvkLeK5eyWm3aWLZOjZudDq+hX20AGFO6Gg
 xQLnPAR2Eu2b9pdO0gKQDbPU1Pa2xfJ4J1cy7l1Szmis3DDKCxT9ScEFw3B5Kue6JGm6
 q30X6F2SXQeinDxzzlvrOKhql6sMYWgCQ+ChF2fRIse8tMBIp2KTZusfX6PZWmtiNAye
 zHMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LO6mdwuW
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.13.1
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

Add new runtime dependencies:
 - python-sqlalchemy
 - python-mako
 - python-typing-extensions

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/Config.in           | 3 +++
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/Config.in b/package/python-alembic/Config.in
index a53dde7f7f..33fe3c3682 100644
--- a/package/python-alembic/Config.in
+++ b/package/python-alembic/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PYTHON_ALEMBIC
 	bool "python-alembic"
+	select BR2_PACKAGE_PYTHON_MAKO # runtime
+	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Alembic is a database migrations tool written by the author
 	  of SQLAlchemy.
diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index df1f4fba02..1f752ebc7e 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  642d563af853b317f018026f3edd5dba  alembic-1.12.1.tar.gz
-sha256  bca5877e9678b454706347bc10b97cb7d67f300320fa5c3a94423e8266e2823f  alembic-1.12.1.tar.gz
+md5  29579d34ea694627280b52a3d3116664  alembic-1.13.1.tar.gz
+sha256  4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595  alembic-1.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index fd41e0df66..52e30e39ba 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.12.1
+PYTHON_ALEMBIC_VERSION = 1.13.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/44/b4/253fe31261d9f5d603d89bd9e6fba1625494a6d761d319902dfe4db59016
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/7b/24/ddce068e2ac9b5581bd58602edb2a1be1b0752e1ff2963c696ecdbe0470d
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
