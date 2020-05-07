From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  7 May 2020 14:39:01 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: only enable
 sse2 when supported
Message-ID: <20200507203901.97715-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to backport a commit so that we can enable/disable sse2 using
the ARGON2_CFFI_USE_SSE2 env variable.

Fixes:
http://autobuild.buildroot.net/results/030/0306d66d081dd0807c577edd50d39075a46d0dd9/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-ARGON2_CFFI_USE_SSE2-to-override-ss.patch | 78 +++++++++++++++++++
 .../python-argon2-cffi/python-argon2-cffi.mk  |  6 ++
 2 files changed, 84 insertions(+)
 create mode 100644 package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch

diff --git a/package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch b/package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch
new file mode 100644
index 0000000000..670d9b3d40
--- /dev/null
+++ b/package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch
@@ -0,0 +1,78 @@
+From 098890ed36d54a7c8beb8c01428c78de7ab77b05 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 6 May 2020 23:40:11 -0600
+Subject: [PATCH] Add env variable ARGON2_CFFI_USE_SSE2 to override sse2
+ optimizations (#61)
+
+This is useful for cross compiling since platform.machine() is broken
+for cross builds.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+098890ed36d54a7c8beb8c01428c78de7ab77b05]
+---
+ CHANGELOG.rst         |  2 +-
+ docs/installation.rst | 10 ++++++++++
+ setup.py              | 12 +++++++++---
+ 3 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/CHANGELOG.rst b/CHANGELOG.rst
+index 9fa2bf0..4405297 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -26,7 +26,7 @@ Deprecations:
+ Changes:
+ ^^^^^^^^
+ 
+-*none*
++- Added ``ARGON2_CFFI_USE_SSE2`` env variable to override SSE2 autodetection.
+ 
+ 
+ ----
+diff --git a/docs/installation.rst b/docs/installation.rst
+index 3ee9ccd..563c891 100644
+--- a/docs/installation.rst
++++ b/docs/installation.rst
+@@ -57,6 +57,16 @@ This approach can lead to problems around your build chain and you can run into
+ **It is your own responsibility to deal with these risks if you choose this path.**
+ 
+ 
++Override Automatic SSE2 Detection
++------------------------------------------
++
++If you set ``ARGON2_CFFI_USE_SSE2`` to ``1`` (and *only* ``1``), ``argon2-cffi`` will build with sse2 support.
++
++If you set ``ARGON2_CFFI_USE_SSE2`` to ``0`` (and *only* ``0``), ``argon2-cffi`` will build without sse2 support.
++
++This should generally only be used if the sse2 autodetection causes a compilation failure or if you are cross compiling.
++
++
+ .. _SSE2: https://en.wikipedia.org/wiki/SSE2
+ .. _PyPI: https://pypi.org/project/argon2-cffi/
+ .. _CFFI environment: https://cffi.readthedocs.io/en/latest/installation.html
+diff --git a/setup.py b/setup.py
+index e91e73a..c26a691 100644
+--- a/setup.py
++++ b/setup.py
+@@ -19,9 +19,15 @@ from setuptools.command.install import install
+ NAME = "argon2-cffi"
+ PACKAGES = find_packages(where="src")
+ 
+-# Optimized version requires SSE2 extensions.  They have been around since
+-# 2001 so we try to compile it on every recent-ish x86.
+-optimized = platform.machine() in ("i686", "x86", "x86_64", "AMD64")
++use_sse2 = os.environ.get("ARGON2_CFFI_USE_SSE2", None)
++if use_sse2 == "1":
++    optimized = True
++elif use_sse2 == "0":
++    optimized = False
++else:
++    # Optimized version requires SSE2 extensions.  They have been around since
++    # 2001 so we try to compile it on every recent-ish x86.
++    optimized = platform.machine() in ("i686", "x86", "x86_64", "AMD64")
+ 
+ CFFI_MODULES = ["src/argon2/_ffi_build.py:ffi"]
+ lib_base = os.path.join("extras", "libargon2", "src")
+-- 
+2.20.1
+
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index 099574e9c3..df1c1d51c6 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -12,4 +12,10 @@ PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
 PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi
 
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SSE2=1
+else
+PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SSE2=0
+endif
+
 $(eval $(python-package))
-- 
2.20.1
