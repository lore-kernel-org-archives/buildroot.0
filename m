From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 22:11:58 +0100
Subject: [Buildroot] [git commit] python-pyzmq: bump to version 16.0.2
Message-ID: <20170201211202.3453581F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c06aa42f7c1a0d22a3c816adacc25bb0b12d0179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated the zmq version detection patch to apply cleanly on 16.0.2.

Added patch #2 to replace compile_and_run with compile_and_forget in the setup
code: this function is only used to check for the availability of "sys/un.h" and
we only need to compile the test code to make sure of that. This fixes the
cross-compilation.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-buildroot-zmq-version-instead-of-detect.patch | 52 ++++++++-------
 ...e-compile_and_run-with-compile_and_forget.patch | 76 ++++++++++++++++++++++
 package/python-pyzmq/python-pyzmq.hash             |  5 +-
 package/python-pyzmq/python-pyzmq.mk               |  4 +-
 4 files changed, 111 insertions(+), 26 deletions(-)

diff --git a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
index 5606069..cb52eaf 100644
--- a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
+++ b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
@@ -5,39 +5,47 @@ retrieve a version string for the installed ZMQ library, but if the cross
 compiler links it together, the result cannot be run on the host, due to
 different architectures and libraries.
 
-And if the host compiler would compile/link it, it would not link with the
-library version inside buildroot but with the library from the host, possibly returning a wrong version number.
+And if the host compiler would compile/link it, it would not link with
+the library version inside buildroot but with the library from the
+host, possibly returning a wrong version number.
 
 Instead of trying to run the compiled test program to get the version
 dynamically, return the version of the buildroot environment.
 
-Signed-off-by: Michael Rommel <rommel@layer-7.net>
+Written by Michael Rommel, modified for version 16.0.2 by Lionel
+Flandrin.
 
