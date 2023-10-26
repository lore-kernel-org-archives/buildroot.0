Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF45C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 924E241866;
	Thu, 26 Oct 2023 09:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 924E241866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjI1vcpani2m; Thu, 26 Oct 2023 09:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E81A841855;
	Thu, 26 Oct 2023 09:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E81A841855
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3C61BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67D8B839B4
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D8B839B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMzg-mmefo_f for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:35 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8229A8399E
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8229A8399E
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso102676166b.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312453; x=1698917253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oR6I7AX+5Zy9n/BTV4B2MKeh2UQGS+5KaDqTyfBa2/0=;
 b=Nd08lhJ6Dl1CEBIKZ6rRYPhCNaZxS73Cn2Q39fN5XICGaKGYHzGMeiiZ+lJxJNmuLE
 n3QyI4uTYvEPF2I5f7gVhdm846tGFTLVj5TvnhL4PULN1dID1M7mVZeJuieiwgm+deNm
 KYsMbZd33tkHGcEc2EguioJGny7ra7nbVqTaZP0LtHTFtYpKO/yt1F59m0K4GRppoWKA
 z7WASqA/OQI3xmeBXzEeovhpE9gaVk7ipGw7+afZ9u79yfznSCHFx8oWiLXGrPoBTfmu
 0LrXGOKC+MLUv+XO2qznaZ+olGiLpkVxwJD2arzmYO/2gDVaGJ/0j8QVL3HgG0NHZN+N
 NuLA==
X-Gm-Message-State: AOJu0Yw3Jn3nFRW4QaNpoJzdmEnHGmG51qihTKWGru5emqp3vaDwg4cQ
 uXpsbzqaKwbePWJr78F7MlI1bBiaCsqtUa+3EWkEthn3i5BxTDrC
X-Google-Smtp-Source: AGHT+IFDDwoenyQdvsupPnuKNxaVX49AlgVqkXXg8aOW8BrVi4CJp3qGf+ftp8muU8UpnypyMKxWuQ==
X-Received: by 2002:a17:907:728b:b0:9ae:6355:5ef4 with SMTP id
 dt11-20020a170907728b00b009ae63555ef4mr14747116ejc.3.1698312453361; 
 Thu, 26 Oct 2023 02:27:33 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:27:00 +0200
Message-ID: <20231026092701.12345-30-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312453; x=1698917253;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oR6I7AX+5Zy9n/BTV4B2MKeh2UQGS+5KaDqTyfBa2/0=;
 b=JHwxvj/8Lz08PFd5xF1Jfy8En4DwiBjwlmV+RdioZa7QmGBJV37EDkRPLi1Z5p5QpP
 Sbxh1T5YdTEByT7XR5dDS3Ff097HN8Swj3L+ByFl8d6VrNqIbeDQ8mwhlnT7OMSg2/K1
 Fr3IO/ip0D9rT7dl5D9fvcEfZ4iMKvEBMn5EU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JHwxvj/8
Subject: [Buildroot] [PATCH 29/30] package/python-crossbar: drop package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-crossbar has been removed. The current package has not recieved an
update since Sat Oct 9 2021 33ece2446e25e20929d1c7eefa9f3244a3b79a92 and is not
python 3.12.0 compatible.

Furthermore, the current version requires at least 42 new packages worth of
depedencies of which several require patches to be python 3.12.0 compatible.
As nobody has stepped up to maintain the package and its ever-growing list of
dependencies, along with the other problems, it is time to drop the package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in.legacy                              | 16 ++++
 package/Config.in                             |  1 -
 .../0001-Avoid-intentional-syntax-error.patch | 29 --------
 ...s-min.txt-drop-indirect-dependencies.patch | 74 -------------------
 ...ice-wap-use-markupsafe-instead-of-we.patch | 53 -------------
 package/python-crossbar/Config.in             | 71 ------------------
 package/python-crossbar/python-crossbar.hash  |  5 --
 package/python-crossbar/python-crossbar.mk    | 14 ----
 .../tests/package/sample_python_crossbar.py   |  4 -
 .../tests/package/test_python_crossbar.py     | 23 ------
 10 files changed, 16 insertions(+), 274 deletions(-)
 delete mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
 delete mode 100644 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
 delete mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
 delete mode 100644 package/python-crossbar/Config.in
 delete mode 100644 package/python-crossbar/python-crossbar.hash
 delete mode 100644 package/python-crossbar/python-crossbar.mk
 delete mode 100644 support/testing/tests/package/sample_python_crossbar.py
 delete mode 100644 support/testing/tests/package/test_python_crossbar.py

