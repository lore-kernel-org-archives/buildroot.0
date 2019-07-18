From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Jul 2019 23:18:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/dropwatch: bump to version 1.5.1
Message-ID: <20190718211858.11982-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site, see
  http://git.infradead.org/users/nhorman/dropwatch.git/blob/975fd7331d19a32f6d0f20781dfb19f2d14c3c31:/README
- Switch to autotools (and so drop second patch on Makefile: if there is
  some errors raised by -Werror, we'll fix them)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dropwatch/0002-remove-werror.patch | 31 ----------------------
 package/dropwatch/Config.in                |  2 +-
 package/dropwatch/dropwatch.hash           |  3 ++-
 package/dropwatch/dropwatch.mk             | 26 +++++++-----------
 4 files changed, 13 insertions(+), 49 deletions(-)
 delete mode 100644 package/dropwatch/0002-remove-werror.patch

diff --git a/package/dropwatch/0002-remove-werror.patch b/package/dropwatch/0002-remove-werror.patch
deleted file mode 100644
index 4b6c989364..0000000000
--- a/package/dropwatch/0002-remove-werror.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2462baf55939ee53bb28ff5f9474761f2a888add Mon Sep 17 00:00:00 2001
-From: Markos Chandras <markos.chandras@imgtec.com>
-Date: Fri, 16 Jun 2017 08:53:31 +0200
-Subject: [PATCH] remove werror
-
--Werror shouldn't be used in released code since it can
-cause random build failures on moderate warnings. It also
-depends on the used toolchain since different toolchains may
-or may not print the same warnings.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 5bc6aaa..527c1da 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -1,7 +1,7 @@
- all: dropwatch
- 
- CPPFLAGS += -D_GNU_SOURCE
--CFLAGS += -g -Wall -Werror $(shell pkg-config --cflags libnl-3.0)
-+CFLAGS += -g -Wall $(shell pkg-config --cflags libnl-3.0)
- LDLIBS += -lbfd -lreadline -lnl-3 -lnl-genl-3
- 
- OBJFILES := main.o lookup.o\
--- 
-2.1.4
-
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index f470f1b562..6d021756ee 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_DROPWATCH
 	  Dropwatch is an interactive utility for monitoring and
 	  recording packets that are dropped by the kernel
 
-	  http://git.infradead.org/users/nhorman/dropwatch.git
+	  https://github.com/nhorman/dropwatch
 
 comment "dropwatch needs a toolchain w/ threads, wchar"
 	depends on !BR2_nios2
diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index 585b035d0f..e0e03ad883 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 4937007da3d0071c9a37ee0360cfd1657b342fd2a327d83ba992fbf3e0ea51b5  dropwatch-7c33d8a8ed105b07a46b55d71d93b36ed34c16db.tar.gz
+sha256 3a95b7ff0d609f581c120a4072e6a97d044f900824b4f4d3ac83fdcc5f3e96cf  dropwatch-1.5.1.tar.gz
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 692a6e8c40..bda25dd326 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,27 +4,21 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 7c33d8a8ed105b07a46b55d71d93b36ed34c16db
-DROPWATCH_SITE = git://git.infradead.org/users/nhorman/dropwatch.git
+DROPWATCH_VERSION = 1.5.1
+DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0
 DROPWATCH_LICENSE_FILES = COPYING
+# From git
+DROPWATCH_AUTORECONF = YES
 
-# libbfd may be linked to libintl
-# Ugly... but LDLIBS are hardcoded anyway
-DROPWATCH_LDLIBS = \
-	-lbfd -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm \
-	$(TARGET_NLS_LIBS)
-
-define DROPWATCH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		LDLIBS="$(DROPWATCH_LDLIBS)" build
+# Autoreconf step fails due to missing m4 directory
+define DROPWATCH_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
 endef
+DROPWATCH_PRE_CONFIGURE_HOOKS += DROPWATCH_CREATE_M4_DIR
 
-define DROPWATCH_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/dropwatch \
-		$(TARGET_DIR)/usr/bin/dropwatch
-endef
+DROPWATCH_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.20.1
