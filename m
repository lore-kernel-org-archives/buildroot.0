Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C341FC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A6282180;
	Tue, 13 Feb 2024 21:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-y8M6HAgjbw; Tue, 13 Feb 2024 21:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83026823E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83026823E3;
	Tue, 13 Feb 2024 21:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16D0B1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FDEA822EC
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsLK35NiUfcq for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2717C822E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2717C822E9
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2717C822E9
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:16:07 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7bee8858a8aso224437039f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858966; x=1708463766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbf+DjejeSCzkoC/PVRrAYNiD1jgeTpbpneJVjnwatk=;
 b=ai781sFrmHLGH5/vfZjQfVPIGCLYgwrOgws012rdTiANS8Pqa/+/5zrUXYTB7Jkpf+
 E41YaxKEjf5YYcN4wKltkIcQXhq0gHJwBHZXdYfjRoxKE15RlLP2bXf13saIVbCJxJ0r
 +GNkiW22CRW05Xrhjt1VHuxzAEsvWKTpN2/9EuixLIgoqvu7MpNySc/srld0y0hGvRm2
 RCKOluH1OKYa7t8XAXzGPbX8oNEDWGLq4GDWJkZv7xdc6ypE8vgTXbyX7vKKczJlC4vK
 kQH9ncFKpN04Bq8QqEpPLwBZtNS8CewpSPo8S3gxcszfX5eQFIWlLDSmE7srubvu5p+D
 us0Q==
X-Gm-Message-State: AOJu0YxVJrgjWx6aMrnxHNWlBbFDZrDDD8y6TwdlBLcMs0zCvb4FmH8B
 7hUfpulO5nkgvkoosP6/agxzU0PFbTX7bnbABCENkO+moaMo7fPO+vaJen+b4KbXJQ==
X-Google-Smtp-Source: AGHT+IHKx1bHFEgO61sTUyWo/BVKACY3442PT5/mhQQnCSJJ9NpTIlW0vPS+2+qn3sD7je3rpA9oiQ==
X-Received: by 2002:a05:6602:1249:b0:7c3:eb03:6cbb with SMTP id
 o9-20020a056602124900b007c3eb036cbbmr954690iou.1.1707858965667; 
 Tue, 13 Feb 2024 13:16:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXi38ScGnW38qCXTt7Jo9u+G5kQ+LFKfNtJwcAg5hUW3rFgnucv2s/0rMxq4EhNMjasZLNEZ3e4HNhxp3mhWBSP72qFB8xY9y+5WoTogoddXrZ3/E8JEzla77dLVGMYEElurxI3cfnnMQF5+bF9RgKFmiNrq6UECuScT2mVo/QBg2/93FthLYwM63o2gxa6Q9z7ipMvE9cbP0bOP4h8ldqiEfhoCYmikojzNwzM7cuZNe++oazc7QHzuCAsvNr6sKEauKIVzH7kSpTrShlHD6NBTPI42Gm4bccLCMxWKxk2UAgB7EeHiMt6msa3a8mp703fj+0Nd67+OiTeooHL3zjr0O0d47XDm+dbhhhADMENQfDkHrTncFbaGfRHcdEMVEv86m47ztN4AETbhbmjfFUQ8+8iybsW5ji0gvnKHTTwyX4aGVnLU1WgmGbqAuRQ7/CBhukWBGaJ2pjr2gimBif6xMT+u2mS1EIMGB7Ud6I7JJZMB8NlT4z8OpjR8hUxxK85bGZItq/ktbAg9PaNnX1CoYWXa+Rf3xTdwFdDA3sXE+P6G80UpJABbTkYEBOldcOEXai5nmTUpKgoFwabMRwDGXjsagyKpB0ew9yAJD710OesUI5Adw/ILPTWRk4E3i0sKmomd5bCA2aSMjWHczc27mYrZyztjJmJqmv8ZvkhP1WD91XcDBmbXdCGbyHDZayli5HVKuwArobXbZa6d/e1YCyOk6luQbmEEfLprkct7aOiElJc6A==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:16:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:12 -0700
