From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 May 2020 01:38:05 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to version
 20.1.0
Message-ID: <20200511073805.93566-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-ARGON2_CFFI_USE_SSE2-to-override-ss.patch | 78 -------------------
 .../python-argon2-cffi.hash                   |  6 +-
 .../python-argon2-cffi/python-argon2-cffi.mk  |  4 +-
 3 files changed, 5 insertions(+), 83 deletions(-)
 delete mode 100644 package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch

diff --git a/package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch b/package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch
deleted file mode 100644
index 670d9b3d40..0000000000
--- a/package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 098890ed36d54a7c8beb8c01428c78de7ab77b05 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 6 May 2020 23:40:11 -0600
-Subject: [PATCH] Add env variable ARGON2_CFFI_USE_SSE2 to override sse2
- optimizations (#61)
-
-This is useful for cross compiling since platform.machine() is broken
-for cross builds.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1 at gmail.com: backport from upstream commit
-098890ed36d54a7c8beb8c01428c78de7ab77b05]
----
- CHANGELOG.rst         |  2 +-
- docs/installation.rst | 10 ++++++++++
- setup.py              | 12 +++++++++---
- 3 files changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/CHANGELOG.rst b/CHANGELOG.rst
-index 9fa2bf0..4405297 100644
---- a/CHANGELOG.rst
-+++ b/CHANGELOG.rst
-@@ -26,7 +26,7 @@ Deprecations:
- Changes:
- ^^^^^^^^
- 
--*none*
-+- Added ``ARGON2_CFFI_USE_SSE2`` env variable to override SSE2 autodetection.
- 
- 
- ----
-diff --git a/docs/installation.rst b/docs/installation.rst
-index 3ee9ccd..563c891 100644
---- a/docs/installation.rst
-+++ b/docs/installation.rst
-@@ -57,6 +57,16 @@ This approach can lead to problems around your build chain and you can run into
- **It is your own responsibility to deal with these risks if you choose this path.**
- 
- 
-+Override Automatic SSE2 Detection
-+------------------------------------------
-+
-+If you set ``ARGON2_CFFI_USE_SSE2`` to ``1`` (and *only* ``1``), ``argon2-cffi`` will build with sse2 support.
-+
-+If you set ``ARGON2_CFFI_USE_SSE2`` to ``0`` (and *only* ``0``), ``argon2-cffi`` will build without sse2 support.
-+
-+This should generally only be used if the sse2 autodetection causes a compilation failure or if you are cross compiling.
-+
-+
- .. _SSE2: https://en.wikipedia.org/wiki/SSE2
- .. _PyPI: https://pypi.org/project/argon2-cffi/
- .. _CFFI environment: https://cffi.readthedocs.io/en/latest/installation.html
-diff --git a/setup.py b/setup.py
-index e91e73a..c26a691 100644
---- a/setup.py
-+++ b/setup.py
-@@ -19,9 +19,15 @@ from setuptools.command.install import install
- NAME = "argon2-cffi"
- PACKAGES = find_packages(where="src")
- 
--# Optimized version requires SSE2 extensions.  They have been around since
--# 2001 so we try to compile it on every recent-ish x86.
--optimized = platform.machine() in ("i686", "x86", "x86_64", "AMD64")
-+use_sse2 = os.environ.get("ARGON2_CFFI_USE_SSE2", None)
-+if use_sse2 == "1":
-+    optimized = True
-+elif use_sse2 == "0":
-+    optimized = False
-+else:
-+    # Optimized version requires SSE2 extensions.  They have been around since
-+    # 2001 so we try to compile it on every recent-ish x86.
-+    optimized = platform.machine() in ("i686", "x86", "x86_64", "AMD64")
- 
- CFFI_MODULES = ["src/argon2/_ffi_build.py:ffi"]
- lib_base = os.path.join("extras", "libargon2", "src")
--- 
-2.20.1
-
diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
index 631c85ac7f..730a9b6c44 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.hash
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argon2_cffi/json
-md5	3fb9154af6f7a113028a7a8bc7da715d  argon2-cffi-19.2.0.tar.gz
-sha256	ffaa623eea77b497ffbdd1a51e941b33d3bf552c60f14dbee274c4070677bda3  argon2-cffi-19.2.0.tar.gz
+md5  e49ccb29351387fd853f31bf19b67f59  argon2-cffi-20.1.0.tar.gz
+sha256  d8029b2d3e4b4cea770e9e5a0104dd8fa185c1724a0f01528ae4826a6d25f97d  argon2-cffi-20.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
+sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index df1c1d51c6..0e3e1be3d6 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_VERSION = 19.2.0
+PYTHON_ARGON2_CFFI_VERSION = 20.1.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/e4/96/f1bf2369f29794971f836b8eff5e3bdb653043f1b61d104eae21b1de3ccb
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/74/fd/d78e003a79c453e8454197092fce9d1c6099445b7e7da0b04eb4fe1dbab7
 PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
-- 
2.20.1
