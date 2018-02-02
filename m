From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  2 Feb 2018 09:06:01 -0500
Subject: [Buildroot] [PATCH v2 3/3] uwsgi: add plugin support
In-Reply-To: <20180202140601.21285-1-aduskett@gmail.com>
References: <20180202140601.21285-1-aduskett@gmail.com>
Message-ID: <20180202140601.21285-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To add plugin support, a new patch 0004-add-plugin_base_dir-variable.patch adds
a PLUGIN_DIR_BASE variable to uwsgiconfig.py

Currently, uwsgiconfig.py sets the plugin_dir to the full target directory
path, which embeds the path into the uwsgi binary. This results in uwsgi
trying to load output/target/usr/lib/uwsgi/ instead of
/usr/lib/uwsgi when running on the target.

Creating a new PLUGIN_BASE_DIR variable and attaching it to the plugin_dir
allows the plugin to be installed to the appropriate directory but still
have uwsgi load the plugins from the correct folder when ran from the target.

Also introduced is buildroot.ini.in, this is a base configuration file that
uwsgi uses to build plugins at the end of the build step.

Currently, the only two plugins that have been added and have been tested are
PHP and PAM. However, this sets up the framework to add more the future as
needed.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Changed python-uwsgi to just uwsgi as this isn't a python module.
  - Added missing menuconfig change in Config.in
  - Changed 0003-add-plugin_base_dir-variable.patch to
    0004-add-plugin_base_dir-variable.patch because of the new
    0001-Add-fallthrough-comments.patch.
  - Changed the wording of the commit message to be more clear as to why the
    new patch is needed and to be more grammatically correct. 

 .../uwsgi/0004-add-plugin_base_dir-variable.patch  | 45 ++++++++++++++++++++++
 package/uwsgi/Config.in                            | 19 ++++++++-
 package/uwsgi/buildroot.ini.in                     |  6 +++
 package/uwsgi/uwsgi.mk                             | 27 ++++++++++++-
 4 files changed, 95 insertions(+), 2 deletions(-)
 create mode 100644 package/uwsgi/0004-add-plugin_base_dir-variable.patch
 create mode 100644 package/uwsgi/buildroot.ini.in

diff --git a/package/uwsgi/0004-add-plugin_base_dir-variable.patch b/package/uwsgi/0004-add-plugin_base_dir-variable.patch
new file mode 100644
index 0000000000..90e9f71bce
--- /dev/null
+++ b/package/uwsgi/0004-add-plugin_base_dir-variable.patch
@@ -0,0 +1,45 @@
+From 2b15d1c4d48a431a92d76486818a84d9653e549b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Mon, 29 Jan 2018 11:40:52 -0500
+Subject: [PATCH] add plugin_base_dir variable
+
+Currently, if the plugin_dir is set to the target directory, uwsgi will
+embed the full path during compiling. This results in uwsgi trying to load
+output/target/usr/lib/uwsgi/ instead of /usr/lib/uwsgi when running on the 
+target.
+
+Creating a new PLUGIN_BASE_DIR variable and attaching it to the plugin_dir 
+allows the plugin to be installed to the appropriate directory but still
+have uwsgi load the plugins from the correct folder when ran from the
+target.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ uwsgiconfig.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/uwsgiconfig.py b/uwsgiconfig.py
+index 0c33491..5b356ec 100644
+--- a/uwsgiconfig.py
++++ b/uwsgiconfig.py
+@@ -27,7 +27,7 @@ try:
+ except:
+     import configparser as ConfigParser
+ 
+-
++plugindir_base = os.environ.get('PLUGIN_DIR_BASE', '/')
+ PY3 = sys.version_info[0] == 3
+ 
+ if uwsgi_os == 'Darwin':
+@@ -1425,7 +1425,7 @@ def build_plugin(path, uc, cflags, ldflags, libs, name = None):
+         pass
+ 
+     if uc:
+-        plugin_dest = uc.get('plugin_build_dir', uc.get('plugin_dir')) + '/' + name + '_plugin'
++        plugin_dest = plugindir_base + uc.get('plugin_build_dir', uc.get('plugin_dir')) + '/' + name + '_plugin'
+     else:
+         plugin_dest = name + '_plugin'
+ 
+-- 
+2.14.3
+
diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
index 96e7bc13c2..fa63842e72 100644
--- a/package/uwsgi/Config.in
+++ b/package/uwsgi/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_UWSGI
+menuconfig BR2_PACKAGE_UWSGI
 	bool "uwsgi"
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
@@ -15,6 +15,23 @@ config BR2_PACKAGE_UWSGI
 	  The uWSGI server.
 	  https://uwsgi-docs.readthedocs.io/en/latest/
 
+if BR2_PACKAGE_UWSGI
+
+comment "plugins"
+
+config BR2_PACKAGE_UWSGI_PAM
+	bool "pam"
+	depends on BR2_ENABLE_LOCALE
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LINUX_PAM
+
+config BR2_PACKAGE_UWSGI_PHP
+	bool "php"
+	select BR2_PACKAGE_PHP
+	select BR2_PACKAGE_PHP_ENABLE_EMBED
+
+endif
+
 comment "uwsgi needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/uwsgi/buildroot.ini.in b/package/uwsgi/buildroot.ini.in
new file mode 100644
index 0000000000..b83e765f42
--- /dev/null
+++ b/package/uwsgi/buildroot.ini.in
@@ -0,0 +1,6 @@
+[uwsgi]
+main_plugin =
+inherit = base
+embedded_plugins = null
+plugin_dir = /usr/lib/uwsgi
+plugins = 
diff --git a/package/uwsgi/uwsgi.mk b/package/uwsgi/uwsgi.mk
index f63b37816e..6f063ca263 100644
--- a/package/uwsgi/uwsgi.mk
+++ b/package/uwsgi/uwsgi.mk
@@ -22,10 +22,35 @@ UWSGI_ENV += \
 	UWSGI_REMOVE_INCLUDES="/usr/include,/usr/local/include" \
 	UWSGI_INCLUDES="$(STAGING_DIR)/usr/include" \
 	XML2_CONFIG="$(STAGING_DIR)/usr/bin/xml2-config" \
-	UWSGICONFIG_PHPDIR=$(STAGING_DIR)/usr
+	UWSGICONFIG_PHPDIR=$(STAGING_DIR)/usr \
+	PLUGIN_DIR_BASE="$(TARGET_DIR)" \
+	UWSGI_PROFILE=$(@D)/buildroot.ini
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
     UWSGI_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_UWSGI_PAM),y)
+UWSGI_DEPENDENCIES += linux-pam
+UWSGI_PLUGINS += pam
+endif
+
+ifeq ($(BR2_PACKAGE_UWSGI_PHP),y)
+UWSGI_DEPENDENCIES += php
+UWSGI_PLUGINS += php
+endif
+
+define UWSGI_SETUP_PROFILE
+	$(INSTALL) -D -m 755 package/uwsgi/buildroot.ini.in \
+		$(@D)/buildroot.ini
+	mkdir -p $(TARGET_DIR)/usr/lib/uwsgi
+	$(foreach f,$(UWSGI_PLUGINS), \
+		echo "    $(f)," >> $(@D)/buildroot.ini
+	)
+	# Remove the trailing comma in buildroot.ini.
+	# This prevents uwsgi from trying to compile a blank plugin.
+	$(SED) '$$ s/.$$//' $(@D)/buildroot.ini
+endef
+UWSGI_POST_PATCH_HOOKS = UWSGI_SETUP_PROFILE
+
 $(eval $(python-package))
-- 
2.14.3
