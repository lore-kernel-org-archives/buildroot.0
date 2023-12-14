Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570C0C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0227E436F4;
	Thu, 14 Dec 2023 09:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0227E436F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75T1giEDv5LK; Thu, 14 Dec 2023 09:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D39ED436EB;
	Thu, 14 Dec 2023 09:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D39ED436EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 385241BF376
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB83436B6
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB83436B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwSmNDxf-nG1 for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:15:11 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADECC436BF
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADECC436BF
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35d6c5f9579so26566675ab.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 01:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702545310; x=1703150110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YIG6BGQkeW4yqjw5XFUDGIwl+PwASSGSe5Uq+2i1R4U=;
 b=UomwRcd4C7DNRDQxJeUbFLnwMoQG/abETo1J7QKeSh94eOZ+rSZacqHN5NiIpqJsZD
 LkMugYjcKeKwb45kRFljQRUW271cxK02lpCyoysu1X5UVszrLUQKDL4GrUzpcNstlTsO
 tlijkhOWssKAsllg9MPoq2Qg8SR+zFDwC728PWKumjqlVrlfm+vN8lj9/51zrJElfKx5
 4DeJd0pusFXr5guptaAi8IW7m/u6OL+q7rO74cdXyMvlpSXIaxIFKQ3eHAdR0oXS9QGX
 cqTC8rbd3oUw11yDrVC2a1L4Q8WlM4SlaCSDarlATmIm89t9NhSF0pB2rXzpfkISSOKM
 z5kQ==
X-Gm-Message-State: AOJu0YySa2voT6w63f/tNMQSYsLwAYkbrBG+/iWN94Sr+fjkLebPD35Q
 /bQoRbBGnw9Wun2CQ4PR94HtVjos0sqXXg==
X-Google-Smtp-Source: AGHT+IEqG2WeCmCrM57ueFrh6If4nhd20Op1L5hkgpR8BqC021JlhCdVCbbAYlGXdwIQg2aFdLJWtQ==
X-Received: by 2002:a92:c26a:0:b0:35d:662d:667 with SMTP id
 h10-20020a92c26a000000b0035d662d0667mr12899352ild.19.1702545310328; 
 Thu, 14 Dec 2023 01:15:10 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 db10-20020a056e023d0a00b0035af0c79e23sm103446ilb.40.2023.12.14.01.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:15:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 02:15:04 -0700
Message-Id: <20231214091504.101102-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214091504.101102-1-james.hilliard1@gmail.com>
References: <20231214091504.101102-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702545310; x=1703150110; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YIG6BGQkeW4yqjw5XFUDGIwl+PwASSGSe5Uq+2i1R4U=;
 b=fgZzaCouhKHzlgBwEDuxeF88TUp+455OLPh3ZWUM1VwOQY6EPVhHPtNLF/KOWf1Yzz
 x61bIWXL1cg8MnuYiCyUBCP2WoO7GztfOJXiMDDdoANT74L6t0DqyUi6AgpfpwODaX0S
 YtKK2ie5GSLbTKTSWqaCoNaqyaLjIAiLzbl+Zzo0NOPXgFp9AJc4Swupe4ZYqTPjSEeZ
 DnHmVPv5w4v7oSAGm8DI37VqyeMzMU+HTSc3pmDk2VhAHNKw+Byd3spqh3aI572cHr/M
 Npb7jO7DDwsFdDwuiU2F3ytH+xMS5nrAhDxq20WQLlKiwBWwrK0yZkSO+5gmjM3xj+NW
 /8UQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fgZzaCou
Subject: [Buildroot] [PATCH 4/4] package/python-tortoise-orm: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-tortoise-orm/Config.in             | 10 ++++++++++
 .../python-tortoise-orm/python-tortoise-orm.hash  |  5 +++++
 .../python-tortoise-orm/python-tortoise-orm.mk    | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-tortoise-orm/Config.in
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.hash
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.mk

diff --git a/package/Config.in b/package/Config.in
index 12ddd7b384..a3ce5b490a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1353,6 +1353,7 @@ menu "External python modules"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-tortoise-orm/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
new file mode 100644
index 0000000000..62b1a5a86e
--- /dev/null
+++ b/package/python-tortoise-orm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_TORTOISE_ORM
+	bool "python-tortoise-orm"
+	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	help
+	  Easy async ORM for python, built with relations in mind.
+
+	  https://github.com/tortoise/tortoise-orm
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
new file mode 100644
index 0000000000..4796c8277f
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
+md5  aa5efa50e69d0a67b75c187f7550acd7  tortoise_orm-0.20.0.tar.gz
+sha256  283af584d685dcc58d6cc1da35b9115bb1e41c89075eae2a19c493b39b9b41f7  tortoise_orm-0.20.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
new file mode 100644
index 0000000000..cc1c2126b7
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-tortoise-orm
+#
+################################################################################
+
+PYTHON_TORTOISE_ORM_VERSION = 0.20.0
+PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/3b/84/8ca142fe370d59c4e3135825b2822d199c4f885ae855657c1a7361e68511
+PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
+PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
+PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
+PYTHON_TORTOISE_ORM_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
