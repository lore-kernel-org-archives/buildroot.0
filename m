From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:32:42 +0200
Subject: [Buildroot] [git commit] rauc: add patch to make it build with
 Linux < 3.0
Message-ID: <20180824213613.449188E718@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db756327f5c765457514b005f70624c6f81688cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to RAUC that makes the eMMC boot partition
support optional. This allows RAUC to build successfully on systems
using Linux < 3.0.

Fixes:

  http://autobuild.buildroot.net/results/7e1cbeb458cb6536a36eae0d24cefb36edb22f55/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...make-eMMC-boot-partition-support-optional.patch | 116 +++++++++++++++++++++
 package/rauc/rauc.mk                               |   2 +
 2 files changed, 118 insertions(+)

diff --git a/package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch b/package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch
new file mode 100644
index 0000000000..f6177c9d54
--- /dev/null
+++ b/package/rauc/0002-build-make-eMMC-boot-partition-support-optional.patch
@@ -0,0 +1,116 @@
+From d66502532fea652d8743bfb61f9843c796d305cf Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 24 Aug 2018 14:30:19 +0200
+Subject: [PATCH] build: make eMMC boot partition support optional
+
+The eMMC boot partition support, added in commit
+ea5cc7ff606c65536da218bd1ef6d0ca279c9b17 ("src/update_handler: add
+support for updating eMMC boot partitions"), requires
+<linux/mmc/ioctl.h>, only available starting from kernel headers 3.0.
+
+Even though it is pretty likely that people are going to use Linux >=
+3.0 on their embedded systems these days, RAUC also needs to be built
+natively on the build machine to produce update artifacts, and the
+build machine is sometimes using an ancient Linux system, especially
+in an enterprise contexts.
+
+In order to make sure that RAUC builds fine in this context, this
+commit makes the eMMC boot partition support optional, by verifying
+the availability of <linux/mmc/ioctl.h>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Makefile.am          | 5 ++++-
+ configure.ac         | 6 ++++++
+ src/update_handler.c | 6 ++++++
+ 3 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 23eb2d1..7b4682d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,7 +39,6 @@ librauc_la_SOURCES = \
+ 	src/checksum.c \
+ 	src/config_file.c \
+ 	src/context.c \
+-	src/emmc.c \
+ 	src/install.c \
+ 	src/manifest.c \
+ 	src/mark.c \
+@@ -63,6 +62,10 @@ librauc_la_SOURCES = \
+ 	include/update_handler.h \
+ 	include/utils.h
+ 
++if WANT_EMMC_BOOT_SUPPORT
++librauc_la_SOURCES += src/emmc.c
++endif
++
+ if WANT_NETWORK
+ librauc_la_SOURCES += src/network.c include/network.h
+ endif
+diff --git a/configure.ac b/configure.ac
+index 2d6f940..1ec124b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -102,6 +102,12 @@ AC_SUBST(DBUS_SYSTEMSERVICEDIR)
+ 
+ # Checks for header files.
+ 
++AC_CHECK_HEADER([linux/mmc/ioctl.h],
++	AC_DEFINE([ENABLE_EMMC_BOOT_SUPPORT], [1], [Define to 1 to enable eMMC boot support]),
++	AC_DEFINE([ENABLE_EMMC_BOOT_SUPPORT], [0]))
++
++AM_CONDITIONAL([WANT_EMMC_BOOT_SUPPORT], [test x$ac_cv_header_linux_mmc_ioctl_h != xno])
++
+ # Checks for typedefs, structures, and compiler characteristics.
+ 
+ # Checks for library functions.
+diff --git a/src/update_handler.c b/src/update_handler.c
+index 62115ec..a9f233a 100644
+--- a/src/update_handler.c
++++ b/src/update_handler.c
+@@ -57,6 +57,7 @@ out:
+ 	return outstream;
+ }
+ 
++#if ENABLE_EMMC_BOOT_SUPPORT == 1
+ static gboolean clear_slot(RaucSlot *slot, GError **error)
+ {
+ 	GError *ierror = NULL;
+@@ -99,6 +100,7 @@ out:
+ 	g_clear_object(&outstream);
+ 	return res;
+ }
++#endif
+ 
+ static gboolean ubifs_ioctl(RaucImage *image, int fd, GError **error)
+ {
+@@ -1085,6 +1087,7 @@ out:
+ 	return res;
+ }
+ 
++#if ENABLE_EMMC_BOOT_SUPPORT == 1
+ static gboolean img_to_boot_emmc_handler(RaucImage *image, RaucSlot *dest_slot, const gchar *hook_name, GError **error)
+ {
+ 
+@@ -1245,6 +1248,7 @@ out:
+ 
+ 	return res;
+ }
++#endif
+ 
+ static gboolean img_to_raw_handler(RaucImage *image, RaucSlot *dest_slot, const gchar *hook_name, GError **error)
+ {
+@@ -1329,7 +1333,9 @@ RaucUpdatePair updatepairs[] = {
+ 	{"*.img", "nand", img_to_nand_handler},
+ 	{"*.img", "ubivol", img_to_ubivol_handler},
+ 	{"*.squashfs", "ubivol", img_to_ubivol_handler},
++#if ENABLE_EMMC_BOOT_SUPPORT == 1
+ 	{"*.img", "boot-emmc", img_to_boot_emmc_handler},
++#endif
+ 	{"*.img", "*", img_to_raw_handler}, /* fallback */
+ 	{0}
+ };
+-- 
+2.14.4
+
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index f1705a8c33..36119c061d 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -9,6 +9,8 @@ RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
+# 0002-build-make-eMMC-boot-partition-support-optional.patch
+RAUC_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
 RAUC_CONF_OPTS += --enable-network
