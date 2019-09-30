From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:30:14 +0200
Subject: [Buildroot] [git commit] package/python-daphne: new package
Message-ID: <20190930192507.679BD83904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2319da688e6cb0fc186e76155d3686e4e54c9cff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Daphne is a HTTP, HTTP2 and WebSocket protocol server for ASGI and ASGI-HTTP,
developed to power Django Channels.

It supports automatic negotiation of protocols; there's no need for URL
prefixing to determine WebSocket endpoints versus HTTP endpoints.

In addition, add the patch: remove pytest-runner-requirement.
Setup and runtime work without without pytest-runner as such, it is not actually
a requirement for building.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas:
 - alphabetic ordering of select in Config.in
 - make the license more precise, as suggested by Yegor]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-remove-pytest-runner-requirement.patch    | 27 ++++++++++++++++++++++
 package/python-daphne/Config.in                    | 14 +++++++++++
 package/python-daphne/python-daphne.hash           |  5 ++++
 package/python-daphne/python-daphne.mk             | 15 ++++++++++++
 6 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8cbf55fd10..91aca14720 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -55,6 +55,7 @@ F:	package/php/
 F:	package/policycoreutils/
 F:	package/python3/
 F:	package/python-asgiref/
+F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
diff --git a/package/Config.in b/package/Config.in
index 713ef79edb..9ef203829c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -874,6 +874,7 @@ menu "External python modules"
 	source "package/python-cycler/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-daemonize/Config.in"
+	source "package/python-daphne/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
 	source "package/python-decorator/Config.in"
diff --git a/package/python-daphne/0001-remove-pytest-runner-requirement.patch b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
new file mode 100644
index 0000000000..c471d60e8c
--- /dev/null
+++ b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
@@ -0,0 +1,27 @@
+From f9d881cc55c89f51240f93308713216cfec793eb Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 3 Aug 2019 14:23:19 -0400
+Subject: [PATCH] remove pytest-runner requirement
+
+Setup does not actually require pytest-runner. As such, remove it.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 64e94f1..4e3abb0 100755
+--- a/setup.py
++++ b/setup.py
+@@ -23,7 +23,6 @@ setup(
+     packages=find_packages() + ["twisted.plugins"],
+     include_package_data=True,
+     install_requires=["twisted>=18.7", "autobahn>=0.18", "asgiref~=3.0"],
+-    setup_requires=["pytest-runner"],
+     extras_require={
+         "tests": ["hypothesis~=3.88", "pytest~=3.10", "pytest-asyncio~=0.8"]
+     },
+-- 
+2.21.0
+
diff --git a/package/python-daphne/Config.in b/package/python-daphne/Config.in
new file mode 100644
index 0000000000..d0510928ea
--- /dev/null
+++ b/package/python-daphne/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_DAPHNE
+	bool "python-daphne"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
+	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	help
+	  Daphne is a HTTP, HTTP2 and WebSocket protocol server for
+	  ASGI and ASGI-HTTP, developed to power Django Channels.
+	  It supports automatic negotiation of protocols; there's no
+	  need for URL prefixing to determine WebSocket endpoints
+	  versus HTTP endpoints.
+
+	  https://github.com/django/daphne
diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
new file mode 100644
index 0000000000..71439a77e1
--- /dev/null
+++ b/package/python-daphne/python-daphne.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/daphne/json
+md5	cac7352d0ebdde4f0cc245ae0b0682f8  daphne-2.3.0.tar.gz
+sha256	2329b7a74b5559f7ea012879c10ba945c3a53df7d8d2b5932a904e3b4c9abcc2  daphne-2.3.0.tar.gz
+# Locally computed sha256
+sha256 55d7d6117493d69de1c7c211b947b910a715030366f1b636d28cf6891dfc1f3d PKG-INFO
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
new file mode 100644
index 0000000000..278bfec29f
--- /dev/null
+++ b/package/python-daphne/python-daphne.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-daphne
+#
+################################################################################
+
+PYTHON_DAPHNE_VERSION = 2.3.0
+PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/7b/f1/994f55248e27059e160f9d07bf5d325a9891b99daf1eb775a14110e91e5b
+PYTHON_DAPHNE_SETUP_TYPE = setuptools
+# https://github.com/django/daphne/blob/master/LICENSE
+PYTHON_DAPHNE_LICENSE = BSD-3-Clause
+PYTHON_DAPHNE_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
