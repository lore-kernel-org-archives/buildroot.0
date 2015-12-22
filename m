From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 19:05:49 +0100
Subject: [Buildroot] [git commit] autofs: new package
Message-ID: <20151222181156.2846E81D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=748131a4c56f092bf302a6fea6901220d50174cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested on i.MX6 using NFS mounts only. Not tested with DAS mounts as
of this commit.

[Thomas:
 - remove the "# rpcbind" comments on the thread and mmu dependencies,
   since we don't select rpcbind. The thread and mmu dependencies are
   still needed though, since autofs uses pthread_*() functions and
   fork().
 - Remove "Requires a toolchain with native RPC." in the Config.in
   help text and instead add a proper Config.in comment about the
   thread and RPC dependency.
 - Add patch to fix building with uClibc, taken from OpenEmbedded.]

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 ...1-include-linux-nfs.h-directly-in-rpc_sub.patch | 33 ++++++++++++++++++++++
 package/autofs/Config.in                           | 19 +++++++++++++
 package/autofs/autofs.hash                         |  2 ++
 package/autofs/autofs.mk                           | 21 ++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f8c23c5..910d521 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -155,6 +155,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/autofs/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch b/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch
new file mode 100644
index 0000000..26e86c3
--- /dev/null
+++ b/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending
+
+From 44bdce8c6ed9b30c1643e5981172a4f9025f013c Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Wed, 13 Mar 2013 16:17:08 +0100
+Subject: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
+
+Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
+nothing but "#include linux/nfs.h". rpc_subs.h already includes
+other linux/nfs*.h files directly.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/rpc_subs.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/rpc_subs.h b/include/rpc_subs.h
+index b6d59f9..a2d9648 100644
+--- a/include/rpc_subs.h
++++ b/include/rpc_subs.h
+@@ -18,7 +18,7 @@
+ 
+ #include <rpc/rpc.h>
+ #include <rpc/pmap_prot.h>
+-#include <nfs/nfs.h>
++#include <linux/nfs.h>
+ #include <linux/nfs2.h>
+ #include <linux/nfs3.h>
+ 
+-- 
+1.7.10.4
+
diff --git a/package/autofs/Config.in b/package/autofs/Config.in
new file mode 100644
index 0000000..2933740
--- /dev/null
+++ b/package/autofs/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_AUTOFS
+	bool "autofs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Autofs controls the operation of the automount daemons. The
+	  automount daemons automatically mount filesystems when they
+	  are used and unmount them after a period of inactivity based
+	  on a set of pre-configured maps defined by default in
+	  /etc/auto.master. The kernel automounter implements SunOS
+	  style automounter under Linux and requires a kernel version
+	  of at least 2.6.17 and the autofs4 kernel module.
+
+	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
+
+comment "autofs needs a toolchain w/ threads, RPC"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
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
index 0000000..f7ff5f3
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
+AUTOFS_CONF_OPTS = \
+	--disable-mount-locking \
+	--enable-ignore-busy \
+	--without-openldap \
+	--without-sasl
+
+AUTOFS_MAKE_ENV = DONTSTRIP=1
+
+$(eval $(autotools-package))
