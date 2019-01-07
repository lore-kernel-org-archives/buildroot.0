From: David J. Fogle <Dave@exitstrategytech.com>
Date: Mon, 7 Jan 2019 22:44:07 +0000
Subject: [Buildroot] [PATCH] package/rauc: version bump to 1.0
Message-ID: <2dcda5ba55a548c5a61cb30db7686ba9@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


For details see [1]

This bump also deleted the two patch files for the RAUC package. These
were related to eMMC support being made optional, and workaround for
olde kernel. Both of these patch sets have been merged into upsteam in
the rauc git repos.

Older kernel workaound:
https://github.com/rauc/rauc/commit/993b698c48789baea51f8b7c47b1e057ba328033#diff-b3a0044e6a3b6a8b16933e72f416c8f1

Make eMMC selectable:
https://github.com/rauc/rauc/commit/f85d1cab07376c7680ef4d9e45a6baf345e24e37#diff-365367c8cde56aafd5cbad767e1c9738

[1] https://github.com/rauc/rauc/releases/tag/v1.0

Signed-off-by: David J Fogle dave at exitstrategytech.com
---
 ...mmc-add-workaround-for-older-kernels.patch |  33 -----
 ...eMMC-boot-partition-support-optional.patch | 116 ------------------
 package/rauc/rauc.hash                        |   2 +-
 package/rauc/rauc.mk                          |   3 +-
 4 files changed, 2 insertions(+), 152 deletions(-)
 delete mode 100644 package/rauc/0001-emmc-add-workaround-for-older-kernels.patch
 delete mode 100644 package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch

