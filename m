From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:16 +0200
Subject: [Buildroot] [PATCH 5/9] s6-networking: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-6-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6-networking, a suite of small networking
utilities for Unix systems.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                      |  1 +
 package/s6-networking/Config.in        | 15 +++++++++++
 package/s6-networking/s6-networking.mk | 46 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 package/s6-networking/Config.in
 create mode 100644 package/s6-networking/s6-networking.mk

diff --git a/package/Config.in b/package/Config.in
index 6ce4c31..60229a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1567,6 +1567,7 @@ endif
 	source "package/rtorrent/Config.in"
 	source "package/rtptools/Config.in"
 	source "package/s6-dns/Config.in"
+	source "package/s6-networking/Config.in"
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
diff --git a/package/s6-networking/Config.in b/package/s6-networking/Config.in
new file mode 100644
index 0000000..1591ca9
--- /dev/null
+++ b/package/s6-networking/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_S6_NETWORKING
+	bool "s6-networking"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_S6_DNS
+	select BR2_PACKAGE_S6
+	help
+	  s6-networking is a suite of small networking utilities for Unix
+	  systems. It includes command-line client and server management, TCP
+	  access control, privilege escalation across UNIX domain sockets,
+	  IDENT protocol management and clock synchronization.
+
+	  http://skarnet.org/software/s6-networking/
+
+comment "s6-networking needs an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
new file mode 100644
index 0000000..b38958c
--- /dev/null
+++ b/package/s6-networking/s6-networking.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# s6-networking
+#
+################################################################################
+
+S6_NETWORKING_VERSION = v2.1.1.0
+S6_NETWORKING_SITE = git://git.skarnet.org/s6-networking.git
+S6_NETWORKING_LICENSE = ISC
+S6_NETWORKING_LICENSE_FILES = COPYING
+S6_NETWORKING_INSTALL_STAGING = YES
+S6_NETWORKING_DEPENDENCIES = s6-dns s6
+
+S6_NETWORKING_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/execline \
+	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
+	--with-lib=$(STAGING_DIR)/usr/lib/s6-dns \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
+
+ifeq ($(BR2_STATIC_LIBS),y)
+S6_NETWORKING_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+S6_NETWORKING_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define S6_NETWORKING_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_NETWORKING_CONFIGURE_OPTS))
+endef
+
+define S6_NETWORKING_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define S6_NETWORKING_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define S6_NETWORKING_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.4.11
