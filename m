Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB589C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5813E40004;
	Mon, 10 Jan 2022 07:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcKeEn1Hmo1H; Mon, 10 Jan 2022 07:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCA40400BF;
	Mon, 10 Jan 2022 07:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD88A1BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F119260C01
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbwCCZgrlx1D for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:39:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E1EB605BE
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:39:05 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso4726817otr.6
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0OtaAzrcNewaq/C3akMG8Ss6Nr5lLQKFueaprLUE6M=;
 b=ARQwRJ8w6HQIFM/rZFEbwQCD65UV1J0J/+SBmxpMdR830rUn82YwZeTqYyGFJ72Gni
 wcqmhrVwJJe9UH8HBWC36sSYPY2Ea7v/gRC5paYgms/mOdYzX0P5y8ThA5Aq/1G1hzti
 40AhdeeWCZCeJE1O75Ij8DE9cpOmMdyeG68GmNOTYVsGiHxuOWtYE03V0EktP1Pfe5MF
 4sadtpE/COQep1+61G7oBPchEcv9IQ95lUqP2WwWR/yyFYHETbSvgOCCRTJGgFji+frR
 p46NcVTNslE8w4cvdWFEtTc/l+EGVAhUlgVtBEHbJfaGYpibFsYU8xGKEdR+Pvugd4lL
 MA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0OtaAzrcNewaq/C3akMG8Ss6Nr5lLQKFueaprLUE6M=;
 b=SKkeqWOgPuwV9pnRneYMW1dLvXhxMh4sHF2zPX3YoJJNRfRKIwr9idL447mO6Xn3dh
 ReGOdVnMROw9+zeYRiN6lmUUcfMzvPugrQjuNYyNLsRcPIPXS2xpP25lsPmGsceOOB0O
 WWS9D3EGvazY6uOmiw5oAvwAKoTe7DWmPjyAeiP0gHZgVxwnB9mMD3365NHu8zsb0ZY0
 /DhfPMO0jZGB7VO/gFjIygahkTkgx8LDxF4JAfvy7HHDCqcWaUNx4HXwMIxYDubeERd1
 M6e/ppHBKNhA49MX2GuVlZLglNS/udQFGyOYZjrhZm3hcrwiDICUz+pzL0W/a8skxvLf
 eMwA==
X-Gm-Message-State: AOAM5322axuhqjR6dWoDLyBpsx+YOpdw2RyZVUV1JTsOeLU/A1dJ16fI
 4PH4TD3+CimHpKBEGFSteFoBpOj15+0=
X-Google-Smtp-Source: ABdhPJwHvYcWKI2KY5dBpWJDZou+k9nyGpn0QmC1SYzqbql6QSykf/rYCfVtef7t6qTgOUeSp4b8mw==
X-Received: by 2002:a9d:2cd:: with SMTP id 71mr51089505otl.107.1641800344055; 
 Sun, 09 Jan 2022 23:39:04 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id 2sm1348881otm.41.2022.01.09.23.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:39:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 00:38:49 -0700
Message-Id: <20220110073850.1603711-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-flit-core: new
 package/infrastructure
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds pep517(needed for flit-core to build itself) and flit python
package types.

We need to add an installer script and pass it appropriate options for
installing pep517 wheels generated by python-pypa-build during the
build stage. Unfortunately it seems pep517 does not support builds
without using the wheel format.

We also need to add a patch fixing the version parser in flit-core.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk                         | 99 +++++++++++++++++++
 ...sion-parser-for-multiple-assignments.patch | 80 +++++++++++++++
 .../python-flit-core/python-flit-core.hash    |  3 +
 package/python-flit-core/python-flit-core.mk  | 15 +++
 support/scripts/pyinstaller.py                | 69 +++++++++++++
 5 files changed, 266 insertions(+)
 create mode 100644 package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
 create mode 100644 package/python-flit-core/python-flit-core.hash
 create mode 100644 package/python-flit-core/python-flit-core.mk
 create mode 100755 support/scripts/pyinstaller.py

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 22ea77352c..6bd3f43286 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -92,6 +92,47 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
+# Target pep517-based packages
+PKG_PYTHON_PEP517_ENV = \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
+	PATH=$(BR_PATH) \
+	$(TARGET_CONFIGURE_OPTS) \
+	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONNOUSERSITE=1 \
+	_python_sysroot=$(STAGING_DIR) \
+	_python_prefix=/usr \
+	_python_exec_prefix=/usr
+
+PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
+    --interpreter=/usr/bin/python \
+    --script-kind=posix \
+    --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+    --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
+    --scripts=$(TARGET_DIR)/usr/bin \
+    --data=$(TARGET_DIR)/usr
+
+PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
+    --interpreter=/usr/bin/python \
+    --script-kind=posix \
+    --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+    --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
+    --scripts=$(STAGING_DIR)/usr/bin \
+    --data=$(STAGING_DIR)/usr
+
+# Host pep517-based packages
+HOST_PKG_PYTHON_PEP517_ENV = \
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1 \
+	$(HOST_CONFIGURE_OPTS)
+
+HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
+    --interpreter=/usr/bin/python \
+    --script-kind=posix \
+    --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+    --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
+    --scripts=$(HOST_DIR)/usr/bin \
+    --data=$(HOST_DIR)/usr
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -141,6 +182,19 @@ $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
+else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+ifeq ($(4),target)
+$(2)_BASE_ENV         = $$(PKG_PYTHON_PEP517_ENV)
+$(2)_BASE_BUILD_TGT   = -w
+$(2)_BASE_BUILD_OPTS   =
+$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
+$(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
+else
+$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_PEP517_ENV)
+$(2)_BASE_BUILD_TGT   = -w
+$(2)_BASE_BUILD_OPTS   =
+$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
+endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")
 endif
