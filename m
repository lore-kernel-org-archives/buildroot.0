Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BFAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 11:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C0540295;
	Sun, 28 Nov 2021 11:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWGInpjDbeCy; Sun, 28 Nov 2021 11:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3446B410B9;
	Sun, 28 Nov 2021 11:56:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8320F1BF2B8
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 11:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8066B83139
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 11:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ww2buEhacP21 for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 11:56:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F44583133
 for <buildroot@busybox.net>; Sun, 28 Nov 2021 11:56:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j3so30127468wrp.1
 for <buildroot@busybox.net>; Sun, 28 Nov 2021 03:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UlRs7Y1CQgF5/ZjgqxETnXCSMIEXvyt6XmIZ8bQaVhU=;
 b=WGSXQ58/Hba0Zgphk2WPKI0xT5MLkJYrXfkb5DvN9rxFcOSqGF4VazAHcvAHgGxFfx
 BVugI+N3jJwneZVLL0bd6yI9dhsXeWE2XQSxzbuB9RNKTwFUQ5H9pip7dHEw63qRtXJo
 oGZVM+C513U1QWMs61aenH2WjzvtnttaAKaOJHv08MtOqvpG0mdUEFqbXuxOf2qc2D6T
 NqfVCBUUZAMUvQi4P3nKVuxZVTUkxUunwuS2UaIbWk4gAWKim5S/l2jmcukKIs54ngtJ
 tWI3ZL5KZoz3qtv0zRmUsprTybwiEXCeJM0WojVC2Abj8r3XwvTD+hGO9ds/LHMcL3dV
 P9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UlRs7Y1CQgF5/ZjgqxETnXCSMIEXvyt6XmIZ8bQaVhU=;
 b=BbLfLXFj2+Z1+Tc2dQOm6R+YQzhF12sKeqQgjz/WSKipxR+vzn4D69PYU4c7RZM65j
 LfWBbeyJdWPDQ6z6MC4I1bGskpZuBaqLgndhrhk31Q2q8Stz2oP/yxx/6up6TaHQJ2F1
 X31e75227M4Ude//JVridxaI3aHsxrBy02XBIuOhD0mqQWE3h4OQ83RczPsBlABHypHZ
 B6KovkkUhO8KJauW3T8JBnsGiHUV2dRoGrF7gajS6M6cA9UED0lqG/t6zjSH/9OyZnRv
 /8BisHDWemuLVXTqdgkc2iwNlj5aWeYFZKuUhY7Z6cR1ZGU6JojTgvDuxZNLDNqVoooR
 Ha4A==
X-Gm-Message-State: AOAM530f9yvFf6YBGoLMcd9LrhW+xeTWUgOT0C+JwNFEIL1QqTA8LDIB
 YjrWe76Fa/TqI0tKV56sDlx4Zu6xgK0=
X-Google-Smtp-Source: ABdhPJy8llBRs7qLoHBlEtm6qRv0IeDckebKmxSzLK8w17b+nHwoeLcQsHIDQaVspPr8bwE1wW4Pbw==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr25711684wrw.486.1638100567187; 
 Sun, 28 Nov 2021 03:56:07 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id p14sm15516425wms.29.2021.11.28.03.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 03:56:06 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Sun, 28 Nov 2021 12:56:01 +0100
Message-Id: <20211128115601.20458-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [RESEND PATCH/next] pybind11: new package
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
Cc: thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr, asafka7@gmail.com,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

fixes http://autobuild.buildroot.net/results/79677cd758a79f4ffc4663a2f6ade7107da3aa53
fixes http://autobuild.buildroot.net/results/b74e4676daf51c7aa80116040a74bb8608d148b4
fixes http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
fixes http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
fixes http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
fixes http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69
fixes https://release-monitoring.org/project/13384
list goes on..

PyBind11 is a lightweight header-only library that exposes C++
types in Python and vice versa.
http://pybind11.readthedocs.org/en/master

---
python-pybind was not the right approach and is in failure since
it's been upgraded to V2.6.1.

Building with setup.py now requires a cmake build first.
With this new approach we can build the package with cmake 
for python bindings in C++ AND we also have the 
C++ bindings in python as an option (depending & requiring the first one).

I make this a host-only package, in the sense that other packages will
require it at build time, and I don't forsee any reasons to have
such a package as a target package.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                               |  2 +-
 package/Config.in                        |  2 +-
 package/pybind11/Config.in               | 25 ++++++++++++++
 package/pybind11/pybind11.hash           |  3 ++
 package/pybind11/pybind11.mk             | 42 ++++++++++++++++++++++++
 package/python-pybind/Config.in          |  8 -----
 package/python-pybind/python-pybind.hash |  4 ---
 package/python-pybind/python-pybind.mk   | 13 --------
 8 files changed, 72 insertions(+), 27 deletions(-)
 create mode 100644 package/pybind11/Config.in
 create mode 100644 package/pybind11/pybind11.hash
 create mode 100644 package/pybind11/pybind11.mk
 delete mode 100644 package/python-pybind/Config.in
 delete mode 100644 package/python-pybind/python-pybind.hash
 delete mode 100644 package/python-pybind/python-pybind.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f812eb564..e5e6d0f538 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1104,7 +1104,7 @@ F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
