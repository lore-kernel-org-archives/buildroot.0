From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:40:03 +0100
Subject: [Buildroot] [PATCH v3 3/7] dtc: bump version to 1.4.1
In-Reply-To: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
Message-ID: <1421178007-11877-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0001-separate-lib-install.patch is no longer needed,
original Makefile already contains separate install-lib target
(but build always complete default target).

Remove superfluous CFLAGS setting.

Adjust 0002-extra-cflags.patch.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - always use default build target, avoids build failure
    (suggested by Thomas Petazzoni)
  - no need for extra CFLAGS setting (suggested by Thomas Petazzoni)
  - split add hash to extra commit

Changes v1 -> v2:
  - delete additional invalid comment
---
 package/dtc/0001-separate-lib-install.patch | 28 ----------------------------
 package/dtc/0002-extra-cflags.patch         |  2 +-
 package/dtc/dtc.mk                          | 14 ++++----------
 3 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 package/dtc/0001-separate-lib-install.patch

diff --git a/package/dtc/0001-separate-lib-install.patch b/package/dtc/0001-separate-lib-install.patch
deleted file mode 100644
index c86d587..0000000
--- a/package/dtc/0001-separate-lib-install.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Makefile: add a rule to only install libfdt
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Patch not sent upstream.
-
-It's really specific to buildroot, and is probably not
-good (aka generic) enough to be pushed upstream.
-
-diff --git a/Makefile b/Makefile
-index 1169e6c..39e7190 100644
---- a/Makefile
-+++ b/Makefile
-@@ -160,10 +160,12 @@ endif
- # intermediate target and building them again "for real"
- .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
- 
--install: all $(SCRIPTS)
-+install: all $(SCRIPTS) libfdt_install
- 	@$(VECHO) INSTALL
- 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
- 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
-+
-+libfdt_install: libfdt
- 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
- 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
- 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
diff --git a/package/dtc/0002-extra-cflags.patch b/package/dtc/0002-extra-cflags.patch
index 51b7957..f070692 100644
--- a/package/dtc/0002-extra-cflags.patch
+++ b/package/dtc/0002-extra-cflags.patch
@@ -23,7 +23,7 @@ index 962f94eba661..bf6b317158cf 100644
  CPPFLAGS = -I libfdt -I .
 -WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 +WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
- 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
+ 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
 -CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
 +CFLAGS ?= -g -Os
 +CFLAGS += -fPIC $(WARNINGS)
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 6fd5064..c01fe7b 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.4.0
+DTC_VERSION = 1.4.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPLv2+/BSD-2c
@@ -19,8 +19,6 @@ endef
 ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
 
 DTC_LICENSE += (for the library), GPLv2+ (for the executables)
-# Use default goal to build everything
-DTC_BUILD_GOAL =
 DTC_INSTALL_GOAL = install
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
@@ -28,21 +26,17 @@ endif
 
 else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
-DTC_BUILD_GOAL = libfdt
-#?libfdt_install is our own install rule added by our patch
-DTC_INSTALL_GOAL = libfdt_install
+DTC_INSTALL_GOAL = install-lib
 
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
 define DTC_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS)    \
-	CFLAGS="$(TARGET_CFLAGS)"   \
-	$(MAKE) -C $(@D) PREFIX=/usr $(DTC_BUILD_GOAL)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
 endef
 
 # For staging, only the library is needed
 define DTC_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-- 
2.1.2
