Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FEFD0BB41
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36294062F;
	Wed, 23 Oct 2024 22:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OieWSoCJpxE; Wed, 23 Oct 2024 22:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D90840277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D90840277;
	Wed, 23 Oct 2024 22:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2AC52073
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF21804FD
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAxkTxE-o0Hy for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:09:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD5A6811B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5A6811B1
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD5A6811B1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:09:36 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a3bd422b52so1363915ab.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729721375; x=1730326175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BEJVIZ1D+J0/q7o/bGO/8BENyKWRnkwn9UW87JU7JHk=;
 b=ONO/SQ0hkuZhH736mnadGPyQBpoBNaHuPSREYBzQGHgmJ+LdDvaXFMfq4bxNWfDDoW
 CxQTkIoFMXUTHtJgCNPCXNmgcLycA4xPAOYUCw0Mqh6/pRGc38XN+d1O/CTLG0s3/yPA
 zgBQ/tpHVd/AFRYrZqDjI97zRvHNpzsLqegFHqCuaPY6JX0XOyJUx5UrhptdA5tTv/D6
 scSQKl+DWu7X3fw66qMjrT6H0qMcSESKkPpQ6UiEcrJ1kM4d+5XyfaaXJaNbwL2ZEIp8
 bA3mkLVX9Mmkxz6oUgVn2+qtXVWYC0RvCKQhLLU2l2tBFTIxQUMgenvuGX+Lx/BRQ+gh
 ukVA==
X-Gm-Message-State: AOJu0Yx6m+aqAsPityOeciQQpQtFrlOcGKq80+zl5uBX0iRZTZPx97R9
 yE2w2snP7ViAMmCVt7AiYAu77T/zV5oFE7XNjKiOjz25HPub6VeFOT1gDw==
X-Google-Smtp-Source: AGHT+IFgUsex4QB3iplrnGt0Fz8jFmFFxoAVpXQIPq+hMtXCQxNHfgMiM+m5vzqgulUgP+E5nVC9BQ==
X-Received: by 2002:a05:6e02:1569:b0:3a0:a070:b81 with SMTP id
 e9e14a558f8ab-3a4d59df6c9mr50632865ab.23.1729721375552; 
 Wed, 23 Oct 2024 15:09:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a6618bbsm2381188173.169.2024.10.23.15.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:09:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:09:33 -0600
Message-Id: <20241023220933.3325504-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729721375; x=1730326175; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BEJVIZ1D+J0/q7o/bGO/8BENyKWRnkwn9UW87JU7JHk=;
 b=gvsU3ZBf3dUAFtT3sSFanlx66yPf5/rrxNGde6X/XnKdBF68c6p4zjxAjwN93+Vcle
 kjTHtyi4lKr4E5tum5GPV2LxuJwFEgJdRLOHYFyGpqVkW7FE5CEbiO2jlWpzdNtJMJ6A
 VtiaJ7frY7L9YG+2h3BRQ3twhBN930h+Xaz9wLw+AqN0yStIIjHOKlBp34JtGd7hhFO4
 DEgmha13E4zbfy5QcfDTJ0ErTAN73luEoiDTZwzm0eSrrF1I3Khmca/yeg5B6lpyL1Ae
 gDvwPkGFZMTh64wzeb5zg03FqZt2XkzNKt9wn5tdU+yhmI6aF88i5VhjBTdBB4OhXNZn
 qHpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gvsU3ZBf
Subject: [Buildroot] [PATCH 1/1] package/pkg-python.mk: add poetry setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we have many python packages using the poetry(poetry-core) build
system we should add a setup type for it so that we don't have to
manually specify the host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/manual/adding-packages-directory.adoc |  2 +-
 docs/manual/adding-packages-python.adoc    | 20 +++++++-------
 package/pkg-python.mk                      | 31 ++++++++++++++++++++--
 utils/scanpypi                             |  2 ++
 4 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index cb19f3bac9..348c065798 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -429,7 +429,7 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use the +flit+, +hatch+, +pep517+,
+   for Python modules that use the +flit+, +hatch+, +pep517+, +poetry+
    +setuptools+, +setuptools-rust+ or +maturin+ mechanisms. We cover
    them through a xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 790e2899cf..b42c06e54c 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -51,8 +51,8 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +setuptools+ Python build system is used. The six
-supported ones are +flit+, +hatch+, +pep517+, +setuptools+,
+this case the +setuptools+ Python build system is used. The seven
+supported ones are +flit+, +hatch+, +pep517+, +poetry+, +setuptools+,
 +setuptools-rust+ and +maturin+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
@@ -96,14 +96,14 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The five supported values are +flit+, +hatch+,
-  +pep517+ and +setuptools+, +setuptools-rust+ and +maturin+. If you
-  don't know which one is used in your package, look at the +setup.py+
-  or +pyproject.toml+ file in your package source code, and see whether
-  it imports things from the +flit+ module or the +setuptools+
-  module. If the package is using a +pyproject.toml+ file without any
-  build-system requires and with a local in-tree backend-path one
-  should use +pep517+.
+  by the package. The seven supported values are +flit+, +hatch+,
+  +pep517+, +poetry+, +setuptools+, +setuptools-rust+ and +maturin+.
+  If you don't know which one is used in your package, look at the
+  +setup.py+ or +pyproject.toml+ file in your package source code,
+  and see whether it imports things from the +flit+ module or the
+  +setuptools+ module. If the package is using a +pyproject.toml+
+  file without any build-system requires and with a local in-tree
+  backend-path one should use +pep517+.
 
 A few additional variables, specific to the Python infrastructure, can
 optionally be defined, depending on the package's needs. Many of them
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 3c607b5277..32ace4aac1 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -258,6 +258,33 @@ HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
 HOST_PKG_PYTHON_MATURIN_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
+# Target poetry packages
+PKG_PYTHON_POETRY_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+PKG_PYTHON_POETRY_BUILD_CMD = \
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
+
+PKG_PYTHON_POETRY_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_POETRY_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
+PKG_PYTHON_POETRY_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-poetry-core
+
+# Host poetry packages
+HOST_PKG_PYTHON_POETRY_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+HOST_PKG_PYTHON_POETRY_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
+
+HOST_PKG_PYTHON_POETRY_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -284,8 +311,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit' or 'hatch'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin poetry,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit', 'hatch' or 'poetry'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
diff --git a/utils/scanpypi b/utils/scanpypi
index f832d5cab0..af62c01632 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -419,6 +419,8 @@ class BuildrootPackage():
                     self.setup_metadata['method'] = 'flit'
                 elif build_backend == 'hatchling.build':
                     self.setup_metadata['method'] = 'hatch'
+                elif build_backend == 'poetry.core.masonry.api':
+                    self.setup_metadata['method'] = 'poetry'
                 elif build_backend == 'setuptools.build_meta':
                     self.setup_metadata['method'] = 'setuptools'
                 else:
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
