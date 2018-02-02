From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  2 Feb 2018 09:05:59 -0500
Subject: [Buildroot] [PATCH v2 1/3] uwsgi: new package
Message-ID: <20180202140601.21285-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uwsgi is a web server gateway interface written in python that is
meant to be flexible and plugin oriented.

To get it to cross compile, 2 small patches had to be created:

The first fixes the build system attempting to link against /usr/lib
instead of sysconfig.PREFIX.

The second adds a way to specify a location for xml2-config, as the
build-system currently just blindly calls out xml2-config which
can be on the host machine.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Changed python-uwsgi to just uwsgi as this isn't a python module.
  - Updated dependencies to reflect above change.
  - Added 0001-Add-fallthrough-comments.patch from upstream and reordered
    the other patches.
  - Changed source URL from PyPI to GitHub as that is the official project
    location.
    
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/uwsgi/0001-Add-fallthrough-comments.patch  | 53 +++++++++++++++++++++
 package/uwsgi/0002-fix-libxml2-paths.patch         | 54 ++++++++++++++++++++++
 .../0003-set-libdir-to-sysconfig-PREFIX.patch      | 32 +++++++++++++
 package/uwsgi/Config.in                            | 21 +++++++++
 package/uwsgi/uwsgi.hash                           |  3 ++
 package/uwsgi/uwsgi.mk                             | 31 +++++++++++++
 8 files changed, 196 insertions(+)
 create mode 100644 package/uwsgi/0001-Add-fallthrough-comments.patch
 create mode 100644 package/uwsgi/0002-fix-libxml2-paths.patch
 create mode 100644 package/uwsgi/0003-set-libdir-to-sysconfig-PREFIX.patch
 create mode 100644 package/uwsgi/Config.in
 create mode 100644 package/uwsgi/uwsgi.hash
 create mode 100644 package/uwsgi/uwsgi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9048d45b16..2ddb4099fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -58,6 +58,7 @@ F:	package/selinux-python/
 F:	package/semodule-utils/
 F:	package/setools/
 F:	package/sngrep/
+F:	package/uwsgi/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/libepoxy/
diff --git a/package/Config.in b/package/Config.in
index 9a6b199f40..3eb4addf50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1837,6 +1837,7 @@ endif
 	source "package/ulogd/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
+	source "package/uwsgi/Config.in"
 	source "package/vde2/Config.in"
 	source "package/vdr/Config.in"
 	source "package/vdr-plugin-vnsiserver/Config.in"
diff --git a/package/uwsgi/0001-Add-fallthrough-comments.patch b/package/uwsgi/0001-Add-fallthrough-comments.patch
new file mode 100644
index 0000000000..01c0e54f65
--- /dev/null
+++ b/package/uwsgi/0001-Add-fallthrough-comments.patch
@@ -0,0 +1,53 @@
+From d640610e4ba5c4cf246e5c915c37d9dbcc9741df Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Fri, 2 Feb 2018 08:30:52 -0500
+Subject: [PATCH] Add fallthrough comments
+
+Add comments that GCC will recognise, as documented:
+https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
+
+Upstream status: fixed
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ core/hash.c    | 2 ++
+ core/routing.c | 8 ++++----
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/core/hash.c b/core/hash.c
+index a1288fa..ccd0a4c 100644
+--- a/core/hash.c
++++ b/core/hash.c
+@@ -42,8 +42,10 @@ static uint32_t murmur2_hash(char *key, uint64_t keylen) {
+ 	switch (keylen) {
+ 		case 3:
+         		h ^= key[2] << 16;
++        		/* fallthrough */
+     		case 2:
+         		h ^= key[1] << 8;
++        		/* fallthrough */
+     		case 1:
+         		h ^= key[0];
+         		h *= 0x5bd1e995;
+diff --git a/core/routing.c b/core/routing.c
+index 42310ca..6d6fb08 100644
+--- a/core/routing.c
++++ b/core/routing.c
+@@ -1792,10 +1792,10 @@ static int uwsgi_route_condition_ipv6in(struct wsgi_request *wsgi_req, struct uw
+ 
+ 	int i = (pfxlen / 32);
+ 	switch (i) {
+-	case 0: mask[0] = 0;
+-	case 1: mask[1] = 0;
+-	case 2: mask[2] = 0;
+-	case 3: mask[3] = 0;
++	case 0: mask[0] = 0; /* fallthrough */
++	case 1: mask[1] = 0; /* fallthrough */
++	case 2: mask[2] = 0; /* fallthrough */
++	case 3: mask[3] = 0; /* fallthrough */
+ 	}
+ 
+ 	if (pfxlen % 32)
+-- 
+2.14.3
+
diff --git a/package/uwsgi/0002-fix-libxml2-paths.patch b/package/uwsgi/0002-fix-libxml2-paths.patch
new file mode 100644
index 0000000000..de3e47c01c
--- /dev/null
+++ b/package/uwsgi/0002-fix-libxml2-paths.patch
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
diff --git a/package/uwsgi/0003-set-libdir-to-sysconfig-PREFIX.patch b/package/uwsgi/0003-set-libdir-to-sysconfig-PREFIX.patch
new file mode 100644
index 0000000000..b5881e80f5
--- /dev/null
+++ b/package/uwsgi/0003-set-libdir-to-sysconfig-PREFIX.patch
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
diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
new file mode 100644
index 0000000000..96e7bc13c2
--- /dev/null
+++ b/package/uwsgi/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_UWSGI
+	bool "uwsgi"
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
+	help
+	  The uWSGI server.
+	  https://uwsgi-docs.readthedocs.io/en/latest/
+
+comment "uwsgi needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/uwsgi/uwsgi.hash b/package/uwsgi/uwsgi.hash
new file mode 100644
index 0000000000..eca39a6484
--- /dev/null
+++ b/package/uwsgi/uwsgi.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	251f0670628ce9b9f4c2b4288a7ea921e2ddb3d5e886b6aa2358273573e6fdcf  uwsgi-2.0.15.tar.gz
+sha256	ca495399f5da3ce2724649b47eb118f7549344ba58c0cf350d94c3390e435897  LICENSE
diff --git a/package/uwsgi/uwsgi.mk b/package/uwsgi/uwsgi.mk
new file mode 100644
index 0000000000..f63b37816e
--- /dev/null
+++ b/package/uwsgi/uwsgi.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# uwsgi
+#
+################################################################################
+
+UWSGI_VERSION = 2.0.15
+UWSGI_SITE = $(call github,unbit,uwsgi,$(UWSGI_VERSION))
+UWSGI_SETUP_TYPE = setuptools
+UWSGI_LICENSE = GPL2
+UWSGI_LICENSE_FILES = LICENSE
+UWSGI_DEPENDENCIES = libxml2 jansson util-linux pcre
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+UWSGI_DEPENDENCIES += python
+else
+UWSGI_DEPENDENCIES += python3
+endif
+
+# Remove static includes that point to the host machine include directory.
+UWSGI_ENV += \
+	UWSGI_REMOVE_INCLUDES="/usr/include,/usr/local/include" \
+	UWSGI_INCLUDES="$(STAGING_DIR)/usr/include" \
+	XML2_CONFIG="$(STAGING_DIR)/usr/bin/xml2-config" \
+	UWSGICONFIG_PHPDIR=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+    UWSGI_DEPENDENCIES += openssl
+endif
+
+$(eval $(python-package))
-- 
2.14.3
