From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 14:59:39 +0000
Subject: [Buildroot] [PATCH 1/2] package/python3: allow to enable ssl
 support for host package too
Message-ID: <20190920145920.21999-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some python scripts may be ran in the custom scripts a user can define in the
config.
If any of those require ssl, they will fail with no possible fix.
This patch allows to enable ssl support for host python3 in the config,
defaulting to it being disable to conform to the previous behaviour.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/Config.in.host         |  1 +
 package/python3/Config.in.host | 17 +++++++++++++++++
 package/python3/python3.mk     |  9 +++++++--
 3 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 package/python3/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 93822304e9..5767837a9a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -55,6 +55,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
+	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
new file mode 100644
index 0000000000..45ac33456e
--- /dev/null
+++ b/package/python3/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HOST_PYTHON3
+	bool "host python3"
+	help
+	  The python language interpreter. Host package.
+
+	  http://www.python.org/
+
+if BR2_PACKAGE_HOST_PYTHON3
+
+config BR2_PACKAGE_HOST_PYTHON3_SSL
+	bool "ssl"
+	select BR2_PACKAGE_HOST_OPENSSL
+	help
+	  _ssl module for host Python3.
+
+endif
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8e6a0296ed..cb944de216 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -26,8 +26,7 @@ HOST_PYTHON3_CONF_OPTS += \
 	--enable-unicodedata \
 	--disable-test-modules \
 	--disable-idle3 \
-	--disable-ossaudiodev \
-	--disable-openssl
+	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
@@ -42,6 +41,12 @@ PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
+HOST_PYTHON3_DEPENDENCIES += host-openssl
+else
+HOST_PYTHON3_CONF_OPTS += --disable-openssl
+endif
+
 PYTHON3_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
-- 
2.20.1
