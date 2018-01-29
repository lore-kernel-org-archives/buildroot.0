From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 29 Jan 2018 12:58:43 -0500
Subject: [Buildroot] [PATCH 1/3] python-uwsgi: new package
Message-ID: <20180129175845.23586-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python-uwsgi is a web server gateway interface written in python that is
meant to be flexible and plugin oriented.

To get it to cross compile, 2 small patches had to be created:

The first fixes the build system attempting to link against /usr/lib
instead of sysconfig.PREFIX.

The second adds a way to specify a location for xml2-config, as the
build-system currently just blindly calls out xml2-config which
can be on the host machine.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-set-libdir-to-sysconfig-PREFIX.patch      | 32 +++++++++++++
 package/python-uwsgi/0002-fix-libxml2-paths.patch  | 54 ++++++++++++++++++++++
 package/python-uwsgi/Config.in                     | 10 ++++
 package/python-uwsgi/python-uwsgi.hash             |  4 ++
 package/python-uwsgi/python-uwsgi.mk               | 26 +++++++++++
 7 files changed, 128 insertions(+)
 create mode 100644 package/python-uwsgi/0001-set-libdir-to-sysconfig-PREFIX.patch
 create mode 100644 package/python-uwsgi/0002-fix-libxml2-paths.patch
 create mode 100644 package/python-uwsgi/Config.in
 create mode 100644 package/python-uwsgi/python-uwsgi.hash
 create mode 100644 package/python-uwsgi/python-uwsgi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 73c0231bc0..7b2735be41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -52,6 +52,7 @@ F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/python-uwsgi/
 F:	package/restorecond/
 F:	package/refpolicy/
 F:	package/selinux-python/
diff --git a/package/Config.in b/package/Config.in
index 00451f526d..7b041f79a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -934,6 +934,7 @@ menu "External python modules"
 	source "package/python-ujson/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
