From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 23 Nov 2019 12:20:32 -0800
Subject: [Buildroot] [PATCH v2 1/3] uwsgi: new package
In-Reply-To: <20191123202034.1397950-1-aduskett@gmail.com>
References: <20191123202034.1397950-1-aduskett@gmail.com>
Message-ID: <20191123202034.1397950-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The uWSGI project aims at developing a full stack for building hosting services.
Application servers (for various programming languages and protocols), proxies,
process managers and monitors are all implemented using a common API and a
standard configuration style. Thanks to its pluggable architecture, it can be
extended to support more platforms and languages.

There are five patches currently required to properly cross-compile uWSGI, all
but one of which are pending upstream:

1) add-plugin_base_dir-variable.patch
  - uWSGI appends the full path of the plugin directory to the binary when
    compiling, which results in plugins failing to load on the target filing
    system.

2) add-a-xml2_config-environment-variable-for-cross-co.patch
  - uWSGI calls out to xml2-config with no way to define a path for xml2-config,
    thus resulting in the hosts xml2-config cflags and library paths used, add
    the XML2_CONFIG environment variable which overwrites the default
    xml2-config path.

3) add-a-pcre_config-environment-variable-for-cross-co.patch
  - This patch is the same as the above, except the variable name is
    PCRE_CONFIG.

4) adjust-python-library-header-paths-for-cross-compila.patch
  - uWSGI calls sysconfig.get_config_var('LIBDIR') which return the host header
    and library paths. To fix this, prefix the LIBDIR path with _python_sysroot
    taken from the sysconfigdata module.

5) fix-building-with-uClibc.patch
  - There are two issues building uwsgi with uClibc:
    1) core/uwsgi.c includes <execinfo.h> when __GLIBC__  is defined, but does
       not check if __UCLIBC__ is also defined.
    2) plugins/router_basicauth/router_basicauth.c checks if __GLIBC__ is
       defined for <crypt.h> and to enable a workaround for a bug in
       Glibc-2.2.5, both of which do not apply to uClibc. Adding a check for
       __UCLIBC__ for both of these conditions fixes the issue.

Even though PCRE is not technically required, the official documentation
recommends always building with PCRE support, and many of the embedded plugins
require PCRE to be present. As such, PCRE is set as a dependency.
https://uwsgi-docs.readthedocs.io/en/latest/SNI.html?highlight=sni-regexp

The "Main application type" prompt in the Config.in is to set the main_plugin
variable in the buildroot.ini file.

There is a "buildroot.ini.in" file which is used to overwrite the default
settings in buildconf/base.ini. The following settings that explicitly set:
 - json: Allow a config file to be in JSON format
 - pcre: Explicitly set to True
 - ssl: Allow SSL connections
 - xml: Allow a config file to be in XML format.
 - yaml: Allow a config file to be in YAML format.
 - main_plugin: Set to Python.
 - plugin_dir: The plugin directory for the target.

The .ini file does not have a standard value for each option; because of this,
each option is a key/value pair with a colon set as a delimiter. A for loop
set's each setting appropriately by splitting the key/value into two variables
and running SED against the .ini file.

Tested with every option enabled:

