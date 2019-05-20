From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:39:53 +0200
Subject: [Buildroot] [git commit branch/next] package/python-matplotlib: new
 package
Message-ID: <20190520094924.9BF098149A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d80339c9659aa0fe3cac14fd9b599bad3c191aac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Matplotlib is a Python 2D plotting library
which produces publication quality figures
in a variety of hardcopy formats and interactive
environments across platforms.

More information is available at:
https://matplotlib.org/.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
[Peter: use Python-2.0 for license, fix license file, add host-pkgconf]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Fix-invalid-inclusion-headers.patch       | 29 ++++++++++++++++++++++
 package/python-matplotlib/Config.in                | 22 ++++++++++++++++
 package/python-matplotlib/python-matplotlib.hash   |  4 +++
 package/python-matplotlib/python-matplotlib.mk     | 16 ++++++++++++
 6 files changed, 73 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0962ef2c8d..94df850814 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1229,6 +1229,7 @@ F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 F:	package/python-cycler/
+F:	package/python-matplotlib/
 
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
diff --git a/package/Config.in b/package/Config.in
index 28e52a5eba..9e0624935f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -933,6 +933,7 @@ menu "External python modules"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
+	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-meld3/Config.in"
 	source "package/python-mimeparse/Config.in"
diff --git a/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch b/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
new file mode 100644
index 0000000000..b10bfb326f
--- /dev/null
+++ b/package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
@@ -0,0 +1,29 @@
+From b0232c3cf1051749dd1e2bd0ec7c5c0a3a008d2f Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Thu, 9 May 2019 15:06:36 +0200
+Subject: [PATCH] Fix invalid inclusion headers
+
+By default, matplotlib includes headers from host
+machine which breaks the build process.
+
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+---
+ python-matplotlib-3.0.3/setupext.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setupext.py b/setupext.py
+index fc82d5d..eb978d2 100644
+--- a/setupext.py
++++ b/setupext.py
+@@ -267,7 +267,7 @@ def get_base_dirs():
+         'gnu0': ['/usr'],
+         'aix5': ['/usr/local'],
+         }
+-    return basedir_map.get(sys.platform, ['/usr/local', '/usr'])
++    return basedir_map.get(sys.platform, [])
+ 
+ 
+ def get_include_dirs():
+-- 
+2.7.4
+
diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
new file mode 100644
index 0000000000..7f775ea2fc
--- /dev/null
+++ b/package/python-matplotlib/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PYTHON_MATPLOTLIB
+	bool "python-matplotlib"
+	depends on !BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_FREETYPE # runtime
+	select BR2_PACKAGE_LIBPNG # runtime
+	select BR2_PACKAGE_PYTHON_CYCLER
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	select BR2_PACKAGE_ZLIB # runtime
+	help
+	  Matplotlib strives to produce publication
+	  quality 2D graphics for interactive graphing,
+	  scientific publishing, user interface
+	  development and web application servers targeting
+	  multiple user interfaces and hardcopy output
+	  formats.
+
+	  https://matplotlib.org/
diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
new file mode 100644
index 0000000000..ccb22eefa5
--- /dev/null
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/project/matplotlib/#files
+sha256	e1d33589e32f482d0a7d1957bf473d43341115d40d33f578dad44432e47df7b7  matplotlib-3.0.3.tar.gz
+# Locally computed sha256 checksums
+sha256	5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
new file mode 100644
index 0000000000..7082637d09
--- /dev/null
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-matplotlib
+#
+################################################################################
+
+PYTHON_MATPLOTLIB_VERSION = 3.0.3
+PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/26/04/8b381d5b166508cc258632b225adbafec49bbe69aa9a4fa1f1b461428313
+PYTHON_MATPLOTLIB_LICENSE = Python-2.0
+PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
+PYTHON_MATPLOTLIB_DEPENDENCIES = host-pkgconf freetype host-python-numpy \
+	libpng python-cycler
+PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
