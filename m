From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 23:41:32 +0100
Subject: [Buildroot] [git commit] python-crossbar: bump to version
 17.6.1.post3
Message-ID: <20180117224135.1F0A983B17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08ccfb65c66531624e0927ddd74e3062becb4632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update dependencies and add licence checksum.

As BR now has the latest setuptools version, remove now obsolete
comment.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Rework-runtime-dependencies.patch         | 37 ++++++++++++++++++++++
 package/python-crossbar/Config.in                  | 12 +++++--
 package/python-crossbar/python-crossbar.hash       |  7 ++--
 package/python-crossbar/python-crossbar.mk         |  6 ++--
 4 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/package/python-crossbar/0002-Rework-runtime-dependencies.patch b/package/python-crossbar/0002-Rework-runtime-dependencies.patch
new file mode 100644
index 0000000..784949c
--- /dev/null
+++ b/package/python-crossbar/0002-Rework-runtime-dependencies.patch
@@ -0,0 +1,37 @@
+From 35b2ec4949c9d1620551efde6e3a3d46323899de Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 11 Jan 2018 10:13:18 +0100
+Subject: [PATCH 2/2] Rework runtime dependencies
+
+Add python version requirement to Python2 only packages like
+ipaddress and enum34 and bump h2 package version.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ requirements-min.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/requirements-min.txt b/requirements-min.txt
+index 83820cd1..5cbf35c4 100644
+--- a/requirements-min.txt
++++ b/requirements-min.txt
+@@ -2,7 +2,7 @@ click>=6.6
+ setuptools>=28.3.0
+ zope.interface>=4.3.2
+ Twisted>=17.1.0
+-h2<3.0.0
++h2>=3.0.1
+ priority>=1.3.0
+ txaio>=2.8.0
+ autobahn>=17.6.2
+@@ -33,5 +33,5 @@ bitstring>=3.1.5
+ attrs>=16.2.0
+ incremental>=16.10.1
+ constantly>=15.1.0
+-enum34>=1.1.6
+-ipaddress>=1.0.18
++enum34>=1.1.6; python_version < '3.4'
++ipaddress>=1.0.18; python_version < '3.3'
+-- 
+2.11.0
+
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 2a98467..7058644 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -2,14 +2,22 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	# All the following dependencies are runtime dependencies
+	select BR2_PACKAGE_PYTHON_ATTRS
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
+	select BR2_PACKAGE_PYTHON_CONSTANTLY
 	select BR2_PACKAGE_PYTHON_CBOR
 	select BR2_PACKAGE_PYTHON_CLICK
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_IDNA
+	select BR2_PACKAGE_PYTHON_INCREMENTAL
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_JINJA2
+	select BR2_PACKAGE_PYTHON_H2
 	select BR2_PACKAGE_PYTHON_LMDB
 	select BR2_PACKAGE_PYTHON_MISTUNE
 	select BR2_PACKAGE_PYTHON_NETADDR
+	select BR2_PACKAGE_PYTHON_PRIORITY
 	select BR2_PACKAGE_PYTHON_PSUTIL
 	select BR2_PACKAGE_PYTHON_PYASN
 	select BR2_PACKAGE_PYTHON_PYASN_MODULES
@@ -17,6 +25,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_PYINOTIFY
 	select BR2_PACKAGE_PYTHON_PYNACL
 	select BR2_PACKAGE_PYTHON_PYOPENSSL
+	select BR2_PACKAGE_PYTHON_PYQRCODE
 	select BR2_PACKAGE_PYTHON_PYTRIE
 	select BR2_PACKAGE_PYTHON_PYYAML
 	select BR2_PACKAGE_PYTHON_SDNOTIFY
@@ -24,13 +33,12 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_SETPROCTITLE
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
-	select BR2_PACKAGE_PYTHON_SHUTILWHICH if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SHUTILWHICH
 	select BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_U_MSGPACK
 	select BR2_PACKAGE_PYTHON_UBJSON
 	select BR2_PACKAGE_PYTHON_WATCHDOG
-	select BR2_PACKAGE_PYTHON_WSACCEL
 	help
 	  Crossbar.io is an open-source WAMP application router that
 	  allows to build advanced applications from loosely-coupled
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index a500bcf..b9bfea8 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi/crossbar/json, sha256 locally computed.
-md5	516478cc368503a0a0babc1dc28c5085  crossbar-0.14.0.tar.gz
-sha256	6242ef34c56061850743d750d042993590ca7ec8ebe7b28c21ed05bb0904d71b  crossbar-0.14.0.tar.gz
+# md5 from https://pypi.python.org/pypi/crossbar/json, sha256 locally computed
+md5	d557615f34e7736f749e59b4d3ddbea0  crossbar-17.6.1.post3.tar.gz
+sha256	8d023af0a772404f4e57add5888583fc0068d62a7a2249bea4539a6d7b70fbd9  crossbar-17.6.1.post3.tar.gz
+sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 77cecfa..5ebeddc 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-# don't bump version as newer setuptools package is needed,
-# that still didn't make its way into Buildroot
-PYTHON_CROSSBAR_VERSION = 0.14.0
+PYTHON_CROSSBAR_VERSION = 17.6.1.post3
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/f0/9a/e0b77e15698c47b6293655bc0e1996dd8e87bd8af7bc7434a5c8281a024e
+PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/6a/25/9bc78947a4552c5fe27671ca2abe3be0559b8c76bc93d52157a6333ea971
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
