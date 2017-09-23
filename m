From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/libpri: new package
Message-ID: <20170923171328.3B1E98103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a77f356b78f9134227f9702a1eb09c3203c42d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile in the package is not very versatile, so we need to go our
way to only build and install what we can.

Fixing the Makefile is not worth it, considering that we can quite
easily do all of that in our .mk.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: add license file hashes and use SPDX license name]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in          |  1 +
 package/libpri/Config.in   | 21 +++++++++++++++++++
 package/libpri/libpri.hash |  7 +++++++
 package/libpri/libpri.mk   | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3b2f04a..56eac65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1161,6 +1161,7 @@ menu "Hardware handling"
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
index 0000000..47c4a00
--- /dev/null
+++ b/package/libpri/libpri.hash
@@ -0,0 +1,7 @@
+# sha1 and sha256 from http://downloads.asterisk.org/pub/telephony/libpri/releases/
+sha1    63536f3300fb007dfd5fe8064406992ca938bd9a                          libpri-1.5.0.tar.gz
+sha256  ee224bc4aa65c54546bd09675c3f0b71817ce9e277332bce86989d8dcd556a24  libpri-1.5.0.tar.gz
+
+# License files, locally calculated
+sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
+sha256  53b8b3aea4faec23fd9dbd4936044aca80c9b00343e6e58ee3303cec19512b33  README
diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
new file mode 100644
index 0000000..2e2d0e8
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
+LIBPRI_LICENSE = GPL-2.0 with OpenH323 exception
+LIBPRI_LICENSE_FILES = LICENSE README
+
+LIBPRI_DEPENDENCIES = dahdi-linux dahdi-tools
+LIBPRI_INSTALL_STAGING = YES
+
+# The Makefile default rule will always try to generate both libraries.
+# So we need to explicitly build only what we can.
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
