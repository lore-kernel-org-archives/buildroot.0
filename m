From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:47:55 +0200
Subject: [Buildroot] [git commit] package/iputils: add config options to
 select which binaries to build/install
Message-ID: <20200903193957.3EC35875FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95b0078cc089b48be8973b9507599cc836397869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: Alejandro Gonz??lez <alejandro.gonzalez.correo@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/Config.in  |  67 ++++++++++++++++++++++++
 package/iputils/iputils.mk | 126 ++++++++++++++++++++++++++++++---------------
 2 files changed, 152 insertions(+), 41 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index b5d9141a7d..0d4a4ba3f8 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -7,3 +7,70 @@ config BR2_PACKAGE_IPUTILS
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
+	default y
+	depends on BR2_PACKAGE_IPUTILS_RDISC
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
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
+	help
+	  Installs ninfod.
+
+comment "ninfod needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 9cc51d1541..e10c0636c9 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -17,8 +17,74 @@ IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
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
+#
+# arping
+#
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
+#
+# ping
+#
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
+#
+# tftpd
+#
+ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
 IPUTILS_CONF_OPTS += -DBUILD_TFTPD=true
 
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
@@ -37,63 +103,41 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 IPUTILS_DEPENDENCIES += systemd
 endif
 
-# ninfod requires <pthread.h>
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-IPUTILS_NINFOD = n
-endif
-
-ifeq ($(IPUTILS_NINFOD),n)
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
-else
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=true
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
-	ln -sf ping $(TARGET_DIR)/bin/ping6
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
 