-F:	package/python-pybind/
+F:	package/pybind11/
 F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
diff --git a/package/Config.in b/package/Config.in
index e355ab1987..7d36c22d0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1132,7 +1132,6 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
-	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
@@ -2005,6 +2004,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/pybind11/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/riemann-c-client/Config.in"
diff --git a/package/pybind11/Config.in b/package/pybind11/Config.in
new file mode 100644
index 0000000000..cc3d481ccc
--- /dev/null
+++ b/package/pybind11/Config.in
@@ -0,0 +1,25 @@
+comment "pybind11 needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_PYBIND11
+	bool "pybind11"
+	depends on BR2_USE_WCHAR # boost
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST
+	help
+	  Pybind11 is a lightweight header-only library that exposes C++
+	  types in Python and vice versa, mainly to create Python
+	  bindings of existing C++ code.
+
+	  http://pybind11.readthedocs.org/en/master
+
+if BR2_PACKAGE_PYBIND11
+
+config BR2_PACKAGE_PYBIND11_WITH_PYTHON
+	bool "pybind11-python"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Activate support for python-pybind
+
+endif
diff --git a/package/pybind11/pybind11.hash b/package/pybind11/pybind11.hash
new file mode 100644
index 0000000000..ab8825bf04
--- /dev/null
+++ b/package/pybind11/pybind11.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f1bcc07caa568eb312411dde5308b1e250bd0e1bc020fae855bf9f43209940cc  pybind11-2.8.1.tar.gz
+sha256 83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/pybind11/pybind11.mk b/package/pybind11/pybind11.mk
new file mode 100644
index 0000000000..3c7856b82d
--- /dev/null
+++ b/package/pybind11/pybind11.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# pybind11
+#
+################################################################################
+
+PYBIND11_VERSION = 2.8.1
+PYBIND11_SITE = $(call github,pybind,pybind11,v$(PYBIND11_VERSION))
+PYBIND11_LICENSE = BSD-3-Clause
+PYBIND11_LICENSE_FILES = LICENSE
+PYBIND11_INSTALL_STAGING = YES
+PYBIND11_SUPPORTS_IN_SOURCE_BUILD = YES
+
+HOST_PYBIND11_CONF_OPTS = \
+	-DBUILD_DOCS=OFF \
+	-DDOWNLOAD_EIGEN=OFF \
+	-DPYTHON=$(TARGET_DIR)/usr/bin/python \
+	-DPYTHON_PREFIX=$(STAGING_DIR)/usr
+
+# pybind11-python support activation
+# this requires the cmake build installed within $(@D)
+ifeq ($(BR2_PACKAGE_PYBIND11_WITH_PYTHON),y)
+
+HOST_PYBIND11_DEPENDENCIES += host-python3
+
+HOST_PYBIND11_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(@D)/pybind11
+
+define PYBIND11_PYTHON_BUILD
+	cd $(@D) && $(HOST_DIR)/bin/python setup.py install
+endef
+
+HOST_PYBIND11_POST_INSTALL_HOOKS += PYBIND11_PYTHON_BUILD
+
+else
+
+HOST_PYBIND11_CONF_OPTS += \
+	-DPYBIND_FINDPYTHON=OFF \
+	-DPYBIND11_NOPYTHON=ON
+
+endif
+
+$(eval $(host-cmake-package))
diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
deleted file mode 100644
index 604cb9ee67..0000000000
--- a/package/python-pybind/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYBIND
-	bool "python-pybind"
-	help
-	  PyBind is a lightweight header-only library that exposes C++
-	  types in Python and vice versa, mainly to create Python
-	  bindings of existing C++ code.
-
-	  http://pybind11.readthedocs.org/en/master
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
deleted file mode 100644
index a68ac846e2..0000000000
--- a/package/python-pybind/python-pybind.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
-# License files, locally calculated
-sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
deleted file mode 100644
index a6a1bdb976..0000000000
--- a/package/python-pybind/python-pybind.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# python-pybind
-#
-################################################################################
-
-PYTHON_PYBIND_VERSION = 2.6.1
-PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
-PYTHON_PYBIND_LICENSE = BSD-3-Clause
-PYTHON_PYBIND_LICENSE_FILES = LICENSE
-PYTHON_PYBIND_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
