Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388D2CF0429
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 22:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F46404A6;
	Tue,  8 Oct 2024 22:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsLLGGERUw37; Tue,  8 Oct 2024 22:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 324C840526
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 324C840526;
	Tue,  8 Oct 2024 22:27:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 479BB1BF48B
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 22:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3568640526
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 22:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaHuFrvv9FGe for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 22:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F06BE404A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06BE404A6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F06BE404A6
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 22:27:29 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-8353b41369fso18106439f.3
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 15:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728426448; x=1729031248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iEFdUhxtxKnxRHcrEToEEdfSukLMJ60nc/WROdu/c5w=;
 b=Q4TZDvDcNSUYB1zgvUIMhC3dQwT85iasgCnU4iw7E/xslfkM4afWW4hL5l0dpMJ2Zp
 6R/iAzmK8td0kpvlUoKDJzRmdH9vw5YRGNv2FrDLXZlN+//OVzQIrJTFX3FiDlqUg4KD
 BkARpotHxs1O0MqSkKLDgaT/AHa5uSWTrlu7esUvdfoQZY+rA6RjfGGK4oeMnfGm4Wd0
 0G5rn1XWJ+rpjpRlNTe3c6zkzjWPApWwHJmcoOX1OYd5cPZYb0MUOyig9A2ZaSE8xcd0
 dZeigt2EHbvrWt4ljp6ASzEClKTRzE2C92JBkd8/rusY69s1H1ITRwlR+5stcT4sO5uf
 zetw==
X-Gm-Message-State: AOJu0Yz4Fb6ZWmcpGp1D3keR1meOnWoTQoQy+4/lu4b+3gRkZQvw0kEY
 mHJHCxw4mygXKvhO4V1+FqhnWIKojFnJzsUT0BK8dTo5Bb7jGg+lFc9EiJ86
X-Google-Smtp-Source: AGHT+IHxVm8H76Dp36LqwSttxUr7AOF6X/zGkM+Qx3ZgJB4mxvT3o2+KIhVNUvevr/tq9lD9tv50QA==
X-Received: by 2002:a05:6602:13c5:b0:82c:fd75:813a with SMTP id
 ca18e2360f4ac-8353d376a3dmr56495139f.1.1728426448498; 
 Tue, 08 Oct 2024 15:27:28 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83503aac0casm192336239f.25.2024.10.08.15.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 15:27:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 16:27:24 -0600
Message-Id: <20241008222724.3766564-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728426448; x=1729031248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iEFdUhxtxKnxRHcrEToEEdfSukLMJ60nc/WROdu/c5w=;
 b=cuA+A29NiHksP3o1w1vYl/f+3+ow9xsCzx3eDi+c6jy/GcQVy4O3dfY32Cd3OV0QeD
 D+A63ESqg9//2dvc8rWhMXlRTNel+RdylWdbHGSY0/rqjpRv/bKf7VCf/TlTyV4reKmr
 PSzU1qfs0UShqVvhJ8piTgnz54eYdI8cc34HhAI9ENvqd1ZBxdkRk+w5Zuk8WZRSlINw
 3HTQGAPE98yx+Cz5Mt8EZwVC0N1IyyOrduHmoQqiZKLLajbogZDWPX07Pd+kSJrYpY3T
 4pPSSBB4LS+pZtawj4Ug/iuF9FQf3QVAzeyJaDEhJ/u56kfa4T8PrVZYgrUpO005mwp/
 e1fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cuA+A29N
Subject: [Buildroot] [PATCH 1/1] package/pkg-python.mk: add hatch setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we have many python packages using the hatch(hatchling) build
system we should add a setup type for it so that we don't have to
manually specify the host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/manual/adding-packages-directory.adoc |  6 ++---
 docs/manual/adding-packages-python.adoc    | 14 +++++-----
 package/pkg-python.mk                      | 31 ++++++++++++++++++++--
 utils/scanpypi                             |  2 ++
 4 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 4ca11507e1..cb19f3bac9 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -429,9 +429,9 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use the +flit+, +pep517+, +setuptools+,
-   +setuptools-rust+ or +maturin+ mechanisms. We cover them through a
-   xref:python-package-tutorial[tutorial] and a
+   for Python modules that use the +flit+, +hatch+, +pep517+,
+   +setuptools+, +setuptools-rust+ or +maturin+ mechanisms. We cover
+   them through a xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
 
 * *Makefiles for Lua modules*: We have a dedicated infrastructure for
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index f33770f95c..790e2899cf 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -51,9 +51,9 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +setuptools+ Python build system is used. The five
-supported ones are +flit+, +pep517+, +setuptools+, +setuptools-rust+
-and +maturin+.
+this case the +setuptools+ Python build system is used. The six
+supported ones are +flit+, +hatch+, +pep517+, +setuptools+,
++setuptools-rust+ and +maturin+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
 generates all the Makefile rules that actually allow the package to be
@@ -96,10 +96,10 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The five supported values are +flit+, +pep517+ and
-  +setuptools+, +setuptools-rust+ and +maturin+. If you don't know
-  which one is used in your package, look at the +setup.py+ or
-  +pyproject.toml+ file in your package source code, and see whether
+  by the package. The five supported values are +flit+, +hatch+,
+  +pep517+ and +setuptools+, +setuptools-rust+ and +maturin+. If you
+  don't know which one is used in your package, look at the +setup.py+
+  or +pyproject.toml+ file in your package source code, and see whether
   it imports things from the +flit+ module or the +setuptools+
   module. If the package is using a +pyproject.toml+ file without any
   build-system requires and with a local in-tree backend-path one
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index dea4f39ca0..3c607b5277 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -200,6 +200,33 @@ HOST_PKG_PYTHON_FLIT_BOOTSTRAP_BUILD_CMD = \
 HOST_PKG_PYTHON_FLIT_BOOTSTRAP_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
+# Target hatch packages
+PKG_PYTHON_HATCH_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+PKG_PYTHON_HATCH_BUILD_CMD = \
+	$(PKG_PYTHON_PEP517_BUILD_CMD)
+
+PKG_PYTHON_HATCH_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_HATCH_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
+PKG_PYTHON_HATCH_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-hatchling
+
+# Host hatch packages
+HOST_PKG_PYTHON_HATCH_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+HOST_PKG_PYTHON_HATCH_BUILD_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
+
+HOST_PKG_PYTHON_HATCH_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 # Target maturin packages
 PKG_PYTHON_MATURIN_ENV = \
 	$(PKG_PYTHON_PEP517_ENV) \
@@ -257,8 +284,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit' or 'hatch'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
diff --git a/utils/scanpypi b/utils/scanpypi
index b6a2a92219..5871d97021 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -417,6 +417,8 @@ class BuildrootPackage():
                 self.build_backend = build_backend
                 if build_backend == 'flit_core.buildapi':
                     self.setup_metadata['method'] = 'flit'
+                elif build_backend == 'hatchling.build':
+                    self.setup_metadata['method'] = 'hatch'
                 elif build_backend == 'setuptools.build_meta':
                     self.setup_metadata['method'] = 'setuptools'
                 else:
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
