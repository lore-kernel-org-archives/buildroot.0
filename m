From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:46:13 +0200
Subject: [Buildroot] [git commit] python,
	python3: add patch to prevent distutils from adjusting the shebang
Message-ID: <20140921174754.478049D6A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edab68c1f1eb285c08ac6f82031622001ad40896
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The copy_scripts() method in distutils copies the scripts listed
in the setup file and adjusts the first line to refer to the
current Python interpreter. When cross-compiling, this means that
the adjusted shebang refers to the host Python interpreter.

As a consequence, we add a patch for python and python3 that
force copy_scripts() to preserve the shebang when
cross-compilation is detected.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...017-distutils-scripts-dont-adjust-shebang.patch |   25 ++++++++++++++++++++
 ...015-distutils-scripts-dont-adjust-shebang.patch |   25 ++++++++++++++++++++
 2 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/python/python-017-distutils-scripts-dont-adjust-shebang.patch b/package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
new file mode 100644
index 0000000..da4dc36
--- /dev/null
+++ b/package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
@@ -0,0 +1,25 @@
+Do not adjust the shebang of Python scripts for cross-compilation
+
+The copy_scripts() method in distutils copies the scripts listed in
+the setup file and adjusts the first line to refer to the current
+Python interpreter. When cross-compiling, this means that the adjusted
+shebang refers to the host Python interpreter.
+
+This patch modifies copy_scripts() to preserve the shebang when
+cross-compilation is detected.
+
+Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+
+Index: b/Lib/distutils/command/build_scripts.py
+===================================================================
+--- a/Lib/distutils/command/build_scripts.py
++++ b/Lib/distutils/command/build_scripts.py
+@@ -89,7 +89,7 @@
+                     adjust = 1
+                     post_interp = match.group(1) or ''
+ 
+-            if adjust:
++            if adjust and not '_python_sysroot' in os.environ:
+                 log.info("copying and adjusting %s -> %s", script,
+                          self.build_dir)
+                 if not self.dry_run:
diff --git a/package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch b/package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch
new file mode 100644
index 0000000..ed2f193
--- /dev/null
+++ b/package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch
@@ -0,0 +1,25 @@
+Do not adjust the shebang of Python scripts for cross-compilation
+
+The copy_scripts() method in distutils copies the scripts listed in
+the setup file and adjusts the first line to refer to the current
+Python interpreter. When cross-compiling, this means that the adjusted
+shebang refers to the host Python interpreter.
+
+This patch modifies copy_scripts() to preserve the shebang when
+cross-compilation is detected.
+
+Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+
+Index: b/Lib/distutils/command/build_scripts.py
+===================================================================
+--- a/Lib/distutils/command/build_scripts.py
++++ b/Lib/distutils/command/build_scripts.py
+@@ -91,7 +91,7 @@
+                     adjust = True
+                     post_interp = match.group(1) or b''
+ 
+-            if adjust:
++            if adjust and not '_python_sysroot' in os.environ:
+                 log.info("copying and adjusting %s -> %s", script,
+                          self.build_dir)
+                 updated_files.append(outfile)
