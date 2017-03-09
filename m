From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:09:28 +0100
Subject: [Buildroot] [git commit] s6-networking: new package
Message-ID: <20170309221655.26E3682552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb486cb320fc72d8839243d8ca9741c353003454
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides s6-networking, a suite of small networking
utilities for Unix systems.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/s6-networking/Config.in          | 13 +++++++++
 package/s6-networking/s6-networking.hash |  2 ++
 package/s6-networking/s6-networking.mk   | 48 ++++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f67d416..e2b5a1e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -442,6 +442,7 @@ F:	package/jemalloc/
 F:	package/ninja/
 F:	package/s6/
 F:	package/s6-dns/
+F:	package/s6-networking/
 F:	package/skalibs/
 F:	package/smack/
 F:	package/xvisor/
diff --git a/package/Config.in b/package/Config.in
index bca190c..8e5880d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1641,6 +1641,7 @@ endif
 	source "package/rtorrent/Config.in"
 	source "package/rtptools/Config.in"
 	source "package/s6-dns/Config.in"
+	source "package/s6-networking/Config.in"
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
diff --git a/package/s6-networking/Config.in b/package/s6-networking/Config.in
new file mode 100644
index 0000000..ebb77a7
--- /dev/null
+++ b/package/s6-networking/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_S6_NETWORKING
+	bool "s6-networking"
+	select BR2_PACKAGE_S6_DNS
+	select BR2_PACKAGE_S6
+	depends on BR2_USE_MMU # s6
+	help
+	  s6-networking is a suite of small networking utilities for
+	  Unix systems. It includes command-line client and server
+	  management, TCP access control, privilege escalation across
+	  UNIX domain sockets, IDENT protocol management and clock
+	  synchronization.
+
+	  http://skarnet.org/software/s6-networking/
diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
new file mode 100644
index 0000000..a15efab
--- /dev/null
+++ b/package/s6-networking/s6-networking.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 5d8150d7413b335693c6e63092381dd0866b1b6f95662a2cbae5ec17ca449ab0 s6-networking-2.2.1.0.tar.gz
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
new file mode 100644
index 0000000..47d4d61
--- /dev/null
+++ b/package/s6-networking/s6-networking.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# s6-networking
+#
+################################################################################
+
+S6_NETWORKING_VERSION = 2.2.1.0
+S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
+S6_NETWORKING_LICENSE = ISC
+S6_NETWORKING_LICENSE_FILES = COPYING
+S6_NETWORKING_INSTALL_STAGING = YES
+S6_NETWORKING_DEPENDENCIES = s6-dns s6
+
+S6_NETWORKING_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/execline \
+	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
+	--with-lib=$(STAGING_DIR)/usr/lib/s6-dns \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_NETWORKING_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_NETWORKING_CONF_OPTS))
+endef
+
+define S6_NETWORKING_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_NETWORKING_REMOVE_STATIC_LIB_DIR
+	rm -rf $(TARGET_DIR)/usr/lib/s6-networking
+endef
+
+S6_NETWORKING_POST_INSTALL_TARGET_HOOKS += S6_NETWORKING_REMOVE_STATIC_LIB_DIR
+
+define S6_NETWORKING_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define S6_NETWORKING_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