diff --git a/package/rauc/0001-emmc-add-workaround-for-older-kernels.patch b/package/rauc/0001-emmc-add-workaround-for-older-kernels.patch
deleted file mode 100644
index 23c9484e61..0000000000
--- a/package/rauc/0001-emmc-add-workaround-for-older-kernels.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7c67c0ef267d470fcec950d2be49507255f39fc5 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 13 May 2018 14:17:44 +0200
-Subject: [PATCH] emmc: add workaround for older kernels
-
-Kernels up to (and including 3.3) forgot to include types.h in their
-mmc/ioctl.h, and thus __u32 (and others) are not defined, causing
-compilation errors:
-
-    http://autobuild.buildroot.org/results/621/621587906bd2bb27c43b6fcbb051d75f20e32e7c/build-end.log
-
-Fix that by explicitly including types.h before mmc/ioctl.h.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- src/emmc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/emmc.c b/src/emmc.c
-index e8b0b05..2ce3373 100644
---- a/src/emmc.c
-+++ b/src/emmc.c
-@@ -4,6 +4,7 @@
- #include <fcntl.h>
- #include <glib/gstdio.h>
- #include <linux/major.h>
-+#include <linux/types.h> /* kernel < 3.4 forgot that in mmc/ioctl.h */
- #include <linux/mmc/ioctl.h>
- #include <string.h>
- #include <sys/ioctl.h>
--- 
-2.14.1
-
diff --git a/package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch b/package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch
deleted file mode 100644
index f6177c9d54..0000000000
--- a/package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From d66502532fea652d8743bfb61f9843c796d305cf Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 24 Aug 2018 14:30:19 +0200
-Subject: [PATCH] build: make eMMC boot partition support optional
-
-The eMMC boot partition support, added in commit
-ea5cc7ff606c65536da218bd1ef6d0ca279c9b17 ("src/update_handler: add
-support for updating eMMC boot partitions"), requires
-<linux/mmc/ioctl.h>, only available starting from kernel headers 3.0.
-
-Even though it is pretty likely that people are going to use Linux >=
-3.0 on their embedded systems these days, RAUC also needs to be built
-natively on the build machine to produce update artifacts, and the
-build machine is sometimes using an ancient Linux system, especially
-in an enterprise contexts.
-
-In order to make sure that RAUC builds fine in this context, this
-commit makes the eMMC boot partition support optional, by verifying
-the availability of <linux/mmc/ioctl.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Makefile.am          | 5 ++++-
- configure.ac         | 6 ++++++
- src/update_handler.c | 6 ++++++
- 3 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 23eb2d1..7b4682d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -39,7 +39,6 @@ librauc_la_SOURCES = \
-       src/checksum.c \
-       src/config_file.c \
-       src/context.c \
--      src/emmc.c \
-       src/install.c \
-       src/manifest.c \
-       src/mark.c \
-@@ -63,6 +62,10 @@ librauc_la_SOURCES = \
-       include/update_handler.h \
-       include/utils.h
- 
-+if WANT_EMMC_BOOT_SUPPORT
-+librauc_la_SOURCES += src/emmc.c
-+endif
-+
- if WANT_NETWORK
- librauc_la_SOURCES += src/network.c include/network.h
- endif
-diff --git a/configure.ac b/configure.ac
-index 2d6f940..1ec124b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -102,6 +102,12 @@ AC_SUBST(DBUS_SYSTEMSERVICEDIR)
- 
- # Checks for header files.
- 
-+AC_CHECK_HEADER([linux/mmc/ioctl.h],
-+      AC_DEFINE([ENABLE_EMMC_BOOT_SUPPORT], [1], [Define to 1 to enable eMMC boot support]),
-+      AC_DEFINE([ENABLE_EMMC_BOOT_SUPPORT], [0]))
-+
-+AM_CONDITIONAL([WANT_EMMC_BOOT_SUPPORT], [test x$ac_cv_header_linux_mmc_ioctl_h != xno])
-+
- # Checks for typedefs, structures, and compiler characteristics.
- 
- # Checks for library functions.
-diff --git a/src/update_handler.c b/src/update_handler.c
-index 62115ec..a9f233a 100644
---- a/src/update_handler.c
-+++ b/src/update_handler.c
-@@ -57,6 +57,7 @@ out:
-       return outstream;
- }
- 
-+#if ENABLE_EMMC_BOOT_SUPPORT == 1
- static gboolean clear_slot(RaucSlot *slot, GError **error)
- {
-       GError *ierror = NULL;
-@@ -99,6 +100,7 @@ out:
-       g_clear_object(&outstream);
-       return res;
- }
-+#endif
- 
- static gboolean ubifs_ioctl(RaucImage *image, int fd, GError **error)
- {
-@@ -1085,6 +1087,7 @@ out:
-       return res;
- }
- 
-+#if ENABLE_EMMC_BOOT_SUPPORT == 1
- static gboolean img_to_boot_emmc_handler(RaucImage *image, RaucSlot *dest_slot, const gchar *hook_name, GError **error)
- {
- 
-@@ -1245,6 +1248,7 @@ out:
- 
-       return res;
- }
-+#endif
- 
- static gboolean img_to_raw_handler(RaucImage *image, RaucSlot *dest_slot, const gchar *hook_name, GError **error)
- {
-@@ -1329,7 +1333,9 @@ RaucUpdatePair updatepairs[] = {
-       {"*.img", "nand", img_to_nand_handler},
-       {"*.img", "ubivol", img_to_ubivol_handler},
-       {"*.squashfs", "ubivol", img_to_ubivol_handler},
-+#if ENABLE_EMMC_BOOT_SUPPORT == 1
-       {"*.img", "boot-emmc", img_to_boot_emmc_handler},
-+#endif
-       {"*.img", "*", img_to_raw_handler}, /* fallback */
-       {0}
- };
--- 
-2.14.4
-
diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index a16340f185..54c6c93229 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
 # https://github.com/rauc/rauc/releases/download/v0.4/rauc-0.4.tar.xz.asc
-sha256 89656b6330ac1f31293d450f5179896397c588ab52e77ec229382a6abd125d35 rauc-0.4.tar.xz
+sha256 8875ab0d02b4cb38a211b236855361c18b874b385e6f18dde394ac699f2cf2aa rauc-1.0.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 36119c061d..6ca39e820e 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-RAUC_VERSION = 0.4
+RAUC_VERSION = 1.0
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
-# 0002-build-make-eMMC-boot-partition-support-optional.patch
 RAUC_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
-- 
2.19.2
