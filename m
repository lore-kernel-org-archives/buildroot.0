From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue,  1 Sep 2020 16:37:31 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-stegano : new package
In-Reply-To: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
References: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200901143731.2916-4-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steganography is the art and science of writing hidden
messages in such a way that no one , apart from the sender
and intended recipient , suspects the existence of the message,
a form of security through obscurity.
Steganography is often used with cryptography.

More about python-stegano is available at :
https://pypi.org/project/stegano/.

Stegano can be tested :
$ python3
>>> from stegano import lsb
>>> secret = lsb.hide("./image.png", "Hello World")
>>> secret.save("./image-with-steganography.png")
To get back text :
>>> clear_message = lsb.reveal("./image-with-steganography")

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 Notes :
 - This module has been tested with Python3.
 - It has been checked with check-package :
   $ ./utils/check-package package/python-stegano/*
   33 lines processed
   0 warnings generated

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-stegano/Config.in           | 14 ++++++++++++++
 package/python-stegano/python-stegano.hash |  5 +++++
 package/python-stegano/python-stegano.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/python-stegano/Config.in
 create mode 100644 package/python-stegano/python-stegano.hash
 create mode 100644 package/python-stegano/python-stegano.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 18411d638b..fcb6526dad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1402,6 +1402,7 @@ F:	package/python-crayons/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
 F:	package/python-piexif/
+F:	package/python-stegano/
 
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
diff --git a/package/Config.in b/package/Config.in
index 7dac15254a..40eb865256 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1169,6 +1169,7 @@ menu "External python modules"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
+	source "package/python-stegano/Config.in"
 	source "package/python-subprocess32/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
diff --git a/package/python-stegano/Config.in b/package/python-stegano/Config.in
new file mode 100644
index 0000000000..b0b209c5f8
--- /dev/null
+++ b/package/python-stegano/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_STEGANO
+	bool "python-stegano"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_JPEG #runtime
+	select BR2_PACKAGE_LIBXML2 #runtime
+	select BR2_PACKAGE_OPENJPEG #runtime
+	select BR2_PACKAGE_PYTHON_CRAYONS #runtime
+	select BR2_PACKAGE_PYTHON_PIEXIF #runtime
+	select BR2_PACKAGE_PYTHON_PILLOW #runtime
+	select BR2_PACKAGE_TIFF #runtime
+	help
+	  A pure Python Steganography module.
+
+	  https://github.com/itkach/mwscrape
diff --git a/package/python-stegano/python-stegano.hash b/package/python-stegano/python-stegano.hash
new file mode 100644
index 0000000000..d823c1752e
--- /dev/null
+++ b/package/python-stegano/python-stegano.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/stegano/json
+md5  c63deda6352232c12cc09a8fd3ffc4e1  stegano-0.9.8.tar.gz
+sha256  b22eaefd8c236b0579fc3cc7ea709d0154098c11d3a30a3b840daa2ca1e3aa8a  stegano-0.9.8.tar.gz
+# Locally computed sha256 checksums
+sha256  c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271  COPYING
diff --git a/package/python-stegano/python-stegano.mk b/package/python-stegano/python-stegano.mk
new file mode 100644
index 0000000000..9ff2d94484
--- /dev/null
+++ b/package/python-stegano/python-stegano.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-stegano
+#
+################################################################################
+
+PYTHON_STEGANO_VERSION = 0.9.8
+PYTHON_STEGANO_SOURCE = stegano-$(PYTHON_STEGANO_VERSION).tar.gz
+PYTHON_STEGANO_SITE = https://files.pythonhosted.org/packages/6d/43/e758084b67931731d09cb5ee4d877955f970e8c2e20be4b85ccd177bef35
+PYTHON_STEGANO_LICENSE = GPL-3.0+
+PYTHON_STEGANO_LICENSE_FILES = COPYING
+PYTHON_STEGANO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.11.0
