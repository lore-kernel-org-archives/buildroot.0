From: Rohan Fletcher <rohfledev@gmail.com>
Date: Sat, 20 Jul 2013 22:27:13 +1200
Subject: [Buildroot] [PATCH 2/3] python: added hidden openssl option to host
	python
In-Reply-To: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
References: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
Message-ID: <1374316034-31973-2-git-send-email-rohfledev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

used by python-pip to use https to download packages

Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
---
 package/python/Config.in |  6 ++++++
 package/python/python.mk | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index cfe73db..0740ef0 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -101,6 +101,12 @@ config BR2_PACKAGE_PYTHON_HASHLIB
 	help
 	  hashlib support in Python
 
+config BR2_HOST_PYTHON_SSL_SUPPORT
+	bool
+	help
+	  Includes ssl support in host python build. 
+	  This is disabled by default to reduce build time.
+
 endmenu
 
 endif
diff --git a/package/python/python.mk b/package/python/python.mk
index ecea638..4bd9da1 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -31,8 +31,11 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-gdbm		\
 	--disable-bsddb		\
 	--disable-test-modules	\
-	--disable-bz2		\
-	--disable-ssl
+	--disable-bz2		
+
+ifneq ($(BR2_HOST_PYTHON_SSL_SUPPORT), y)
+HOST_PYTHON_CONF_OPT += --disable-ssl
+endif
 
 HOST_PYTHON_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
@@ -51,6 +54,10 @@ HOST_PYTHON_MAKE = $(MAKE1)
 PYTHON_DEPENDENCIES  = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
+ 
+ifeq ($(BR2_HOST_PYTHON_SSL_SUPPORT), y)
+HOST_PYTHON_DEPENDENCIES += host-openssl
+endif
 
 PYTHON_INSTALL_STAGING = YES
 
-- 
1.8.1.2
