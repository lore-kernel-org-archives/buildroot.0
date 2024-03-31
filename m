Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6929CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D9D822B3;
	Sun, 31 Mar 2024 00:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3pmCETWK_b2; Sun, 31 Mar 2024 00:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2BE822AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA2BE822AC;
	Sun, 31 Mar 2024 00:42:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83C4C1BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC5E5606E9
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baJt0jbdYGVI for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1814860622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1814860622
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1814860622
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:10 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7d0ace5dcf4so39024339f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845729; x=1712450529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0JY1tuDy+qUGJ8M6k85sDVJLP9m22vfaI4+s+KDCbA=;
 b=lS8geXdessZiBpAzhTn5dxLCyW76IL2ANnWgaNJe8MStR1cFMev5tctbC0BhT7hg/o
 c0po+gIGaM/U0hv0f1sBPcfRzjNV68ogFmKAyiRLk5ytVE8zyf+vNpUjoWQRKYNI43Zf
 KQSCr3GLm6aUGaF+3KO8k7O77A32GWf2Gp2QYbMmkpPqepDgaPGBWrDlWacaCEle0jwU
 6qnCYbl0XYlcmO6/n9A0ld3e6cQ2WBDE9iun15bo0Gr51L3E4ABz01zBL9dxKOVaC3K5
 HoRx+mcnPpKTfElfcDoxfNe6UXZlTdNmeVlLr23rkn42/v27g55BlYRuaOekhoood+gS
 KEmA==
X-Gm-Message-State: AOJu0Yz65ZjakPtrT4qUuhSwwe94B5BnRde4wo8NZAtSGpN5fPB9byIw
 5vGBEMoi4kzG+2vSDeyaDNcLK6zIDoGLdrdT6KYPTJO9DbJpRNn5In5oX5L4YEEKIA==
X-Google-Smtp-Source: AGHT+IH6AijhgzPGzsgh3JPr4bl/PZsbD8jzgala8PspaOyyMW+o67Q0TB4wyNou8j7KqFsjL04eOQ==
X-Received: by 2002:a5e:de0d:0:b0:7d0:8868:b454 with SMTP id
 e13-20020a5ede0d000000b007d08868b454mr5868058iok.21.1711845729661; 
 Sat, 30 Mar 2024 17:42:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:30 -0600
Message-Id: <20240331004133.636618-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845729; x=1712450529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0JY1tuDy+qUGJ8M6k85sDVJLP9m22vfaI4+s+KDCbA=;
 b=g2yPvwPbbId8zMUH3rVBVoHnB/ipEADz6NWJ73W7xgzZh6iDlhxkVCxtPJtN64cuIi
 AQdrZQl6Vg0vchRVHyNt9kmPSRsaM4Mz3FY4tvCti3/WEVP6iXmzH3JVYTTPnSkS9k8U
 7Z4KYv1cYQGGLJgnua8OHkRKzmZlW1gRJgI03Tvbzdf8a51rE9R5912616ECz7c/1z2e
 TsRcQsoYHtmWu6vyuzPdmGhgp8JlZLVpibnTdPBhLEvSnU6yre3AIjKQdui0rR025Yr4
 m4xiJPCwTCZSp8AnMGZrgTv4E06I6qyVZwR0NHBuEL6xKAew1SSsXoMo0yGtewB7sd2/
 RrzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g2yPvwPb
Subject: [Buildroot] [PATCH v9 15/18] package/python-simplelogging: migrate
 to poetry core pep517 build backend
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to migrate package/python-simplelogging to the pep517
poetry-core backend as setuptools is not supported when building
with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

We also need to add a patch which switches from poetry to poetry
core as we do not support the full poetry package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-Switch-build-backend-to-poetry-core.patch | 31 +++++++++++++++++++
 .../python-simplelogging.mk                   |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch

diff --git a/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
new file mode 100644
index 0000000000..2c345fe268
--- /dev/null
+++ b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
@@ -0,0 +1,31 @@
+From 76c1c545bad28f592405ca1e5bcf6081051c946a Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Feb 2024 13:37:00 -0700
+Subject: [PATCH] Switch build-backend to poetry-core
+
+poetry-core is the lightweight counterpart of poetry that is intended
+to be used as a build-backend. Unlike poetry, it does not require
+installing all the dependencies of the package manager, making
+the builds much faster. The generated artifacts are the same.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/vpoulailleau/simplelogging/pull/230
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index a89ab64..79403cb 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -55,5 +55,5 @@ commands =
+ """
+ 
+ [build-system]
+-requires = ["poetry>=0.12"]
+-build-backend = "poetry.masonry.api"
++requires = ["poetry-core>=1.0.0"]
++build-backend = "poetry.core.masonry.api"
+-- 
+2.34.1
+
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index 556628613b..dbd9ce3ae3 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -7,8 +7,9 @@
 PYTHON_SIMPLELOGGING_VERSION = 0.11.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
 PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/73/d6/4c06aa7f2c3b9fc09429a1196fd357357cc555de5e16c09b2d12e9db1ebb
-PYTHON_SIMPLELOGGING_SETUP_TYPE = setuptools
+PYTHON_SIMPLELOGGING_SETUP_TYPE = pep517
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
+PYTHON_SIMPLELOGGING_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
