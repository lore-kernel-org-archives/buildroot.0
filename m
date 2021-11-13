Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BE6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 20:52:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C0E60EBC
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 20:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45C0E60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF37880E11;
	Sat, 13 Nov 2021 20:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSX088me9nSe; Sat, 13 Nov 2021 20:52:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D536F80DFD;
	Sat, 13 Nov 2021 20:52:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFF0D1BF859
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 20:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD49280DFD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 20:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWwDrTkukYfc for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 20:52:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D9F280DF3
 for <buildroot@busybox.net>; Sat, 13 Nov 2021 20:52:23 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so9328069wmz.2
 for <buildroot@busybox.net>; Sat, 13 Nov 2021 12:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FB8u1Hgd1Z5jPQwhpXgNW72IA/DZPgmFdMSKZFJgLlA=;
 b=BqHqXMdWdlS7n9tTDv2gGlmm1Kox/0YnQyD+JLBZ/2SXgAXMVGuuTZSAXvHiHVrYwd
 z7R73aE1vxflWkXp3ICUpzKQenQJwYV73tcHwhKgeFSmw1oq69hta2RFDBgBEx0XV06O
 Ih9bpWT/fZwrmZubVAIkFg97QB8aZAPb6aK+Pc5FxiBv9qrBSCwJGD2uphkCJcAW/L6J
 GTis9ihosZOVu1vCwmajO0BG1rwMEYFWnfX2f0QIvFhCOwCKmIf+d52oAmsfKhxiuyim
 Rg1d2/Q2ql/t4OvXiVqzFdxJRH7jgUXxMQU02d169kz8/puMbfFzl0ztAAk7KFQCkgi6
 ewDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FB8u1Hgd1Z5jPQwhpXgNW72IA/DZPgmFdMSKZFJgLlA=;
 b=bYdCTBUYAq5YCLUhsLHsx5qsu1WzVnv3iskRBYQUw84wDwJFY3J7yvGeyMPs5Fc3qa
 HrSupucVIOolFRoENBK7SR84KhktcMsounKvGEGCWc47/GR4cO22bFT5e1Dgo+sBRrxN
 hE47q8dr3HJNMW2aPFySy3sxhni6xZAW8QpGybLONe1PFUDSf/bHM/hKPKGoBH0DT7su
 23J7MOKDv/EFAr1aeGsWyOnrKqPFWjw0rb5KDZ+2YDFy9zVSyd7G4tgqQbyGnS6T8rix
 sfAyC1CL6dBT5lwxzEk6B2voQJeJUkzmJwpe1by/1j+D8NdwMe7V+gHx8fCEwmyS9d7r
 /SrQ==
X-Gm-Message-State: AOAM530pQmTnn9VzKXD2EWif1fMNBW3NHrQ9Ch2zIfamyT7Qq/r/yp1u
 dtFGSR9S+xJ+eEwkCsIx/Gv6uZ4SV7yStg==
X-Google-Smtp-Source: ABdhPJy1jw8XDPtkeJsL5Zq7Ta+7dCHS4U/FDhDd0MRJE2Q9CL2T72B6k3fghw++cWeBAwGpxToJOQ==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr45463194wmb.183.1636836741128; 
 Sat, 13 Nov 2021 12:52:21 -0800 (PST)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id n8sm9288940wrp.95.2021.11.13.12.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 12:52:20 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Sat, 13 Nov 2021 21:51:58 +0100
Message-Id: <20211113205158.26875-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next] pybind11: new package
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

fixes http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
fixes http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
fixes http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
fixes http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69
list goes on..

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
