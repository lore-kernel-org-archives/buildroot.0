From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:30 +0100
Subject: [Buildroot] [PATCH 29/52] package/libpri: new package
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <2283c54c43f87d551c357071455077be4d2aa794.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile in the package is not very versatile, so we need to go our
way to only build and install what we can.

Fixing the Makefile is not worth it, considering that we can quite
easily do all of that in our .mk.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in          |  1 +
 package/libpri/Config.in   | 21 +++++++++++++++++++
 package/libpri/libpri.hash |  3 +++
 package/libpri/libpri.mk   | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 package/libpri/Config.in
 create mode 100644 package/libpri/libpri.hash
 create mode 100644 package/libpri/libpri.mk

diff --git a/package/Config.in b/package/Config.in
index 4cbc2c8..b3a9539 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1053,6 +1053,7 @@ menu "Hardware handling"
 	source "package/libnfc/Config.in"
 	source "package/libpciaccess/Config.in"
 	source "package/libphidget/Config.in"
+	source "package/libpri/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libraw1394/Config.in"
 	source "package/librtas/Config.in"
diff --git a/package/libpri/Config.in b/package/libpri/Config.in
new file mode 100644
index 0000000..de2d96f
--- /dev/null
+++ b/package/libpri/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBPRI
+	bool "libpri"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_DAHDI_LINUX
+	select BR2_PACKAGE_DAHDI_TOOLS
+	help
+	  libpri is an open source library that encapsulates the
+	  protocols used to communicate over ISDN Primary Rate
+	  Interfaces (T1, E1, J1).
+
+	  http://www.asterisk.org/downloads/libpri
+
+comment "libpri needs a kernel to be built"
+	depends on BR2_USE_MMU
+	depends on !BR2_LINUX_KERNEL
+
+comment "libpri needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpri/libpri.hash b/package/libpri/libpri.hash
new file mode 100644
index 0000000..408779f
--- /dev/null
+++ b/package/libpri/libpri.hash
@@ -0,0 +1,3 @@
+# sha1 and sha256 from http://downloads.asterisk.org/pub/telephony/libpri/releases/
+sha1    63536f3300fb007dfd5fe8064406992ca938bd9a                          libpri-1.5.0.tar.gz
+sha256  ee224bc4aa65c54546bd09675c3f0b71817ce9e277332bce86989d8dcd556a24  libpri-1.5.0.tar.gz
diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
new file mode 100644
index 0000000..f4ebdb7
--- /dev/null
+++ b/package/libpri/libpri.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# libpri
+#
+################################################################################
+
+LIBPRI_VERSION = 1.5.0
+LIBPRI_SITE = http://downloads.asterisk.org/pub/telephony/libpri/releases
+
+LIBPRI_LICENSE = GPLv2 w/ OpenH323 exception
+LIBPRI_LICENSE_FILES = LICENSE README
+
+LIBPRI_DEPENDENCIES = dahdi-linux dahdi-tools
+LIBPRI_INSTALL_STAGING = YES
+
+# The Makefile default rule will always try to generate both libraries.
+#    16 # So we need to explicitly build only what we can.
+ifneq ($(BR2_SHARED_LIBS),y)
+LIBPRI_LIBS = libpri.a
+define LIBPRI_INSTALL_A
+	$(INSTALL) -D -m 0644 $(@D)/libpri.a $(1)/usr/lib/libpri.a
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+LIBPRI_LIBS += libpri.so.1.4
+define LIBPRI_INSTALL_SO
+	$(INSTALL) -D -m 0644 $(@D)/libpri.so.1.4 $(1)/usr/lib/libpri.so.1.4
+	ln -sf libpri.so.1.4 $(1)/usr/lib/libpri.so
+endef
+endif
+
+LIBPRI_UTILS = pridump pritest rosetest testprilib
+
+define LIBPRI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(LIBPRI_LIBS) $(LIBPRI_UTILS)
+endef
+
+define LIBPRI_INSTALL_STAGING_CMDS
+	$(call LIBPRI_INSTALL_A,$(STAGING_DIR))
+	$(call LIBPRI_INSTALL_SO,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 $(@D)/libpri.h $(STAGING_DIR)/usr/include/libpri.h
+endef
+
+define LIBPRI_INSTALL_TARGET_CMDS
+	$(foreach u,$(LIBPRI_UTILS),\
+		$(INSTALL) -D -m 0755 $(@D)/$(u) $(TARGET_DIR)/usr/sbin/$(u)$(sep))
+	$(call LIBPRI_INSTALL_SO,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
