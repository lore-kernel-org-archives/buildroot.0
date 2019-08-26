From: =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Mon, 26 Aug 2019 19:37:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: add configs to select
 which binaries are built
Message-ID: <20190826173751.13832-1-alejandro.gonzalez.correo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the iputils build script might build binaries which are
useless for certain applications, like tftpd. Those binaries will bloat
the target filesystem unless a post-build script removes them manually,
which is cumbersome and doesn't shorten build times.

These changes add Kconfig options which let the user select what
binaries are built with ease.

Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
---
 package/iputils/Config.in  |  64 ++++++++++++++++++++
 package/iputils/iputils.mk | 119 ++++++++++++++++++++++++++++++-------
 2 files changed, 163 insertions(+), 20 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index b5d9141a7d..cb3d03072a 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -7,3 +7,67 @@ config BR2_PACKAGE_IPUTILS
 	  etc.
 
 	  https://github.com/iputils/iputils
+
+if BR2_PACKAGE_IPUTILS
+
+config BR2_PACKAGE_IPUTILS_ARPING
+	bool "arping"
+	default y
+	help
+	  Installs arping.
+
+config BR2_PACKAGE_IPUTILS_CLOCKDIFF
+	bool "clockdiff"
+	default y
+	help
+	  Installs clockdiff.
+
+config BR2_PACKAGE_IPUTILS_PING
+	bool "ping"
+	default y
+	help
+	  Installs ping.
+
+config BR2_PACKAGE_IPUTILS_RARPD
+	bool "rarpd"
+	help
+	  Installs rarpd.
+
+config BR2_PACKAGE_IPUTILS_RDISC
+	bool "rdisc"
+	default y
+	help
+	  Installs rdisc.
+
+config BR2_PACKAGE_IPUTILS_RDISC_SERVER
+	bool "rdisc (server code)"
+	depends on BR2_PACKAGE_IPUTILS_RDISC
+	default y
+	help
+	  Builds rdisc with server code.
+
+config BR2_PACKAGE_IPUTILS_TFTPD
+	bool "tftpd"
+	help
+	  Installs tftpd.
+
+config BR2_PACKAGE_IPUTILS_TRACEPATH
+	bool "tracepath"
+	default y
+	help
+	  Installs tracepath.
+
+config BR2_PACKAGE_IPUTILS_TRACEROUTE6
+	bool "traceroute6"
+	default y
+	help
+	  Installs traceroute6.
+
+config BR2_PACKAGE_IPUTILS_NINFOD
+	bool "ninfod"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
+	default y
+	help
+	  Installs ninfod.
+
+endif
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4a06581790..291114abb9 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -17,6 +17,68 @@ IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+# Selectively build binaries
+
+ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)
+IPUTILS_CONF_OPTS += -DBUILD_ARPING=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_ARPING=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_CLOCKDIFF),y)
+IPUTILS_CONF_OPTS += -DBUILD_CLOCKDIFF=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_CLOCKDIFF=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_PING),y)
+IPUTILS_CONF_OPTS += -DBUILD_PING=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_PING=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPTUILS_RARPD),y)
+IPUTILS_CONF_OPTS += -DBUILD_RARPD=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_RARPD=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_RDISC),y)
+IPUTILS_CONF_OPTS += -DBUILD_RDISC=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_RDISC=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_RDISC_SERVER),y)
+IPUTILS_CONF_OPTS += -DENABLE_RDISC_SERVER=true
+else
+IPUTILS_CONF_OPTS += -DENABLE_RDISC_SERVER=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
+IPUTILS_CONF_OPTS += -DBUILD_TFTPD=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_TFTPD=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_TRACEPATH),y)
+IPUTILS_CONF_OPTS += -DBUILD_TRACEPATH=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_TRACEPATH=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_TRACEROUTE6),y)
+IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_NINFOD),y)
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=true
+else
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 IPUTILS_CONF_OPTS += -DUSE_CAP=true
 IPUTILS_DEPENDENCIES += libcap
@@ -49,57 +111,74 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
-# ninfod requires <pthread.h>
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
-endif
-
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 IPUTILS_CONF_OPTS += -DUSE_GETTEXT=true
 else
 IPUTILS_CONF_OPTS += -DUSE_GETTEXT=false
 endif
 
-IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=true
-
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
 IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
 # move iputils binaries to the same location as where Busybox installs
 # the corresponding applets, so that we have a single version of the
 # tools (from iputils)
-define IPUTILS_MOVE_BINARIES
+define IPUTILS_MOVE_ARPING_BINARY
 	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
+endef
+ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_ARPING_BINARY
+endif
+
+define IPUTILS_MOVE_PING_BINARY
 	$(if $(BR2_ROOTFS_MERGED_USR),,\
 		mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping)
+endef
+ifeq ($(BR2_PACKAGE_IPUTILS_PING),y)
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_PING_BINARY
+endif
+
+define IPUTILS_MOVE_TFTPD_BINARY
 	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd
 endef
-IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
+ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_TFTPD_BINARY
+endif
 
 # upstream requires distros to create symlink
 define IPUTILS_CREATE_PING6_SYMLINK
 	ln -sf $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
 endef
+ifeq ($(BR2_PACKAGE_IPUTILS_PING),y)
 IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
+endif
 
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
 define IPUTILS_PERMISSIONS
-	/usr/sbin/arping      f 755 0 0 - - - - -
-	/usr/bin/clockdiff    f 755 0 0 - - - - -
-	|xattr cap_net_raw+p
-	/bin/ping             f 755 0 0 - - - - -
-	|xattr cap_net_raw+p
-	/usr/bin/traceroute6  f 755 0 0 - - - - -
-	|xattr cap_net_raw+p
+	$(if $(BR2_PACKAGE_IPUTILS_ARPING),y,\
+		/usr/sbin/arping      f 755 0 0 - - - - -)
+	$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),y,\
+		/usr/bin/clockdiff    f 755 0 0 - - - - -
+		|xattr cap_net_raw+p)
+	$(if $(BR2_PACKAGE_IPUTILS_PING),y,\
+		/bin/ping             f 755 0 0 - - - - -
+		|xattr cap_net_raw+p)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),y,\
+		/usr/bin/traceroute6  f 755 0 0 - - - - -
+		|xattr cap_net_raw+p)
 endef
 else
 define IPUTILS_PERMISSIONS
-	/usr/sbin/arping      f  755 0 0 - - - - -
-	/usr/bin/clockdiff    f 4755 0 0 - - - - -
-	/bin/ping             f 4755 0 0 - - - - -
-	/usr/bin/traceroute6  f 4755 0 0 - - - - -
+	$(if $(BR2_PACKAGE_IPUTILS_ARPING),y,\
+		/usr/sbin/arping      f  755 0 0 - - - - -)
+	$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),y,\
+		/usr/bin/clockdiff    f 4755 0 0 - - - - -)
+	$(if $(BR2_PACKAGE_IPUTILS_PING),y,\
+		/bin/ping             f 4755 0 0 - - - - -)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),y,\
+		/usr/bin/traceroute6  f 4755 0 0 - - - - -)
 endef
 endif
 
-- 
2.20.1