Message-Id: <20240213211512.3918044-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858966; x=1708463766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbf+DjejeSCzkoC/PVRrAYNiD1jgeTpbpneJVjnwatk=;
 b=PsmWDWqIsI6ie4Qvomfd7WzUyLT9ztiJDi/43h3JPQ7FoFp+IyvV9j5nT88e/TdP5B
 CYsOmQeaOuyVNCwKzvjVvJHVscIJfkFxjLSjlWelooyqj90AtbW6cgizZUDkhl+WvfxZ
 c1aDM2HbqOUcnfkBYZU8fRj6WTTJscgq4GfQZxmZIbEVmn2+9Rt+h9wk2GCicimJxMj/
 HTCsZ87yuq1ERCtRqhkfyGSldvCFThvglZImqe+mBMgWEPhMmRrlpgELvLG+PKpGh8nC
 7knJbPlUexdHe3hDbdpgAv5Hiv46gMJRFNUSl4RjRezuiU/F5zscKgeTe2gCqdR1VAPM
 C0Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PsmWDWqI
Subject: [Buildroot] [PATCH v8 26/26] package/pkg-python.mk: migrate
 setuptools to pep517
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that setuptools and its dependencies are using pep517 we can
migrate the setuptools infrastructure itself to use the pep517
build frontend.

As part of this we need to migrate the all python packages using
_BUILD_OPTS to the new config settings format used by the pep517
build frontend.

Use new setup type variables to define setup type specific
dependencies instead of using the conditional block.

We also need to set --skip-dependency-check for the following
packages which specify build dependencies that are not actually
required:
 - python-lxml
 - python-matplotlib
 - python-msgpack
 - python-pymupdf
 - python-setuptools-scm-git-archive
 - python-uvloop
 - python-wsaccel

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v7 -> v8:
  - disable dependency enforcement for more packages
Changes v6 -> v7:
  - just disable dependency enforcement for msgpack
  - rebase
Changes v5 -> v6:
  - use setup type variables for dependencies
Changes v4 -> v5:
  - rebase on next
Changes v1 -> v3:
  - rebase on master
  - combine setuptools-rust and maturin env variables
  - drop patch which is now upstream
---
 package/pkg-python.mk                         | 160 +++++++++---------
 package/python-evdev/python-evdev.mk          |   4 +-
 package/python-lxml/python-lxml.mk            |  10 +-
 package/python-m2crypto/python-m2crypto.mk    |   4 +-
 .../python-matplotlib/python-matplotlib.mk    |   1 +
 package/python-msgpack/python-msgpack.mk      |   1 +
 package/python-pillow/python-pillow.mk        |  35 ++--
 package/python-psycopg2/python-psycopg2.mk    |   5 +-
 package/python-pymupdf/python-pymupdf.mk      |   1 +
 package/python-pyzmq/python-pyzmq.mk          |   4 +-
 .../python-setuptools-scm-git-archive.mk      |   1 +
 package/python-uvloop/python-uvloop.mk        |   7 +-
 package/python-wsaccel/python-wsaccel.mk      |   1 +
 13 files changed, 121 insertions(+), 113 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 94f28ff841..839f728e2f 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -52,15 +52,62 @@ HOST_PKG_PYTHON_ENV = \
 	PYTHONNOUSERSITE=1 \
 	$(HOST_CONFIGURE_OPTS)
 
-# Target setuptools-based packages
-PKG_PYTHON_SETUPTOOLS_ENV = \
+# Target pep517-based packages
+PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
 
