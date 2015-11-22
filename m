From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 22 Nov 2015 15:48:20 +0200
Subject: [Buildroot] [PATCH 1/1] autofs: new package
Message-ID: <1448200100-29006-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Add the autofs package from kernel.org

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in          |    1 +
 package/autofs/Config.in   |   16 ++++++++++++++++
 package/autofs/autofs.hash |    2 ++
 package/autofs/autofs.mk   |   21 +++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/autofs/Config.in
 create mode 100644 package/autofs/autofs.hash
 create mode 100644 package/autofs/autofs.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..9e59352 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -149,6 +149,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/autofs/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/autofs/Config.in b/package/autofs/Config.in
new file mode 100644
index 0000000..2db185b
--- /dev/null
+++ b/package/autofs/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_AUTOFS
+	bool "autofs"
+	select BR2_PACKAGE_NFS_UTILS # runtime
+	select BR2_PACKAGE_RPCBIND # runtime
+	depends on BR2_TOOLCHAIN_HAS_THREADS # rpcbind
+	depends on BR2_USE_MMU # nfs-utils, rpcbind
+	help
+	  Based on the Debian autofs package description:
+	  Autofs controls the operation of the automount daemons. The automount
+	  daemons automatically mount filesystems when they are used and unmount
+	  them after a period of inactivity based on a set of pre-configured
+	  maps defined by default in /etc/auto.master. The kernel automounter
+	  implements SunOS style automounter under Linux and requires a kernel
+	  version of at least 2.6.17 and the autofs4 kernel module.
+
+	  git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git
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
index 0000000..0de6b97
--- /dev/null
+++ b/package/autofs/autofs.mk
@@ -0,0 +1,21 @@
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
+	--with-openldap=no \
+	--with-sasl=no \
+	--with-libtirpc=no
+
+AUTOFS_MAKE_ENV = DONTSTRIP=1
+
+$(eval $(autotools-package))
-- 
1.7.9.5