---- pyzmq-13.0.2/buildutils/detect.py.orig	2013-08-10 00:49:28.242557978 +0200
-+++ pyzmq-13.0.2/buildutils/detect.py	2013-08-10 00:44:35.197572704 +0200
-@@ -119,15 +119,17 @@ def detect_zmq(basedir, compiler=None, *
-             
-     efile = test_compilation(cfile, compiler=compiler, **compiler_attrs)
+Signed-off-by: Lionel Flandrin <lionel@svkt.org>
+---
+ buildutils/detect.py | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/buildutils/detect.py b/buildutils/detect.py
+index 9520da7..823144f 100644
+--- a/buildutils/detect.py
++++ b/buildutils/detect.py
+@@ -117,13 +117,15 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
+     
+     cc = get_compiler(compiler=compiler, **compiler_attrs)
+     efile = test_compilation(cfile, compiler=cc)
+-    patch_lib_paths(efile, cc.library_dirs)
++    #patch_lib_paths(efile, cc.library_dirs)
      
--    result = Popen(efile, stdout=PIPE, stderr=PIPE)
--    so, se = result.communicate()
-+    # result = Popen(efile, stdout=PIPE, stderr=PIPE)
-+    # so, se = result.communicate()
-     # for py3k:
--    so = so.decode()
--    se = se.decode()
--    if result.returncode:
+-    rc, so, se = get_output_error([efile])
+-    if rc:
 -        msg = "Error running version detection script:\n%s\n%s" % (so,se)
 -        logging.error(msg)
 -        raise IOError(msg)
-+    #so = so.decode()
-+    #se = se.decode()
-+    #if result.returncode:
-+    #    msg = "Error running version detection script:\n%s\n%s" % (so,se)
-+    #    logging.error(msg)
-+    #    raise IOError(msg)
++    #rc, so, se = get_output_error([efile])
++    # if rc:
++    #     msg = "Error running version detection script:\n%s\n%s" % (so,se)
++    #     logging.error(msg)
++    #     raise IOError(msg)
 +
 +    so = "vers: ##ZEROMQ_VERSION##"
  
      handlers = {'vers':  lambda val: tuple(int(v) for v in val.split('.'))}
  
+-- 
+2.11.0
+
diff --git a/package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch b/package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch
new file mode 100644
index 0000000..278e939
--- /dev/null
+++ b/package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch
@@ -0,0 +1,76 @@
+detect.py: replace compile_and_run with compile_and_forget
+
+This function is only used in setup.py to detect the availability of
+sys/un.h by compiling and running a small test program. Since we're
+cross-compiling we can't run the generated program, however if the
+header is missing the test will fail at the compilation step so
+running the test in unnecessary.
+
+Signed-off-by: Lionel Flandrin <lionel@svkt.org>
+---
+ buildutils/detect.py | 16 ++++++++--------
+ setup.py             |  4 ++--
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/buildutils/detect.py b/buildutils/detect.py
+index 7a6c115..9520da7 100644
+--- a/buildutils/detect.py
++++ b/buildutils/detect.py
+@@ -58,7 +58,7 @@ def test_compilation(cfile, compiler=None, **compiler_attrs):
+     cc.link_executable(objs, efile, extra_preargs=lpreargs)
+     return efile
+ 
+-def compile_and_run(basedir, src, compiler=None, **compiler_attrs):
++def compile_and_forget(basedir, src, compiler=None, **compiler_attrs):
+     if not os.path.exists(basedir):
+         os.makedirs(basedir)
+     cfile = pjoin(basedir, os.path.basename(src))
+@@ -66,16 +66,16 @@ def compile_and_run(basedir, src, compiler=None, **compiler_attrs):
+     try:
+         cc = get_compiler(compiler, **compiler_attrs)
+         efile = test_compilation(cfile, compiler=cc)
+-        patch_lib_paths(efile, cc.library_dirs)
+-        result = Popen(efile, stdout=PIPE, stderr=PIPE)
+-        so, se = result.communicate()
+-        # for py3k:
+-        so = so.decode()
+-        se = se.decode()
++        # patch_lib_paths(efile, cc.library_dirs)
++        # result = Popen(efile, stdout=PIPE, stderr=PIPE)
++        # so, se = result.communicate()
++        # # for py3k:
++        # so = so.decode()
++        # se = se.decode()
+     finally:
+         shutil.rmtree(basedir)
+     
+-    return result.returncode, so, se
++    return None
+     
+     
+ def detect_zmq(basedir, compiler=None, **compiler_attrs):
+diff --git a/setup.py b/setup.py
+index c3a2879..b8b0aaf 100755
+--- a/setup.py
++++ b/setup.py
+@@ -54,7 +54,7 @@ from buildutils import (
+     info, warn, fatal, debug, line, copy_and_patch_libzmq, localpath,
+     fetch_libzmq, stage_platform_hpp,
+     bundled_version, customize_mingw,
+-    compile_and_run,
++    compile_and_forget,
+     patch_lib_paths,
+     )
+ 
+@@ -327,7 +327,7 @@ class Configure(build_ext):
+             except Exception:
+                 pass
+             try:
+-                compile_and_run(self.tempdir,
++                compile_and_forget(self.tempdir,
+                     pjoin('buildutils', 'check_sys_un.c'),
+                     **minus_zmq
+                 )
+-- 
+2.11.0
+
diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 9871ecd..6cdd0b9 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  00e263c26a524f81127247e6f37cbf427eddf3a3657d170cf4865bd522df3914  pyzmq-14.3.1.tar.gz
+# md5 from https://pypi.python.org/pypi/pyzmq/json, sha256 locally computed
+md5  9a8768b00a566a400d70318f8c359cfe  pyzmq-16.0.2.tar.gz
+sha256  0322543fff5ab6f87d11a8a099c4c07dd8a1719040084b6ce9162bcdf5c45c9d  pyzmq-16.0.2.tar.gz
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 0e787b1..ade2d3a 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 14.3.1
+PYTHON_PYZMQ_VERSION = 16.0.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = http://pypi.python.org/packages/source/p/pyzmq
+PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/af/37/8e0bf3800823bc247c36715a52e924e8f8fd5d1432f04b44b8cd7a5d7e55
 PYTHON_PYZMQ_LICENSE = LGPLv3+, BSD-3c, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
