From: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>
Date: Mon, 28 Mar 2016 16:15:16 +0530
Subject: [Buildroot] [PATCH 1/1] python-m2crypto:bump to 0.23.0
Message-ID: <1459161916-21579-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>
---
Changes v1 :
  - Bump up the python-m2crypto package to 0.23.0 and Added the License information.
  - Deleted the patch for python-m2crypto as it is no more needed in the
    latest version of 0.23.0
---
 ...o-build-with-SSLv2-when-it-is-not-availab.patch | 36 ----------------------
 package/python-m2crypto/python-m2crypto.hash       |  4 +--
 package/python-m2crypto/python-m2crypto.mk         |  6 +++-
 3 files changed, 7 insertions(+), 39 deletions(-)
 delete mode 100644 package/python-m2crypto/0001-Don-t-try-to-build-with-SSLv2-when-it-is-not-availab.patch

diff --git a/package/python-m2crypto/0001-Don-t-try-to-build-with-SSLv2-when-it-is-not-availab.patch b/package/python-m2crypto/0001-Don-t-try-to-build-with-SSLv2-when-it-is-not-availab.patch
deleted file mode 100644
index 7210fa2..0000000
--- a/package/python-m2crypto/0001-Don-t-try-to-build-with-SSLv2-when-it-is-not-availab.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ac01b38302474920288c1a9eb63fd35fa8d1db5b Mon Sep 17 00:00:00 2001
-From: Bosse Klykken <larkly@gmail.com>
-Date: Tue, 17 Jul 2012 15:55:00 +0200
-Subject: [PATCH] =?UTF-8?q?Don=E2=80=99t=20try=20to=20build=20with=20SSLv2?=
- =?UTF-8?q?=20when=20it=20is=20not=20available.?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The patch originally from http://stackoverflow.com/a/11072709/164233
-
-Fixes #30
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- SWIG/_ssl.i | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/SWIG/_ssl.i b/SWIG/_ssl.i
-index 3f6bd61..89b1ad1 100644
---- a/SWIG/_ssl.i
-+++ b/SWIG/_ssl.i
-@@ -52,8 +52,10 @@ extern const char *SSL_alert_desc_string(int);
- %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
- extern const char *SSL_alert_desc_string_long(int);
- 
-+#ifndef OPENSSL_NO_SSL2
- %rename(sslv2_method) SSLv2_method;
- extern SSL_METHOD *SSLv2_method(void);
-+#endif
- %rename(sslv3_method) SSLv3_method;
- extern SSL_METHOD *SSLv3_method(void);
- %rename(sslv23_method) SSLv23_method;
--- 
-2.7.0
-
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index a2603b9..1bf9709 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,2 +1,2 @@
-# From https://pypi.python.org/pypi/M2Crypto/0.22.5
-md5 f84eb07aa1687f39bc26ee7b1ba5a105 M2Crypto-0.22.5.tar.gz
+# From https://pypi.python.org/pypi/M2Crypto/
+md5 89557730e245294a6cab06de8ad4fb42 M2Crypto-0.23.0.tar.gz
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 0416957..820100f 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.22.5
+PYTHON_M2CRYPTO_VERSION = 0.23.0
 PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
 
+# The license is a BSD-style license
+PYTHON_M2CRYPTO_LICENSE = BSD
+PYTHON_M2CRYPTO_LICENSE_FILE = LICENSE
+
 # We need to use python2 because m2crypto is not python3 compliant.
 HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
 
-- 
2.5.0
