From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:17:38 +0200
Subject: [Buildroot] [git commit] python-crossbar: bump to version 18.9.2
Message-ID: <20181004121647.EF9568C562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9adc5dd9e3605e176922e2cc2fb3edbc1305f72d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update dependencies (and fix alphabetical order).
Add patch to remove idna direct dependency (was sent to upstream too:
https://github.com/crossbario/crossbar/pull/1406).

Fixes:
http://autobuild.buildroot.org/results/31d/31db5fd90514906a8c77f921c9650a386ec80101/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Remove-idna-requirement.patch             | 26 +++++++++++++++
 .../0002-Rework-runtime-dependencies.patch         | 37 ----------------------
 package/python-crossbar/Config.in                  | 19 ++++++-----
 package/python-crossbar/python-crossbar.hash       |  7 ++--
 package/python-crossbar/python-crossbar.mk         |  4 +--
 5 files changed, 41 insertions(+), 52 deletions(-)

diff --git a/package/python-crossbar/0002-Remove-idna-requirement.patch b/package/python-crossbar/0002-Remove-idna-requirement.patch
new file mode 100644
index 0000000000..b4bbe3b5a5
--- /dev/null
+++ b/package/python-crossbar/0002-Remove-idna-requirement.patch
@@ -0,0 +1,26 @@
+From 9164d21cc66c1f78de37c9383528c5d528cbdbeb Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Wed, 26 Sep 2018 15:33:43 +0300
+Subject: [PATCH] Remove idna requirement.
+
+The latest version of idna is 2.7, but it seems like idna is not a direct
+dependency anymore (a short "git grep" shows it's only written in requirement
+and readme files).
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ requirements-min.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/requirements-min.txt b/requirements-min.txt
+index d7c2a562..84bf1878 100644
+--- a/requirements-min.txt
++++ b/requirements-min.txt
+@@ -1,4 +1,3 @@
+-idna<2.6,>=2.5
+ click>=6.7
+ setuptools>=36.0.1
+ zope.interface>=4.4.2
+-- 
+2.17.1
+
diff --git a/package/python-crossbar/0002-Rework-runtime-dependencies.patch b/package/python-crossbar/0002-Rework-runtime-dependencies.patch
deleted file mode 100644
index 784949c2dd..0000000000
--- a/package/python-crossbar/0002-Rework-runtime-dependencies.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 35b2ec4949c9d1620551efde6e3a3d46323899de Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Thu, 11 Jan 2018 10:13:18 +0100
-Subject: [PATCH 2/2] Rework runtime dependencies
-
-Add python version requirement to Python2 only packages like
-ipaddress and enum34 and bump h2 package version.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- requirements-min.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/requirements-min.txt b/requirements-min.txt
-index 83820cd1..5cbf35c4 100644
---- a/requirements-min.txt
-+++ b/requirements-min.txt
-@@ -2,7 +2,7 @@ click>=6.6
- setuptools>=28.3.0
- zope.interface>=4.3.2
- Twisted>=17.1.0
--h2<3.0.0
-+h2>=3.0.1
- priority>=1.3.0
- txaio>=2.8.0
- autobahn>=17.6.2
-@@ -33,5 +33,5 @@ bitstring>=3.1.5
- attrs>=16.2.0
- incremental>=16.10.1
- constantly>=15.1.0
--enum34>=1.1.6
--ipaddress>=1.0.18
-+enum34>=1.1.6; python_version < '3.4'
-+ipaddress>=1.0.18; python_version < '3.3'
--- 
-2.11.0
-
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 96a25c2c69..2f9de6e0b5 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,45 +1,44 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_ATTRS
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_BITSTRING
-	select BR2_PACKAGE_PYTHON_CONSTANTLY
 	select BR2_PACKAGE_PYTHON_CBOR
 	select BR2_PACKAGE_PYTHON_CLICK
+	select BR2_PACKAGE_PYTHON_CONSTANTLY
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_H2
 	select BR2_PACKAGE_PYTHON_IDNA
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_JINJA2
-	select BR2_PACKAGE_PYTHON_H2
 	select BR2_PACKAGE_PYTHON_LMDB
 	select BR2_PACKAGE_PYTHON_MISTUNE
 	select BR2_PACKAGE_PYTHON_NETADDR
+	select BR2_PACKAGE_PYTHON_PASSLIB
 	select BR2_PACKAGE_PYTHON_PRIORITY
 	select BR2_PACKAGE_PYTHON_PSUTIL
-	select BR2_PACKAGE_PYTHON_PYASN
-	select BR2_PACKAGE_PYTHON_PYASN_MODULES
+	select BR2_PACKAGE_PYTHON_PYASN1
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES
 	select BR2_PACKAGE_PYTHON_PYGMENTS
-	select BR2_PACKAGE_PYTHON_PYINOTIFY
 	select BR2_PACKAGE_PYTHON_PYNACL
 	select BR2_PACKAGE_PYTHON_PYOPENSSL
 	select BR2_PACKAGE_PYTHON_PYQRCODE
 	select BR2_PACKAGE_PYTHON_PYTRIE
 	select BR2_PACKAGE_PYTHON_PYYAML
 	select BR2_PACKAGE_PYTHON_SDNOTIFY
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_SETPROCTITLE
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
-	select BR2_PACKAGE_PYTHON_SHUTILWHICH
 	select BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_TWISTED
+	select BR2_PACKAGE_PYTHON_TXAIO
+	select BR2_PACKAGE_PYTHON_TXTORCON
 	select BR2_PACKAGE_PYTHON_U_MSGPACK
 	select BR2_PACKAGE_PYTHON_UBJSON
 	select BR2_PACKAGE_PYTHON_WATCHDOG
+	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
 	help
 	  Crossbar.io is an open-source WAMP application router that
 	  allows to build advanced applications from loosely-coupled
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index b9bfea8938..a9c40c91e6 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/crossbar/json, sha256 locally computed
-md5	d557615f34e7736f749e59b4d3ddbea0  crossbar-17.6.1.post3.tar.gz
-sha256	8d023af0a772404f4e57add5888583fc0068d62a7a2249bea4539a6d7b70fbd9  crossbar-17.6.1.post3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/crossbar/json
+md5	6c684c9613091d7ba8adadb6bff5c1cd  crossbar-18.9.2.tar.gz
+sha256	8486f2daa73c45475633baa9d21dcaf74d635781939df6ab6748cc2958aa9d75  crossbar-18.9.2.tar.gz
+# Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 5ebeddc76a..ee7d2a6a32 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 17.6.1.post3
+PYTHON_CROSSBAR_VERSION = 18.9.2
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/6a/25/9bc78947a4552c5fe27671ca2abe3be0559b8c76bc93d52157a6333ea971
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/1c/71/27e6b5ba1e557d28d155badee90022f73f4216b752d063221edbe2b188f0
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
