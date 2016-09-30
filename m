From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 30 Sep 2016 16:46:43 +0200
Subject: [Buildroot] [PATCH 1/2] efivar: bump to version 28
Message-ID: <1475246804-26748-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream has changed version numbering scheme since version 25, which
came after version 0.24.

The two patches that we had in package/efivar/ were backports and so can
be dropped with this bump.

This new version also fixes the build failure with gcc 6.x, so:
Fixes:
http://autobuild.buildroot.net/results/ea6/ea6968d5d0fd0d8ee64e045e2aa56c8e8a0b7b14

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 .../0001-Workaround-rename-of-linux-nvme.h.patch   | 32 ---------------
 .../0002-Make.rules-fix-build-with-make-3.81.patch | 45 ----------------------
 package/efivar/efivar.hash                         |  2 +-
 package/efivar/efivar.mk                           |  2 +-
 4 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 package/efivar/0001-Workaround-rename-of-linux-nvme.h.patch
 delete mode 100644 package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch

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
-- 
2.7.4
