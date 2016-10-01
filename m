From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Oct 2016 00:11:12 +0200
Subject: [Buildroot] [git commit] efivar: bump to version 28
Message-ID: <20161001221204.2CB7A81E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a1d2729ec9c594d7690e5ae444a18317dca5813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has changed version numbering scheme since version 25, which
came after version 0.24.

The two patches that we had in package/efivar/ were backports and so can
be dropped with this bump.

This new version also fixes the build failure with gcc 6.x, so:
Fixes:
http://autobuild.buildroot.net/results/ea6/ea6968d5d0fd0d8ee64e045e2aa56c8e8a0b7b14

[Peter: require GCC 4.9+, adjust Config.in nvme.h comment]
Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Workaround-rename-of-linux-nvme.h.patch   | 32 ---------------
 .../0002-Make.rules-fix-build-with-make-3.81.patch | 45 ----------------------
 package/efivar/Config.in                           |  8 ++--
 package/efivar/efivar.hash                         |  2 +-
 package/efivar/efivar.mk                           |  2 +-
 5 files changed, 6 insertions(+), 83 deletions(-)

diff --git a/package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch b/package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch
deleted file mode 100644
index c12a2d9..0000000
--- a/package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 75a73111371526a12712bb7211da2116c0bf40f7 Mon Sep 17 00:00:00 2001
-From: Mike Gilbert <floppym@gentoo.org>
-Date: Thu, 14 Jan 2016 17:02:31 -0500
-Subject: [PATCH] Workaround rename of linux/nvme.h
-
-Bug: https://bugs.gentoo.org/571548
-
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- src/linux.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/linux.c b/src/linux.c
-index b618cfd..9388cd3 100644
---- a/src/linux.c
-+++ b/src/linux.c
-@@ -22,7 +22,12 @@
- #include <inttypes.h>
- #include <limits.h>
- #include <linux/ethtool.h>
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)
-+#include <linux/nvme_ioctl.h>
-+#else
- #include <linux/nvme.h>
-+#endif
- #include <linux/sockios.h>
- #include <net/if.h>
- #include <scsi/scsi.h>
--- 
-2.7.4
-
diff --git a/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch b/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
deleted file mode 100644
index e4e5a2c..0000000
--- a/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 00376f4dec71d4abb591ba07bc8164ba29e5955e Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Tue, 22 Mar 2016 21:43:44 -0300
-Subject: [PATCH] Make.rules: fix build with make <= 3.81
-
-Building with host make 3.81 resulted in an issue where src/efivar.pc
-was never generated.
-Even by running 'make efivar.pc' inside the src directory, make always
-returned that there was nothing to do.
-This was not observed when using make 3.82 or 4.x.
-It is apparently caused by the assignment operators in the multi-line
-defines in Make.rules, which do not seem to be supported by make 3.81.
-By omitting the assignment operators, the rule works with both versions
-of make.
-
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- Make.rules | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Make.rules b/Make.rules
-index 8a50fa5..d9c0609 100644
---- a/Make.rules
-+++ b/Make.rules
-@@ -42,7 +42,7 @@ include $(TOPDIR)/Make.version
- 
- %.c : %.h
- 
--define substitute-version =
-+define substitute-version
- 	sed						\
- 		-e "s,@@VERSION@@,$(VERSION),g"		\
- 		-e "s,@@LIBDIR@@,$(libdir),g"		\
-@@ -61,7 +61,7 @@ pkg-config-ldflags = \
- pkg-config-ldlibs = \
- 	$(shell if [ -n "$(PKGS)" ]; then $(PKG_CONFIG) --libs-only-l $(PKGS) ; fi)
- 
--define deps-of =
-+define deps-of
- 	$(foreach src,$(filter %.c,$(1)),$(patsubst %.c,.%.d,$(src))) \
- 	$(foreach src,$(filter %.S,$(1)),$(patsubst %.S,.%.d,$(src)))
- endef
--- 
-2.7.4
-
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index d595107..466a30a 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_EFIVAR
 	bool "efivar"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
 	# linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4,
-	# and we have a patch to handle that situation. However, some
+	# and the efivar source handles that situation. However, some
 	# Sourcery CodeBench toolchains use 4.4 kernel headers but they
 	# don't have that header file renamed, and that is causing build
 	# failures. So, prevent this package to be built using those
@@ -12,16 +12,16 @@ config BR2_PACKAGE_EFIVAR
 	# doesn't build with uclibc due to lack of uchar.h
 	# doesn't build with musl due to lack of __bswap_constant_16
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_POPT
 	help
 	  Tools and libraries to manipulate EFI variables
 
 	  https://github.com/rhinstaller/efivar
 
-comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
+comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index 6619229..3671bbc 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 f807f5f0846323bc21b18043542b296f5ad81514f91f13c74a4b8da30c965c94 efivar-0.23.tar.gz
+sha256 7fed0b31fe796d7dfef40cccb97b8bb0b806f16e568074ad2d456be30e195f5e efivar-28.tar.gz
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index cb5f7b6..cff3ac1 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 0.23
+EFIVAR_VERSION = 28
 EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPLv2.1
 EFIVAR_LICENSE_FILES = COPYING