diff --git a/Config.in.legacy b/Config.in.legacy
index f1d5f345c3..607e0486c9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,22 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_PYTHON_CROSSBAR
+	bool "python-crossbar removed"
+	select BR2_LEGACY
+	help
+	  python-crossbar has been removed. The current package has
+	  not recieved an update since Sat Oct 9 13:55:06 2021
+	  commit: 33ece2446e25e20929d1c7eefa9f3244a3b79a92
+	  and is not python 3.12.0 compatible.
+
+	  Furthermore, the current version requires at least 42 new
+	  packages worth of depedencies of which several require
+	  patches to be python 3.12.0 compatible. As nobody has
+	  stepped up to maintain the package and its ever-growing
+	  list of dependencies, along with the other problems, it
+	  is time to drop the package.
+
 config BR2_PACKAGE_PYTHON_PYXB
 	bool "python-pyxb removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d756094c4b..b7ae35bd89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1034,7 +1034,6 @@ menu "External python modules"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
 	source "package/python-crontab/Config.in"
-	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-cssselect2/Config.in"
diff --git a/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch b/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
deleted file mode 100644
index 0ff7cae21a..0000000000
--- a/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 423a1b081f6b7198f6a921ca83043270ebbace1a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 1 May 2016 15:35:32 +0200
-Subject: [PATCH] Avoid intentional syntax error
-
-This file has an intentional syntax error, meant to validate QA, but
-it breaks byte compilation of this package.
-
-Issue reported upstream:
-https://github.com/crossbario/crossbar/issues/750.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- crossbar/worker/test/examples/syntaxerror.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/crossbar/worker/test/examples/syntaxerror.py b/crossbar/worker/test/examples/syntaxerror.py
-index 7b88e088..cd7de901 100644
---- a/crossbar/worker/test/examples/syntaxerror.py
-+++ b/crossbar/worker/test/examples/syntaxerror.py
-@@ -27,5 +27,3 @@
- #  with this program. If not, see <http://www.gnu.org/licenses/agpl-3.0.en.html>.
- #
- #####################################################################################
--
--class # noqa
--- 
-2.20.1
-
diff --git a/package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch b/package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
deleted file mode 100644
index 12027d779c..0000000000
--- a/package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 3ae2b36e48fc0f75f0bb6c89f893ece033bccd87 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 7 Aug 2022 18:44:29 +0200
-Subject: [PATCH] requirements-min.txt: drop indirect dependencies
-
-For some interesting reason, the crossbar maintainers have decided to
-include indirect dependencies in their requirements-min.txt, i.e
-dependencies that they don't use directly, but that packages they
-depend on themselves depend on.
-
-This makes the packaging in Buildroot confusing, as it means not all
-dependencies in requirements-min.txt should be taken into
-account. Also some of these indirect dependencies cause issues due to
-upper bounds set on the version (which is the case for idna and
-urllib3).
-
-This patch therefore clarifies the situation by removing such indirect
-dependencies from requirements-min.txt. As the patch is obviously not
-upstreamable, it will require some maintenance effort, but that effort
-is anyway already there to sort out direct dependencies from indirect
-dependencies when updating the Buildroot packaging for crossbar.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- requirements-min.txt | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/requirements-min.txt b/requirements-min.txt
-index 5ac4e0ee..cdd82d27 100644
---- a/requirements-min.txt
-+++ b/requirements-min.txt
-@@ -1,20 +1,13 @@
--attrs>=17.2.0
- autobahn[asyncio,twisted,encryption,compress,serialization,scram]>=21.3.1
- bitstring>=3.1.5
--bcrypt>=3.1.6
- cbor>=1.0.0
- click>=6.7
- colorama>=0.4.4
--constantly>=15.1.0
- cryptography>=2.6.1
--h2>=3.2.0
--idna<2.6,>=2.5
- importlib-resources>=4.1.1
--incremental>=17.5.0
- jinja2>=2.10.1
- lmdb>=0.92
- mistune>=0.7.4
--netaddr>=0.7.19
- passlib>=1.7.1
- priority>=1.3.0
- psutil>=5.2.2
-@@ -28,7 +21,6 @@ pyqrcode>=1.2.1
- pytrie>=0.3
- pyyaml>=4.2b4
- sdnotify>=0.3.1
--service_identity>=17.0.0
- setproctitle>=1.1.10
- setuptools>=36.2.7
- treq>=20.4.1
-@@ -37,10 +29,6 @@ twisted[tls,conch,http2,osx_platform]>=20.3.0; sys_platform == 'darwin'
- twisted[tls,conch,http2,windows_platform]>=20.3.0; sys_platform == 'win32'
- txaio>=21.2.1
- txtorcon>=20.0.0
--u-msgpack-python>=2.4.1
--# urllib3 is an indirect dependency, but we force a recent version because of https://nvd.nist.gov/vuln/detail/CVE-2019-11324
--# workaround for version conflict in requests vs sth else:
--urllib3<1.25,>=1.21.1
- vmprof>=0.4.12; platform_machine=='x86_64' or platform_machine=='i386' or platform_machine=='arm'
- watchdog>=0.8.3
- werkzeug>=0.14.1
--- 
-2.37.1
-
diff --git a/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
deleted file mode 100644
index ab2d4709bd..0000000000
--- a/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a6866509b0387ab6d6f99f68cd82bcac922fe839 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Mon, 30 May 2022 19:38:11 +0200
-Subject: [PATCH] crossbar/webservice/wap: use markupsafe instead of werkzeug
-
-wap.py use escape from werkzeug but it has been removed since
-the version 2.1.0 [1].
-
-Replace with escape from markupsafe like upstream commit [2]
-(wihout other changes).
-
-[1] https://github.com/pallets/werkzeug/commit/22d1e9ac13829b83347107a9b4d77072a8e1af6a
-[2] https://github.com/crossbario/crossbar/commit/ca8d383f01231e2b3f986e791f215f12f2deee5d
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- crossbar/webservice/wap.py | 7 ++++++-
- requirements-min.txt       | 1 +
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/crossbar/webservice/wap.py b/crossbar/webservice/wap.py
-index 825558b1..6daa9b21 100644
---- a/crossbar/webservice/wap.py
-+++ b/crossbar/webservice/wap.py
-@@ -36,7 +36,12 @@ from collections.abc import Mapping, Sequence
- 
- from werkzeug.routing import Map, Rule
- from werkzeug.exceptions import NotFound, MethodNotAllowed
--from werkzeug.utils import escape
-+
-+try:
-+    # removed in werkzeug 2.1.0
-+    from werkzeug.utils import escape
-+except ImportError:
-+    from markupsafe import escape
- 
- from jinja2 import Environment, FileSystemLoader
- from jinja2.sandbox import SandboxedEnvironment
-diff --git a/requirements-min.txt b/requirements-min.txt
-index cdd82d27..50cb1489 100644
---- a/requirements-min.txt
-+++ b/requirements-min.txt
-@@ -7,6 +7,7 @@ cryptography>=2.6.1
- importlib-resources>=4.1.1
- jinja2>=2.10.1
- lmdb>=0.92
-+MarkupSafe>=1.1.1
- mistune>=0.7.4
- passlib>=1.7.1
- priority>=1.3.0
--- 
-2.37.1
-
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
deleted file mode 100644
index aadcb2c360..0000000000
--- a/package/python-crossbar/Config.in
+++ /dev/null
@@ -1,71 +0,0 @@
-config BR2_PACKAGE_PYTHON_CROSSBAR
-	bool "python-crossbar"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn's compress and serialization
-	# All the following dependencies are runtime dependencies. It
-	# matches almost 1:1 the requirements-min.txt from crossbar
-	# with the following exceptions:
-	# - importlib-resources is in Python itself, so no external
-	#   module is needed
-	# - vmprof, while listed as a needed dependency, isn't
-	#   actually strictly necesary
-	# - wsaccel is not a direct dependency, it is there to make
-	#   sure autobahn has the 'accelerate' feature, when the
-	#   Python implementation is CPython, and our package does
-	#   enable autobahn[accelerate]
-	select BR2_PACKAGE_PYTHON_AUTOBAHN
-	select BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
-	select BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
-	select BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
-	select BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
-	select BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
-	select BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
-	select BR2_PACKAGE_PYTHON_BITSTRING
-	select BR2_PACKAGE_PYTHON_CBOR
-	select BR2_PACKAGE_PYTHON_CLICK
-	select BR2_PACKAGE_PYTHON_COLORAMA
-	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
-	select BR2_PACKAGE_PYTHON_JINJA2
-	select BR2_PACKAGE_PYTHON_LMDB
-	select BR2_PACKAGE_PYTHON_MARKUPSAFE
-	select BR2_PACKAGE_PYTHON_MISTUNE
-	select BR2_PACKAGE_PYTHON_PASSLIB
-	select BR2_PACKAGE_PYTHON_PRIORITY
-	select BR2_PACKAGE_PYTHON_PSUTIL
-	select BR2_PACKAGE_PYTHON_PYASN1
-	select BR2_PACKAGE_PYTHON_PYASN1_MODULES
-	select BR2_PACKAGE_PYTHON_PYGMENTS
-	select BR2_PACKAGE_PYTHON_PYNACL
-	select BR2_PACKAGE_PYTHON_PYOPENSSL
-	select BR2_PACKAGE_PYTHON_PYQRCODE
-	select BR2_PACKAGE_PYTHON_PYTRIE
-	select BR2_PACKAGE_PYTHON_PYYAML
-	select BR2_PACKAGE_PYTHON_SDNOTIFY
-	select BR2_PACKAGE_PYTHON_SETPROCTITLE
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS
-	select BR2_PACKAGE_PYTHON_TREQ
-	select BR2_PACKAGE_PYTHON_TWISTED
-	select BR2_PACKAGE_PYTHON_TWISTED_CONCH
-	select BR2_PACKAGE_PYTHON_TWISTED_HTTP2
-	select BR2_PACKAGE_PYTHON_TWISTED_TLS
-	select BR2_PACKAGE_PYTHON_TXAIO
-	select BR2_PACKAGE_PYTHON_TXTORCON
-	select BR2_PACKAGE_PYTHON_UBJSON
-	select BR2_PACKAGE_PYTHON_WATCHDOG
-	select BR2_PACKAGE_PYTHON_WERKZEUG
-	select BR2_PACKAGE_PYTHON_ZLMDB
-	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
-	help
-	  Crossbar.io is an open-source WAMP application router that
-	  allows to build advanced applications from loosely-coupled
-	  components that can talk in real-time with each other.
-
-	  https://pypi.python.org/pypi/crossbar
-
-comment "python-crossbar needs a glibc or musl toolchain w/ C++"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
deleted file mode 100644
index 4441578a29..0000000000
--- a/package/python-crossbar/python-crossbar.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5  df576100bcf6e423cdc1e2e96b602140  crossbar-21.3.1.tar.gz
-sha256  ac71959f0c57ab08d43f7830b85c6312e000b25543a179cd751ac357944dd7ef  crossbar-21.3.1.tar.gz
-# Locally computed
-sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  crossbar/LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
deleted file mode 100644
index aae61cd2e8..0000000000
--- a/package/python-crossbar/python-crossbar.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-crossbar
-#
-################################################################################
-
-PYTHON_CROSSBAR_VERSION = 21.3.1
-PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/17/37/aafc4ec30068fd7ebb97f1a00d4ddf8de482dfa4c1d2a1fc6bb814d91400
-PYTHON_CROSSBAR_LICENSE = AGPL-3.0
-PYTHON_CROSSBAR_LICENSE_FILES = crossbar/LICENSE
-PYTHON_CROSSBAR_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_crossbar.py b/support/testing/tests/package/sample_python_crossbar.py
deleted file mode 100644
index 8160a37219..0000000000
--- a/support/testing/tests/package/sample_python_crossbar.py
+++ /dev/null
@@ -1,4 +0,0 @@
-import os
-import crossbar
-
-crossbar.run(["version"])
diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
deleted file mode 100644
index e67ab9ff6e..0000000000
--- a/support/testing/tests/package/test_python_crossbar.py
+++ /dev/null
@@ -1,23 +0,0 @@
-from tests.package.test_python import TestPythonPackageBase
-import os
-
-
-class TestPythonPy3Crossbar(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_CROSSBAR=y
-        BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-        """
-    sample_scripts = ["tests/package/sample_python_crossbar.py"]
-    timeout = 60
-
-    def login(self):
-        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-drive", "file=%s,if=scsi,format=raw" % ext2_file],
-                           kernel_cmdline=["rootwait", "root=/dev/sda"])
-        self.emulator.login()
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
