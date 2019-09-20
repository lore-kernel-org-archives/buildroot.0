From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 14:59:49 +0000
Subject: [Buildroot] [PATCH 2/2] package/python: allow to enable ssl support
 for host package too
In-Reply-To: <20190920145920.21999-1-nicolas.carrier@orolia.com>
References: <20190920145920.21999-1-nicolas.carrier@orolia.com>
Message-ID: <20190920145920.21999-2-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some python scripts may be ran in the custom scripts a user can define in the
config.
If any of those require ssl, they will fail with no possible fix.
This patch allows to enable ssl support for host python2 in the config,
defaulting to it being disable to conform to the previous behaviour.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/Config.in.host        |  1 +
 package/python/Config.in.host | 17 +++++++++++++++++
 package/python/python.mk      |  7 ++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 package/python/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 5767837a9a..100a3ecd1c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -51,6 +51,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
diff --git a/package/python/Config.in.host b/package/python/Config.in.host
new file mode 100644
index 0000000000..01d1a14620
--- /dev/null
+++ b/package/python/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HOST_PYTHON
+	bool "host python"
+	help
+	  The python language interpreter. Host package.
+
+	  http://www.python.org/
+
+if BR2_PACKAGE_HOST_PYTHON
+
+config BR2_PACKAGE_HOST_PYTHON_SSL
+	bool "ssl"
+	select BR2_PACKAGE_HOST_OPENSSL
+	help
+	  _ssl module for host Python.
+
+endif
+
diff --git a/package/python/python.mk b/package/python/python.mk
index d1e70a015a..e6c2cb0b22 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -32,7 +32,6 @@ HOST_PYTHON_CONF_OPTS += \
 	--disable-bsddb \
 	--disable-test-modules \
 	--disable-bz2 \
-	--disable-ssl \
 	--disable-ossaudiodev \
 	--disable-pyo-build
 
@@ -58,6 +57,12 @@ PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON_SSL),y)
+HOST_PYTHON_DEPENDENCIES += host-openssl
+else
+HOST_PYTHON_CONF_OPTS += --disable-ssl
+endif
+
 PYTHON_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
-- 
2.20.1
