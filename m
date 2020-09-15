From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2020 22:26:19 +0200
Subject: [Buildroot] [git commit] package/python-s3transfer: new package.
Message-ID: <20200915202422.05C3681E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b8ffe69b2675013fb806fad4856a561eb6adc13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An Amazon S3 Transfer Manager.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # roc-rk3399-pc
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-s3transfer/Config.in              |  9 +++++++++
 package/python-s3transfer/python-s3transfer.hash |  5 +++++
 package/python-s3transfer/python-s3transfer.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8d989242c4..e3e1eb36ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2213,6 +2213,7 @@ N:	Rapha??l M??lotte <raphael.melotte@essensium.com>
 F:	package/jbig2dec/
 F:	package/python-botocore/
 F:	package/python-jmespath/
+F:	package/python-s3transfer/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
diff --git a/package/Config.in b/package/Config.in
index 448fa3759e..44b2a1b357 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1147,6 +1147,7 @@ menu "External python modules"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rtslib-fb/Config.in"
+	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
diff --git a/package/python-s3transfer/Config.in b/package/python-s3transfer/Config.in
new file mode 100644
index 0000000000..6587a5fe39
--- /dev/null
+++ b/package/python-s3transfer/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_S3TRANSFER
+	bool "python-s3transfer"
+	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
+	# runtime, not needed for python3:
+	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON
+	help
+	  An Amazon S3 Transfer Manager.
+
+	  https://github.com/boto/s3transfer
diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
new file mode 100644
index 0000000000..6b554607da
--- /dev/null
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/s3transfer/json
+md5	8ca74015d9dc58af26c68276a8867eca  s3transfer-0.2.1.tar.gz
+sha256	6efc926738a3cd576c2a79725fed9afde92378aa5c6a957e3af010cb019fac9d  s3transfer-0.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256	8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
new file mode 100644
index 0000000000..86bdc19eae
--- /dev/null
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-s3transfer
+#
+################################################################################
+
+PYTHON_S3TRANSFER_VERSION = 0.2.1
+PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/39/12/150cd55c606ebca6725683642a8e7068cd6af10f837ce5419a9f16b7fb55
+PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
+PYTHON_S3TRANSFER_LICENSE = Apache-2.0
+PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
