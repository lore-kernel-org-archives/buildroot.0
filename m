From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  7 Aug 2019 19:17:44 -0400
Subject: [Buildroot] [PATCH 3/3] package/uwsgi: add support for application
 types
In-Reply-To: <20190807231744.57150-1-aduskett@gmail.com>
References: <20190807231744.57150-1-aduskett@gmail.com>
Message-ID: <20190807231744.57150-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

uWSGI supports many different application types; two everyday use cases are
Python and PHP.

uWSGI requires Python to configure, build, and install, but it is not necessary
to run. Setting the package type to generic saves upwards of 29M of space with
a Glibc target filing system (52M vs. 23M.) If however, the primary application
type is Python, then the package is better suited to be a python-package because
there is no longer any space saved, Python is now on the target and staging
directories, and Buildroot can provide all of the necessary variables to
compile the Python plugin.

The "Main application type" prompt in the Config.in sets the main_plugin
variable in the buildroot.ini file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/uwsgi/Config.in        | 45 +++++++++++++++++++++++++------
 package/uwsgi/buildroot.ini.in |  2 +-
 package/uwsgi/uwsgi.mk         | 48 ++++++++++++++++++++++++++++------
 3 files changed, 78 insertions(+), 17 deletions(-)

diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
index 8b1082d06e..a1341f289e 100644
--- a/package/uwsgi/Config.in
+++ b/package/uwsgi/Config.in
@@ -1,15 +1,11 @@
 menuconfig BR2_PACKAGE_UWSGI
 	bool "uwsgi"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	depends on BR2_USE_MMU # python
-	depends on BR2_USE_WCHAR # python
-	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	# While it's possible to build uwsgi without PCRE, it would require not to
 	# build Python or PHP or several of the embedded plugins.
 	# The official documentation also recommends building PCRE support.
 	# https://uwsgi-docs.readthedocs.io/en/latest/SNI.html?highlight=sni-regexp
 	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	help
 	  The uWSGI server.
 	  The uWSGI project aims at developing a full stack for
@@ -24,7 +20,36 @@ menuconfig BR2_PACKAGE_UWSGI
 
 if BR2_PACKAGE_UWSGI
 
-comment "plugins"
+choice
+	prompt "Main application type"
+	default BR2_PACKAGE_UWSGI_APPLICATION_PHP
+	help
+	  Select the application type
+
+config BR2_PACKAGE_UWSGI_APPLICATION_PHP
+	bool "PHP"
+	depends on !BR2_BINFMT_FLAT # PHP
+	select BR2_PACKAGE_PHP # runtime
+	select BR2_PACKAGE_PHP_BUILD_SHARED_LIBRARY # linking
+	help
+	  Select this if your primary application is PHP based.
+
+config BR2_PACKAGE_UWSGI_APPLICATION_PYTHON
+	bool "Python"
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  Select this if your primary application is Python based.
+
+comment "uwsgi-python needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+endchoice
+
+comment "plugins with external dependencies"
 
 config BR2_PACKAGE_UWSGI_PLUGINS_CAPABILITIES
 	bool "POSIX capability support"
@@ -60,6 +85,10 @@ config BR2_PACKAGE_UWSGI_PLUGINS_YAML
 
 endif
 
-comment "uwsgi-python needs a toolchain w/ dynamic library, wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+config BR2_PACKAGE_UWSGI_MAIN_APPLICATION
+	string
+	default "php"  if BR2_PACKAGE_UWSGI_APPLICATION_PHP
+	default "python"  if BR2_PACKAGE_UWSGI_APPLICATION_PYTHON
+
+comment "uwsgi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/uwsgi/buildroot.ini.in b/package/uwsgi/buildroot.ini.in
index 75ad8afa32..e9074a3644 100644
--- a/package/uwsgi/buildroot.ini.in
+++ b/package/uwsgi/buildroot.ini.in
@@ -5,5 +5,5 @@ pcre = true
 ssl = false
 xml = false
 yaml = false
-main_plugin = python
+main_plugin = #MAIN_PLUGIN#
 plugin_dir = /usr/lib/uwsgi
