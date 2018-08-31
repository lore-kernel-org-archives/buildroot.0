From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 31 Aug 2018 07:35:43 +0300
Subject: [Buildroot] [PATCH v2 1/1] python-pyzmq: bump to version 17.1.2
Message-ID: <20180831043543.6538-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust the first patch to the new version, and remove the second
patch since it's not needed anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
v1 -> v2: keep current existing log and sign-off, and add mine.

This patch should solve some of the build issues of pyzmq.
I didn't run it through all configs, but checked locally on some.
---
 ...ldroot-zmq-version-instead-of-detect.patch | 11 ++-
 ...pile_and_run-with-compile_and_forget.patch | 76 -------------------
 package/python-pyzmq/python-pyzmq.hash        |  4 +-
 package/python-pyzmq/python-pyzmq.mk          |  4 +-
 4 files changed, 11 insertions(+), 84 deletions(-)
 delete mode 100644 package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch

diff --git a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
index cb52eaf6de..461ef4e5fe 100644
--- a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
+++ b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
@@ -15,19 +15,22 @@ dynamically, return the version of the buildroot environment.
 Written by Michael Rommel, modified for version 16.0.2 by Lionel
 Flandrin.
 
+Modified for version 17.1.2 by Asaf Kahlon.
+
 Signed-off-by: Lionel Flandrin <lionel@svkt.org>
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 ---
  buildutils/detect.py | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/buildutils/detect.py b/buildutils/detect.py
-index 9520da7..823144f 100644
+index cb14a8d..b33a3b5 100644
 --- a/buildutils/detect.py
 +++ b/buildutils/detect.py
-@@ -117,13 +117,15 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
+@@ -116,13 +116,15 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
      
      cc = get_compiler(compiler=compiler, **compiler_attrs)
-     efile = test_compilation(cfile, compiler=cc)
+     efile = test_compilation(cfile, compiler=cc, **compiler_attrs)
 -    patch_lib_paths(efile, cc.library_dirs)
 +    #patch_lib_paths(efile, cc.library_dirs)
      
@@ -47,5 +50,5 @@ index 9520da7..823144f 100644
      handlers = {'vers':  lambda val: tuple(int(v) for v in val.split('.'))}
  
 -- 
-2.11.0
+2.17.1
 
diff --git a/package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch b/package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch
deleted file mode 100644
index 278e939e0e..0000000000
--- a/package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-detect.py: replace compile_and_run with compile_and_forget
-
-This function is only used in setup.py to detect the availability of
-sys/un.h by compiling and running a small test program. Since we're
-cross-compiling we can't run the generated program, however if the
-header is missing the test will fail at the compilation step so
-running the test in unnecessary.
-
-Signed-off-by: Lionel Flandrin <lionel@svkt.org>
----
- buildutils/detect.py | 16 ++++++++--------
- setup.py             |  4 ++--
- 2 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/buildutils/detect.py b/buildutils/detect.py
-index 7a6c115..9520da7 100644
---- a/buildutils/detect.py
-+++ b/buildutils/detect.py
-@@ -58,7 +58,7 @@ def test_compilation(cfile, compiler=None, **compiler_attrs):
-     cc.link_executable(objs, efile, extra_preargs=lpreargs)
-     return efile
- 
--def compile_and_run(basedir, src, compiler=None, **compiler_attrs):
-+def compile_and_forget(basedir, src, compiler=None, **compiler_attrs):
-     if not os.path.exists(basedir):
-         os.makedirs(basedir)
-     cfile = pjoin(basedir, os.path.basename(src))
-@@ -66,16 +66,16 @@ def compile_and_run(basedir, src, compiler=None, **compiler_attrs):
-     try:
-         cc = get_compiler(compiler, **compiler_attrs)
-         efile = test_compilation(cfile, compiler=cc)
--        patch_lib_paths(efile, cc.library_dirs)
--        result = Popen(efile, stdout=PIPE, stderr=PIPE)
--        so, se = result.communicate()
--        # for py3k:
--        so = so.decode()
--        se = se.decode()
-+        # patch_lib_paths(efile, cc.library_dirs)
-+        # result = Popen(efile, stdout=PIPE, stderr=PIPE)
-+        # so, se = result.communicate()
-+        # # for py3k:
-+        # so = so.decode()
-+        # se = se.decode()
-     finally:
-         shutil.rmtree(basedir)
-     
--    return result.returncode, so, se
-+    return None
-     
-     
- def detect_zmq(basedir, compiler=None, **compiler_attrs):
-diff --git a/setup.py b/setup.py
-index c3a2879..b8b0aaf 100755
---- a/setup.py
-+++ b/setup.py
-@@ -54,7 +54,7 @@ from buildutils import (
-     info, warn, fatal, debug, line, copy_and_patch_libzmq, localpath,
-     fetch_libzmq, stage_platform_hpp,
-     bundled_version, customize_mingw,
--    compile_and_run,
-+    compile_and_forget,
-     patch_lib_paths,
-     )
- 
-@@ -327,7 +327,7 @@ class Configure(build_ext):
-             except Exception:
-                 pass
-             try:
--                compile_and_run(self.tempdir,
-+                compile_and_forget(self.tempdir,
-                     pjoin('buildutils', 'check_sys_un.c'),
-                     **minus_zmq
-                 )
--- 
-2.11.0
-
diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 6cdd0b9f18..eb8cf0923b 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pyzmq/json, sha256 locally computed
-md5  9a8768b00a566a400d70318f8c359cfe  pyzmq-16.0.2.tar.gz
-sha256  0322543fff5ab6f87d11a8a099c4c07dd8a1719040084b6ce9162bcdf5c45c9d  pyzmq-16.0.2.tar.gz
+md5  6f5d77cb5ec1617ce9b6e5ad7c6174fb  pyzmq-17.1.2.tar.gz
+sha256  a72b82ac1910f2cf61a49139f4974f994984475f771b0faa730839607eeedddf  pyzmq-17.1.2.tar.gz
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index c34c5af265..1f7cb5d613 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 16.0.2
+PYTHON_PYZMQ_VERSION = 17.1.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/af/37/8e0bf3800823bc247c36715a52e924e8f8fd5d1432f04b44b8cd7a5d7e55
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/b9/6a/bc9277b78f5c3236e36b8c16f4d2701a7fd4fa2eb697159d3e0a3a991573
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-- 
2.17.1
