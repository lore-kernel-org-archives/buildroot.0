From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 00:24:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-httplib2: security bump to
 version 0.19.1
Message-ID: <20210409222445.3865584-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2021-21240: httplib2 is a comprehensive HTTP client library
  for Python. In httplib2 before version 0.19.0, a malicious server
  which responds with long series of "\xa0" characters in the
  "www-authenticate" header may cause Denial of Service (CPU burn while
  parsing header) of the httplib2 client accessing said server. This is
  fixed in version 0.19.0 which contains a new implementation of auth
  headers parsing using the pyparsing library.
- Fix CVE-2020-11078: In httplib2 before version 0.18.0, an attacker
  controlling unescaped part of uri for `httplib2.Http.request()` could
  change request headers and body, send additional hidden requests to
  same server. This vulnerability impacts software that uses httplib2
  with uri constructed by string concatenation, as opposed to proper
  urllib building with escaping. This has been fixed in 0.18.0.
- Use LICENSE file instead of PKG-INFO
- pyparsing is a runtime dependency since version 0.19.0 and
  https://github.com/httplib2/httplib2/commit/bd9ee252c8f099608019709e22c0d705e98d26bc

https://github.com/httplib2/httplib2/blob/v0.19.1/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-httplib2/Config.in            | 1 +
 package/python-httplib2/python-httplib2.hash | 8 ++++----
 package/python-httplib2/python-httplib2.mk   | 6 +++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
index e42f5132b7..39671f2386 100644
--- a/package/python-httplib2/Config.in
+++ b/package/python-httplib2/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_HTTPLIB2
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  httplib2 is a comprehensive HTTP client library, httplib2.py
 	  supports many features left out of other HTTP libraries.
diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index c272d8517c..2c5914c5f6 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  4c05b09eb6f6c20a31ca488c7a87dda9  httplib2-0.17.2.tar.gz
-sha256  eb7a6b137ae31e61c5f429083c5bebb71fe5fd1958e7f3d5c39b21b11cd4b290  httplib2-0.17.2.tar.gz
-# Locally computer sha256 checksums
-sha256  4205f0d88e04380ba13b9c60e2f85771196b66ee84bf48971d30d82a78e84c3f  PKG-INFO
+md5  de7f5e3a4adb3105889867327bdd39dc  httplib2-0.19.1.tar.gz
+sha256  0b12617eeca7433d4c396a100eaecfa4b08ee99aa881e6df6e257a7aad5d533d  httplib2-0.19.1.tar.gz
+# Locally computed sha256 checksums
+sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index fbdb6d83c4..7b9b400241 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.17.2
+PYTHON_HTTPLIB2_VERSION = 0.19.1
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/1b/f0/a35a448afea308aeb6a1430dbcfb46f4cef11360cbc18f22af6e567bb847
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/ed/cd/533a1e9e04671bcee5d2854b4f651a3fab9586d698de769d93b05ee2bff1
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
-PYTHON_HTTPLIB2_LICENSE_FILES = PKG-INFO
+PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.30.2
