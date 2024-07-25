Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CECAC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 07:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C524540E0A;
	Thu, 25 Jul 2024 07:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFybZIlNeRFn; Thu, 25 Jul 2024 07:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A5E40BDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65A5E40BDC;
	Thu, 25 Jul 2024 07:21:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 508021BF397
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 07:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FFA060A57
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 07:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlguHyI3qGEj for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 07:21:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=dylan.bespalko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FF6B60A51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF6B60A51
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FF6B60A51
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 07:21:31 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3daf0e73976so413378b6e.1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 00:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721892090; x=1722496890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2V9w0b3g0r+VXcnIHgu9roMyQCI/I4D+gWi82oaFZc=;
 b=uxJ2S9fb73Un/ZELmn8E1MFpWmbG808z+tTBDhxFIMpvLEkSShHlMiSAiWNGr34+4M
 3OPrpeoUoplOS2NUMWgIB76jvfOH6v7ef4wcWOgh5hpf5JGos3CMp7dRCNDWjOGxt+2Q
 k97CeDQd5qU9fDCCdaHO25k9DkIYVBcZQLRJJmX2FrNv1xN1WIfEaPrn0iUVFdb6y0Y8
 hPbAkQhnXg2GmU+fQKn72/1tKhxmR2RMfdr0DCM/VZOefCBYWnKjNmfH5FaqIHUqRZwD
 uGI6+YJ7vmFZ6UbimlMiy3jWmIG3ZQHO1B4em1h8YiWv3ycxjwJURF+/1YWKAYBuYfn6
 3FTg==
X-Gm-Message-State: AOJu0Yz9ZfS9MhaUKEBjQ8caUc+yi1TZgIru4GWLHS/2UAa/amvH2VG2
 YeB1ukOGMLZQPMII/9Q2fB9XAEYbGl9gjV5S35AhqDNzL0PrAU1ch+ruHztY
X-Google-Smtp-Source: AGHT+IHutNUx2dDbjhPg1zScAx44yzZAZ9AmYXdx96cjAr4UyokGss5e9YTQqBuLGJ9T0c6BdtpMAQ==
X-Received: by 2002:a05:6808:3007:b0:3d5:600c:682 with SMTP id
 5614622812f47-3db10e678e4mr2256262b6e.13.1721892089748; 
 Thu, 25 Jul 2024 00:21:29 -0700 (PDT)
Received: from NSFW0.cg.shawcable.net
 ([2604:3d09:c8e:3500:9609:d003:2ee6:e04f])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f8655dffsm532990a12.39.2024.07.25.00.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 00:21:29 -0700 (PDT)
From: Dylan Bespalko <dylan.bespalko@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 00:21:18 -0700
Message-Id: <20240725072118.218886-1-dylan.bespalko@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721892090; x=1722496890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M2V9w0b3g0r+VXcnIHgu9roMyQCI/I4D+gWi82oaFZc=;
 b=B5YzY3PJ6o5t04fqRKYnU1BBL1Hm91v+y7+9UG9NfA8Q5911a1EcWu4ug+RTqRhENQ
 9j+ASJnzOuTQuxNR0/GpxLFBIX/D/jxL0kLDufnxVuEWQbgHipGmYo4n/NcFvFlX0clJ
 +tnhIQr1DXQH0ZtLHG5oWjmSc6aw1GdYvoOC8Yvv4Nv8FkKPkO5ptpTvLXXNhWIXpMfQ
 mkvFxSRgbEW70fIKoghwyC/78FaPHte1dfKEBeqAz25+zHxNLfXg6aySY1OxAchbzNET
 Nxj7H8+OKEjZFvcYBYYsyXwaFhbUm7hrC2+RQqVmNcoFRGDD4FnlTV9MGTEq1F29Bgxl
 Sf7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B5YzY3PJ
