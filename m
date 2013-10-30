From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 30 Oct 2013 12:22:25 -0300
Subject: [Buildroot] [PATCH] fio: new package
Message-ID: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 package/Config.in     |  1 +
 package/fio/Config.in |  6 ++++++
 package/fio/fio.mk    | 25 +++++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/fio/Config.in
 create mode 100644 package/fio/fio.mk

diff --git a/package/Config.in b/package/Config.in
index 4c4da51..7cb46aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -47,6 +47,7 @@ source "package/dmalloc/Config.in"
 source "package/dropwatch/Config.in"
 source "package/dstat/Config.in"
 source "package/duma/Config.in"
+source "package/fio/Config.in"
 source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
diff --git a/package/fio/Config.in b/package/fio/Config.in
new file mode 100644
index 0000000..263e7f5
--- /dev/null
+++ b/package/fio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FIO
+	bool "fio"
+	depends on BR2_USE_MMU # fork()
+	help
+	  fio is an I/O tool meant to be used both for benchmark
+	  and stress/hardware verification.
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
new file mode 100644
index 0000000..60cd14f
--- /dev/null
+++ b/package/fio/fio.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# fio
+#
+################################################################################
+
+FIO_VERSION = 2.1.3
+FIO_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fio
+FIO_SOURCE = fio_$(FIO_VERSION).orig.tar.gz
+FIO_LICENSE = GPLv2
+FIO_LICENSE_FILES = LICENSE
+
+define FIO_CONFIGURE_CMDS
+	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
+endef
+
+define FIO_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define FIO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/fio $(TARGET_DIR)/usr/bin/fio
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
