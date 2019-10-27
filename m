From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 13:00:45 +0100
Subject: [Buildroot] [git commit] package/mdevd: new package
Message-ID: <20191027115547.23DBE88988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f76483b91c1cef5f50dd5b5aace42220656e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides mdevd, a small daemon managing kernel hotplug
events similar to udevd.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/mdevd/Config.in  |  9 +++++++++
 package/mdevd/mdevd.hash |  3 +++
 package/mdevd/mdevd.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6efe52f19f..1dacbb6f30 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -694,6 +694,7 @@ F:	package/eudev/
 F:	package/execline/
 F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
+F:	package/mdevd/
 F:	package/meson/
 F:	package/ninja/
 F:	package/pkg-meson.mk
diff --git a/package/Config.in b/package/Config.in
index 901c25fe02..f779c28c7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -479,6 +479,7 @@ endmenu
 	source "package/lvm2/Config.in"
 	source "package/mali-t76x/Config.in"
 	source "package/mdadm/Config.in"
+	source "package/mdevd/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
diff --git a/package/mdevd/Config.in b/package/mdevd/Config.in
new file mode 100644
index 0000000000..046094039c
--- /dev/null
+++ b/package/mdevd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MDEVD
+	bool "mdevd"
+	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
+	help
+	  mdevd is a small daemon managing kernel hotplug events,
+	  similarly to udevd.
+
+	  http://skarnet.org/software/mdevd/
diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
new file mode 100644
index 0000000000..55b0af4496
--- /dev/null
+++ b/package/mdevd/mdevd.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256 302819dceb2400f299ef8f04828a4fe9156d7334e41ce34d61db37fbc2aa7e8f  mdevd-0.1.1.0.tar.gz
+sha256 e5319cb67bd1d896f3b2fa1136034b1b155a6e278ab1c2578a394f758f0034c1  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
new file mode 100644
index 0000000000..603a35731c
--- /dev/null
+++ b/package/mdevd/mdevd.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# mdevd
+#
+################################################################################
+
+MDEVD_VERSION = 0.1.1.0
+MDEVD_SITE = http://skarnet.org/software/mdevd
+MDEVD_LICENSE = ISC
+MDEVD_LICENSE_FILES = COPYING
+MDEVD_INSTALL_STAGING = YES
+MDEVD_DEPENDENCIES = skalibs
+
+MDEVD_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define MDEVD_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MDEVD_CONF_OPTS))
+endef
+
+define MDEVD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define MDEVD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define MDEVD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