Subject: [Buildroot] [PATCH] added python-pyside6 recipe
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
Cc: Dylan Bespalko <dylan.bespalko@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 DEVELOPERS                                    |   4 +
 package/Config.in                             |   2 +
 package/python-pyside6/Config.in              |  19 ++
 package/python-pyside6/python-pyside6.hash    |  10 ++
 package/python-pyside6/python-pyside6.mk      | 123 +++++++++++++
 package/python-shiboken6/Config.in            |  24 +++
 .../python-shiboken6/python-shiboken6.hash    |  10 ++
 package/python-shiboken6/python-shiboken6.mk  | 137 +++++++++++++++
 .../tests/package/sample_python_pyside6.py    | 165 ++++++++++++++++++
 .../tests/package/test_python_pyside6.py      |  60 +++++++
 10 files changed, 554 insertions(+)
 create mode 100644 package/python-pyside6/Config.in
 create mode 100644 package/python-pyside6/python-pyside6.hash
 create mode 100644 package/python-pyside6/python-pyside6.mk
 create mode 100644 package/python-shiboken6/Config.in
 create mode 100644 package/python-shiboken6/python-shiboken6.hash
 create mode 100644 package/python-shiboken6/python-shiboken6.mk
 create mode 100644 support/testing/tests/package/sample_python_pyside6.py
 create mode 100644 support/testing/tests/package/test_python_pyside6.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a8c92f122..b9685b620b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -881,6 +881,10 @@ F:	package/unscd/
 N:	Dushara Jayasinghe <nidujay@gmail.com>
 F:	package/prosody/
 
+N:      Dylan Bespalko <dylan.bespalko@gmail.com>
+F:      package/python-shiboken6/
+F:      package/python-pyside6/
+
 N:	Edgar Bonet <bonet@grenoble.cnrs.fr>
 F:	board/acmesystems/acqua-a5/
 F:	configs/acmesystems_acqua_a5_256mb_defconfig
diff --git a/package/Config.in b/package/Config.in
index 90f1ecc877..2a449c884d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1309,6 +1309,7 @@ menu "External python modules"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysensors/Config.in"
 	source "package/python-pysftp/Config.in"
+	source "package/python-pyside6/Config.in"
 	source "package/python-pysmb/Config.in"
 	source "package/python-pysmi/Config.in"
 	source "package/python-pysnmp/Config.in"