@@ -203,6 +257,12 @@ $(2)_DEPENDENCIES += $$(if $$(filter host-python3-setuptools,$(1)),,host-python3
 else
 $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
 endif
+else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+$(2)_DEPENDENCIES += $$(if $$(filter host-python-pypa-build,$(1)),,host-python-pypa-build)
+$(2)_DEPENDENCIES += $$(if $$(filter host-python-installer,$(1)),,host-python-installer)
+ifeq ($$($(2)_SETUP_TYPE),flit)
+$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)
+endif
 endif # SETUP_TYPE
 
 # Python interpreter to use for building the package.
@@ -234,6 +294,15 @@ endif
 # file.
 #
 ifndef $(2)_BUILD_CMDS
+ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+define $(2)_BUILD_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$($(2)_PYTHON_INTERPRETER) -m build -n \
+		$$($$(PKG)_BASE_BUILD_TGT) \
+		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
+endef
+else
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
@@ -242,12 +311,21 @@ define $(2)_BUILD_CMDS
 		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
 endef
 endif
+endif
 
 #
 # Host installation step. Only define it if not already defined by the
 # package .mk file.
 #
 ifndef $(2)_INSTALL_CMDS
+ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+define $(2)_INSTALL_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$($(2)_PYTHON_INTERPRETER) $(TOPDIR)/support/scripts/pyinstaller.py dist/* \
+		$$($$(PKG)_BASE_INSTALL_OPTS) $$($$(PKG)_INSTALL_OPTS))
+endef
+else
 define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
@@ -255,12 +333,22 @@ define $(2)_INSTALL_CMDS
 		$$($$(PKG)_BASE_INSTALL_OPTS) $$($$(PKG)_INSTALL_OPTS))
 endef
 endif
+endif
 
 #
 # Target installation step. Only define it if not already defined by
 # the package .mk file.
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
+ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+define $(2)_INSTALL_TARGET_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$($(2)_PYTHON_INTERPRETER) $(TOPDIR)/support/scripts/pyinstaller.py dist/* \
+		$$($$(PKG)_BASE_INSTALL_TARGET_OPTS) \
+		$$($$(PKG)_INSTALL_TARGET_OPTS))
+endef
+else
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
@@ -269,12 +357,22 @@ define $(2)_INSTALL_TARGET_CMDS
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
 endif
+endif
 
 #
 # Staging installation step. Only define it if not already defined by
 # the package .mk file.
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
+ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
+define $(2)_INSTALL_STAGING_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$($(2)_PYTHON_INTERPRETER) $(TOPDIR)/support/scripts/pyinstaller.py dist/* \
+		$$($$(PKG)_BASE_INSTALL_STAGING_OPTS) \
+		$$($$(PKG)_INSTALL_STAGING_OPTS))
+endef
+else
 define $(2)_INSTALL_STAGING_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
@@ -283,6 +381,7 @@ define $(2)_INSTALL_STAGING_CMDS
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
 endef
 endif
+endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
diff --git a/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch b/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
new file mode 100644
index 0000000000..5a94e1dcab
--- /dev/null
+++ b/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
@@ -0,0 +1,80 @@
+From 2cd8b5708be88b90ea2fa0fb35407a5ec2038c8e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 27 Nov 2021 02:36:15 -0700
+Subject: [PATCH] Fix ast version parser for multiple assignments
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/takluyver/flit/pull/474]
+---
+ flit_core/common.py                 | 21 +++++++++++--------
+ .../tests/samples/moduleunimportabledouble.py |  8 +++++++
+ flit_core/tests/test_common.py      |  5 +++++
+ 3 files changed, 25 insertions(+), 9 deletions(-)
+ create mode 100644 flit_core/tests/samples/moduleunimportabledouble.py
+
+diff --git a/flit_core/common.py b/flit_core/common.py
+index f1f378f..86bcf4b 100644
+--- a/flit_core/common.py
++++ b/flit_core/common.py
+@@ -132,15 +132,18 @@ def get_docstring_and_version_via_ast(target):
+     for child in node.body:
+         # Only use the version from the given module if it's a simple
+         # string assignment to __version__
+-        is_version_str = (
+-                isinstance(child, ast.Assign)
+-                and len(child.targets) == 1
+-                and isinstance(child.targets[0], ast.Name)
+-                and child.targets[0].id == "__version__"
+-                and isinstance(child.value, ast.Str)
+-        )
+-        if is_version_str:
+-            version = child.value.s
++        if isinstance(child, ast.Assign):
++            for target in child.targets:
++                is_version_str = (
++                    isinstance(target, ast.Name)
++                    and target.id == "__version__"
++                    and isinstance(child.value, ast.Str)
++                )
++                if is_version_str:
++                    version = child.value.s
++                    break
++            else:
++                continue
+             break
+     else:
+         version = None
+diff --git a/flit_core/tests/samples/moduleunimportabledouble.py b/flit_core/tests/samples/moduleunimportabledouble.py
+new file mode 100644
+index 0000000..42d51f3
+--- /dev/null
++++ b/flit_core/tests/samples/moduleunimportabledouble.py
+@@ -0,0 +1,8 @@
++
++"""
++A sample unimportable module with double assignment
++"""
++
++raise ImportError()
++
++VERSION = __version__ = "0.1"
+diff --git a/flit_core/tests/test_common.py b/flit_core/tests/test_common.py
+index 02cfab7..42e230b 100644
+--- a/flit_core/tests/test_common.py
++++ b/flit_core/tests/test_common.py
+@@ -70,6 +70,11 @@ class ModuleTests(TestCase):
+                                 'version': '0.1'}
+                          )
+ 
++        info = get_info_from_module(Module('moduleunimportabledouble', samples_dir))
++        self.assertEqual(info, {'summary': 'A sample unimportable module with double assignment',
++                                'version': '0.1'}
++                         )
++
+         info = get_info_from_module(Module('module1', samples_dir / 'constructed_version'))
+         self.assertEqual(info, {'summary': 'This module has a __version__ that requires runtime interpretation',
+                                 'version': '1.2.3'}
+-- 
+2.33.1
+
diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
new file mode 100644
index 0000000000..bd47fd4f6b
--- /dev/null
+++ b/package/python-flit-core/python-flit-core.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/flit_core/json
+md5  82143536b81f148851a0213305838e53  flit_core-3.6.0.tar.gz
+sha256  5892962ab8b8ea945835b3a288fe9dd69316f1903d5288c3f5cafdcdd04756ad  flit_core-3.6.0.tar.gz
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
new file mode 100644
index 0000000000..539a6c99fe
--- /dev/null
+++ b/package/python-flit-core/python-flit-core.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-flit-core
+#
+################################################################################
+
+PYTHON_FLIT_CORE_VERSION = 3.6.0
+PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/08/e9/0653f7783ba2ec2f954f19442878427f1d5bfccb01842d354453c2809b22
+PYTHON_FLIT_CORE_SETUP_TYPE = pep517
+PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
+HOST_PYTHON_FLIT_CORE_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_FLIT_CORE_DEPENDENCIES = host-python-pypa-build
+
+$(eval $(host-python-package))
diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
new file mode 100755
index 0000000000..6dd9242327
--- /dev/null
+++ b/support/scripts/pyinstaller.py
@@ -0,0 +1,69 @@
+#!/usr/bin/env python3
+
+import argparse
+import glob
+
+from installer import install
+from installer.destinations import SchemeDictionaryDestination
+from installer.sources import WheelFile
+
+
+def main():
+    """Entry point for CLI."""
+    ap = argparse.ArgumentParser("python pyinstaller.py")
+    ap.add_argument("wheel_file", help="Path to a .whl file to install")
+
+    ap.add_argument(
+        "--interpreter", required=True, help="Interpreter path to be used in scripts"
+    )
+    ap.add_argument(
+        "--script-kind",
+        required=True,
+        choices=["posix", "win-ia32", "win-amd64", "win-arm", "win-arm64"],
+        help="Kind of launcher to create for each script",
+    )
+
+    dest_args = ap.add_argument_group("Destination directories")
+    dest_args.add_argument(
+        "--purelib",
+        required=True,
+        help="Directory for platform-independent Python modules",
+    )
+    dest_args.add_argument(
+        "--platlib",
+        help="Directory for platform-dependent Python modules (same as purelib "
+        "if not specified)",
+    )
+    dest_args.add_argument(
+        "--headers", required=True, help="Directory for C header files"
+    )
+    dest_args.add_argument(
+        "--scripts", required=True, help="Directory for executable scripts"
+    )
+    dest_args.add_argument(
+        "--data", required=True, help="Directory for external data files"
+    )
+    args = ap.parse_args()
+
+    destination = SchemeDictionaryDestination(
+        {
+            "purelib": args.purelib,
+            "platlib": args.platlib if args.platlib is not None else args.purelib,
+            "headers": args.headers,
+            "scripts": args.scripts,
+            "data": args.data,
+        },
+        interpreter=args.interpreter,
+        script_kind=args.script_kind,
+    )
+
+    with WheelFile.open(glob.glob(args.wheel_file)[0]) as source:
+        install(
+            source=source,
+            destination=destination,
+            additional_metadata={},
+        )
+
+
+if __name__ == "__main__":
+    main()
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