+	source "package/python-uwsgi/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
diff --git a/package/python-uwsgi/0001-set-libdir-to-sysconfig-PREFIX.patch b/package/python-uwsgi/0001-set-libdir-to-sysconfig-PREFIX.patch
new file mode 100644
index 0000000000..b5881e80f5
--- /dev/null
+++ b/package/python-uwsgi/0001-set-libdir-to-sysconfig-PREFIX.patch
@@ -0,0 +1,32 @@
+From 742e370cc7d9bb75b83805683a4cc0f92f72850b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Sun, 28 Jan 2018 11:44:04 -0500
+Subject: [PATCH] set libdir to sysconfig.PREFIX.
+
+LIBDIR is currently set to /usr/lib which causes cross-compiling to fail.
+Instead, force the libdir to sysconfig.PREFIX.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ plugins/python/uwsgiplugin.py | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/plugins/python/uwsgiplugin.py b/plugins/python/uwsgiplugin.py
+index 843876f..9c75c9b 100644
+--- a/plugins/python/uwsgiplugin.py
++++ b/plugins/python/uwsgiplugin.py
+@@ -50,10 +50,7 @@ if not 'UWSGI_PYTHON_NOLIB' in os.environ:
+         if '-lutil' in LIBS:
+             LIBS.append('-lutil')
+     else:
+-        try:
+-            libdir = sysconfig.get_config_var('LIBDIR')
+-        except:
+-            libdir = "%s/lib" % sysconfig.PREFIX
++        libdir = "%s/lib" % sysconfig.PREFIX
+ 
+         LDFLAGS.append("-L%s" % libdir)
+         LDFLAGS.append("-Wl,-rpath,%s" % libdir)
+-- 
+2.14.3
+
diff --git a/package/python-uwsgi/0002-fix-libxml2-paths.patch b/package/python-uwsgi/0002-fix-libxml2-paths.patch
new file mode 100644
index 0000000000..de3e47c01c
--- /dev/null
+++ b/package/python-uwsgi/0002-fix-libxml2-paths.patch
@@ -0,0 +1,54 @@
+From b9cf6c65e3cabdea249604497b8d34fe1c35da6f Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Sun, 28 Jan 2018 14:17:59 -0500
+Subject: [PATCH] fix libxml2 paths
+
+instead of blindly calling out xml2-config, check to see if a path for
+xml2-config is provided, and use that if it is.
+
+This prevents python-uwsgi from trying to use the host machines include paths.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ uwsgiconfig.py | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/uwsgiconfig.py b/uwsgiconfig.py
+index 17b25b9..0c33491 100644
+--- a/uwsgiconfig.py
++++ b/uwsgiconfig.py
+@@ -1292,12 +1292,13 @@ class uConf(object):
+                 self.gcc_list.append('core/legion')
+                 report['ssl'] = True
+ 
++        xml2config = os.environ.get('XML2_CONFIG','xml2-config')
+         if self.get('xml'):
+             if self.get('xml') == 'auto':
+-                xmlconf = spcall('xml2-config --libs')
++                xmlconf = spcall(xml2config + ' --libs')
+                 if xmlconf:
+                     self.libs.append(xmlconf)
+-                    xmlconf = spcall("xml2-config --cflags")
++                    xmlconf = spcall(xml2config + " --cflags")
+                     self.cflags.append(xmlconf)
+                     self.cflags.append("-DUWSGI_XML -DUWSGI_XML_LIBXML2")
+                     self.gcc_list.append('core/xmlconf')
+@@ -1308,13 +1309,13 @@ class uConf(object):
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
+2.14.3
+
diff --git a/package/python-uwsgi/Config.in b/package/python-uwsgi/Config.in
new file mode 100644
index 0000000000..856e765693
--- /dev/null
+++ b/package/python-uwsgi/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_UWSGI
+	bool "python-uwsgi"
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  The uWSGI server.
+	  https://uwsgi-docs.readthedocs.io/en/latest/
diff --git a/package/python-uwsgi/python-uwsgi.hash b/package/python-uwsgi/python-uwsgi.hash
new file mode 100644
index 0000000000..c9760fea15
--- /dev/null
+++ b/package/python-uwsgi/python-uwsgi.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/uwsgi/json, sha256 locally computed
+md5	fc50bd9e83b7602fa474b032167010a7  uwsgi-2.0.15.tar.gz
+sha256	572ef9696b97595b4f44f6198fe8c06e6f4e6351d930d22e5330b071391272ff  uwsgi-2.0.15.tar.gz
+sha256	ca495399f5da3ce2724649b47eb118f7549344ba58c0cf350d94c3390e435897  LICENSE
diff --git a/package/python-uwsgi/python-uwsgi.mk b/package/python-uwsgi/python-uwsgi.mk
new file mode 100644
index 0000000000..006fbd3444
--- /dev/null
+++ b/package/python-uwsgi/python-uwsgi.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# python-uwsgi
+#
+################################################################################
+
+PYTHON_UWSGI_VERSION = 2.0.15
+PYTHON_UWSGI_SOURCE = uwsgi-$(PYTHON_UWSGI_VERSION).tar.gz
+PYTHON_UWSGI_SITE = https://pypi.python.org/packages/bb/0a/45e5aa80dc135889594bb371c082d20fb7ee7303b174874c996888cc8511
+PYTHON_UWSGI_SETUP_TYPE = setuptools
+PYTHON_UWSGI_LICENSE = GPL2
+PYTHON_UWSGI_LICENSE_FILES = LICENSE
+PYTHON_UWSGI_DEPENDENCIES = libxml2 jansson util-linux pcre
+
+# Remove static includes that point to the host machine include directory.
+PYTHON_UWSGI_ENV += \
+	UWSGI_REMOVE_INCLUDES="/usr/include,/usr/local/include" \
+	UWSGI_INCLUDES="$(STAGING_DIR)/usr/include" \
+	XML2_CONFIG="$(STAGING_DIR)/usr/bin/xml2-config" \
+	UWSGICONFIG_PHPDIR=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+    PYTHON_UWSGI_DEPENDENCIES += openssl
+endif
+
+$(eval $(python-package))
-- 
2.14.3
