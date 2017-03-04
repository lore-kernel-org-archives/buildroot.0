From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Mar 2017 15:37:50 +0100
Subject: [Buildroot] [PATCH 1/1] boinc: new package
Message-ID: <1488638270-20784-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Open-source software for volunteer computing and grid computing.

Use the idle time on your computer to cure diseases, study global
warming, discover pulsars, and do many other types of scientific
research.

https://boinc.berkeley.edu

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/Config.in                                  |   1 +
 .../0001-Fix-LDFLAGS-for-cross-compilation.patch   | 127 +++++++++++++++++++++
 package/boinc/Config.in                            |  20 ++++
 package/boinc/S99boinc-client                      |  37 ++++++
 package/boinc/boinc-client.service                 |  10 ++
 package/boinc/boinc.hash                           |   3 +
 package/boinc/boinc.mk                             |  66 +++++++++++
 7 files changed, 264 insertions(+)
 create mode 100644 package/boinc/0001-Fix-LDFLAGS-for-cross-compilation.patch
 create mode 100644 package/boinc/Config.in
 create mode 100644 package/boinc/S99boinc-client
 create mode 100644 package/boinc/boinc-client.service
 create mode 100644 package/boinc/boinc.hash
 create mode 100644 package/boinc/boinc.mk

diff --git a/package/Config.in b/package/Config.in
index bf9843c..8c73cb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1490,6 +1490,7 @@ menu "Networking applications"
 	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
 	source "package/boa/Config.in"
