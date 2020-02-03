From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon,  3 Feb 2020 17:30:49 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/netdata: new package
Message-ID: <20200203163050.4071698-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Always provide --disable-dbengine configuration option, because we do
not support libjudy dependency that is required otherwise.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v3 -> v4:
 - use 1.19.0 instead of 1.18.1 version
 - drop musl fix, which is now part of 1.19.0 netdata version
 - use patch from upstream netdata (which will be part of next release) that
   removes use of .keep files
 - rebase on Builroot master

changes v2 -> v3:
 - add patch that removes installation of .keep files for /var/cache/netdata and
   /var/log/netdata directories; this solves a race condition when installing
   .keep file to the same directory (/tmp/netdata with default skeleton) from
   multiple threads
 - add S60netdata sysv-init script, which creates needed directories
   (/var/cache/netdata and /var/log/netdata) (suggested by Matt)

changes v1 -> v2:
 - squash DEVELOPERS update (suggested by Arnout),
 - reduce number of required dependencies and support them as optional:
   - json-c: there are few custom JSON handling function if json-c library is
     not provided,
   - openssl: enable or disable https support based on its availability (and
     solve openssl not being in netdata.mk file - suggested by Matt),
 - add optional dependencies on cups, nfacct and zlib,
 - enable or disable -flto based on BR2_GCC_ENABLE_LTO
 - drop libuv and lz4 dependencies, because it is not required with
   --disable-dbengine option,
 - add comment about NETDATA_AUTORECONF (suggested by Matt),
 - apply upstreamed patch to fix musl build (musl build was not failing with v1
   patch but did with v2).

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 ...ve-all-refernces-to-.keep-files-7829.patch | 139 ++++++++++++++++++
 package/netdata/Config.in                     |  16 ++
 package/netdata/S60netdata                    |  41 ++++++
 package/netdata/netdata.hash                  |   3 +
 package/netdata/netdata.mk                    |  61 ++++++++
 7 files changed, 262 insertions(+)
 create mode 100644 package/netdata/0001-Remove-all-refernces-to-.keep-files-7829.patch
 create mode 100644 package/netdata/Config.in
 create mode 100644 package/netdata/S60netdata
 create mode 100644 package/netdata/netdata.hash
 create mode 100644 package/netdata/netdata.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 172ebbf43a..25e8c5849a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1529,6 +1529,7 @@ F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/murata-cyw-fw/
+F:	package/netdata/
 F:	package/rs485conf/
 F:	package/turbolua/
 
