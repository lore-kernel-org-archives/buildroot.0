From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:00:37 +0200
Subject: [Buildroot] [git commit] package/python-channels-redis: new package
Message-ID: <20190930195555.5134E839DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4b8a4786ec396244e37a27dce1173e23ca17cee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A Django Channels channel layer that uses Redis as its backing store,
and supports both a single-server and sharded configurations, as well
as group support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas:
 - alphabetic ordering of selects in Config.in
 - drop redis dependency
 - add missing python3 dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-channels-redis/Config.in                  | 13 +++++++++++++
 package/python-channels-redis/python-channels-redis.hash |  5 +++++
 package/python-channels-redis/python-channels-redis.mk   | 15 +++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 78538f10b9..ac73c7daa5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -57,6 +57,7 @@ F:	package/python3/
 F:	package/python-aioredis/
 F:	package/python-asgiref/
 F:	package/python-channels/
+F:	package/python-channels-redis/
 F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
diff --git a/package/Config.in b/package/Config.in
index 5324220f29..4d8fce21c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -854,6 +854,7 @@ menu "External python modules"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-channels/Config.in"
+	source "package/python-channels-redis/Config.in"
 	source "package/python-characteristic/Config.in"
 	source "package/python-chardet/Config.in"
 	source "package/python-cheetah/Config.in"
diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
new file mode 100644
index 0000000000..d2d8a4707a
--- /dev/null
+++ b/package/python-channels-redis/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
+	bool "python-channels-redis"
+	depends on BR2_PACKAGE_PYTHON3 # python-channels
+	select BR2_PACKAGE_PYTHON_AIOREDIS # runtime
+	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
+	select BR2_PACKAGE_PYTHON_CHANNELS # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
+	help
+	  A Django Channels channel layer that uses Redis as its
+	  backing store, and supports both a single-server and
+	  sharded configurations, as well as group support.
+
+	  http://github.com/django/channels_redis/
diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
new file mode 100644
index 0000000000..155091933b
--- /dev/null
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/channels_redis/json
+md5	d060c96cc53c6b2c3f93df4d7aefecf3  channels_redis-2.4.0.tar.gz
+sha256	b7ccbcb2fd4e568c08c147891b26db59aa25d88b65af826ce7f70c815cfb91bc  channels_redis-2.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
new file mode 100644
index 0000000000..d56f403a7c
--- /dev/null
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-channels-redis
+#
+################################################################################
+
+PYTHON_CHANNELS_REDIS_VERSION = 2.4.0
+PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/79/20/896a5246ef703a74dd0af6e46038eb7838d801e532cf25474d2580f09d3e
+PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
+PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
+PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
+PYTHON_CHANNELS_REDIS_DEPENDENCIES = redis
+
+$(eval $(python-package))