+	source "package/boinc/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
diff --git a/package/boinc/0001-Fix-LDFLAGS-for-cross-compilation.patch b/package/boinc/0001-Fix-LDFLAGS-for-cross-compilation.patch
new file mode 100644
index 0000000..66ed227
--- /dev/null
+++ b/package/boinc/0001-Fix-LDFLAGS-for-cross-compilation.patch
@@ -0,0 +1,127 @@
+From e53ffa4173a0b06df4f98ceea7c71c38a97dc23f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 27 Feb 2017 21:59:27 +0100
+Subject: [PATCH] Fix LDFLAGS for cross-compilation
+
+Remove "-L$(libdir)" from LDFLAGS of boinc libraries in Makefile.am of
+api, lib, sched and zlib directories to be able to cross-compile boinc.
+
+Indeed, libdir is not equal to the path where BOINC will be installed
+but to exec_prefix/lib. The full installation path is
+$(DESTDIR)/$(libdir).
+
+To cross-compile boinc, exec_prefix will be set to the target path (for
+example: /usr) and DESTDIR will be set (during make install) to the
+staging or target directory on the host (for example /home/xxx/target).
+The issue of adding -L$(libdir) is that it is not allowed by the
+compiler, the error "unsafe header/library path used in
+cross-compilation: '-L/usr/lib'" will be raised.
+
+As a result, remove -L$(libdir)" from LDFLAGS, the default library
+search paths are sufficient for "standard" compilation or can be updated
+manually by passing the additional search path to LDFLAGS during the
+configure call for cross-compilation.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ api/Makefile.am   | 6 +++---
+ lib/Makefile.am   | 6 +++---
+ sched/Makefile.am | 4 ++--
+ zip/Makefile.am   | 2 +-
+ 4 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/api/Makefile.am b/api/Makefile.am
+index 2663f9a..3f52d9f 100644
+--- a/api/Makefile.am
++++ b/api/Makefile.am
+@@ -43,18 +43,18 @@ endif
+ 
+ lib_LTLIBRARIES = libboinc_api.la
+ libboinc_api_la_SOURCES = $(api_files)
+-libboinc_api_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_api_la_LDFLAGS = -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
+ 
+ if BUILD_GRAPHICS_API
+ lib_LTLIBRARIES += libboinc_graphics2.la
+ libboinc_graphics2_la_SOURCES = $(graphics2_files)
+ libboinc_graphics2_la_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/lib -I$(top_srcdir)/samples/image_libs
+-libboinc_graphics2_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION) -ljpeg
++libboinc_graphics2_la_LDFLAGS = -rpath $(libdir) -version-number $(LIBBOINC_VERSION) -ljpeg
+ endif #BUILD_GRAPHICS_API
+ 
+ lib_LTLIBRARIES += libboinc_opencl.la
+ libboinc_opencl_la_SOURCES = $(opencl_files)
+-libboinc_opencl_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_opencl_la_LDFLAGS = -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
+ 
+ if INSTALL_HEADERS
+ ## install only headers that are meant for exporting the API !!
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 03563d7..cafc6b0 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -176,7 +176,7 @@ lib_LTLIBRARIES = libboinc.la
+ libboinc_la_SOURCES = $(generic_sources) $(mac_sources) $(win_sources)
+ libboinc_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+ libboinc_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+-libboinc_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
++libboinc_la_LDFLAGS = -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
+ libboinc_la_LIBADD =
+ 
+ if ENABLE_BOINCCRYPT
+@@ -184,7 +184,7 @@ lib_LTLIBRARIES += libboinc_crypt.la
+ libboinc_crypt_la_SOURCES = crypt.cpp
+ libboinc_crypt_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CFLAGS)
+ libboinc_crypt_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CXXFLAGS)
+-libboinc_crypt_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
++libboinc_crypt_la_LDFLAGS = -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
+ libboinc_crypt_la_LIBADD =
+ endif
+ 
+@@ -193,7 +193,7 @@ lib_LTLIBRARIES += libboinc_fcgi.la
+ libboinc_fcgi_la_SOURCES = $(libfcgi_sources) $(mac_sources) $(win_sources)
+ libboinc_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+ libboinc_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+-libboinc_fcgi_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_fcgi_la_LDFLAGS = -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
+ libboinc_fcgi_la_LIBADD =
+ endif 
+ # end of "if ENABLE_FCGI"
+diff --git a/sched/Makefile.am b/sched/Makefile.am
+index e9e5000..6dd75fd 100644
+--- a/sched/Makefile.am
++++ b/sched/Makefile.am
+@@ -25,7 +25,7 @@ lib_LTLIBRARIES = libsched.la
+ libsched_la_SOURCES = $(libsched_sources)
+ libsched_la_CFLAGS = $(AM_CPPFLAGS)
+ libsched_la_CXXFLAGS = $(AM_CPPFLAGS)
+-libsched_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libsched_la_LDFLAGS= -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
+ libsched_la_LIBADD= $(SSL_LIBS)
+ 
+ ## install only headers that are meant for exporting the API !!
+@@ -47,7 +47,7 @@ lib_LTLIBRARIES += libsched_fcgi.la
+ libsched_fcgi_la_SOURCES = $(libsched_sources)
+ libsched_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
+ libsched_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
+-libsched_fcgi_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libsched_fcgi_la_LDFLAGS= -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
+ libsched_fcgi_la_LIBADD=
+ 
+ endif
+diff --git a/zip/Makefile.am b/zip/Makefile.am
+index 0054b43..710864e 100644
+--- a/zip/Makefile.am
++++ b/zip/Makefile.am
+@@ -61,7 +61,7 @@ endif
+ 
+ lib_LTLIBRARIES = libboinc_zip.la
+ libboinc_zip_la_SOURCES = $(libboinc_zip_sources)
+-libboinc_zip_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_zip_la_LDFLAGS = -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
+ libboinc_zip_la_LIBADD =
+ 
+ # Some OSs may not prefix libraries with lib.
+-- 
+2.5.0
+
diff --git a/package/boinc/Config.in b/package/boinc/Config.in
new file mode 100644
index 0000000..ca1b283
--- /dev/null
+++ b/package/boinc/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_BOINC
+	bool "boinc"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  Open-source software for volunteer computing and grid
+	  computing.
+
+	  Use the idle time on your computer to cure diseases, study
+	  global warming, discover pulsars, and do many other types of
+	  scientific research.
+
+	  https://boinc.berkeley.edu
+
+comment "boinc needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/boinc/S99boinc-client b/package/boinc/S99boinc-client
new file mode 100644
index 0000000..f4b2a2c
--- /dev/null
+++ b/package/boinc/S99boinc-client
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+NAME=boinc_client
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/bin/$NAME
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/boinc/boinc-client.service b/package/boinc/boinc-client.service
new file mode 100644
index 0000000..9de940e
--- /dev/null
+++ b/package/boinc/boinc-client.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=BOINC client
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/boinc_client
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
new file mode 100644
index 0000000..cc8eb6d
--- /dev/null
+++ b/package/boinc/boinc.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	d58c654e8234aab7261bb90685ac3eb6a94a122b2df4f66e62c8276ab5dfd4f9	boinc-26198.tar.gz
+sha256	39dc32290378ab5ed258944b80140adc48613677e1792701d6fbeba1b0aa60e3	25c2f1839753a2695c62cc4d4edb7e88345af8cb.patch
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
new file mode 100644
index 0000000..b102d44
--- /dev/null
+++ b/package/boinc/boinc.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# boinc
+#
+################################################################################
+
+BOINC_VERSION = 26198
+BOINC_SITE = $(call github,BOINC,boinc,vboxwrapper/$(BOINC_VERSION))
+BOINC_LICENSE = LGPLv3
+BOINC_LICENSE_FILES = COPYING COPYING.LESSER 
+BOINC_DEPENDENCIES = host-pkgconf
+BOINC_INSTALL_STAGING = YES
+BOINC_AUTORECONF = YES
+BOINC_CONF_OPTS = \
+	--disable-apps \
+	--disable-boinczip \
+	--disable-manager \
+	--disable-server \
+	--enable-libraries \
+	--with-pkg-config=$(PKG_CONFIG_HOST_BINARY)
+
+# Fix execinfo.h detection
+BOINC_PATCH = \
+	https://github.com/BOINC/boinc/commit/25c2f1839753a2695c62cc4d4edb7e88345af8cb.patch
+
+ifeq ($(BR2_PACKAGE_LIBFCGI),y)
+BOINC_DEPENDENCIES += libfcgi
+BOINC_CONF_OPTS += --enable-fcgi
+else
+BOINC_CONF_OPTS += --disable-fcgi
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_OPENSSL),yy)
+BOINC_DEPENDENCIES += \
+	libcurl \
+	openssl
+BOINC_CONF_OPTS += \
+	--enable-client \
+	--with-libcurl=$(STAGING_DIR)/usr/lib \
+	$(if $(BR2_STATIC_LIBS),--disable-dynamic-client-linkage, \
+		--enable-dynamic-client-linkage)
+else
+BOINC_CONF_OPTS += --disable-client
+endif
+
+# Remove boinc-client because it is incompatible with buildroot
+define BOINC_REMOVE_UNNEEDED_FILE
+	$(RM) $(TARGET_DIR)/etc/init.d/boinc-client
+endef
+
+BOINC_POST_INSTALL_TARGET_HOOKS += BOINC_REMOVE_UNNEEDED_FILE
+
+define BOINC_INSTALL_INIT_SYSV
+	 $(INSTALL) -D -m 0755 package/boinc/S99boinc-client \
+		$(TARGET_DIR)/etc/init.d/S99boinc-client
+endef
+
+define BOINC_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/boinc/boinc-client.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/boinc-client.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/boinc-client.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/boinc-client.service
+endef
+
+$(eval $(autotools-package))
-- 
2.5.0
