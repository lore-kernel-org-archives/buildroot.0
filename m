From: =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Thu, 29 Aug 2019 21:17:22 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/iputils: add configs to select
 which binaries are built
Message-ID: <20190829191722.18761-1-alejandro.gonzalez.correo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the iputils build script might build binaries which are
useless for certain applications, like tftpd or ninfod. Those binaries
will add to the target filesystem size unless a post-build script removes
them manually, which is cumbersome and doesn't shorten build times.

In particular, in a certain aarch64 Buildroot project with musl selected
as a C library, this patch allowed to shrink the full iputils package from
219 KiB (if every option is selected) to 63 KiB (with only the ping
binary selected) - a 71.2% relative size decrease.

Moreover, upstream recently introduced a commit that disabled tftpd from
building by default, like rarpd. In the current state of things, this change
will introduce inconveniences for Buildroot users which prefer to use the
tftpd implementation provided by this package. With this patch, however, that
decision and similar future ones won't be a concern, because they will
have complete control of what binaries are built.

These changes add Kconfig options which let the user select what
binaries are built with ease.

Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
---
Changes v2 -> v3:
	- Several style revisions (suggested by Arnout)
	- Simplify ninfod crypto dependencies logic (suggested by
	  Arnout)
	- Better explain the rationale for this patch in the commit
	  message

Changes v2 -> v1:
	- Fix several typos

 package/iputils/Config.in  |  68 ++++++++++++++++++++++
 package/iputils/iputils.mk | 116 +++++++++++++++++++++++++------------
 2 files changed, 147 insertions(+), 37 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index b5d9141a7d..7d106fa2d7 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -7,3 +7,71 @@ config BR2_PACKAGE_IPUTILS
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
+	depends on BR2_PACKAGE_NETTLE || BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_OPENSSL || BR2_PACKAGE_LINUX_HEADERS
+	default y
+	help
+	  Installs ninfod.
+
+comment "ninfod needs nettle, libgcrypt, openssl or Linux headers and a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || (!BR2_PACKAGE_NETTLE && !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LINUX_HEADERS)
+
+endif
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4a06581790..c2bbf0f96d 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -17,6 +17,66 @@ IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+# Selectively build binaries
+IPUTILS_CONF_OPTS += \
+	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
+	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
+	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
+	-DBUILD_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
+	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
+	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
+	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false)
+
+# Handle binaries with hooks
+ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)
+IPUTILS_CONF_OPTS += -DBUILD_ARPING=true
+
+# move some binaries to the same location as where Busybox installs
+# the corresponding applets, so that we have a single version of the
+# tools (from iputils)
+define IPUTILS_MOVE_ARPING_BINARY
+	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_ARPING_BINARY
+
+else
+IPUTILS_CONF_OPTS += -DBUILD_ARPING=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_PING),y)
+IPUTILS_CONF_OPTS += -DBUILD_PING=true
+
+# same reason to move the ping binary as for arping
+ifeq ($(BR2_ROOTFS_MERGED_USR),)
+define IPUTILS_MOVE_PING_BINARY
+	mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_PING_BINARY
+endif
+
+# upstream requires distros to create symlink
+define IPUTILS_CREATE_PING6_SYMLINK
+	ln -sf $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
+
+else
+IPUTILS_CONF_OPTS += -DBUILD_PING=false
+endif
+
+ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
+IPUTILS_CONF_OPTS += -DBUILD_TFTPD=true
+
+define IPUTILS_MOVE_TFTPD_BINARY
+	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_TFTPD_BINARY
+
+else
+IPUTILS_CONF_OPTS += -DBUILD_TFTPD=false
+endif
+
+# Handle libraries
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 IPUTILS_CONF_OPTS += -DUSE_CAP=true
 IPUTILS_DEPENDENCIES += libcap
@@ -45,13 +105,6 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=kernel
 IPUTILS_DEPENDENCIES += linux-headers
 else
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
-# BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
-endif
-
-# ninfod requires <pthread.h>
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
@@ -60,46 +113,35 @@ else
 IPUTILS_CONF_OPTS += -DUSE_GETTEXT=false
 endif
 
-IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=true
-
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
 IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
-# move iputils binaries to the same location as where Busybox installs
-# the corresponding applets, so that we have a single version of the
-# tools (from iputils)
-define IPUTILS_MOVE_BINARIES
-	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
-	$(if $(BR2_ROOTFS_MERGED_USR),,\
-		mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping)
-	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd
-endef
-IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
-
-# upstream requires distros to create symlink
-define IPUTILS_CREATE_PING6_SYMLINK
-	ln -sf $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
-endef
-IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
-
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
+	$(if $(BR2_PACKAGE_IPUTILS_ARPING),\
+		/usr/sbin/arping      f 755 0 0 - - - - -,)
+	$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),\
+		/usr/bin/clockdiff    f 755 0 0 - - - - -
+		|xattr cap_net_raw+p,)
+	$(if $(BR2_PACKAGE_IPUTILS_PING),\
+		/bin/ping             f 755 0 0 - - - - -
+		|xattr cap_net_raw+p,)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),\
+		/usr/bin/traceroute6  f 755 0 0 - - - - -
+		|xattr cap_net_raw+p,)
 endef
 else
 define IPUTILS_PERMISSIONS
-	/usr/sbin/arping      f  755 0 0 - - - - -
-	/usr/bin/clockdiff    f 4755 0 0 - - - - -
-	/bin/ping             f 4755 0 0 - - - - -
-	/usr/bin/traceroute6  f 4755 0 0 - - - - -
+	$(if $(BR2_PACKAGE_IPUTILS_ARPING),\
+		/usr/sbin/arping      f  755 0 0 - - - - -,)
+	$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),\
+		/usr/bin/clockdiff    f 4755 0 0 - - - - -,)
+	$(if $(BR2_PACKAGE_IPUTILS_PING),\
+		/bin/ping             f 4755 0 0 - - - - -,)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),\
+		/usr/bin/traceroute6  f 4755 0 0 - - - - -,)
 endef
 endif
 
-- 
2.20.1
