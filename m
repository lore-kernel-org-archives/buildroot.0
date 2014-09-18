From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 18 Sep 2014 12:00:51 +0200
Subject: [Buildroot] [PATCH v2 1/5] python,
	python3: add patch to prevent distutils from adjusting the shebang
In-Reply-To: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1411034455-19670-2-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The copy_scripts() method in distutils copies the scripts listed
in the setup file and adjusts the first line to refer to the
current Python interpreter. When cross-compiling, this means that
the adjusted shebang refers to the host Python interpreter.

As a consequence, we add a patch for python and python3 that
force copy_scripts() to preserve the shebang when
cross-compilation is detected.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 ...017-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++++++++++++
 ...015-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
 create mode 100644 package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch

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
-- 
2.1.0