diff --git a/package/uwsgi/uwsgi.mk b/package/uwsgi/uwsgi.mk
index 4441c94b16..95eec5284d 100644
--- a/package/uwsgi/uwsgi.mk
+++ b/package/uwsgi/uwsgi.mk
@@ -8,22 +8,16 @@ UWSGI_VERSION = 2.0.18
 UWSGI_SITE = $(call github,unbit,uwsgi,$(UWSGI_VERSION))
 UWSGI_LICENSE = GPL-2.0+
 UWSGI_LICENSE_FILES = LICENSE
-UWSGI_SETUP_TYPE = setuptools
-UWSGI_DEPENDENCIES += pcre
+UWSGI_DEPENDENCIES += host-python3 host-python3-setuptools pcre
 
 UWSGI_ENV += \
+	CC="$(TARGET_CC)" \
 	UWSGI_REMOVE_INCLUDES="/usr/include,/usr/local/include" \
 	UWSGI_INCLUDES="$(STAGING_DIR)/usr/include" \
 	PLUGIN_BASE_DIR="$(TARGET_DIR)" \
 	PCRE_CONFIG="$(STAGING_DIR)/usr/bin/pcre-config" \
 	UWSGI_PROFILE=$(@D)/buildroot.ini
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-UWSGI_DEPENDENCIES += python
-else
-UWSGI_DEPENDENCIES += python3
-endif
-
 ifeq ($(BR2_PACKAGE_LIBZLIB),y)
 UWSGI_DEPENDENCIES += libzlib
 endif
@@ -32,6 +26,24 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 UWSGI_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_UWSGI_APPLICATION_PHP),y)
+UWSGI_DEPENDENCIES += php
+UWSGI_ENV += \
+	UWSGICONFIG_PHPDIR="$(STAGING_DIR)/usr" \
+	UWSGICONFIG_PHPLIBDIR="$(STAGING_DIR)/usr/lib"
+endif
+
+# Set uWSGI to a python-package if the main application is also Python.
+ifeq ($(BR2_PACKAGE_UWSGI_APPLICATION_PYTHON),y)
+UWSGI_SETUP_TYPE = setuptools
+UWSGI_ENV += PYTHON_LIBDIR="$(STAGING_DIR)/usr/lib"
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+UWSGI_DEPENDENCIES += python
+else
+UWSGI_DEPENDENCIES += python3
+endif
+endif
+
 # Plugins
 ifeq ($(BR2_PACKAGE_UWSGI_PLUGINS_CAPABILITIES),y)
 UWSGI_DEPENDENCIES += libcap
@@ -81,7 +93,29 @@ define UWSGI_SETUP_PROFILE
 		$(eval value=$(shell echo $f | cut -d: -f 2)) \
 		$(SED) "s%$(option).*%$(option) = $(value)%g" $(@D)/buildroot.ini
 	)
+	$(SED) "s%#MAIN_PLUGIN#%$(BR2_PACKAGE_UWSGI_MAIN_APPLICATION)%g" $(@D)/buildroot.ini
+
 endef
 UWSGI_POST_PATCH_HOOKS = UWSGI_SETUP_PROFILE
 
+# Python is required to configure, build, and install uWsgi, but is C, as such,
+# Python is not a requirement. If the main application type is not Python, then
+# Python must be called out manually. However, if the main application is
+# Python, uWSGI can be setup as a python-package type.
+ifneq ($(BR2_PACKAGE_UWSGI_APPLICATION_PYTHON),y)
+define UWSGI_BUILD_CMDS
+	cd $(@D); \
+	$(TARGET_MAKE_ENV) $(UWSGI_ENV) $(HOST_DIR)/bin/python3 \
+		./setup.py build
+endef
+
+define UWSGI_INSTALL_TARGET_CMDS
+	cd $(@D); \
+	$(TARGET_MAKE_ENV) $(UWSGI_ENV) $(HOST_DIR)/bin/python3 \
+		./setup.py install $(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
+endef
+
+$(eval $(generic-package))
+else
 $(eval $(python-package))
+endif
-- 
2.21.0
