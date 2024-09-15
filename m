Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8DCC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E8F812C3;
	Sun, 15 Sep 2024 22:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSIWriCBF35Q; Sun, 15 Sep 2024 22:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FD181295
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FD181295;
	Sun, 15 Sep 2024 22:28:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3DA91BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2DCF40247
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yH_agt4U325A for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78020400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78020400A4
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78020400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:28:55 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82cdadeeb2eso119132239f.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726439334; x=1727044134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1r5U2+ejCkkZec7mWJkwHhxUwERQBfGc6GntagjomJk=;
 b=WlOA6tkVVaZJTF7CASxVi2VP9YYCYoQhyS/Ua7wT6I4B6oE1VznQsV7wotALWgEw5b
 uS4pIbe8wuGQN91omEmtbfCHHMPXcrETgw3qQVHihFX5n1mptYp80wXxyMmMveI4mBun
 5Sp1vOmzJxbuWOmseR5CDpr1DgQgJoiNzop75wTOgl98cyX6zLkEKYdiJoviI4FwjzIF
 tlWdqnUWoAlC17VrORz6DGRMUbTIG6NPbkBz6Ut2Mu4syuttbjGvfl13cj2z6CJrrwR2
 bqNV1pGk7vohvlTmZwWaBGJoTddEOHJOYpQczQSWitjF5800Y6u8s2GDqikLMYzSSNMn
 TaSg==
X-Gm-Message-State: AOJu0YztovCaw0qvsT6DwTzGQCqxkGCXthuztVE06IpIq2Dz8mMJavp8
 wJXPDIhDAnyEmV1ZeCEt8YJVQW0KFgXjbp8VvakW7+8ph5Ya4hG/IuJtOA==
X-Google-Smtp-Source: AGHT+IGXrBcqp/Jmj991PqJX2RGDTjwmJF6LBgsDihkye5mewj4xBxxg9jHJWr/VsVQAe2S5zBvtUQ==
X-Received: by 2002:a05:6602:3cc:b0:82d:129f:acb6 with SMTP id
 ca18e2360f4ac-82d1f9672bemr1655603739f.14.1726439334041; 
 Sun, 15 Sep 2024 15:28:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13dc5sm1155217173.87.2024.09.15.15.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:28:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:28:52 -0600
Message-Id: <20240915222852.1664225-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726439334; x=1727044134; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1r5U2+ejCkkZec7mWJkwHhxUwERQBfGc6GntagjomJk=;
 b=RMWyZFaQa9345AUfeeMTs5A+bUz9s34YcXkjAVXqBmL54W9aAlTlYsFJVqp0vOa/AW
 kHPfX0dv+EC3gtSzkiHF4KImaPsje06f033eeh9jT4n8DCAE/8yMRoc3/98eRJkty40N
 xVntLy6gUj51OJC+jv60tDW68YTl8EDSpDQWzwvwjnIDDDHi4R/NTUVUH4e1kNSm8YCz
 ydqjRbCfkpSXpbEEY0nS4qpZIuRcPKNhSBd0vXdSgYf+pBjfSNZdCxqXiNs4gqvfzyr6
 7G9+NarwIfxYrvv/Fj4AP4O1uFciMCXbSqPazjrqaayAQERdw/zQv8ggOs4XgDhnN7ao
 iL9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RMWyZFaQ
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy: bump
 to version 1.1.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

License hash changed due to year removal:
https://github.com/marshmallow-code/marshmallow-sqlalchemy/commit/26f4bed9e41c8d2bd03183e5960dfd3753a308df

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-marshmallow-sqlalchemy/Config.in           | 1 -
 .../python-marshmallow-sqlalchemy.hash                    | 6 +++---
 .../python-marshmallow-sqlalchemy.mk                      | 8 ++++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/Config.in b/package/python-marshmallow-sqlalchemy/Config.in
index f48d27edd6..f7f1975c72 100644
--- a/package/python-marshmallow-sqlalchemy/Config.in
+++ b/package/python-marshmallow-sqlalchemy/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_MARSHMALLOW_SQLALCHEMY
 	bool "python-marshmallow-sqlalchemy"
 	select BR2_PACKAGE_PYTHON_MARSHMALLOW # runtime
-	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
 	help
 	  SQLAlchemy integration with the marshmallow
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 3194513dfc..68892165f5 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  61e46e0ad5fabd0e9e11f895e1243bc3  marshmallow-sqlalchemy-0.30.0.tar.gz
-sha256  29ad0a4fd1b4a1e52dcb07f9673d284a6b0795141916cc2169d4ee9a5d007347  marshmallow-sqlalchemy-0.30.0.tar.gz
+md5  1cdbefa0aa35a1205d7e3bb3674743bb  marshmallow_sqlalchemy-1.1.0.tar.gz
+sha256  2ab092da269dafa8a05d51a58409af71a8d2183958ba47143127dd239e0359d8  marshmallow_sqlalchemy-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5f6cd082e01dda8a7c157687e196be98d68224cf41c0cee1968eb5c08e0c076a  LICENSE
+sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index a95e53022b..a334bec1f5 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.30.0
-PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow-sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/5d/3f/21aa202f3df31d2d20d4ae8dfe9c7f1ce0a1eecba7003915a986a7599778
-PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = setuptools
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.1.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/82/f8/2e565045b17dd60b38aafc3242ac44f5403315df08963501d07463d089ac
+PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
