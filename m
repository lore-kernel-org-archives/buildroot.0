From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 17 Feb 2020 15:23:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/{avro-c,
 python-avro}: bump to version 1.9.2
Message-ID: <20200217142307.53693-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Drop patch for avro-c that was applied upstream
 - Fix inconsistency in PYTHON_AVRO_SITE
 - Adopt new spacing convention in .hash files
 - Add upstream patch for python-avro
 - Add patch to remove installation-time linting in python-avro

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 ...-C-to-be-built-on-musl-based-systems.patch | 45 ------------------
 package/avro-c/avro-c.hash                    |  6 +--
 package/avro-c/avro-c.mk                      |  2 +-
 .../0001-fix-pycodestyle-regression.patch     | 28 +++++++++++
 ...all-time-linting-and-imports-sorting.patch | 46 +++++++++++++++++++
 package/python-avro/python-avro.hash          |  6 +--
 package/python-avro/python-avro.mk            |  2 +-
 7 files changed, 82 insertions(+), 53 deletions(-)
 delete mode 100644 package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
 create mode 100644 package/python-avro/0001-fix-pycodestyle-regression.patch
 create mode 100644 package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch

diff --git a/package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch b/package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
deleted file mode 100644
index bfa7e8a60e..0000000000
--- a/package/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9b39a985bcd6cd34f0820f3680f145d46c0e56bd Mon Sep 17 00:00:00 2001
-From: Titouan Christophe <titouan.christophe@railnova.eu>
-Date: Sun, 8 Dec 2019 01:55:59 +0100
-Subject: [PATCH] Allow avro C to be built on musl based systems.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The type `ssize_t` is defined in sys/types.h, and nowhere else
-in the musl standard C library, so it should be included for the
-compilation to succeed.
-
-This fixes several errors like:
-
-    In file included from src/generic.c:29:0:
-    src/generic.c: In function ?avro_generic_value_new?:
-    src/avro_generic_internal.h:63:39:
-        error: ?ssize_t? undeclared (first use in this function);
-               did you mean ?size_t??
-
-Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
-[yann.morin.1998 at free.fr:
-  - backported from upstream 9b39a98, adapted to the release tarball
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/avro_generic_internal.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/avro_generic_internal.h b/src/avro_generic_internal.h
-index 709403c0..9843ed65 100644
---- a/src/avro_generic_internal.h
-+++ b/src/avro_generic_internal.h
-@@ -24,6 +24,8 @@ extern "C" {
- #define CLOSE_EXTERN
- #endif
- 
-+#include <sys/types.h>
-+
- #include "avro/generic.h"
- #include "avro/schema.h"
- #include "avro/value.h"
--- 
-2.20.1
-
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index da74f3c052..fdddf0bd80 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://www-eu.apache.org/dist/avro/avro-1.9.1/c/avro-c-1.9.1.tar.gz.sha512
-sha512 68b1f44f870c9b6f0b2380da9e34d91148ff4398cb300f4bdd4e3e1ad00820acd9084b73232b00d4cd4935fb992b41dc65afdafcbea14a3d87259608688df904  avro-c-1.9.1.tar.gz
+# From https://www-eu.apache.org/dist/avro/avro-1.9.2/c/avro-c-1.9.2.tar.gz.sha512
+sha512  1bc4bb22c88b70235e8e0280dbb7aeee7aa3f6cb7ff78a1aa5a7a6a1aca5522e8cfc89064096eace1c07a50e98f2397abd3620de1a29f9e5103b6f4c84316927  avro-c-1.9.2.tar.gz
 
 # License files
-sha256 d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
+sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index a1b1931bf0..5cdbe362d8 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRO_C_VERSION = 1.9.1
+AVRO_C_VERSION = 1.9.2
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/0001-fix-pycodestyle-regression.patch b/package/python-avro/0001-fix-pycodestyle-regression.patch
new file mode 100644
index 0000000000..63cb5da294
--- /dev/null
+++ b/package/python-avro/0001-fix-pycodestyle-regression.patch
@@ -0,0 +1,28 @@
+From a66459dd654489bf2c17e2828d5c314a4048be70 Mon Sep 17 00:00:00 2001
+From: Ryan Skraba <ryan@skraba.com>
+Date: Thu, 13 Feb 2020 09:57:02 +0100
+Subject: [PATCH] AVRO-2737: Fix pycodestyle regression.
+
+An erroneous import was added in the Avro 1.9.2 Python3 package.
+The issue has been fixed and released on pypi as version 1.9.2.1, but has
+not been published on the Apache download website, hence this patch.
+
+[Titouan: add detailed commit message]
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 20dd4e240..f6297bb1b 100755
+--- a/setup.py
++++ b/setup.py
+@@ -38,8 +38,6 @@
+ 
+ import setuptools
+ 
+-import pycodestyle
+-
+ _HERE = os.path.dirname(os.path.abspath(__file__))
+ _AVRO_DIR = os.path.join(_HERE, 'avro')
+ _VERSION_FILE_NAME = 'VERSION.txt'
diff --git a/package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch b/package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch
new file mode 100644
index 0000000000..41231e923d
--- /dev/null
+++ b/package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch
@@ -0,0 +1,46 @@
+From 3446a4af8474cd863efddeae7f3e5dd3f9b8e25e Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Mon, 17 Feb 2020 15:12:13 +0100
+Subject: [PATCH] drop install time linting and imports sorting
+
+Since the 1.9.2 release, the setup script is also performing code linting
+tasks, which require additional python libraries.
+
+These linting tasks are not needed anyway, since they are intended to prepare
+the code for distribution, but the Buildroot package is already using a
+distributed version. We therefore simply remove them.
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ setup.cfg | 2 --
+ setup.py  | 1 -
+ 2 files changed, 3 deletions(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 7b5de18..d46a36e 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -25,8 +25,6 @@ package_dir =
+ include_package_data = true
+ packages = avro
+ setup_requires = 
+-	isort
+-	pycodestyle
+ install_requires = 
+ zip_safe = true
+ scripts = 
+diff --git a/setup.py b/setup.py
+index f6297bb..91d3287 100755
+--- a/setup.py
++++ b/setup.py
+@@ -164,7 +164,6 @@ def main():
+     setuptools.setup(cmdclass={
+         "clean": CleanCommand,
+         "generate_interop_data": GenerateInteropDataCommand,
+-        "lint": LintCommand,
+     })
+ 
+ 
+-- 
+2.24.1
+
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index f63b37ee0a..fbc466a94f 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://www-eu.apache.org/dist/avro/avro-1.9.1/py3/avro-python3-1.9.1.tar.gz.sha512
-sha512 771ce6e5ca6315f5b9108cb4f5dd9488575cc3433ffdd744f96ce7989763728259c89475319fd9c411ed6b65c996b762548c50a697eb1fba9ab024112ca17daa  avro-python3-1.9.1.tar.gz
+# From https://www-eu.apache.org/dist/avro/avro-1.9.2/py3/avro-python3-1.9.2.tar.gz.sha512
+sha512  f981fd72bc64eb71e6c132c551700e89a8ebdd6cd9d7e6fa7559831cee69749fc255a49ee0859afd106e0d913c36327b27ca4c7b36efbf740515881b92076cb6  avro-python3-1.9.2.tar.gz
 
 # License files
-sha256 c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
+sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 3f9140e946..dd6008b1ba 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_AVRO_VERSION = $(AVRO_C_VERSION)
-PYTHON_AVRO_SITE = https://www-eu.apache.org/dist/avro/avro-1.9.1/py3
+PYTHON_AVRO_SITE = https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py3
 PYTHON_AVRO_SOURCE = avro-python3-$(PYTHON_AVRO_VERSION).tar.gz
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
-- 
2.24.1