@@ -1364,6 +1365,7 @@ menu "External python modules"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-sh/Config.in"
+	source "package/python-shiboken6/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplegeneric/Config.in"
diff --git a/package/python-pyside6/Config.in b/package/python-pyside6/Config.in
new file mode 100644
index 0000000000..b999cadbbb
--- /dev/null
+++ b/package/python-pyside6/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PYTHON_PYSIDE6
+	bool "python-pyside6"
+	depends on BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT6BASE_GUI
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS  # Requirement of PySide6.QtWidgets, but not QtWidgets
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6BASE_OPENGL
+	select BR2_PACKAGE_OPENSSL  # Requirement of PySide6.QtNetwork, but not QtNetwork
+	select BR2_PACKAGE_HOST_PYTHON_SHIBOKEN6
+	select BR2_PACKAGE_PYTHON_SHIBOKEN6
+	help
+	  Qt For Python is the Python Qt bindings project.
+	  Make sure to select a qpa-platform using:
+	  - BR2_PACKAGE_QT6BASE_DEFAULT_QPA="<qpa-platform>"
+	  - Or, QT_QPA_PLATFORM=<qpa-platform> python3
+
+	  PySide6 auto-detects the Qt6 Modules that are present.
+
+	  https://wiki.qt.io/Qt_for_Python
diff --git a/package/python-pyside6/python-pyside6.hash b/package/python-pyside6/python-pyside6.hash
new file mode 100644
index 0000000000..361ae66124
--- /dev/null
+++ b/package/python-pyside6/python-pyside6.hash
@@ -0,0 +1,10 @@
+# Locally computed sha256 checksums
+md5  385a4463908d14cc86d54aac0454e871  python-pyside6-v6.7.2-git4.tar.gz
+sha256  5ddb1bac70c9504d57f31005f4cdf5921c71fbf91190abe22abf45537d725d3b  python-pyside6-v6.7.2-git4.tar.gz
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  Qt-GPL-exception-1.0.txt
diff --git a/package/python-pyside6/python-pyside6.mk b/package/python-pyside6/python-pyside6.mk
new file mode 100644
index 0000000000..9db8aad384
--- /dev/null
+++ b/package/python-pyside6/python-pyside6.mk
@@ -0,0 +1,123 @@
+################################################################################
+#
+# python-pyside6
+#
+################################################################################
+
+PYTHON_PYSIDE6_VERSION = v6.7.2
+PYTHON_PYSIDE6_SITE = https://code.qt.io/pyside/pyside-setup.git
+PYTHON_PYSIDE6_SITE_METHOD = git
+PYTHON_PYSIDE6_CPE_ID_VENDOR = qt
+PYTHON_PYSIDE6_CPE_ID_PRODUCT = pyside6
+PYTHON_PYSIDE6_SUPPORTS_IN_SOURCE_BUILD = NO
+PYTHON_PYSIDE6_INSTALL_STAGING = YES
+
+PYTHON_PYSIDE6_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GFDL-1.3 (docs), \
+	Apache-2.0, \
+	BSD-3-Clause
+
+PYTHON_PYSIDE6_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+PYTHON_PYSIDE6_DEPENDENCIES = \
+	host-python-shiboken6 \
+	qt6base \
+	python-shiboken6
+
+PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES = \
+	Core \
+	Gui \
+	Widgets \
+	$(if $(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),PrintSupport) \
+	$(if $(BR2_PACKAGE_QT6BASE_SQL),Sql) \
+	$(if $(BR2_PACKAGE_QT6BASE_NETWORK),Network) \
+	$(if $(BR2_PACKAGE_QT6BASE_TEST),Test) \
+	$(if $(BR2_PACKAGE_QT6BASE_CONCURRENT),Concurrent)
+
+PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES = \
+	$(if $(BR2_PACKAGE_QT6BASE_DBUS),DBus) \
+	$(if $(BR2_PACKAGE_QT6BASE_XML),Xml) \
+	$(if $(BR2_PACKAGE_QT6BASE_OPENGL),OpenGL) \
+	$(if $(BR2_PACKAGE_QT6BASE_WIDGETS) && $(BR2_PACKAGE_QT6BASE_OPENGL),OpenGLWidgets)
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6declarative
+PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += \
+	Qml \
+	Quick \
+	QuickControls2 \
+	QuickTest \
+	QuickWidgets
+endif
+ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6serialport
+PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialPort
+ifeq ($(BR2_PACKAGE_QT6SERIALBUS),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6serialbus
+PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialBus
+endif
+endif
+ifeq ($(BR2_PACKAGE_QT6SVG),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6svg
+PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += Svg
+PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SvgWidgets
+endif
+#ifeq ($(BR2_PACKAGE_QT6TOOLS),y)  # Failed to find the host tool "Qt6::lconvert".  It is part of the Qt6LinguistTools package
+#PYTHON_PYSIDE6_DEPENDENCIES += qt6tools
+#PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += UiTools
+#endif
+
+PYTHON_PYSIDE6_ALL_MODULES = $(subst $(space),\;,$(PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES) $(PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES))
+
+PYTHON_PYSIDE6_CONF_ENV = \
+	LLVM_INSTALL_DIR=$(HOST_DIR)
+
+#Add option -DMODULES=Core\;Gui\;Widgets for minimum build
+PYTHON_PYSIDE6_CONF_CXXFLAGS = $(subst $(space),$(comma),$(TARGET_CXXFLAGS))
+PYTHON_PYSIDE6_CONF_OPTS = \
+	-DMODULES=$(PYTHON_PYSIDE6_ALL_MODULES) \
+	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
+	-DSTANDALONE=ON \
+	-DPYSIDE_TREAT_QT_INCLUDE_DIRS_AS_NON_SYSTEM=ON \
+	-DSHIBOKEN_GENERATOR_EXTRA_FLAGS='\
+		--compiler-path=$(HOST_DIR)/bin/clang'
+
+# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
+# 2. sed -i s/\$\$(PKG)/PYTHON_PYSIDE6/g
+# 3. sed -i s/\$\$/\$/g
+# 4. append $(PYTHON_PYSIDE6_SRCDIR) with sources/shiboken6
+define PYTHON_PYSIDE6_CONFIGURE_CMDS
+	(mkdir -p $(PYTHON_PYSIDE6_BUILDDIR) && \
+	cd $(PYTHON_PYSIDE6_BUILDDIR) && \
+	rm -f CMakeCache.txt && \
+	PATH=$(BR_PATH) \
+	$(PYTHON_PYSIDE6_CONF_ENV) $(BR2_CMAKE) $(PYTHON_PYSIDE6_SRCDIR)/sources/pyside6 \
+		-G$(PYTHON_PYSIDE6_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$(PYTHON_PYSIDE6_GENERATOR_PROGRAM)" \
+		-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
+		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
+		-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_DOC=OFF \
+		-DBUILD_DOCS=OFF \
+		-DBUILD_EXAMPLE=OFF \
+		-DBUILD_EXAMPLES=OFF \
+		-DBUILD_TEST=OFF \
+		-DBUILD_TESTS=OFF \
+		-DBUILD_TESTING=OFF \
+		-DBUILD_SHARED_LIBS=$(if $(BR2_STATIC_LIBS),OFF,ON) \
+		$(CMAKE_QUIET) \
+		$(PYTHON_PYSIDE6_CONF_OPTS) \
+		)
+endef
+
+$(eval $(cmake-package))
diff --git a/package/python-shiboken6/Config.in b/package/python-shiboken6/Config.in
new file mode 100644
index 0000000000..1e42f0edcc
--- /dev/null
+++ b/package/python-shiboken6/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_PYTHON_SHIBOKEN6
+	bool "python-shiboken6"
+	depends on BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT6BASE_GUI
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS  # Requirement of PySide6.QtWidgets, but not QtWidgets
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6BASE_OPENGL
+	select BR2_PACKAGE_HOST_LIBXSLT
+	select BR2_PACKAGE_HOST_CLANG
+	select BR2_PACKAGE_HOST_CMAKE
+	select BR2_PACKAGE_HOST_PERL
+	select BR2_PACKAGE_HOST_QT6BASE
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON_NUMPY
+	select BR2_PACKAGE_HOST_PYTHON_SHIBOKEN6
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON_NUMPY
+	help
+	  Shiboken generates bindings for C++ libraries using
+	  CPython source code
+
+	  https://wiki.qt.io/Qt_for_Python
diff --git a/package/python-shiboken6/python-shiboken6.hash b/package/python-shiboken6/python-shiboken6.hash
new file mode 100644
index 0000000000..d6f479a477
--- /dev/null
+++ b/package/python-shiboken6/python-shiboken6.hash
@@ -0,0 +1,10 @@
+# Locally computed sha256 checksums
+md5  0bc8a2fcc8ab4c31711b7c6e1254dae8  python-shiboken6-v6.7.2-git4.tar.gz
+sha256  586a245db884a4d020f696b985d3afee0b81f11cc3aeeb62aa2c4632d43f4e67  python-shiboken6-v6.7.2-git4.tar.gz
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  Qt-GPL-exception-1.0.txt
diff --git a/package/python-shiboken6/python-shiboken6.mk b/package/python-shiboken6/python-shiboken6.mk
new file mode 100644
index 0000000000..333d610605
--- /dev/null
+++ b/package/python-shiboken6/python-shiboken6.mk
@@ -0,0 +1,137 @@
+################################################################################
+#
+# python-shiboken6
+#
+################################################################################
+
+PYTHON_SHIBOKEN6_VERSION = v6.7.2
+PYTHON_SHIBOKEN6_SITE = https://code.qt.io/pyside/pyside-setup.git
+PYTHON_SHIBOKEN6_SITE_METHOD = git
+PYTHON_SHIBOKEN6_CPE_ID_VENDOR = qt
+PYTHON_SHIBOKEN6_CPE_ID_PRODUCT = shiboken
+PYTHON_SHIBOKEN6_SUPPORTS_IN_SOURCE_BUILD = NO
+PYTHON_SHIBOKEN6_INSTALL_STAGING = YES
+
+PYTHON_SHIBOKEN6_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GFDL-1.3 (docs), \
+	Apache-2.0, \
+	BSD-3-Clause
+
+PYTHON_SHIBOKEN6_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+PYTHON_SHIBOKEN6_DEPENDENCIES = \
+	host-libxslt \
+	host-clang \
+	host-cmake \
+	host-perl \
+	host-qt6base \
+	host-python3 \
+	host-python-numpy \
+	host-python-shiboken6 \
+	qt6base \
+	python3 \
+	python-numpy
+
+HOST_PYTHON_SHIBOKEN6_DEPENDENCIES = \
+	host-libxslt \
+	host-clang \
+	host-cmake \
+	host-perl \
+	host-qt6base \
+	host-python3 \
+	host-python-numpy
+
+PYTHON_SHIBOKEN6_CONF_OPTS = \
+	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
+	-DQFP_PYTHON_HOST_PATH=$(HOST_DIR)/bin/python3
+
+HOST_PYTHON_SHIBOKEN6_CONF_OPTS =
+
+# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
+# 2. sed -i s/\$\$(PKG)/PYTHON_SHIBOKEN6/g
+# 3. sed -i s/\$\$/\$/g
+# 4. append $(PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
+define PYTHON_SHIBOKEN6_CONFIGURE_CMDS
+	(mkdir -p $(PYTHON_SHIBOKEN6_BUILDDIR) && \
+	cd $(PYTHON_SHIBOKEN6_BUILDDIR) && \
+	rm -f CMakeCache.txt && \
+	PATH=$(BR_PATH) \
+	$(PYTHON_SHIBOKEN6_CONF_ENV) $(BR2_CMAKE) $(PYTHON_SHIBOKEN6_SRCDIR)/sources/shiboken6 \
+		-G$(PYTHON_SHIBOKEN6_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$(PYTHON_SHIBOKEN6_GENERATOR_PROGRAM)" \
+		-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
+		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
+		-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_DOC=OFF \
+		-DBUILD_DOCS=OFF \
+		-DBUILD_EXAMPLE=OFF \
+		-DBUILD_EXAMPLES=OFF \
+		-DBUILD_TEST=OFF \
+		-DBUILD_TESTS=OFF \
+		-DBUILD_TESTING=OFF \
+		-DBUILD_SHARED_LIBS=$(if $(BR2_STATIC_LIBS),OFF,ON) \
+		$(CMAKE_QUIET) \
+		$(PYTHON_SHIBOKEN6_CONF_OPTS) \
+		)
+endef
+
+# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
+# 2. sed -i s/\$\$(PKG)/HOST_PYTHON_SHIBOKEN6/g
+# 3. sed -i s/\$\$/\$/g
+# 4. append $(HOST_PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
+define HOST_PYTHON_SHIBOKEN6_CONFIGURE_CMDS
+	(mkdir -p $(HOST_PYTHON_SHIBOKEN6_BUILDDIR) && \
+	cd $(HOST_PYTHON_SHIBOKEN6_BUILDDIR) && \
+	rm -f CMakeCache.txt && \
+	PATH=$(BR_PATH) \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	$(HOST_PYTHON_SHIBOKEN6_CONF_ENV) $(BR2_CMAKE) $(HOST_PYTHON_SHIBOKEN6_SRCDIR)/sources/shiboken6 \
+		-G$(HOST_PYTHON_SHIBOKEN6_GENERATOR) \
+		-DCMAKE_MAKE_PROGRAM="$(HOST_PYTHON_SHIBOKEN6_GENERATOR_PROGRAM)" \
+		-DCMAKE_INSTALL_SO_NO_EXE=0 \
+		-DCMAKE_FIND_ROOT_PATH="$(HOST_DIR)" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
+		-DCMAKE_INSTALL_PREFIX="$(HOST_DIR)" \
+		-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
+		-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+		-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+		-DCMAKE_ASM_COMPILER="$(HOSTAS)" \
+		-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
+		-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
+		$(if $(CMAKE_HOST_C_COMPILER_LAUNCHER),\
+			-DCMAKE_C_COMPILER_LAUNCHER="$(CMAKE_HOST_C_COMPILER_LAUNCHER)" \
+			-DCMAKE_CXX_COMPILER_LAUNCHER="$(CMAKE_HOST_CXX_COMPILER_LAUNCHER)" \
+		) \
+		-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_DOC=OFF \
+		-DBUILD_DOCS=OFF \
+		-DBUILD_EXAMPLE=OFF \
+		-DBUILD_EXAMPLES=OFF \
+		-DBUILD_TEST=OFF \
+		-DBUILD_TESTS=OFF \
+		-DBUILD_TESTING=OFF \
+		-DBUILD_SHARED_LIBS=ON \
+		$(CMAKE_QUIET) \
+		$(HOST_PYTHON_SHIBOKEN6_CONF_OPTS) \
+		)
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/support/testing/tests/package/sample_python_pyside6.py b/support/testing/tests/package/sample_python_pyside6.py
new file mode 100644
index 0000000000..079cece9d5
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyside6.py
@@ -0,0 +1,165 @@
+# ALL_ESSENTIAL_MODULES
+def test_python_pyside6_qt():
+    from PySide6.QtCore import Qt
+    enum = Qt.white
+    assert(str(enum) == 'GlobalColor.white')
+
+
+def test_python_pyside6_qtcore():
+    from PySide6 import QtCore
+    obj = QtCore.QObject()
+    obj.setObjectName('MyObject')
+    assert(obj.objectName() == 'MyObject')
+
+
+def test_python_pyside6_qtgui():
+    from PySide6 import QtGui
+    color = QtGui.QColor.fromRgb(255, 255, 255, 255)
+    assert(color.name(QtGui.QColor.HexArgb) == "#ffffffff")
+
+
+def test_python_pyside6_qtwidgets():
+    from PySide6 import QtWidgets
+    app = QtWidgets.QApplication()
+    label = QtWidgets.QLabel('Hello World')
+    assert(label.text() == 'Hello World')
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtprintsupport():
+    from PySide6 import QtWidgets
+    from PySide6 import QtPrintSupport
+    app = QtWidgets.QApplication()
+    p = QtPrintSupport.QPrinter()
+    assert(p.creator() == '')
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtsql():
+    from PySide6 import QtSql
+    db = QtSql.QSqlDatabase()
+    assert(db.hostName() == '')
+
+
+def test_python_pyside6_qtnetwork():
+    from PySide6 import QtNetwork
+    host_info = QtNetwork.QHostInfo()
+    assert(host_info.localHostName() == 'buildroot')
+
+
+def test_python_pyside6_qttest():
+    from PySide6 import QtTest
+    text = QtTest.QTest.toPrettyCString('hello there', 5)
+    assert(text == '"hello"')
+
+
+def test_python_pyside6_qtconcurrent():
+    from PySide6 import QtConcurrent
+    future = QtConcurrent.QFutureQString()
+    assert(future.isRunning() is False)
+
+
+# ALL_OPTIONAL_MODULES
+def test_python_pyside6_qtdbus():
+    from PySide6 import QtDBus
+    message = QtDBus.QDBusMessage()
+    assert(message.errorMessage() == '')
+
+
+def test_python_pyside6_qtxml():
+    from PySide6 import QtXml
+    doc = QtXml.QDomDocument('temp.xml')
+    assert(doc.toString() == '')
+
+
+def test_python_pyside6_qtopengl():
+    from PySide6 import QtOpenGL
+    log = QtOpenGL.QOpenGLDebugLogger()
+    assert(log.isLogging() is False)
+
+
+def test_python_pyside6_qtopenglwidgets():
+    from PySide6 import QtWidgets
+    from PySide6 import QtOpenGLWidgets
+    app = QtWidgets.QApplication()
+    _ = QtOpenGLWidgets.QOpenGLWidget()
+    # assert(widget.isValid() == False)
+    # QOpenGLWidget is not supported on this platform.
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtquickcontrols():
+    from PySide6 import QtWidgets
+    from PySide6 import QtQuick
+    app = QtWidgets.QApplication()
+    view = QtQuick.QQuickView()
+    assert(str(view.status()) == 'Status.Null')
+    view.setSource('/usr/lib/qt6/qml/QtQuick/Controls/Universal/Label.qml')
+    assert(str(view.status()) == 'Status.Ready')
+    view.close()
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtquicktest():
+    from PySide6 import QtQuickTest
+    QtQuickTest.QUICK_TEST_MAIN('/usr/lib/qt6/qml/QtTest/TestCase.qml')
+    # The directory '/root' does not contain any test files matching 'tst_*.qml'
+    # 1
+    # todo: The tests run, but don't pass. I have no experience with this module.
+
+
+def test_python_pyside6_qtquickwidgets():
+    from PySide6 import QtWidgets
+    from PySide6 import QtQuickWidgets
+    app = QtWidgets.QApplication()
+    view = QtQuickWidgets.QQuickWidget()
+    assert(str(view.status()) == 'Status.Null')
+    view.setSource('/usr/lib/qt6/qml/QtQuick/Controls/Universal/Label.qml')
+    assert(str(view.status()) == 'Status.Ready')
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtserialport():
+    from PySide6 import QtSerialPort
+    ser = QtSerialPort.QSerialPort()
+    ser.setPortName('/dev/ttyUSB0')
+    assert(ser.portName() == 'ttyUSB0')
+
+
+def test_python_pyside6_qtsvg():
+    from PySide6 import QtSvg
+    renderer = QtSvg.QSvgRenderer()
+    renderer.setFramesPerSecond(30)
+    assert(renderer.framesPerSecond() == 30)
+
+
+def test_python_pyside6_qtsvgwidgets():
+    from PySide6 import QtWidgets
+    from PySide6 import QtSvgWidgets
+    app = QtWidgets.QApplication()
+    widget = QtSvgWidgets.QSvgWidget()
+    widget.setObjectName('MyObject')
+    assert(widget.objectName() == 'MyObject')
+    QtWidgets.QApplication.shutdown(app)
+
+
+if __name__ == "__main__":
+    test_python_pyside6_qt()
+    test_python_pyside6_qtcore()
+    test_python_pyside6_qtgui()
+    test_python_pyside6_qtwidgets()
+    test_python_pyside6_qtprintsupport()
+    test_python_pyside6_qtsql()
+    test_python_pyside6_qtnetwork()
+    test_python_pyside6_qttest()
+    test_python_pyside6_qtconcurrent()
+    test_python_pyside6_qtdbus()
+    test_python_pyside6_qtxml()
+    test_python_pyside6_qtopengl()
+    test_python_pyside6_qtopenglwidgets()
+    test_python_pyside6_qtquickcontrols()
+    test_python_pyside6_qtquicktest()
+    test_python_pyside6_qtquickwidgets()
+    test_python_pyside6_qtserialport()
+    test_python_pyside6_qtsvg()
+    test_python_pyside6_qtsvgwidgets()
diff --git a/support/testing/tests/package/test_python_pyside6.py b/support/testing/tests/package/test_python_pyside6.py
new file mode 100644
index 0000000000..a5a4872182
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyside6.py
@@ -0,0 +1,60 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PySide6(TestPythonPackageBase):
+    __test__ = True
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_QT6=y
+        BR2_PACKAGE_QT6BASE_GUI=y
+        BR2_PACKAGE_QT6BASE_WIDGETS=y
+        BR2_PACKAGE_QT6BASE_PRINTSUPPORT=y
+        BR2_PACKAGE_QT6BASE_SQL=y
+        BR2_PACKAGE_QT6BASE_SQLITE=y
+        BR2_PACKAGE_QT6BASE_NETWORK=y
+        BR2_PACKAGE_QT6BASE_TEST=y
+        BR2_PACKAGE_QT6BASE_CONCURRENT=y
+        BR2_PACKAGE_QT6BASE_DBUS=y
+        BR2_PACKAGE_QT6BASE_XML=y
+        BR2_PACKAGE_QT6BASE_OPENGL=y
+        BR2_PACKAGE_QT6DECLARATIVE=y
+        BR2_PACKAGE_QT6DECLARATIVE_QUICK=y
+        BR2_PACKAGE_QT6SERIALPORT=y
+        BR2_PACKAGE_QT6SERIALBUS=y
+        BR2_PACKAGE_QT6SVG=y
+        BR2_PACKAGE_QT6BASE_DEFAULT_QPA="offscreen"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYSIDE6=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_pyside6.py"]
+    timeout = 30
+
+    def login(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-smp", "2",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
