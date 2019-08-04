From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:16:31 -0400
Subject: [Buildroot] [PATCH 08/08] package/python-channels-redis: new package
In-Reply-To: <20190804011631.86261-1-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
Message-ID: <20190804011631.86261-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

A Django Channels channel layer that uses Redis as its backing store, and
supports both a single-server and sharded configurations, as well as group
support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                      |  1 +
 package/Config.in                               |  1 +
 package/python-channels-redis/Config.in         | 17 +++++++++++++++++
 .../python-channels-redis.hash                  |  5 +++++
 .../python-channels-redis.mk                    | 15 +++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/python-channels-redis/Config.in
 create mode 100644 package/python-channels-redis/python-channels-redis.hash
 create mode 100644 package/python-channels-redis/python-channels-redis.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fdd8427673..e937f6c196 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -60,6 +60,7 @@ F:	package/python3/
 F:	package/python-aioredis/
 F:	package/python-asgiref/
 F:	package/python-channels/
+F:	package/python-channels-redis/
 F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
diff --git a/package/Config.in b/package/Config.in
index a63b2e41b4..1b3fb4788d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -852,6 +852,7 @@ menu "External python modules"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-channels/Config.in"
+	source "package/python-channels-redis/Config.in"
 	source "package/python-characteristic/Config.in"
 	source "package/python-chardet/Config.in"
 	source "package/python-cheetah/Config.in"
diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
new file mode 100644
index 0000000000..75b90837e5
--- /dev/null
+++ b/package/python-channels-redis/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
+	bool "python-channels-redis"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # redis
+	select BR2_PACKAGE_PYTHON_AIOREDIS # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
+	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
+	select BR2_PACKAGE_PYTHON_CHANNELS # runtime
+	select BR2_PACKAGE_REDIS
+	help
+	  A Django Channels channel layer that uses Redis as its
+	  backing store, and supports both a single-server and
+	  sharded configurations, as well as group support.
+
+	  http://github.com/django/channels_redis/
+
+comment "python-channels-redis needs a toolchain w/ atomic"
+	depends on !BR2_TOOLCHAIN_HAS_ATOMIC
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
-- 
2.21.0
