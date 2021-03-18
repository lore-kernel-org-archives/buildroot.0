From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 17 Mar 2021 22:42:53 -0600
Subject: [Buildroot] [PATCH v3 2/2] package/python-cryptography: bump to
 version 3.4.6
In-Reply-To: <20210318044253.3202355-1-james.hilliard1@gmail.com>
References: <20210318044253.3202355-1-james.hilliard1@gmail.com>
Message-ID: <20210318044253.3202355-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python 2 is no longer supported, a rust toolchain is also
now a direct compile time requirement for cryptography.

Drop all dependencies that are no longer needed to build
cryptography.

Propagate the new rust toolchain and python 3 requirement
to all packages that depend on python-cryptography.

Drop the C++ toolchain dependency for packages in which
that dependency was only needed for python-cryptography.

Drop python 2 dependencies for packages that depend
on python-cryptography.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/docker-compose/Config.in              | 13 +++++--------
 package/python-autobahn/Config.in             |  6 +++---
 package/python-crossbar/Config.in             |  6 +++---
 package/python-cryptography/Config.in         | 19 +++++--------------
 .../python-cryptography.hash                  |  6 +++---
 .../python-cryptography.mk                    |  9 ++++++---
 package/python-keyring/Config.in              |  7 ++++---
 package/python-opcua-asyncio/Config.in        |  5 +++++
 package/python-paramiko/Config.in             |  8 +++++---
 package/python-pyopenssl/Config.in            |  8 +++++---
 package/python-pysftp/Config.in               |  6 ++++++
 package/python-secretstorage/Config.in        |  7 ++++---
 package/python-service-identity/Config.in     |  9 +++++----
 package/python-treq/Config.in                 |  8 +++++---
 package/python-twisted/Config.in              |  8 +++++---
 package/python-txtorcon/Config.in             |  9 +++++----
 16 files changed, 74 insertions(+), 60 deletions(-)

diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 74af8e03d5..6751974c4c 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -4,12 +4,9 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	depends on !BR2_STATIC_LIBS # python
-	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko -> python-cryptography
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
-	       if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko -> python-cryptography
+	depends on !BR2_PACKAGE_PYTHON # python-paramiko -> python-cryptography
+	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
@@ -26,7 +23,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 
 	  https://www.docker.com/
 
-comment "docker-compose needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "docker-compose needs a toolchain w/ rust, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+		BR2_STATIC_LIBS || !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 78b16897bc..f55e14e284 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
@@ -10,6 +10,6 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 
 	  https://pypi.python.org/pypi/autobahn
 
-comment "python-autobahn needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-autobahn needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 50b70b8e02..a2ae4e7b95 100644
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
@@ -49,6 +49,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 	  https://pypi.python.org/pypi/crossbar
 
-comment "python-crossbar needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-crossbar needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index d1c2917ea9..9246debdf8 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -1,24 +1,15 @@
 config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
 	  primitives and recipes to Python developers.
 
 	  https://cryptography.io
 
-comment "python-cryptography needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-cryptography needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index c6768ff21a..b047416736 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5  163608a7cb838c6b39360e1e64377d54  cryptography-3.0.tar.gz
-sha256  8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053  cryptography-3.0.tar.gz
+md5  498e716708a5d36ff4593c71d7bef364  cryptography-3.4.6.tar.gz
+sha256  2d32223e5b0ee02943f32b19245b61a62db83a882f0e76cc564e1cec60d48f87  cryptography-3.4.6.tar.gz
 # Locally computed sha256 checksums
-sha256  35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
+sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
 sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 6eb7be8d5d..65d3d692cc 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 3.0
+PYTHON_CRYPTOGRAPHY_VERSION = 3.4.6
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/fa/2d/2154d8cb773064570f48ec0b60258a4522490fcb115a6c7c9423482ca993
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-setuptools-rust host-python-cffi host-rustc
+PYTHON_CRYPTOGRAPHY_ENV = CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)" \
+	CARGO_HOME="$(HOST_DIR)/share/cargo"
 
 $(eval $(python-package))
diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 18fad84007..1897cbd8f5 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_KEYRING
 	bool "python-keyring"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-secretstorage -> python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_INSTALL_LIBSTDCPP # python-secretstorage
 	select BR2_PACKAGE_PYTHON_ENTRYPOINTS # runtime
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
@@ -10,5 +10,6 @@ config BR2_PACKAGE_PYTHON_KEYRING
 
 	  https://pypi.python.org/pypi/keyring
 
-comment "python-keyring needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-keyring needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
index 3700e00e1d..cc9a02a9c5 100644
--- a/package/python-opcua-asyncio/Config.in
+++ b/package/python-opcua-asyncio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	bool "python-opcua-asyncio"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_AIOFILES # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
@@ -12,3 +13,7 @@ config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	  hacks for support of python < 3.6.
 
 	  https://github.com/FreeOpcUa/opcua-asyncio
+
+comment "python-opcua-asyncio needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index e33199c82c..b4cefff5c0 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
@@ -12,5 +13,6 @@ config BR2_PACKAGE_PYTHON_PARAMIKO
 
 	  https://github.com/paramiko/paramiko/
 
-comment "python-paramiko needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-paramiko needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
index c32e211e17..ffd0f10373 100644
--- a/package/python-pyopenssl/Config.in
+++ b/package/python-pyopenssl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYOPENSSL
 	bool "python-pyopenssl"
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_PYTHON3 # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
@@ -8,5 +9,6 @@ config BR2_PACKAGE_PYTHON_PYOPENSSL
 
 	  https://github.com/pyca/pyopenssl
 
-comment "python-pyopenssl needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-pyopenssl needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
index 06f883f602..55b67c6f48 100644
--- a/package/python-pysftp/Config.in
+++ b/package/python-pysftp/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_PYTHON_PYSFTP
 	bool "python-pysftp"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko -> python-cryptography
+	depends on BR2_PACKAGE_PYTHON3 # python-paramiko -> python-cryptography
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  A friendly face on SFTP.
 
 	  https://bitbucket.org/dundeemt/pysftp
+
+comment "python-pysftp needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-secretstorage/Config.in b/package/python-secretstorage/Config.in
index 78a0a2ae15..4f79f55a15 100644
--- a/package/python-secretstorage/Config.in
+++ b/package/python-secretstorage/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_PYTHON_SECRETSTORAGE
 	bool "python-secretstorage"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	help
 	  Python bindings to FreeDesktop.org Secret Service API.
 
 	  https://github.com/mitya57/secretstorage
 
-comment "python-secretstorage needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-secretstorage needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index 0260ab4010..8d46408a7e 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pyopenssl -> python-cryptography
+	depends on BR2_PACKAGE_PYTHON3 # python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
@@ -12,5 +12,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 
 	  https://pypi.python.org/pypi/service_identity
 
-comment "python-service-identify needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-service-identify needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 23056e72d2..68e71e1c7f 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pyopenssl -> python-cryptography
+	depends on BR2_PACKAGE_PYTHON3 # python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
@@ -16,5 +17,6 @@ config BR2_PACKAGE_PYTHON_TREQ
 
 	  https://github.com/twisted/treq
 
-comment "python-treq needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-treq needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 4e24a3f71a..4a384524d2 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -22,12 +22,14 @@ config BR2_PACKAGE_PYTHON_TWISTED_HTTP2
 
 config BR2_PACKAGE_PYTHON_TWISTED_TLS
 	bool "TLS support"
-	depends on BR2_INSTALL_LIBSTDCPP # python-{pyopenssl,service-identity}
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-{pyopenssl,service-identity}
+	depends on BR2_PACKAGE_PYTHON3 # python-{pyopenssl,service-identity}
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 
-comment "TLS support needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "TLS support needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
 
 endif
diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index 4f91e7b048..e4d49e4aff 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PYTHON_TXTORCON
 	bool "python-txtorcon"
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-service-identity
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pyopenssl, python-service-identity
+	depends on BR2_PACKAGE_PYTHON3 # python-pyopenssl, python-service-identity
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
@@ -15,5 +15,6 @@ config BR2_PACKAGE_PYTHON_TXTORCON
 
 	  https://github.com/meejah/txtorcon
 
-comment "python-txtorcon needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "python-txtorcon needs a toolchain w/ rust"
+	depends on !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
-- 
2.25.1
