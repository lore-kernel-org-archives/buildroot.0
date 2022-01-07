Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55277C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FDE54049E;
	Fri,  7 Jan 2022 17:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQZxu7M8fozQ; Fri,  7 Jan 2022 17:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A84A404B5;
	Fri,  7 Jan 2022 17:14:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CCF01BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94F44404B5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HeTGq8iftXhq for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:13:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51F4540192
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:13:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6E9C0C0005;
 Fri,  7 Jan 2022 17:13:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri,  7 Jan 2022 18:13:17 +0100
Message-Id: <20220107171318.1423075-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/7] DO-NOT-APPLY package/python-cryptography:
 bump version to 36.0.1
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
 Asaf Kahlon <asafka7@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version bump requires significant changes because
python-cryptography is now partially implemented in Rust.

This means that:

 - The C++ dependency is no longer needed.

 - We need to ensure we are on an architecture where Rust is
   available (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS)

 - Almost all Python dependencies are no longer relevant, except for
   the python-cffi.

 - A number of magic environment variables are needed to make the Rust
   part build correctly (CARGO_BUILD_TARGET, PYO3_CROSS_LIB_DIR,
   CARGO_HOME)

 - We need to invoke the "cargo" download post-process hook to vendor
   the Cargo dependencies at download time.

 - We need to propagate to relatively significant reverse dependency
   tree the changes of dependencies on python-cryptography.

DO-NOT-APPLY: this commit is currently broken when host arch == target
arch.

Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-compose/Config.in                   |  8 +++++---
 package/python-autobahn/Config.in                  |  6 +-----
 package/python-channels-redis/Config.in            |  7 ++-----
 package/python-channels/Config.in                  |  7 ++-----
 package/python-crossbar/Config.in                  |  6 +-----
 package/python-cryptography/Config.in              | 14 ++------------
 .../python-cryptography/python-cryptography.hash   |  5 ++---
 package/python-cryptography/python-cryptography.mk | 14 +++++++++++---
 package/python-daphne/Config.in                    |  7 ++-----
 package/python-keyring/Config.in                   |  7 ++-----
 package/python-opcua-asyncio/Config.in             |  1 +
 package/python-paramiko/Config.in                  |  8 ++------
 package/python-pyopenssl/Config.in                 |  8 ++------
 package/python-secretstorage/Config.in             |  6 +-----
 package/python-service-identity/Config.in          | 10 ++++------
 package/python-treq/Config.in                      | 10 ++++------
 package/python-twisted/Config.in                   |  6 ++----
 package/python-txdbus/Config.in                    |  5 ++++-
 package/python-txtorcon/Config.in                  |  7 ++-----
 19 files changed, 52 insertions(+), 90 deletions(-)

diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 8e16b60521..761befea4d 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	depends on !BR2_STATIC_LIBS # python
-	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko -> python-cryptography
+	# python-paramiko -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
@@ -23,7 +24,8 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 
 	  https://www.docker.com/
 
-comment "docker-compose needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "docker-compose needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+		BR2_STATIC_LIBS
diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index f719dcc8f1..92ddad0ea4 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
@@ -11,7 +11,3 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
-
-comment "python-autobahn needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
index 8946670180..bab801d2a9 100644
--- a/package/python-channels-redis/Config.in
+++ b/package/python-channels-redis/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	bool "python-channels-redis"
-	depends on BR2_INSTALL_LIBSTDCPP # python-channels -> python-daphne
+	# python-channels -> python-daphne -> python-autobahn -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3 # python-channels
 	select BR2_PACKAGE_PYTHON_AIOREDIS # runtime
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
@@ -12,7 +13,3 @@ config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	  sharded configurations, as well as group support.
 
 	  http://github.com/django/channels_redis/
-
-comment "python-channels-redis needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-channels/Config.in b/package/python-channels/Config.in
index 5c70f20d1c..6cd6e5f60d 100644
--- a/package/python-channels/Config.in
+++ b/package/python-channels/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CHANNELS
 	bool "python-channels"
-	depends on BR2_INSTALL_LIBSTDCPP # python-daphne -> python-autobahn -> python-cryptography
+	# python-daphne -> python-autobahn -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3 # python-daphne
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_DAPHNE # runtime
@@ -14,7 +15,3 @@ config BR2_PACKAGE_PYTHON_CHANNELS
 	  own protocols and needs.
 
 	  http://github.com/django/channels
-
-comment "python-channels needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 50b70b8e02..b72d64c19d 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_ATTRS
@@ -48,7 +48,3 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	  components that can talk in real-time with each other.
 
 	  https://pypi.python.org/pypi/crossbar
-
-comment "python-crossbar needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index da4252d6da..07a22bf846 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -1,21 +1,11 @@
 config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
-	depends on BR2_PACKAGE_PYTHON3 # python-idna
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
 	  primitives and recipes to Python developers.
 
 	  https://cryptography.io
