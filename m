From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:50:25 +0100
Subject: [Buildroot] [git commit] s6-linux-utils: new package
Message-ID: <20170310215141.95A7C8229B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=364dbfacbc17d64473c0d131262fc30980c15cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides s6-linux-utils, a set of minimalistic
Linux-specific system utilities.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/s6-linux-utils/Config.in           |  9 ++++++++
 package/s6-linux-utils/s6-linux-utils.hash |  2 ++
 package/s6-linux-utils/s6-linux-utils.mk   | 34 ++++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 94827d2..bc3801a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -442,6 +442,7 @@ F:	package/jemalloc/
 F:	package/ninja/
 F:	package/s6/
 F:	package/s6-dns/
+F:	package/s6-linux-utils/
 F:	package/s6-networking/
 F:	package/s6-portable-utils/
 F:	package/s6-rc/
diff --git a/package/Config.in b/package/Config.in
index d47e38f..e54dde8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1803,6 +1803,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
diff --git a/package/s6-linux-utils/Config.in b/package/s6-linux-utils/Config.in
new file mode 100644
index 0000000..14af3cf
--- /dev/null
+++ b/package/s6-linux-utils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_S6_LINUX_UTILS
+	bool "s6-linux-utils"
+	select BR2_PACKAGE_SKALIBS
+	depends on BR2_USE_MMU # skalibs
+	help
+	  s6-linux-utils is a set of minimalistic Linux-specific
+	  system utilities.
+
+	  http://skarnet.org/software/s6-linux-utils/
diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
new file mode 100644
index 0000000..600c5fc
--- /dev/null
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 587745abfbf2cc631bb54dd2b3fd29f39b723e3c50e28165138a85c98fda35f9 s6-linux-utils-2.2.0.0.tar.gz
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
new file mode 100644
index 0000000..04ce688
--- /dev/null
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# s6-linux-utils
+#
+################################################################################
+
+S6_LINUX_UTILS_VERSION = 2.2.0.0
+S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
+S6_LINUX_UTILS_LICENSE = ISC
+S6_LINUX_UTILS_LICENSE_FILES = COPYING
+S6_LINUX_UTILS_DEPENDENCIES = skalibs
+
+S6_LINUX_UTILS_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_LINUX_UTILS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_UTILS_CONF_OPTS))
+endef
+
+define S6_LINUX_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_LINUX_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
