From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:59:00 +0100
Subject: [Buildroot] [git commit] package/setools: drop path prefix from man
 install
Message-ID: <20181202071601.5C6197F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d68f3ba156074c5dc4bd96a19cb85ae8c5ae2754
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For this man file install scenario, joining the sys.prefix makes the
path absolute (this was previously working by accident).  It was
found when e94280e5a537b "package/pkg-python: use proper --prefix
and --root values" was merged.

Fixes:
http://autobuild.buildroot.net/results/e214e1a539cdac07028fb58c3822f89886d86f1f

Upstream:
https://github.com/SELinuxProject/setools/pull/13/commits/bc36cba1393120e65bfe4d0f642fd8d38010c0f7

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...etup.py-drop-path-prefix-from-man-install.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch b/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
new file mode 100644
index 0000000000..63344506b2
--- /dev/null
+++ b/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
@@ -0,0 +1,42 @@
+From bc36cba1393120e65bfe4d0f642fd8d38010c0f7 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Wed, 28 Nov 2018 20:49:00 -0600
+Subject: [PATCH] setup.py: drop path prefix from man install
+
+If the directory is a relative path, it is interpreted relative to the
+installation prefix (Python's sys.prefix for pure-Python packages,
+sys.exec_prefix for packages that contain extension modules).
+So the sys.prefix should not be joined because the correct one will be
+added regardless. The reason why a relative path is going to work is
+because the installation path is built internally joining python root
+with python prefix, thus forming the correct path $(TARGET_DIR)/usr.
+(https://docs.python.org/3/distutils/setupscript.html#installing-additional-files)
+
+For this man file install scenario, joining the sys.prefix makes the
+path absolute (this was previously working by accident).
+
+Upstream: https://github.com/SELinuxProject/setools/pull/13/commits/bc36cba1393120e65bfe4d0f642fd8d38010c0f7
+
+Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Cc: Arnout Vandecappelle <arnout@mind.be>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 3767fbc..80e0400 100644
+--- a/setup.py
++++ b/setup.py
+@@ -136,7 +136,7 @@ setup(name='setools',
+       cmdclass={'build_qhc': QtHelpCommand, 'clean': CleanCommand},
+       packages=['setools', 'setools.diff', 'setoolsgui', 'setoolsgui.apol'],
+       scripts=['apol', 'sediff', 'seinfo', 'seinfoflow', 'sesearch', 'sedta'],
+-      data_files=[(join(sys.prefix, 'share/man/man1'), glob.glob("man/*.1"))],
++      data_files=[('share/man/man1', glob.glob("man/*.1"))],
+       package_data={'': ['*.ui', '*.qhc', '*.qch'], 'setools': ['perm_map']},
+       ext_modules=cythonize(ext_py_mods, include_path=['setools/policyrep'],
+                             annotate=cython_annotate,
+-- 
+1.9.1
+
