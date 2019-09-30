From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:44:47 +0200
Subject: [Buildroot] [git commit] package/python-channels: new package
Message-ID: <20190930195117.BAA23839D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e019c3afb02c218ba29522ac131a8ecb7aaf3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Channels augments Django to bring WebSocket, long-poll HTTP, task
offloading and other async support to your code, using familiar Django
design patterns and a flexible underlying framework that lets you not
only customize behaviours but also write support for your own
protocols and needs.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas:
 - alphabetic ordering of selects in Config.in
 - add missing BR2_PACKAGE_PYTHON3 dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-channels/Config.in            | 15 +++++++++++++++
 package/python-channels/python-channels.hash |  5 +++++
 package/python-channels/python-channels.mk   | 14 ++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 71b1b2b6eb..78538f10b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -56,6 +56,7 @@ F:	package/policycoreutils/
 F:	package/python3/
 F:	package/python-aioredis/
 F:	package/python-asgiref/
+F:	package/python-channels/
 F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
diff --git a/package/Config.in b/package/Config.in
index 91f5bb736d..5324220f29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -853,6 +853,7 @@ menu "External python modules"
 	source "package/python-cchardet/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
+	source "package/python-channels/Config.in"
 	source "package/python-characteristic/Config.in"
 	source "package/python-chardet/Config.in"
 	source "package/python-cheetah/Config.in"
diff --git a/package/python-channels/Config.in b/package/python-channels/Config.in
new file mode 100644
index 0000000000..45c9dcc246
--- /dev/null
+++ b/package/python-channels/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_CHANNELS
+	bool "python-channels"
+	depends on BR2_PACKAGE_PYTHON3 # python-daphne
+	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
+	select BR2_PACKAGE_PYTHON_DAPHNE # runtime
+	select BR2_PACKAGE_PYTHON_DJANGO # runtime
+	help
+	  Channels augments Django to bring WebSocket, long-poll
+	  HTTP, task offloading and other async support to your
+	  code, using familiar Django design patterns and a
+	  flexible underlying framework that lets you not only
+	  customize behaviours but also write support for your
+	  own protocols and needs.
+
+	  http://github.com/django/channels
diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
new file mode 100644
index 0000000000..539589e433
--- /dev/null
+++ b/package/python-channels/python-channels.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/channels/json
+md5	aec056cf4d0fa6444b3d83ccd5885fc5  channels-2.2.0.tar.gz
+sha256	af7cdba9efb3f55b939917d1b15defb5d40259936013e60660e5e9aff98db4c5  channels-2.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
new file mode 100644
index 0000000000..a0f4591f76
--- /dev/null
+++ b/package/python-channels/python-channels.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-channels
+#
+################################################################################
+
+PYTHON_CHANNELS_VERSION = 2.2.0
+PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/26/b9/92c803f3e8e304efbfbcd0634d4a5ad2d231f515b968f1b9e7c84ee78012
+PYTHON_CHANNELS_SETUP_TYPE = setuptools
+PYTHON_CHANNELS_LICENSE = BSD-3-Clause
+PYTHON_CHANNELS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