-
-comment "python-cryptography needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 7cb38c8d3d..1219fa9b5f 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,6 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5  e2ce2ec8a63965fad351f36ed70fde4b  cryptography-3.3.2.tar.gz
-sha256  5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed  cryptography-3.3.2.tar.gz
+# Locally calculated after vendoring
+sha256  196bba703cebc052a19f5353614fcfa9d680471990c10305f110adcc05744eeb  cryptography-36.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 9c00efb44f..d302f87405 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,14 +4,22 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 3.3.2
+PYTHON_CRYPTOGRAPHY_VERSION = 36.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/f9/4b/1cf8e281f7ae4046a59e5e39dd7471d46db9f61bb564fddbff9084c4334f
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-setuptools-rust host-python-cffi host-rustc
+PYTHON_CRYPTOGRAPHY_ENV = CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)" \
+	CARGO_HOME="$(HOST_DIR)/share/cargo"
+# We need to vendor the Cargo crates at download time
+PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_CRYPTOGRAPHY_DL_ENV = \
+	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
 
 $(eval $(python-package))
diff --git a/package/python-daphne/Config.in b/package/python-daphne/Config.in
index 601b2e1db8..c4479417e9 100644
--- a/package/python-daphne/Config.in
+++ b/package/python-daphne/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_DAPHNE
 	bool "python-daphne"
-	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn -> python-cryptography
+	# python-autobahn -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
@@ -14,7 +15,3 @@ config BR2_PACKAGE_PYTHON_DAPHNE
 	  versus HTTP endpoints.
 
 	  https://github.com/django/daphne
-
-comment "python-daphne needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index f7bb1ae820..61cb98952f 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_KEYRING
 	bool "python-keyring"
+	# python-secretstorage -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_INSTALL_LIBSTDCPP # python-secretstorage
 	select BR2_PACKAGE_PYTHON_ENTRYPOINTS # runtime
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
@@ -9,7 +10,3 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	  system keyring service from Python.
 
 	  https://pypi.python.org/pypi/keyring
-
-comment "python-keyring needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
index 3700e00e1d..95715fdd08 100644
--- a/package/python-opcua-asyncio/Config.in
+++ b/package/python-opcua-asyncio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	bool "python-opcua-asyncio"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_AIOFILES # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index 4b8495d76d..e44237b0c2 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
-	depends on BR2_PACKAGE_PYTHON3 # python-bcrypt
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_PYTHON3 # python-bcrypt, python-cryptography
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
@@ -10,7 +10,3 @@ config BR2_PACKAGE_PYTHON_PARAMIKO
 	  SSH2 protocol library.
 
 	  https://github.com/paramiko/paramiko/
-
-comment "python-paramiko needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
index 99ea4e9408..65d516813f 100644
--- a/package/python-pyopenssl/Config.in
+++ b/package/python-pyopenssl/Config.in
@@ -1,14 +1,10 @@
 config BR2_PACKAGE_PYTHON_PYOPENSSL
 	bool "python-pyopenssl"
-	depends on BR2_PACKAGE_PYTHON3 # python-cryptography -> python-idna
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_PYTHON3 # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python wrapper module around the OpenSSL library.
 
 	  https://github.com/pyca/pyopenssl
-
-comment "python-pyopenssl needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-secretstorage/Config.in b/package/python-secretstorage/Config.in
index 8ae8c2d598..059ea097bb 100644
--- a/package/python-secretstorage/Config.in
+++ b/package/python-secretstorage/Config.in
@@ -1,13 +1,9 @@
 config BR2_PACKAGE_PYTHON_SECRETSTORAGE
 	bool "python-secretstorage"
 	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	help
 	  Python bindings to FreeDesktop.org Secret Service API.
 
 	  https://github.com/mitya57/secretstorage
-
-comment "python-secretstorage needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index ab012347dc..c571065e92 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
-	depends on BR2_PACKAGE_PYTHON3 # python-pyopenssl -> python-cryptography -> python-idna
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
+	# python-pyopenssl -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# python-pyopenssl -> python-cryptography
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
@@ -11,7 +13,3 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	  Service identity verification for pyOpenSSL.
 
 	  https://pypi.python.org/pypi/service_identity
-
-comment "python-service-identify needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 02c26a53f7..6e54c19e16 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
-	depends on BR2_PACKAGE_PYTHON3 # python-idna
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
+	# python-pyopenssl -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# python-idna, python-pyopenssl -> python-cryptography
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
@@ -16,7 +18,3 @@ config BR2_PACKAGE_PYTHON_TREQ
 	  API for making HTTP requests when using Twisted.
 
 	  https://github.com/twisted/treq
-
-comment "python-treq needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 29536ecf9d..89298b2e0c 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -23,12 +23,10 @@ config BR2_PACKAGE_PYTHON_TWISTED_HTTP2
 
 config BR2_PACKAGE_PYTHON_TWISTED_TLS
 	bool "TLS support"
-	depends on BR2_INSTALL_LIBSTDCPP # python-{pyopenssl,service-identity}
+	# python-{pyopenssl,service-identity}
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 
-comment "TLS support needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 endif
diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
index c7de322f91..ffd00f153e 100644
--- a/package/python-txdbus/Config.in
+++ b/package/python-txdbus/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_PYTHON_TXDBUS
 	bool "python-txdbus"
-	depends on BR2_PACKAGE_PYTHON3 # python-twisted -> python-cryptography -> python-idna
+	# python-twisted -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# python-twisted -> python-cryptography
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index e8a1a233db..0606e5f442 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_TXTORCON
 	bool "python-txtorcon"
+	# python-pyopenssl -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3 # python-idna
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-service-identity
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
@@ -14,7 +15,3 @@ config BR2_PACKAGE_PYTHON_TXTORCON
 	  configuration abstractions.
 
 	  https://github.com/meejah/txtorcon
-
-comment "python-txtorcon needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
