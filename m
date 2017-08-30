From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:16:37 +0200
Subject: [Buildroot] [git commit] package/simicsfs: remove package
Message-ID: <20170830201148.E1F5B7FE16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20db09895d84ce20b66432614084fd6a54d6a9bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot currently packages version 1.18 of simics, which is quite
out of date, and does not compile with Linux 4.12+. The latest package
v1.22 supports recent kernels, however that is not publicly available
anymore like the older versions.

In fact Simics is now moving away from the simicsfs kernel module, as
the kernel module has required too much maintenance work. Users should
move to the new user mode Simics agent instead. Therefore, we drop the
corresponding package from Buildroot.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy               | 13 +++++++++++++
 DEVELOPERS                     |  1 -
 package/Config.in              |  1 -
 package/simicsfs/Config.in     | 11 -----------
 package/simicsfs/simicsfs.hash |  2 --
 package/simicsfs/simicsfs.mk   | 13 -------------
 6 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 693dc95..d35b409 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,19 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_PACKAGE_SIMICSFS
+	bool "simicsfs support removed"
+	select BR2_LEGACY
+	help
+	  Support for simicsfs kernel driver that provides access to a
+	  host computer's local filesystem when the target is
+	  executing within a SIMICS simulation has been removed.
+
+	  Simics is now moving away from the simicsfs kernel module,
+	  as the kernel module has required too much maintenance
+	  work. Users should move to the user mode Simics agent
+	  instead.
+
 config BR2_BINUTILS_VERSION_2_26_X
 	bool "binutils version 2.26 support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 73686e2..1453486 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,7 +1162,6 @@ F:	package/python-pyrex/
 F:	package/raptor/
 F:	package/sepolgen/
 F:	package/setools/
-F:	package/simicsfs/
 F:	package/smcroute/
 F:	package/tclap/
 F:	package/valijson/
diff --git a/package/Config.in b/package/Config.in
index a0868d9..ba101db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,7 +189,6 @@ menu "Filesystem and flash utilities"
 	source "package/mtools/Config.in"
 	source "package/nfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
-	source "package/simicsfs/Config.in"
 	source "package/sp-oops-extract/Config.in"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
diff --git a/package/simicsfs/Config.in b/package/simicsfs/Config.in
deleted file mode 100644
index 12b05c1..0000000
--- a/package/simicsfs/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-comment "simicsfs needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
-config BR2_PACKAGE_SIMICSFS
-	bool "simicsfs"
-	depends on BR2_LINUX_KERNEL
-	help
-	  A kernel driver that provides access to a host computer's local
-	  filesystem when the target is executing within a SIMICS simulation.
-
-	  http://www.cs.sfu.ca/~fedorova/Tech/simics-guides-3.0.26/simics-user-guide-unix/topic33.html
diff --git a/package/simicsfs/simicsfs.hash b/package/simicsfs/simicsfs.hash
deleted file mode 100644
index 42ada91..0000000
--- a/package/simicsfs/simicsfs.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	d0cf7caf888dc1e7dc9496c4b59af98eb2b69d6113d6920757465902e1f21f38	simicsfs-1.18.tar.gz
diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
deleted file mode 100644
index fe05302..0000000
--- a/package/simicsfs/simicsfs.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# simicsfs
-#
-################################################################################
-
-SIMICSFS_VERSION = 1.18
-SIMICSFS_SITE = http://download.simics.net/pub
-SIMICSFS_LICENSE = GPL-2.0+
-SIMICSFS_LICENSE_FILES = hostfs.h
-
-$(eval $(kernel-module))
-$(eval $(generic-package))