diff --git a/package/Config.in b/package/Config.in
index e7cf60c533..fda9fd82aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1925,6 +1925,7 @@ menu "Miscellaneous"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/netdata/Config.in"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
diff --git a/package/netdata/0001-Remove-all-refernces-to-.keep-files-7829.patch b/package/netdata/0001-Remove-all-refernces-to-.keep-files-7829.patch
new file mode 100644
index 0000000000..9deaca252b
--- /dev/null
+++ b/package/netdata/0001-Remove-all-refernces-to-.keep-files-7829.patch
@@ -0,0 +1,139 @@
+From 9586bb2fe65ca674cfbc8ff7629b4f631a038036 Mon Sep 17 00:00:00 2001
+From: James Mills <1290234+prologic@users.noreply.github.com>
+Date: Sat, 25 Jan 2020 12:24:55 +1000
+Subject: [PATCH] Remove all refernces to .keep files (#7829)
+
+commit 2a0cdadc6f358c6f3dbeb03156b55a35edd975ed upstream.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ Makefile.am                            | 4 ----
+ collectors/charts.d.plugin/.keep       | 0
+ collectors/charts.d.plugin/Makefile.am | 1 -
+ collectors/node.d.plugin/.keep         | 0
+ collectors/node.d.plugin/Makefile.am   | 1 -
+ collectors/python.d.plugin/.keep       | 0
+ collectors/python.d.plugin/Makefile.am | 1 -
+ collectors/statsd.plugin/.keep         | 0
+ collectors/statsd.plugin/Makefile.am   | 1 -
+ health/.keep                           | 0
+ health/Makefile.am                     | 1 -
+ netdata.spec.in                        | 2 --
+ packaging/installer/.keep              | 0
+ 13 files changed, 11 deletions(-)
+ delete mode 100644 collectors/charts.d.plugin/.keep
+ delete mode 100644 collectors/node.d.plugin/.keep
+ delete mode 100644 collectors/python.d.plugin/.keep
+ delete mode 100644 collectors/statsd.plugin/.keep
+ delete mode 100644 health/.keep
+ delete mode 100644 packaging/installer/.keep
+
+diff --git a/Makefile.am b/Makefile.am
+index 2625dcc5..9ea370dc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -113,10 +113,6 @@ AM_CFLAGS = \
+     $(NULL)
+ 
+ sbin_PROGRAMS =
+-dist_cache_DATA = packaging/installer/.keep
+-dist_varlib_DATA = packaging/installer/.keep
+-dist_registry_DATA = packaging/installer/.keep
+-dist_log_DATA = packaging/installer/.keep
+ plugins_PROGRAMS =
+ 
+ LIBNETDATA_FILES = \
+diff --git a/collectors/charts.d.plugin/.keep b/collectors/charts.d.plugin/.keep
+deleted file mode 100644
+index e69de29b..00000000
+diff --git a/collectors/charts.d.plugin/Makefile.am b/collectors/charts.d.plugin/Makefile.am
+index b3b2fb92..618fd5dd 100644
+--- a/collectors/charts.d.plugin/Makefile.am
++++ b/collectors/charts.d.plugin/Makefile.am
+@@ -31,7 +31,6 @@ dist_charts_DATA = \
+ 
+ userchartsconfigdir=$(configdir)/charts.d
+ dist_userchartsconfig_DATA = \
+-    .keep \
+     $(NULL)
+ 
+ # Explicitly install directories to avoid permission issues due to umask
+diff --git a/collectors/node.d.plugin/.keep b/collectors/node.d.plugin/.keep
+deleted file mode 100644
+index e69de29b..00000000
+diff --git a/collectors/node.d.plugin/Makefile.am b/collectors/node.d.plugin/Makefile.am
+index 411bce9e..c3142d43 100644
+--- a/collectors/node.d.plugin/Makefile.am
++++ b/collectors/node.d.plugin/Makefile.am
+@@ -23,7 +23,6 @@ dist_noinst_DATA = \
+ 
+ usernodeconfigdir=$(configdir)/node.d
+ dist_usernodeconfig_DATA = \
+-    .keep \
+     $(NULL)
+ 
+ # Explicitly install directories to avoid permission issues due to umask
+diff --git a/collectors/python.d.plugin/.keep b/collectors/python.d.plugin/.keep
+deleted file mode 100644
+index e69de29b..00000000
+diff --git a/collectors/python.d.plugin/Makefile.am b/collectors/python.d.plugin/Makefile.am
+index cb14e350..9c3c46ab 100644
+--- a/collectors/python.d.plugin/Makefile.am
++++ b/collectors/python.d.plugin/Makefile.am
+@@ -29,7 +29,6 @@ dist_python_DATA = \
+ 
+ userpythonconfigdir=$(configdir)/python.d
+ dist_userpythonconfig_DATA = \
+-    .keep \
+     $(NULL)
+ 
+ # Explicitly install directories to avoid permission issues due to umask
+diff --git a/collectors/statsd.plugin/.keep b/collectors/statsd.plugin/.keep
+deleted file mode 100644
+index e69de29b..00000000
+diff --git a/collectors/statsd.plugin/Makefile.am b/collectors/statsd.plugin/Makefile.am
+index 87b6ca7a..b01302d1 100644
+--- a/collectors/statsd.plugin/Makefile.am
++++ b/collectors/statsd.plugin/Makefile.am
+@@ -14,7 +14,6 @@ dist_statsdconfig_DATA = \
+ 
+ userstatsdconfigdir=$(configdir)/statsd.d
+ dist_userstatsdconfig_DATA = \
+-    .keep \
+     $(NULL)
+ 
+ # Explicitly install directories to avoid permission issues due to umask
+diff --git a/health/.keep b/health/.keep
+deleted file mode 100644
+index e69de29b..00000000
+diff --git a/health/Makefile.am b/health/Makefile.am
+index f63faa8a..0a263511 100644
+--- a/health/Makefile.am
++++ b/health/Makefile.am
+@@ -16,7 +16,6 @@ dist_noinst_DATA = \
+ 
+ userhealthconfigdir=$(configdir)/health.d
+ dist_userhealthconfig_DATA = \
+-    .keep \
+     $(NULL)
+ 
+ # Explicitly install directories to avoid permission issues due to umask
+diff --git a/netdata.spec.in b/netdata.spec.in
+index 405e8f50..7c97c675 100644
+--- a/netdata.spec.in
++++ b/netdata.spec.in
+@@ -256,8 +256,6 @@ autoreconf -ivf
+ rm -rf "${RPM_BUILD_ROOT}"
+ %{__make} %{?_smp_mflags} DESTDIR="${RPM_BUILD_ROOT}" install
+ 
+-find "${RPM_BUILD_ROOT}%{_localstatedir}" -name .keep -delete -print
+-
+ install -m 644 -p system/netdata.conf "${RPM_BUILD_ROOT}%{_sysconfdir}/%{name}"
+ 
+ # ###########################################################
+diff --git a/packaging/installer/.keep b/packaging/installer/.keep
+deleted file mode 100644
+index e69de29b..00000000
+-- 
+2.24.1
+
diff --git a/package/netdata/Config.in b/package/netdata/Config.in
new file mode 100644
index 0000000000..30e8c30055
--- /dev/null
+++ b/package/netdata/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_NETDATA
+	bool "netdata"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Netdata is distributed, real-time, performance and health
+	  monitoring for systems and applications. It is a highly
+	  optimized monitoring agent you install on all your systems and
+	  containers.
+
+	  https://github.com/netdata/netdata
+
+comment "netdata needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/netdata/S60netdata b/package/netdata/S60netdata
new file mode 100644
index 0000000000..20ce8a22e9
--- /dev/null
+++ b/package/netdata/S60netdata
@@ -0,0 +1,41 @@
+#!/bin/sh
+#
+# netdata        Starts netdata.
+#
+
+# Create needed directories.
+[ -d /var/cache/netdata ] || mkdir -p /var/cache/netdata
+[ -d /var/lib/netdata ] || mkdir -p /var/lib/netdata
+[ -d /var/log/netdata ] || mkdir -p /var/log/netdata
+
+start() {
+	printf "Starting netdata: "
+	/usr/sbin/netdata -u root
+	echo "OK"
+}
+stop() {
+	printf "Stopping netdata: "
+	killall netdata
+	echo "OK"
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
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
new file mode 100644
index 0000000000..257d988258
--- /dev/null
+++ b/package/netdata/netdata.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 007656f639d3544698af503f35550aeb4d4d5a06b81801bf5acf4ac21db68f6e  netdata-1.19.0.tar.gz
+sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
new file mode 100644
index 0000000000..20eb60c52c
--- /dev/null
+++ b/package/netdata/netdata.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# netdata
+#
+################################################################################
+
+NETDATA_VERSION = 1.19.0
+NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
+NETDATA_LICENSE = GPL-3.0
+NETDATA_LICENSE_FILES = LICENSE
+# netdata's source code is released without a generated configure script
+NETDATA_AUTORECONF = YES
+NETDATA_CONF_OPTS = --disable-dbengine
+NETDATA_DEPENDENCIES = util-linux
+
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+NETDATA_CONF_OPTS += --enable-lto
+else
+NETDATA_CONF_OPTS += --disable-lto
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+NETDATA_CONF_OPTS += --enable-plugin-cups
+NETDATA_DEPENDENCIES += cups
+else
+NETDATA_CONF_OPTS += --disable-plugin-cups
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+NETDATA_CONF_OPTS += --enable-jsonc
+NETDATA_DEPENDENCIES += json-c
+else
+NETDATA_CONF_OPTS += --disable-jsonc
+endif
+
+ifeq ($(BR2_PACKAGE_NFACCT),y)
+NETDATA_CONF_OPTS += --enable-plugin-nfacct
+NETDATA_DEPENDENCIES += nfacct
+else
+NETDATA_CONF_OPTS += --disable-plugin-nfacct
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NETDATA_CONF_OPTS += --enable-https
+NETDATA_DEPENDENCIES += openssl
+else
+NETDATA_CONF_OPTS += --disable-https
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+NETDATA_DEPENDENCIES += zlib
+else
+NETDATA_CONF_OPTS += --without-zlib
+endif
+
+define NETDATA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/netdata/S60netdata \
+		$(TARGET_DIR)/etc/init.d/S60netdata
+endef
+
+$(eval $(autotools-package))
-- 
2.24.1
