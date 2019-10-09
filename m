From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed,  9 Oct 2019 20:24:21 +0300
Subject: [Buildroot] [PATCH v2 2/2] package/snmpclitools: new package
In-Reply-To: <20191009172421.10069-1-asafka7@gmail.com>
References: <20191009172421.10069-1-asafka7@gmail.com>
Message-ID: <20191009172421.10069-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For now, we use PKG-INFO as license file, since LICENSE.rst isn't
provided with the tarball.
A pull request was sent upstream:
https://github.com/etingof/snmpclitools/pull/11

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
v1->v2: rename to snmpclitools (instead of python-snmpclitools)
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/snmpclitools/Config.in         |  9 +++++++++
 package/snmpclitools/snmpclitools.hash |  5 +++++
 package/snmpclitools/snmpclitools.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/snmpclitools/Config.in
 create mode 100644 package/snmpclitools/snmpclitools.hash
 create mode 100644 package/snmpclitools/snmpclitools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05f33eb2c3..37af071500 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -234,6 +234,7 @@ N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/collectd/
 F:	package/libuv/
 F:	package/python*
+F:	package/snmpclitools/
 F:	package/spdlog/
 F:	package/uftp/
 F:	package/zeromq/
diff --git a/package/Config.in b/package/Config.in
index d8d0824c71..5574e2f6d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2069,6 +2069,7 @@ endif
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/sngrep/Config.in"
+	source "package/snmpclitools/Config.in"
 	source "package/snort/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/snmpclitools/Config.in b/package/snmpclitools/Config.in
new file mode 100644
index 0000000000..00bf5994d1
--- /dev/null
+++ b/package/snmpclitools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SNMPCLITOOLS
+	bool "snmpclitools"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYSMI # runtime
+	select BR2_PACKAGE_PYTHON_PYSNMP # runtime
+	help
+	  SNMP command-line tools.
+
+	  https://github.com/etingof/snmpclitools
diff --git a/package/snmpclitools/snmpclitools.hash b/package/snmpclitools/snmpclitools.hash
new file mode 100644
index 0000000000..4dcbdcb6e0
--- /dev/null
+++ b/package/snmpclitools/snmpclitools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/snmpclitools/json
+md5	132b100f5e7b80715e6c1d424e89687c  snmpclitools-0.6.4.tar.gz
+sha256	820c45de419bf355c845a96610a395ec18a15176ac0362d388da7740266ea1ac  snmpclitools-0.6.4.tar.gz
+# Locally computed sha256 checksums
+sha256	ed5561a0f5b75e93aa026c1b9fdef58e7ccbf6b2e9a2458be732afc288209d23  PKG-INFO
diff --git a/package/snmpclitools/snmpclitools.mk b/package/snmpclitools/snmpclitools.mk
new file mode 100644
index 0000000000..68cb6206fe
--- /dev/null
+++ b/package/snmpclitools/snmpclitools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# snmpclitools
+#
+################################################################################
+
+SNMPCLITOOLS_VERSION = 0.6.4
+SNMPCLITOOLS_SOURCE = snmpclitools-$(SNMPCLITOOLS_VERSION).tar.gz
+SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/03/2a/8488828e92a82c5416e33fba6089283162937b0f73e5b15205fb6ec3bbea
+SNMPCLITOOLS_SETUP_TYPE = setuptools
+SNMPCLITOOLS_LICENSE = BSD-2-Clause
+SNMPCLITOOLS_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
-- 
2.20.1
