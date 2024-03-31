Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BA9C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2FED82309;
	Sun, 31 Mar 2024 00:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dme-4zIApvUF; Sun, 31 Mar 2024 00:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8C4821D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8C4821D9;
	Sun, 31 Mar 2024 00:42:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51E231BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0083960611
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5miAnvDKtroI for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2904660627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2904660627
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2904660627
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:14 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7d0c0e3d675so3686939f.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845734; x=1712450534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDyLsR9SWredvpMnlj9xNwO1Fw0heCHnTt5vwPV92WM=;
 b=W3JEx4H6gKWmR4A3nKWkTA+GdzBi8CpGu1UbqrrNtoYQ2Gsu2FrRSkfZMdo5XMOH+0
 xOAJ7SkGzDxJ2L1YXQnjkMfQbJPGX5KIbTLtsCVnhCK50de4hMuget6YGEAO0lIF5mpA
 ThxgyTBN5s5tjLfmhADKNX4JsIPxJuHF5nqT8Q4UKDntekVVRdzJfxgkEFHhwCd3SgwZ
 taX8BfnT9KzJlsYQdKkYfCsWHj+za1YwpcMYNw2rTAmpjGUHFMEWDyJRDvmgmcxS2iM0
 HEItZBxkbZUsP2pFqtU33y7nHgdfPino0bODQF1CNSeggFD41jA3PEmaQr8zcuaXe3eM
 eJCA==
X-Gm-Message-State: AOJu0Yyp6r+77NyYBX4okRJmPCcpuAYMwo3tKpIVtnADioJhLzvu6jv6
 ko9Ud34X79L40SQuUo/KrF5gJlPSxmPZ9RNy7inC+t1QpjvzPy3xqF8+N0VRWKDxmw==
X-Google-Smtp-Source: AGHT+IHRdcBhiNPQi36w1DZZDwJCJ7fjk8FoLmYYDO+p4xlt3Tbax4Gi+7VE46vfxjH8D5J5p4yi5A==
X-Received: by 2002:a05:6602:1dc1:b0:7c8:55c2:63dc with SMTP id
 hk1-20020a0566021dc100b007c855c263dcmr6838350iob.9.1711845733695; 
 Sat, 30 Mar 2024 17:42:13 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:33 -0600
Message-Id: <20240331004133.636618-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845734; x=1712450534; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDyLsR9SWredvpMnlj9xNwO1Fw0heCHnTt5vwPV92WM=;
 b=bpZ8sJLWrO8HwPXAsGMuexAOFmcAXeK7fQ1zUCb3/wB30ZRIgmQhEi7OzpMPReapJQ
 upadln9L52JgE2nCugSjLrAmQl1RhuuRxe8OPwaG+O4DqkEnk8Gh2q7Sx1MuWqudDZlk
 UGX6lz23VR2mNtjiic09HaF/r8o3U+JIuPrO32C8nkjWssueoRQMQPdMT0zjtkxBxtBo
 lkaan0p5h9CqDjItPSEL9N9hDUWvh+2XUDHQWXP1FRAgaXWZy6zFuZvADznNVHvXdj97
 fU/oYGdO3L3CNFLKzdV2B+a/P/3RdNF8/SbgwkKcRUqAbkNMAp3CW6oFbpWQ/SHZN6iQ
 rvIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bpZ8sJLW
Subject: [Buildroot] [PATCH v9 18/18] package/pkg-python.mk: migrate
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

Now that setuptools and its dependencies are using pep517 we can
migrate the setuptools infrastructure itself to use the pep517
build frontend.

As part of this we need to migrate the all python packages using
_BUILD_OPTS to the new config settings format used by the pep517
build frontend.

We need to use a setup.cfg file to pass the pg_config path when
building python-psycopg2 as this package needs the pg_config
path for all internal build stages while -C--build-option= only
passes the flag to the internal bdist_wheel stage.

Use new setup type variables to define setup type specific
dependencies instead of using the conditional block.

We also need to set --skip-dependency-check for the following
packages which specify build dependencies that are not actually
required:
 - python-lxml
 - python-matplotlib
 - python-msgpack
 - python-pymupdf
 - python-uvloop
 - python-wsaccel

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v8 -> v9:
  - use setup.cfg for python-psycopg2 to pass pg_config path
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
 package/python-psycopg2/python-psycopg2.mk    |   7 +-
 package/python-pymupdf/python-pymupdf.mk      |   1 +
 package/python-pyzmq/python-pyzmq.mk          |   4 +-
 package/python-uvloop/python-uvloop.mk        |   7 +-
 package/python-wsaccel/python-wsaccel.mk      |   1 +
 12 files changed, 122 insertions(+), 113 deletions(-)

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
index 0149b8d185..59a3190ae1 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -11,9 +11,12 @@ PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
 PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
+
 # Force psycopg2 to use the Buildroot provided postgresql version
 # instead of the one from the host machine
-PYTHON_PSYCOPG2_BUILD_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
-PYTHON_PSYCOPG2_INSTALL_TARGET_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
+define PYTHON_PSYCOPG2_CREATE_SETUP_CFG
+	printf "[build_ext]\ndefine=\npg_config=$(STAGING_DIR)/usr/bin/pg_config\n" > $(@D)/setup.cfg
+endef
+PYTHON_PSYCOPG2_PRE_CONFIGURE_HOOKS += PYTHON_PSYCOPG2_CREATE_SETUP_CFG
 
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
