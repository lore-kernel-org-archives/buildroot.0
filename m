From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 11:06:44 +0200
Subject: [Buildroot] [git commit] package/python-pygments: security bump to
 version 2.7.4
Message-ID: <20210405084134.D540F8B91F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03c2a812310e37567171f18dae51cfb57d69422e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-20270: An infinite loop in SMLLexer in Pygments versions 1.5 to
  2.7.3 may lead to denial of service when performing syntax highlighting of
  a Standard ML (SML) source file, as demonstrated by input that only
  contains the "exception" keyword

- CVE-2021-27291: In pygments 1.1+, fixed in 2.7.4, the lexers used to parse
  programming languages rely heavily on regular expressions.  Some of the
  regular expressions have exponential or cubic worst-case complexity and
  are vulnerable to ReDoS.  By crafting malicious input, an attacker can
  cause a denial of service

Python 2.x support was dropped in pygments 2.6, so adjust (reverse)
dependencies:

Version 2.6
-----------
(released March 8, 2020)

- Running Pygments on Python 2.x is no longer supported.
  (The Python 2 lexer still exists.)

Adjust the license hash for a change of copyright years:
https://github.com/pygments/pygments/commit/a590ac5ea7c00a41e253834306bfa19e38349c0b

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pudb/Config.in                | 4 ++--
 package/python-pygments/Config.in            | 1 +
 package/python-pygments/python-pygments.hash | 6 +++---
 package/python-pygments/python-pygments.mk   | 4 ++--
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-pudb/Config.in b/package/python-pudb/Config.in
index d4a4f73e6a..b3a93058b5 100644
--- a/package/python-pudb/Config.in
+++ b/package/python-pudb/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PYTHON_PUDB
 	bool "python-pudb"
+	depends on BR2_PACKAGE_PYTHON3 # pygments
 	select BR2_PACKAGE_PYTHON_URWID # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_CURSES # runtime
 	help
 	  A full-screen, console-based Python debugger.
 
diff --git a/package/python-pygments/Config.in b/package/python-pygments/Config.in
index f097c52397..d74e53d4c8 100644
--- a/package/python-pygments/Config.in
+++ b/package/python-pygments/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYGMENTS
 	bool "python-pygments"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Pygments is a syntax highlighting package written in Python.
 
diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index ad3604ee54..09b47b2bdc 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5	5ecc3fbb2a783e917b369271fc0e6cd1  Pygments-2.4.2.tar.gz
-sha256	881c4c157e45f30af185c1ffe8d549d48ac9127433f2c380c24b84572ad66297  Pygments-2.4.2.tar.gz
+md5  390a49fa0eb5486a795b2b54b9a7b666  Pygments-2.7.4.tar.gz
+sha256  df49d09b498e83c1a73128295860250b0b7edd4c723a32e9bc0d295c7c2ec337  Pygments-2.7.4.tar.gz
 # Locally computed sha256 checksums
-sha256	45b88d3449c37806594758bf3c484d9d98b12b1ecc163f65431fe07fea6025f0  LICENSE
+sha256  c012cf17a2ba79142977c8cc5bb1497a675401bf79c2c9b95a7604e2ddfde8b8  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index bde06c9a8b..781b16353b 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.4.2
+PYTHON_PYGMENTS_VERSION = 2.7.4
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/7e/ae/26808275fc76bf2832deb10d3a3ed3107bc4de01b85dcccbe525f2cd6d1e
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/e1/86/8059180e8217299079d8719c6e23d674aadaba0b1939e25e0cc15dcf075b
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
