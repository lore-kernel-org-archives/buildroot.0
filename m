From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sun, 17 Mar 2019 20:05:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-redis: new package
In-Reply-To: <20190317190540.22423-1-grzegorz@blach.pl>
References: <20190317190540.22423-1-grzegorz@blach.pl>
Message-ID: <20190317190540.22423-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Python interface to the Redis key-value store.

https://github.com/andymccurdy/redis-py

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-redis/Config.in         |  6 ++++++
 package/python-redis/python-redis.hash |  5 +++++
 package/python-redis/python-redis.mk   | 18 ++++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-redis/Config.in
 create mode 100644 package/python-redis/python-redis.hash
 create mode 100644 package/python-redis/python-redis.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d0b29ce2cf..b9eee9720b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -940,6 +940,7 @@ F:	package/python-falcon/
 F:	package/python-hiredis/
 F:	package/python-mimeparse/
 F:	package/python-pigpio/
+F:	package/python-redis/
 F:	package/python-wtforms/
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
diff --git a/package/Config.in b/package/Config.in
index 52f55c63df..26325fe7e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1011,6 +1011,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-raven/Config.in"
+	source "package/python-redis/Config.in"
 	source "package/python-reentry/Config.in"
 	source "package/python-remi/Config.in"
 	source "package/python-request-id/Config.in"
diff --git a/package/python-redis/Config.in b/package/python-redis/Config.in
new file mode 100644
index 0000000000..4143e1f1c1
--- /dev/null
+++ b/package/python-redis/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_REDIS
+	bool "python-redis"
+	help
+	  Python client for Redis key-value store.
+
+	  https://github.com/andymccurdy/redis-py
diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
new file mode 100644
index 0000000000..2c47881c7f
--- /dev/null
+++ b/package/python-redis/python-redis.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/redis/json
+md5	7ca3cb7a2a71f376fc235590ec7056f8  redis-3.2.1.tar.gz
+sha256	8ca418d2ddca1b1a850afa1680a7d2fd1f3322739271de4b704e0d4668449273  redis-3.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256	790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
new file mode 100644
index 0000000000..7bef7c2723
--- /dev/null
+++ b/package/python-redis/python-redis.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-redis
+#
+################################################################################
+
+PYTHON_REDIS_VERSION = 3.2.1
+PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/24/d4/06486dee0f66ef8c5080dc576fdfb33131fd2e0be3747f2be4e5634088a2
+PYTHON_REDIS_SETUP_TYPE = setuptools
+PYTHON_REDIS_LICENSE = MIT
+PYTHON_REDIS_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_PYTHON_HIREDIS),y)
+PYTHON_REDIS_DEPENDENCIES += python-hiredis
+endif
+
+$(eval $(python-package))
-- 
2.20.1
