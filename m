From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 12 Nov 2019 17:23:24 +0100
Subject: [Buildroot] [PATCH next v3 1/2] package/netdata: new package
Message-ID: <20191112162325.529637-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Always provide --disable-dbengine configuration option, because we do
not support libjudy dependency that is required otherwise.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
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

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...-limits.h-before-using-LONG_MAX-7224.patch | 29 +++++++++
 ...install-.keep-for-cache-and-log-dire.patch | 48 +++++++++++++++
 package/netdata/Config.in                     | 16 +++++
 package/netdata/S60netdata                    | 40 ++++++++++++
 package/netdata/netdata.hash                  |  3 +
 package/netdata/netdata.mk                    | 61 +++++++++++++++++++
 8 files changed, 199 insertions(+)
 create mode 100644 package/netdata/0001-include-limits.h-before-using-LONG_MAX-7224.patch
 create mode 100644 package/netdata/0002-Makefile-do-not-install-.keep-for-cache-and-log-dire.patch
 create mode 100644 package/netdata/Config.in
 create mode 100644 package/netdata/S60netdata
 create mode 100644 package/netdata/netdata.hash
 create mode 100644 package/netdata/netdata.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0863aabc6..69ea49339d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1461,6 +1461,7 @@ F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/murata-cyw-fw/
+F:	package/netdata/
 F:	package/rs485conf/
 F:	package/turbolua/
 
diff --git a/package/Config.in b/package/Config.in
index f72c77b416..f70b0c5819 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1874,6 +1874,7 @@ menu "Miscellaneous"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/netdata/Config.in"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
diff --git a/package/netdata/0001-include-limits.h-before-using-LONG_MAX-7224.patch b/package/netdata/0001-include-limits.h-before-using-LONG_MAX-7224.patch
new file mode 100644
index 0000000000..78798370c8
--- /dev/null
+++ b/package/netdata/0001-include-limits.h-before-using-LONG_MAX-7224.patch
@@ -0,0 +1,29 @@
+From af5888b241af29ca9cc4d51e34fd116df13a335e Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <macius1990w@gmail.com>
+Date: Tue, 29 Oct 2019 19:52:47 +0100
+Subject: [PATCH] include limits.h before using LONG_MAX (#7224)
+
+commit fdeac75f9c2e83799c7a44a8a8647d5a561ec96e upstream.
+
+This fixes build with musl standard C library.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ libnetdata/libnetdata.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libnetdata/libnetdata.h b/libnetdata/libnetdata.h
+index ef883300..023ad2c2 100644
+--- a/libnetdata/libnetdata.h
++++ b/libnetdata/libnetdata.h
+@@ -65,6 +65,7 @@
+ #include <getopt.h>
+ #include <grp.h>
+ #include <pwd.h>
++#include <limits.h>
+ #include <locale.h>
+ #include <net/if.h>
+ #include <poll.h>
+-- 
+2.24.0
+
diff --git a/package/netdata/0002-Makefile-do-not-install-.keep-for-cache-and-log-dire.patch b/package/netdata/0002-Makefile-do-not-install-.keep-for-cache-and-log-dire.patch
new file mode 100644
index 0000000000..103c1c6635
--- /dev/null
+++ b/package/netdata/0002-Makefile-do-not-install-.keep-for-cache-and-log-dire.patch
@@ -0,0 +1,48 @@
+From ec71618f84dc10336fd5a4c461cdff2ddfcf223b Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Thu, 31 Oct 2019 17:17:54 +0100
+Subject: [PATCH] Makefile: do not install .keep for cache and log directories
+
+In Buildroot skeleton for init-sysv both cache (/var/cache/netdata) and
+log (/var/log/netdata) default netdata paths point to /tmp/netdata.
+During netdata installation step empty .keep file is installed to those
+locations by two `install` processes (with make -j option). This results
+in race condition, because one process is already trying to change
+permission of created .keep file, while the other unlinked it a moment
+ago with the intention to install "its own" .keep file. As a end result
+installation fails.
+
+Remove installation of .keep file for both cache and log directories,
+because the directory structure is not preserved anyway in case of
+Buildroot. This also prevents above race condition and results in always
+successfully finished installation step.
+
+There is already a discussion [1] about how to deal with this specific
+issue in netdata project, so hopefully we can get rid of this Buildroot
+specific patch someday.
+
+[1] https://github.com/netdata/netdata/issues/7292
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d9da7b8a..7c3c5deb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -113,10 +113,8 @@ AM_CFLAGS = \
+ 	$(NULL)
+ 
+ sbin_PROGRAMS =
+-dist_cache_DATA = packaging/installer/.keep
+ dist_varlib_DATA = packaging/installer/.keep
+ dist_registry_DATA = packaging/installer/.keep
+-dist_log_DATA = packaging/installer/.keep
+ plugins_PROGRAMS =
+ 
+ LIBNETDATA_FILES = \
+-- 
+2.24.0
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
index 0000000000..4a3c8bc02c
--- /dev/null
+++ b/package/netdata/S60netdata
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# netdata        Starts netdata.
+#
+
+# Create needed directories.
+[ -d /var/cache/netdata ] || mkdir -p /var/cache/netdata
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
index 0000000000..e3147a4af5
--- /dev/null
+++ b/package/netdata/netdata.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c788ec01f5228768cbf5032324e041defbac3aaa57a074b98038444fc46ba2d4  netdata-1.18.1.tar.gz
+sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
new file mode 100644
index 0000000000..d300340669
--- /dev/null
+++ b/package/netdata/netdata.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# netdata
+#
+################################################################################
+
+NETDATA_VERSION = 1.18.1
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
2.24.0
