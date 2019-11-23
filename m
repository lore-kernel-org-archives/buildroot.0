From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 23 Nov 2019 12:20:34 -0800
Subject: [Buildroot] [PATCH v2 3/3] package/uwsgi: add support for
 application types
In-Reply-To: <20191123202034.1397950-1-aduskett@gmail.com>
References: <20191123202034.1397950-1-aduskett@gmail.com>
Message-ID: <20191123202034.1397950-4-aduskett@gmail.com>
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
 package/uwsgi/Config.in        | 45 ++++++++++++++++++++++++++++------
 package/uwsgi/buildroot.ini.in |  2 +-
 package/uwsgi/uwsgi.mk         | 26 ++++++++++++++------
 3 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
index f0de3093a4..a1341f289e 100644
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
 
-comment "uwsgi needs a toolchain w/ dynamic library, wchar, threads"
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
index add75c04b9..7186a78088 100644
--- a/package/uwsgi/uwsgi.mk
+++ b/package/uwsgi/uwsgi.mk
@@ -16,14 +16,7 @@ UWSGI_ENV += \
 	UWSGI_INCLUDES="$(STAGING_DIR)/usr/include" \
 	PLUGIN_BASE_DIR="$(TARGET_DIR)" \
 	PCRE_CONFIG="$(STAGING_DIR)/usr/bin/pcre-config" \
-	UWSGI_PROFILE=$(@D)/buildroot.ini \
-	PYTHON_LIBDIR="$(STAGING_DIR)/usr/lib"
-
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-UWSGI_DEPENDENCIES += host-python host-python-setuptools python
-else
-UWSGI_DEPENDENCIES += host-python3 host-python3-setuptools python3
-endif
+	UWSGI_PROFILE=$(@D)/buildroot.ini
 
 ifeq ($(BR2_PACKAGE_LIBZLIB),y)
 UWSGI_DEPENDENCIES += libzlib
@@ -33,6 +26,22 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 UWSGI_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_UWSGI_APPLICATION_PHP),y)
+UWSGI_DEPENDENCIES += php
+UWSGI_ENV += \
+	UWSGICONFIG_PHPDIR="$(STAGING_DIR)/usr" \
+	UWSGICONFIG_PHPLIBDIR="$(STAGING_DIR)/usr/lib"
+endif
+
+ifeq ($(BR2_PACKAGE_UWSGI_APPLICATION_PYTHON),y)
+UWSGI_ENV += PYTHON_LIBDIR="$(STAGING_DIR)/usr/lib"
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+UWSGI_DEPENDENCIES += host-python host-python-setuptools python
+else
+UWSGI_DEPENDENCIES += host-python3 host-python3-setuptools python3
+endif
+endif
+
 # Plugins
 ifeq ($(BR2_PACKAGE_UWSGI_PLUGINS_CAPABILITIES),y)
 UWSGI_DEPENDENCIES += libcap
@@ -82,6 +91,7 @@ define UWSGI_SETUP_PROFILE
 		$(eval value=$(shell echo $f | cut -d: -f 2)) \
 		$(SED) "s%$(option).*%$(option) = $(value)%g" $(@D)/buildroot.ini
 	)
+	$(SED) "s%#MAIN_PLUGIN#%$(BR2_PACKAGE_UWSGI_MAIN_APPLICATION)%g" $(@D)/buildroot.ini
 endef
 UWSGI_POST_PATCH_HOOKS = UWSGI_SETUP_PROFILE
 
-- 
2.23.0
