From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 16:44:13 +0100
Subject: [Buildroot] [git commit] fio: new package
Message-ID: <20131225154501.472A29C1C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43e9128600c209b669cb0eca93717d5bc4fa08bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add largefile and thread dependencies, bump to version 2.1.4,
 use upstream Git instead of Debian tarballs, adjust license
 information]

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |    1 +
 package/fio/Config.in |   13 +++++++++++++
 package/fio/fio.mk    |   24 ++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fe31cd2..76f8d4f 100644
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
index 0000000..deff12c
--- /dev/null
+++ b/package/fio/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FIO
+	bool "fio"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  fio is an I/O tool meant to be used both for benchmark
+	  and stress/hardware verification.
+
+	  http://git.kernel.dk/?p=fio.git;a=summary
+
+comment "fio needs a toolchain w/ largefile, threads"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
new file mode 100644
index 0000000..f9a690e
--- /dev/null
+++ b/package/fio/fio.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# fio
+#
+################################################################################
+
+FIO_VERSION = fio-2.1.4
+FIO_SITE = git://git.kernel.dk/fio.git
+FIO_LICENSE = GPLv2 + special obligations
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