-PKG_PYTHON_SETUPTOOLS_CMD = \
-	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
+PKG_PYTHON_PEP517_BUILD_CMD = \
+	-m build -n -w
+
+PKG_PYTHON_PEP517_INSTALL_OPTS = \
+	--interpreter=/usr/bin/python \
+	--script-kind=posix
+
+PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
+	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(TARGET_DIR)/usr/bin \
+	--data=$(TARGET_DIR)/usr
+
+PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
+	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
+	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(STAGING_DIR)/usr/bin \
+	--data=$(STAGING_DIR)/usr
+
+PKG_PYTHON_PEP517_DEPENDENCIES = \
+	host-python-pypa-build \
+	host-python-installer
+
+# Host pep517-based packages
+HOST_PKG_PYTHON_PEP517_ENV = \
+	$(HOST_PKG_PYTHON_ENV)
+
+HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
+	-m build -n -w
+
+HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
+	$(TOPDIR)/support/scripts/pyinstaller.py \
+	dist/* \
+	--interpreter=$(HOST_DIR)/bin/python \
+	--script-kind=posix \
+	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(HOST_DIR)/bin \
+	--data=$(HOST_DIR)
+
+# Target setuptools-based packages
+PKG_PYTHON_SETUPTOOLS_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
 
 PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) build
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
@@ -69,30 +116,24 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--single-version-externally-managed
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) \
-	install --no-compile \
-	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-	--root=$(TARGET_DIR)
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) \
-	install \
-	$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-	--root=$(STAGING_DIR)
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
+PKG_PYTHON_SETUPTOOLS_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-setuptools
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
+	$(HOST_PKG_PYTHON_PEP517_ENV)
 
 HOST_PKG_PYTHON_SETUPTOOLS_BUILD_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) build
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD = \
-	$(PKG_PYTHON_SETUPTOOLS_CMD) \
-	install \
-	--prefix=$(HOST_DIR) \
-	--root=/ \
-	--single-version-externally-managed
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
 # Target setuptools-rust-based packages
 PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
@@ -109,6 +150,10 @@ PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_TARGET_CMD = \
 PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_STAGING_CMD = \
 	$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_CMD)
 
+PKG_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = \
+	$(PKG_PYTHON_SETUPTOOLS_DEPENDENCIES) \
+	host-python-setuptools-rust
+
 # Host setuptools-rust-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
@@ -121,52 +166,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_RUST_BUILD_CMD = \
 HOST_PKG_PYTHON_SETUPTOOLS_RUST_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_CMD)
 
-# Target pep517-based packages
-PKG_PYTHON_PEP517_ENV = \
-	$(PKG_PYTHON_ENV)
-
-PKG_PYTHON_PEP517_BUILD_CMD = \
-	-m build -n -w
-
-PKG_PYTHON_PEP517_INSTALL_OPTS = \
-	--interpreter=/usr/bin/python \
-	--script-kind=posix
-
-PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
-	$(TOPDIR)/support/scripts/pyinstaller.py \
-	dist/* \
-	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
-	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--scripts=$(TARGET_DIR)/usr/bin \
-	--data=$(TARGET_DIR)/usr
-
-PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
-	$(TOPDIR)/support/scripts/pyinstaller.py \
-	dist/* \
-	$(PKG_PYTHON_PEP517_INSTALL_OPTS) \
-	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--scripts=$(STAGING_DIR)/usr/bin \
-	--data=$(STAGING_DIR)/usr
-
-# Host pep517-based packages
-HOST_PKG_PYTHON_PEP517_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
-
-HOST_PKG_PYTHON_PEP517_BUILD_CMD = \
-	-m build -n -w
-
-HOST_PKG_PYTHON_PEP517_INSTALL_CMD = \
-	$(TOPDIR)/support/scripts/pyinstaller.py \
-	dist/* \
-	--interpreter=$(HOST_DIR)/bin/python \
-	--script-kind=posix \
-	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
-	--scripts=$(HOST_DIR)/bin \
-	--data=$(HOST_DIR)
-
 # Target flit packages
 PKG_PYTHON_FLIT_ENV = \
 	$(PKG_PYTHON_PEP517_ENV)
@@ -180,6 +179,10 @@ PKG_PYTHON_FLIT_INSTALL_TARGET_CMD = \
 PKG_PYTHON_FLIT_INSTALL_STAGING_CMD = \
 	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
 
+PKG_PYTHON_FLIT_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-flit-core
+
 # Host flit packages
 HOST_PKG_PYTHON_FLIT_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV)
@@ -215,6 +218,10 @@ PKG_PYTHON_MATURIN_INSTALL_TARGET_CMD = \
 PKG_PYTHON_MATURIN_INSTALL_STAGING_CMD = \
 	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
 
+PKG_PYTHON_MATURIN_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-maturin
+
 # Host maturin packages
 HOST_PKG_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_PYTHON_PEP517_ENV) \
@@ -293,28 +300,17 @@ else
 $(2)_DEPENDENCIES += host-python3
 endif # ($(4),target)
 
-# Setuptools based packages will need setuptools for the host Python
-# interpreter (both host and target).
+# Setup type specific dependencies are the same whether we are
+# building for the host or the target.
 #
-ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
-$(2)_DEPENDENCIES += host-python-setuptools
-ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
-$(2)_DEPENDENCIES += host-python-setuptools-rust
-endif
-else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
-$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
-ifeq ($$($(2)_SETUP_TYPE),flit)
-$(2)_DEPENDENCIES += host-python-flit-core
-endif
-ifeq ($$($(2)_SETUP_TYPE),maturin)
-$(2)_DEPENDENCIES += host-python-maturin
-endif
-else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
+ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 # Don't add dependency on host-python-installer for
 # host-python-installer itself, and its dependencies.
 ifeq ($$(filter host-python-flit-core host-python-installer,$(1)),)
 $(2)_DEPENDENCIES += host-python-installer
 endif
+else
+$(2)_DEPENDENCIES += $$(PKG_PYTHON_$$($(2)_SETUP_TYPE_UPPER)_DEPENDENCIES)
 endif
 
 # Pyo3 based packages(setuptools-rust and maturin) will need rust
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 5cf62b5160..b509b43e8a 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -12,7 +12,7 @@ PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
 
 PYTHON_EVDEV_BUILD_OPTS = \
-	build_ecodes \
-	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
+	-C--build-option=build_ecodes \
+	-C--build-option=--evdev-headers=$(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
 
 $(eval $(python-package))
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 519a9a77ac..336f954775 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -28,11 +28,13 @@ HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
 # python-lxml needs these scripts in order to properly detect libxml2 and
 # libxslt compiler and linker flags
 PYTHON_LXML_BUILD_OPTS = \
-	--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
-	--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+	--skip-dependency-check
+	-C--build-option=--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+	-C--build-option=--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
 HOST_PYTHON_LXML_BUILD_OPTS = \
-	--xslt-config=$(HOST_DIR)/bin/xslt-config \
-	--xml2-config=$(HOST_DIR)/bin/xml2-config
+	--skip-dependency-check
+	-C--build-option=--xslt-config=$(HOST_DIR)/bin/xslt-config \
+	-C--build-option=--xml2-config=$(HOST_DIR)/bin/xml2-config
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 69a0c28df5..6c07f42d06 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -13,6 +13,8 @@ PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
 PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
 PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
-PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
+PYTHON_M2CRYPTO_BUILD_OPTS = \
+	-C--build-option=build_ext \
+	-C--build-option=--openssl=$(STAGING_DIR)/usr
 
 $(eval $(python-package))
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 4fd2b5f432..5f5d53172e 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -20,6 +20,7 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = \
 	python-pybind \
 	qhull
 PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
+PYTHON_MATPLOTLIB_BUILD_OPTS = --skip-dependency-check
 
 ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
 PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 3ee7c54ce1..9cdf5263de 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -10,6 +10,7 @@ PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/c2/d5/5662032db157
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
+PYTHON_MSGPACK_BUILD_OPTS = --skip-dependency-check
 
 # When set in the environment, whatever the value, MSGPACK_PUREPYTHON drives
 # using the pure python implementation rather than rely on the C++ native code.
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 10939d8467..7f5b4dd0f9 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -14,61 +14,60 @@ PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 
 PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
-PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
-PYTHON_PILLOW_INSTALL_TARGET_OPTS = $(PYTHON_PILLOW_BUILD_OPTS)
+PYTHON_PILLOW_BUILD_OPTS = -C--build-option=build_ext -C--build-option=--disable-platform-guessing
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
-PYTHON_PILLOW_BUILD_OPTS += --enable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-freetype
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += jpeg
-PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 PYTHON_PILLOW_DEPENDENCIES += lcms2
-PYTHON_PILLOW_BUILD_OPTS += --enable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-lcms
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-lcms
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 PYTHON_PILLOW_DEPENDENCIES += libxcb
-PYTHON_PILLOW_BUILD_OPTS += --enable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-xcb
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-xcb
 endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += openjpeg
-PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg2000
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg2000
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 PYTHON_PILLOW_DEPENDENCIES += tiff
-PYTHON_PILLOW_BUILD_OPTS += --enable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-tiff
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_WEBP),y)
 PYTHON_PILLOW_DEPENDENCIES += webp
-PYTHON_PILLOW_BUILD_OPTS += --enable-webp
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webp
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-PYTHON_PILLOW_BUILD_OPTS += --enable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webpmux
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webpmux
 endif
 else
-PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webp -C--build-option=--disable-webpmux
 endif
 
 $(eval $(python-package))
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index 0149b8d185..1b33b7505d 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -13,7 +13,8 @@ PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
 PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
 # Force psycopg2 to use the Buildroot provided postgresql version
 # instead of the one from the host machine
-PYTHON_PSYCOPG2_BUILD_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
-PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
+PYTHON_PSYCOPG2_BUILD_OPTS = \
+	-C--build-option=build_ext \
+	-C--build-option=--pg-config=$(STAGING_DIR)/usr/bin/pg_config
 
 $(eval $(python-package))
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 639ce0e00e..8825868fb5 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -13,6 +13,7 @@ PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
 PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf zlib
+PYTHON_PYMUPDF_BUILD_OPTS = --skip-dependency-check
 
 PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"
 
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index f1444b9124..48a298b221 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -11,7 +11,7 @@ PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
 PYTHON_PYZMQ_SETUP_TYPE = setuptools
-PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
+PYTHON_PYZMQ_BUILD_OPTS = -C--build-option=--zmq=$(STAGING_DIR)/usr
 PYTHON_PYZMQ_DEPENDENCIES = \
 	host-python-cython \
 	host-python-packaging \
@@ -27,7 +27,7 @@ endef
 PYTHON_PYZMQ_POST_PATCH_HOOKS += PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
 
 ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
-PYTHON_PYZMQ_BUILD_OPTS += --enable-drafts
+PYTHON_PYZMQ_BUILD_OPTS += -C--build-option=--enable-drafts
 endif
 
 $(eval $(python-package))
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 153343788b..95cfa025b3 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -11,5 +11,6 @@ PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
 HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(host-python-package))
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 285884a2bb..aaeab2805f 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -10,8 +10,11 @@ PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/9c/16/728cc5dde368e
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
-PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
 PYTHON_UVLOOP_DEPENDENCIES = libuv
+PYTHON_UVLOOP_BUILD_OPTS = \
+	--skip-dependency-check \
+	-C--build-option=build_ext \
+	-C--build-option=--inplace \
+	-C--build-option=--use-system-libuv
 
 $(eval $(python-package))
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 1f63aa5c40..7ccb033256 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -10,5 +10,6 @@ PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/94/28/41c0e711b538
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
+PYTHON_WSACCEL_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