br-arm-full [1/6]: OK
br-arm-cortex-a9-glibc [2/6]: OK
br-arm-cortex-m4-full [3/6]: SKIPPED
br-x86-64-musl [4/6]: OK
br-arm-full-static [5/6]: SKIPPED
sourcery-arm [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-add-plugin_base_dir-variable.patch   |  47 ++++++++
 ...ig-environment-variable-for-cross-co.patch |  60 +++++++++++
 ...ig-environment-variable-for-cross-co.patch |  58 ++++++++++
 ...brary-header-paths-for-cross-compila.patch |  34 ++++++
 .../uwsgi/0005-fix-building-with-uClibc.patch |  61 +++++++++++
 package/uwsgi/Config.in                       |  65 ++++++++++++
 package/uwsgi/buildroot.ini.in                |   9 ++
 package/uwsgi/uwsgi.hash                      |   3 +
 package/uwsgi/uwsgi.mk                        | 100 ++++++++++++++++++
 11 files changed, 439 insertions(+)
 create mode 100644 package/uwsgi/0001-add-plugin_base_dir-variable.patch
 create mode 100644 package/uwsgi/0002-add-a-xml2_config-environment-variable-for-cross-co.patch
 create mode 100644 package/uwsgi/0003-add-a-pcre_config-environment-variable-for-cross-co.patch
 create mode 100644 package/uwsgi/0004-adjust-python-library-header-paths-for-cross-compila.patch
 create mode 100644 package/uwsgi/0005-fix-building-with-uClibc.patch
 create mode 100644 package/uwsgi/Config.in
 create mode 100644 package/uwsgi/buildroot.ini.in
 create mode 100644 package/uwsgi/uwsgi.hash
 create mode 100644 package/uwsgi/uwsgi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 991be89849..19fbf6254d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -74,6 +74,7 @@ F:	package/semodule-utils/
 F:	package/setools/
 F:	package/sngrep/
 F:	package/systemd/
+F:	package/uwsgi/
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/package/Config.in b/package/Config.in
index f72c77b416..53a01fbe08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2129,6 +2129,7 @@ endif
 	source "package/vpnc/Config.in"
 	source "package/vsftpd/Config.in"
 	source "package/vtun/Config.in"
+	source "package/uwsgi/Config.in"
 	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
diff --git a/package/uwsgi/0001-add-plugin_base_dir-variable.patch b/package/uwsgi/0001-add-plugin_base_dir-variable.patch
new file mode 100644
index 0000000000..ace1df09a4
--- /dev/null
+++ b/package/uwsgi/0001-add-plugin_base_dir-variable.patch
@@ -0,0 +1,47 @@
+From 2b15d1c4d48a431a92d76486818a84d9653e549b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Mon, 29 Jan 2018 11:40:52 -0500
+Subject: [PATCH] add plugin_base_dir variable
+
+Currently, when cross-compiling, if the plugin_dir points to the target
+directory, uwsgi will embed the full path during compiling.
+This whole path results in uwsgi trying to load a full target path instead of
+/usr/lib/uwsgi when running on the target.
+
+Creating a new PLUGIN_BASE_DIR variable and prefixing plugin_dir allows the
+plugin to be installed to the appropriate directory but still have uwsgi load
+the plugins from the correct folder when ran from on the cross-compiled target.
+
+Current status: Pending
+https://github.com/unbit/uwsgi/pull/2052
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
++PLUGIN_BASE_DIR = os.environ.get('PLUGIN_BASE_DIR', '')
+ PY3 = sys.version_info[0] == 3
+ 
+ if uwsgi_os == 'Darwin':
+@@ -1435,7 +1435,7 @@ def build_plugin(path, uc, cflags, ldflags, libs, name = None):
+         pass
+ 
+     if uc:
+-        plugin_dest = uc.get('plugin_build_dir', uc.get('plugin_dir')) + '/' + name + '_plugin'
++        plugin_dest = PLUGIN_BASE_DIR + uc.get('plugin_build_dir', uc.get('plugin_dir')) + '/' + name + '_plugin'
+     else:
+         plugin_dest = name + '_plugin'
+ 
+-- 
+2.14.3
+
diff --git a/package/uwsgi/0002-add-a-xml2_config-environment-variable-for-cross-co.patch b/package/uwsgi/0002-add-a-xml2_config-environment-variable-for-cross-co.patch
new file mode 100644
index 0000000000..014494e5cb
--- /dev/null
+++ b/package/uwsgi/0002-add-a-xml2_config-environment-variable-for-cross-co.patch
@@ -0,0 +1,60 @@
+From b98241acc633396dc7f4ab9e4153af552ac6d4a0 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 3 Aug 2019 14:59:18 -0400
+Subject: [PATCH] add a XML2_CONFIG environment variable for cross-compiling
+
+Currently, xml2-config is called out with no way to define an xml2-config path,
+which causes uwsgi to use the host xml2-config which will cause the xml2
+library and CFlag directories to point to the host instead of
+the cross-environment.
+
+Add a check for the XML2_CONFIG environment variable, and if it exists, use the
+resulting path instead.
+
+Current-status: pending
+https://github.com/unbit/uwsgi/pull/2050
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ uwsgiconfig.py | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/uwsgiconfig.py b/uwsgiconfig.py
+index 22c9dd3..26403f1 100644
+--- a/uwsgiconfig.py
++++ b/uwsgiconfig.py
+@@ -1303,12 +1303,13 @@ class uConf(object):
+                 self.gcc_list.append('core/legion')
+                 report['ssl'] = True
+ 
++        xml2config = os.environ.get('XML2_CONFIG','xml2-config')
+         if self.get('xml'):
+             if self.get('xml') == 'auto':
+-                xmlconf = spcall('xml2-config --libs')
++                xmlconf = spcall(xml2config + ' --libs')
+                 if xmlconf and uwsgi_os != 'Darwin':
+                     self.libs.append(xmlconf)
+-                    xmlconf = spcall("xml2-config --cflags")
++                    xmlconf = spcall(xml2config + " --cflags")
+                     self.cflags.append(xmlconf)
+                     self.cflags.append("-DUWSGI_XML -DUWSGI_XML_LIBXML2")
+                     self.gcc_list.append('core/xmlconf')
+@@ -1319,13 +1320,13 @@ class uConf(object):
+                     self.gcc_list.append('core/xmlconf')
+                     report['xml'] = 'expat'
+             elif self.get('xml') == 'libxml2':
+-                xmlconf = spcall('xml2-config --libs')
++                xmlconf = spcall(xml2config + ' --libs')
+                 if xmlconf is None:
+                     print("*** libxml2 headers unavailable. uWSGI build is interrupted. You have to install libxml2 development package or use libexpat or disable XML")
+                     sys.exit(1)
+                 else:
+                     self.libs.append(xmlconf)
+-                    xmlconf = spcall("xml2-config --cflags")
++                    xmlconf = spcall(xml2config + " --cflags")
+                     if xmlconf is None:
+                         print("*** libxml2 headers unavailable. uWSGI build is interrupted. You have to install libxml2 development package or use libexpat or disable XML")
+                         sys.exit(1)
+-- 
+2.21.0
+
diff --git a/package/uwsgi/0003-add-a-pcre_config-environment-variable-for-cross-co.patch b/package/uwsgi/0003-add-a-pcre_config-environment-variable-for-cross-co.patch
new file mode 100644
index 0000000000..88fca366b4
--- /dev/null
+++ b/package/uwsgi/0003-add-a-pcre_config-environment-variable-for-cross-co.patch
@@ -0,0 +1,58 @@
+From 170cbd7226c1a0774da3c19733c2f473befc8eed Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 3 Aug 2019 15:32:41 -0400
+Subject: [PATCH] Add a PCRE_CONFIG environment variable for cross-compiling
+
+Currently, pcre-config is called out with no way to define a pcre-config path,
+which causes uwsgi to use the host pcre-config, which will cause the pcre
+library and cflag directories to point to the host.
+
+Add a check for the PCRE_CONFIG environment variable, and if it exists,
+use the resulting path instead.
+
+upstream-status: pending
+https://github.com/unbit/uwsgi/pull/2051
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ uwsgiconfig.py | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/uwsgiconfig.py b/uwsgiconfig.py
+index 26403f1..b800cdb 100644
+--- a/uwsgiconfig.py
++++ b/uwsgiconfig.py
+@@ -1072,25 +1072,26 @@ class uConf(object):
+         has_pcre = False
+ 
+         # re-enable after pcre fix
++        pcreconfig = os.environ.get('PCRE_CONFIG','pcre-config')
+         if self.get('pcre'):
+             if self.get('pcre') == 'auto':
+-                pcreconf = spcall('pcre-config --libs')
++                pcreconf = spcall(pcreconfig + ' --libs')
+                 if pcreconf:
+                     self.libs.append(pcreconf)
+-                    pcreconf = spcall("pcre-config --cflags")
++                    pcreconf = spcall(pcreconfig + ' --cflags')
+                     self.cflags.append(pcreconf)
+                     self.gcc_list.append('core/regexp')
+                     self.cflags.append("-DUWSGI_PCRE")
+                     has_pcre = True
+ 
+             else:
+-                pcreconf = spcall('pcre-config --libs')
++                pcreconf = spcall(pcreconfig + ' --libs')
+                 if pcreconf is None:
+                     print("*** libpcre headers unavailable. uWSGI build is interrupted. You have to install pcre development package or disable pcre")
+                     sys.exit(1)
+                 else:
+                     self.libs.append(pcreconf)
+-                    pcreconf = spcall("pcre-config --cflags")
++                    pcreconf = spcall(pcreconfig + ' --cflags')
+                     self.cflags.append(pcreconf)
+                     self.gcc_list.append('core/regexp')
+                     self.cflags.append("-DUWSGI_PCRE")
+-- 
+2.21.0
+
diff --git a/package/uwsgi/0004-adjust-python-library-header-paths-for-cross-compila.patch b/package/uwsgi/0004-adjust-python-library-header-paths-for-cross-compila.patch
new file mode 100644
index 0000000000..9eb39b1212
--- /dev/null
+++ b/package/uwsgi/0004-adjust-python-library-header-paths-for-cross-compila.patch
@@ -0,0 +1,34 @@
+From 8bf43f727d34619773d826357f49e172876f8a30 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 3 Aug 2019 17:12:09 -0400
+Subject: [PATCH] Adjust python library/header paths for cross-compilation
+
+uWSGI calls sysconfig.get_config_var('LIBDIR') which return the host header and
+library paths.
+
+To fix this, prefix the LIBDIR path with _python_sysroot taken
+from the sysconfigdata module.
+
+upstream status: Not submitted, Buildroot specific.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ plugins/python/uwsgiplugin.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/plugins/python/uwsgiplugin.py b/plugins/python/uwsgiplugin.py
+index 843876f..a74de7d 100644
+--- a/plugins/python/uwsgiplugin.py
++++ b/plugins/python/uwsgiplugin.py
+@@ -52,6 +52,8 @@ if not 'UWSGI_PYTHON_NOLIB' in os.environ:
+     else:
+         try:
+             libdir = sysconfig.get_config_var('LIBDIR')
++            if "_python_sysroot" in os.environ:
++                libdir = os.environ.get("_python_sysroot") + libdir
+         except:
+             libdir = "%s/lib" % sysconfig.PREFIX
+ 
+-- 
+2.21.0
+
diff --git a/package/uwsgi/0005-fix-building-with-uClibc.patch b/package/uwsgi/0005-fix-building-with-uClibc.patch
new file mode 100644
index 0000000000..1f546fa412
--- /dev/null
+++ b/package/uwsgi/0005-fix-building-with-uClibc.patch
@@ -0,0 +1,61 @@
+From 98c616be6bb745cc5178de3b1a3a84d1f86d6e34 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Wed, 7 Aug 2019 15:10:46 -0400
+Subject: [PATCH] fix building with uClibc
+
+There are two issues building uwsgi with uClibc:
+1) core/uwsgi.c includes <execinfo.h> when __GLIBC__  is defined, but does not
+check if __UCLIBC__ is also defined.
+
+2) plugins/router_basicauth/router_basicauth.c checks if __GLIBC__ is defined
+for <crypt.h> and to enable a workaround for a bug in glibc-2.2.5, both of which
+do not apply to uClibc.
+Add a check for __UCLIBC__ for both of these conditions.
+
+Upstream status: Merged.
+https://github.com/unbit/uwsgi/pull/2054
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ core/uwsgi.c                                | 2 +-
+ plugins/router_basicauth/router_basicauth.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/core/uwsgi.c b/core/uwsgi.c
+index ef9e310..523bf45 100644
+--- a/core/uwsgi.c
++++ b/core/uwsgi.c
+@@ -1820,7 +1820,7 @@ void uwsgi_plugins_atexit(void) {
+ 
+ void uwsgi_backtrace(int depth) {
+ 
+-#if defined(__GLIBC__) || (defined(__APPLE__) && !defined(NO_EXECINFO)) || defined(UWSGI_HAS_EXECINFO)
++#if (!defined(__UCLIBC__) && defined __GLIBC__) || (defined(__APPLE__) && !defined(NO_EXECINFO)) || defined(UWSGI_HAS_EXECINFO)
+ 
+ #include <execinfo.h>
+ 
+diff --git a/plugins/router_basicauth/router_basicauth.c b/plugins/router_basicauth/router_basicauth.c
+index 429bade..0b7161e 100644
+--- a/plugins/router_basicauth/router_basicauth.c
++++ b/plugins/router_basicauth/router_basicauth.c
+@@ -3,7 +3,7 @@
+ #ifdef UWSGI_ROUTING
+ 
+ // TODO: Add more crypt_r supported platfroms here
+-#if defined(__linux__) && defined(__GLIBC__)
++#if defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__)
+ #include <crypt.h>
+ #elif defined(__CYGWIN__)
+ #include <crypt.h>
+@@ -67,7 +67,7 @@ static uint16_t htpasswd_check(char *filename, char *auth) {
+ 
+ 		if (clen > 13) cpwd[13] = 0;
+ 
+-#if defined(__linux__) && defined(__GLIBC__)
++#if defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__)
+ 		struct crypt_data cd;
+ 		memset(&cd, 0, sizeof(struct crypt_data));
+     /* work around glibc-2.2.5 bug,
+-- 
+2.21.0
+
diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
new file mode 100644
index 0000000000..f0de3093a4
--- /dev/null
+++ b/package/uwsgi/Config.in
@@ -0,0 +1,65 @@
+menuconfig BR2_PACKAGE_UWSGI
+	bool "uwsgi"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
+	# While it's possible to build uwsgi without PCRE, it would require not to
+	# build Python or PHP or several of the embedded plugins.
+	# The official documentation also recommends building PCRE support.
+	# https://uwsgi-docs.readthedocs.io/en/latest/SNI.html?highlight=sni-regexp
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  The uWSGI server.
+	  The uWSGI project aims at developing a full stack for
+	  building hosting services. Application servers
+	  (for various programming languages and protocols), proxies,
+	  process managers and monitors are all implemented using a
+	  common API and a standard configuration style. Thanks to
+	  its pluggable architecture, it can be extended to support
+	  more platforms and languages.
+
+	  https://uwsgi-docs.readthedocs.io/en/latest/
+
+if BR2_PACKAGE_UWSGI
+
+comment "plugins"
+
+config BR2_PACKAGE_UWSGI_PLUGINS_CAPABILITIES
+	bool "POSIX capability support"
+	select BR2_PACKAGE_LIBCAP
+	help
+	  POSIX capabilities allow fine-grained permissions for
+	  processes. In addition to the standard UNIX permission scheme,
+	  they define a new set of privileges for system resources.
+
+config BR2_PACKAGE_UWSGI_PLUGINS_JSON
+	bool "JSON"
+	select BR2_PACKAGE_JANSSON if !BR2_PACKAGE_YAJL
+	help
+	  Load the config from a json file.
+
+config BR2_PACKAGE_UWSGI_PLUGINS_SSL
+	bool "SSL"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  SSL Support
+
+config BR2_PACKAGE_UWSGI_PLUGINS_XML
+	bool "XML"
+	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
+	help
+	  Load the config from a XML file.
+
+config BR2_PACKAGE_UWSGI_PLUGINS_YAML
+	bool "YAML"
+	select BR2_PACKAGE_LIBYAML
+	help
+	  Load the config from a YAML file.
+
+endif
+
+comment "uwsgi needs a toolchain w/ dynamic library, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/uwsgi/buildroot.ini.in b/package/uwsgi/buildroot.ini.in
new file mode 100644
index 0000000000..75ad8afa32
--- /dev/null
+++ b/package/uwsgi/buildroot.ini.in
@@ -0,0 +1,9 @@
+[uwsgi]
+inherit = base
+json = false
+pcre = true
+ssl = false
+xml = false
+yaml = false
+main_plugin = python
+plugin_dir = /usr/lib/uwsgi
diff --git a/package/uwsgi/uwsgi.hash b/package/uwsgi/uwsgi.hash
new file mode 100644
index 0000000000..bbdfe3b9ea
--- /dev/null
+++ b/package/uwsgi/uwsgi.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	4972ac538800fb2d421027f49b4a1869b66048839507ccf0aa2fda792d99f583  uwsgi-2.0.18.tar.gz
+sha256	ca495399f5da3ce2724649b47eb118f7549344ba58c0cf350d94c3390e435897  LICENSE
diff --git a/package/uwsgi/uwsgi.mk b/package/uwsgi/uwsgi.mk
new file mode 100644
index 0000000000..add75c04b9
--- /dev/null
+++ b/package/uwsgi/uwsgi.mk
@@ -0,0 +1,100 @@
+################################################################################
+#
+# uwsgi
+#
+################################################################################
+
+UWSGI_VERSION = 2.0.18
+UWSGI_SITE = $(call github,unbit,uwsgi,$(UWSGI_VERSION))
+UWSGI_LICENSE = GPL-2.0+
+UWSGI_LICENSE_FILES = LICENSE
+UWSGI_DEPENDENCIES += pcre
+
+UWSGI_ENV += \
+	CC="$(TARGET_CC)" \
+	UWSGI_REMOVE_INCLUDES="/usr/include,/usr/local/include" \
+	UWSGI_INCLUDES="$(STAGING_DIR)/usr/include" \
+	PLUGIN_BASE_DIR="$(TARGET_DIR)" \
+	PCRE_CONFIG="$(STAGING_DIR)/usr/bin/pcre-config" \
+	UWSGI_PROFILE=$(@D)/buildroot.ini \
+	PYTHON_LIBDIR="$(STAGING_DIR)/usr/lib"
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+UWSGI_DEPENDENCIES += host-python host-python-setuptools python
+else
+UWSGI_DEPENDENCIES += host-python3 host-python3-setuptools python3
+endif
+
+ifeq ($(BR2_PACKAGE_LIBZLIB),y)
+UWSGI_DEPENDENCIES += libzlib
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+UWSGI_DEPENDENCIES += util-linux
+endif
+
+# Plugins
+ifeq ($(BR2_PACKAGE_UWSGI_PLUGINS_CAPABILITIES),y)
+UWSGI_DEPENDENCIES += libcap
+endif
+
+# The uwsgi config.ini file does not use the same values for every option.
+# Use a key/value with a colon as a delimiter to set the appropriate setting.
+ifeq ($(BR2_PACKAGE_UWSGI_PLUGINS_JSON),y)
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+UWSGI_DEPENDENCIES += jansson
+UWSGI_INI_OPTS += "json:jansson"
+else
+UWSGI_DEPENDENCIES += yajl
+UWSGI_INI_OPTS += "json:yajl"
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_UWSGI_PLUGINS_SSL),y)
+UWSGI_DEPENDENCIES += openssl
+UWSGI_INI_OPTS += "ssl:true"
+endif
+
+ifeq ($(BR2_PACKAGE_UWSGI_PLUGINS_XML),y)
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+UWSGI_DEPENDENCIES += libxml2
+UWSGI_INI_OPTS += "xml:libxml2"
+UWSGI_ENV += XML2_CONFIG="$(STAGING_DIR)/usr/bin/xml2-config"
+else
+UWSGI_DEPENDENCIES += expat
+UWSGI_INI_OPTS += "xml:expat"
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_UWSGI_PLUGINS_YAML),y)
+UWSGI_DEPENDENCIES += libyaml
+UWSGI_INI_OPTS += "yaml:libyaml"
+endif
+
+define UWSGI_SETUP_PROFILE
+	mkdir -p $(TARGET_DIR)/usr/lib/uwsgi
+
+	$(INSTALL) -D -m 755 $(UWSGI_PKGDIR)/buildroot.ini.in \
+		$(@D)/buildroot.ini
+
+	$(foreach f,$(UWSGI_INI_OPTS), \
+		$(eval option=$(shell echo $f | cut -d: -f 1)) \
+		$(eval value=$(shell echo $f | cut -d: -f 2)) \
+		$(SED) "s%$(option).*%$(option) = $(value)%g" $(@D)/buildroot.ini
+	)
+endef
+UWSGI_POST_PATCH_HOOKS = UWSGI_SETUP_PROFILE
+
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
-- 
2.23.0
