From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 18:35:53 +0200
Subject: [Buildroot] [git commit] python: do not rely only on LIBRARY_PATH
	for old compilers
Message-ID: <20140420163847.BF84F9C8DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=616dd6245be75798fa6d9fd057a0fb5d7020dc97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cross-compilation improvements integrated in Python rely on the
compiler exposing a line starting with LIBRARY_PATH when called with
-E -v. This is used by Python setup.py to find the installation
locations of libraries.

However, this LIBRARY_PATH line is not shown by very old compilers,
such as the gcc 4.2.x compiler used on the AVR32 architecture. This
causes libraries installed in the sysroot, such as libffi, to not be
detected by the setup.py script.

To fix this problem, this patch adds addtional logic to setup.py,
which consists in deriving the library paths from the sysroot
location, if no LIBRARY_PATH field was found.

Fixes:

  http://autobuild.buildroot.org/results/1aa/1aad2d677dbf7b0a3cb0120a35f45123124f51ab/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...on-012-support-library-path-old-compilers.patch |   54 ++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/python/python-012-support-library-path-old-compilers.patch b/package/python/python-012-support-library-path-old-compilers.patch
new file mode 100644
index 0000000..6c48d1b
--- /dev/null
+++ b/package/python/python-012-support-library-path-old-compilers.patch
@@ -0,0 +1,54 @@
+python: do not rely only on LIBRARY_PATH for old compilers
+
+The cross-compilation improvements integrated in Python rely on the
+compiler exposing a line starting with LIBRARY_PATH when called with
+-E -v. This is used by Python setup.py to find the installation
+locations of libraries.
+
+However, this LIBRARY_PATH line is not shown by very old compilers,
+such as the gcc 4.2.x compiler used on the AVR32 architecture. This
+causes libraries installed in the sysroot, such as libffi, to not be
+detected by the setup.py script.
+
+To fix this problem, this patch adds addtional logic to setup.py,
+which consists in deriving the library paths from the sysroot
+location, if no LIBRARY_PATH field was found.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -416,6 +416,7 @@
+         in_incdirs = False
+         inc_dirs = []
+         lib_dirs = []
++        compiler_has_library_path = False
+         try:
+             if ret >> 8 == 0:
+                 with open(tmpfile) as fp:
+@@ -427,6 +428,7 @@
+                         elif line.startswith("End of search list"):
+                             in_incdirs = False
+                         elif is_gcc and line.startswith("LIBRARY_PATH"):
++                            compiler_has_library_path = True
+                             for d in line.strip().split("=")[1].split(":"):
+                                 d = os.path.normpath(d)
+                                 if '/gcc/' not in d:
+@@ -438,6 +440,15 @@
+         finally:
+             os.unlink(tmpfile)
+ 
++        if not compiler_has_library_path:
++            ret = os.system("%s -print-file-name=libc.a | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::' >%s" % (gcc, tmpfile))
++            with open(tmpfile) as fp:
++                line = fp.readline().strip()
++                add_dir_to_list(self.compiler.library_dirs,
++                                os.path.join(line, "usr", "lib"))
++                add_dir_to_list(self.compiler.library_dirs,
++                                os.path.join(line, "lib"))
++
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+         if not cross_compiling:
