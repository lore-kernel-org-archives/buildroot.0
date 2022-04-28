Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11BCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A157408E2;
	Thu, 28 Apr 2022 22:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHcv3EnFLRXL; Thu, 28 Apr 2022 22:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 659394051A;
	Thu, 28 Apr 2022 22:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0168D1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3E5141BF5
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oypZ_Un7k8wE for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:06:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C38341BF4
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:06:03 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id r17so2869831iln.9
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2IWpDTv0OsdkW7M++PFku+1km4qo/T9w8uOdRi08zM0=;
 b=nw3/E7BIMyyI9MgPl2AQSXef/Zr9ZvvFuG2OyAm+4GqVVBckVnmgpywRBFdn1qTYGi
 JZM389fqn37D+6ICNXAgvYWbz/YexBHxmrrdtLRXgyhN+8rIlZute9VNxIdXcD6p6AJE
 h3j5PEkUa6dwBv0B/p2t2ieEYrMixWYV5IYYtuKEBf72tEOgdNo4mVT3uRGwHn2xzf2H
 8K87ADFBtAsfo/OQwn3Yi4wjOYI7rBl/h3J4F2j8wBjIpdf3/GrBAfw0xQynKIGl6LAm
 Ea6twKMiPVCbT+AIxgo5PHZqjqxpq/QcjHNX/yuJ/RnUF8gtzz1uAGiXoxjsdLCZI5zh
 kZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IWpDTv0OsdkW7M++PFku+1km4qo/T9w8uOdRi08zM0=;
 b=eElVKOWSVI1fdckdxxCVYnv4hbwGRo+AhCHHIgyHVp4N+joAlpv9AWfrOPxMBd2B1e
 A7OhHkCCzerTZD6Akfbzr2CtV5eexpjHLLeDNai01uGH5rvE+bNwF0IKB3oct4fvcNpy
 MZN/RfKLFcd5dQoVukTrpagA3VYZ40sy9HvdrNlAETlL2sy04vv2fxUdfZ92e+a7KIxz
 FzY54IciLqZO3XY38Zq/CsX+E79g217at3dtev+Wu57Q1bdyxFzxI+DkCqf//D+vZgXc
 r+YcFwBY+wwYIYkNb2IH3UohedQBvkXJQjZvoF5p2ePoVSp/b7INSUzh8koxVlq9y4+Z
 SZPg==
X-Gm-Message-State: AOAM533I/wIR9xsQVDxsyXRoC9C0Seew+xalRJnY71vMfqFNYTWW+mE1
 XNtmE4Gr10iNeK2eDM1QJLD2iOQrK1E=
X-Google-Smtp-Source: ABdhPJwnXElALoonHOs97S0o4Ph07w+6f1N2t9ByhrZfxHNZ+WcrtLmeCwfRkpbjEWfAGcZuv0I3JQ==
X-Received: by 2002:a05:6e02:17ce:b0:2cc:8c4:2c78 with SMTP id
 z14-20020a056e0217ce00b002cc08c42c78mr14910155ilu.153.1651183562104; 
 Thu, 28 Apr 2022 15:06:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 123-20020a6b1581000000b00657b48baeb8sm635769iov.41.2022.04.28.15.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:06:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 16:05:58 -0600
Message-Id: <20220428220559.1236052-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428220559.1236052-1-james.hilliard1@gmail.com>
References: <20220428220559.1236052-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/pkg-python: add setuptools-rust
 infrastructure
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

The setuptools-rust package infrastructure is essentially a variant
of the setuptools package infrastructure which sets up the env
and download hooks required for building setuptools-rust packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 46 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 852ab25619..deecaa6e8e 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -109,6 +109,24 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
+# Target setuptools-rust-based packages
+PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
+	$(PKG_CARGO_ENV)
+
+# Host setuptools-rust-based packages
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV = \
+	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV = \
+	$(HOST_PKG_CARGO_ENV)
+
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -176,14 +194,30 @@ $(2)_BASE_BUILD_CMD   = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
-else ifeq ($$($(2)_SETUP_TYPE),setuptools)
+else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+$(2)_DL_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+else
 $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = setup.py build
 $(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_ENV)
+$(2)_DL_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_RUST_DL_ENV)
+ifndef $(2)_CARGO_MANIFEST_PATH
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(3)_CARGO_MANIFEST_PATH)
+else
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+endif
+else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
+endif
 $(2)_BASE_BUILD_CMD = setup.py build
 $(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
@@ -207,7 +241,7 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= -m installer dist/*
 endif
 else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 
 # Target packages need both the python interpreter on the target (for
@@ -224,8 +258,14 @@ endif # ($(4),target)
 # Setuptools based packages will need setuptools for the host Python
 # interpreter (both host and target).
 #
-ifeq ($$($(2)_SETUP_TYPE),setuptools)
+ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
+ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
+$(2)_DEPENDENCIES += host-python-setuptools-rust host-rustc
+# We need to vendor the Cargo crates at download time
+$(2)_DOWNLOAD_POST_PROCESS = cargo
+$(2)_DOWNLOAD_DEPENDENCIES = host-rustc
+endif
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
