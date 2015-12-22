From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Tue, 22 Dec 2015 18:51:10 +0200
Subject: [Buildroot] [PATCH 1/1 v2] autofs: new package
Message-ID: <1450803070-14401-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Adds package "autofs". Requires a toolchain with native RPC support
that supplies the header nfs/nfs.h. The "nfs-utils" package contains
the nfs/nfs.h header but does not install it. Adding an install target
to "nfs-utils" for the nfs/nfs.h header would require significant
upstream work. The "libtirpc" package does not contain the nfs/nfs.h
header.

Tested on i.MX6 using NFS mounts only. Not tested with DAS mounts as
of this commit.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in          |    1 +
 package/autofs/Config.in   |   17 +++++++++++++++++
 package/autofs/autofs.hash |    2 ++
 package/autofs/autofs.mk   |   20 ++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/autofs/Config.in
 create mode 100644 package/autofs/autofs.hash
 create mode 100644 package/autofs/autofs.mk

diff --git a/package/Config.in b/package/Config.in
index 066aa06..db62c82 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -155,6 +155,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/autofs/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/autofs/Config.in b/package/autofs/Config.in
new file mode 100644
index 0000000..5e37094
--- /dev/null
+++ b/package/autofs/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_AUTOFS
+	bool "autofs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # rpcbind
+	depends on BR2_USE_MMU # rpcbind
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC # needs nfs/nfs.h
+	help
+	  Autofs controls the operation of the automount daemons. The
+	  automount daemons automatically mount filesystems when they
+	  are used and unmount them after a period of inactivity based
+	  on a set of pre-configured maps defined by default in
+	  /etc/auto.master. The kernel automounter implements SunOS
+	  style automounter under Linux and requires a kernel version of
+	  at least 2.6.17 and the autofs4 kernel module.
+
+	  Requires a toolchain with native RPC.
+
+	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
new file mode 100644
index 0000000..2d98375
--- /dev/null
+++ b/package/autofs/autofs.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
+sha256 e08ff0ef9ff365d87b6c33dca136d20e4e07675197a324f2816894cb437021c3  autofs-5.1.1.tar.xz
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
new file mode 100644
index 0000000..61e4f80
--- /dev/null
+++ b/package/autofs/autofs.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# autofs
+#
+################################################################################
+
+AUTOFS_VERSION = 5.1.1
+AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
+AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
+AUTOFS_LICENSE = GPLv2+
+AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
+
+AUTOFS_CONF_OPTS = --disable-mount-locking \
+	--enable-ignore-busy \
+	--without-openldap \
+	--without-sasl
+
+AUTOFS_MAKE_ENV = DONTSTRIP=1
+
+$(eval $(autotools-package))
-- 
1.7.9.5
