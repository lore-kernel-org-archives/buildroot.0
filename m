From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Jan 2015 00:52:48 +0100
Subject: [Buildroot] [PATCH v1 2/3] dtc: bump version to 1.4.1
In-Reply-To: <1420933969-24021-1-git-send-email-ps.report@gmx.net>
References: <1420933969-24021-1-git-send-email-ps.report@gmx.net>
Message-ID: <1420933969-24021-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0001-separate-lib-install.patch is no longer needed,
original Makefile already contains separate install-lib target.

Adjust 0002-extra-cflags.patch.

Add hash file.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dtc/0001-separate-lib-install.patch | 28 ----------------------------
 package/dtc/0002-extra-cflags.patch         |  2 +-
 package/dtc/dtc.hash                        |  2 ++
 package/dtc/dtc.mk                          |  6 +++---
 4 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/dtc/0001-separate-lib-install.patch
 create mode 100644 package/dtc/dtc.hash

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
diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
new file mode 100644
index 0000000..8b3af33
--- /dev/null
+++ b/package/dtc/dtc.hash
@@ -0,0 +1,2 @@
+# from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
+sha256 77992ad8eac7b68f553d0ba58e5b51604ac803d126196c99e3ae38aaae28bb94  dtc-1.4.1.tar.xz
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 6fd5064..1247ce2 100644
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
@@ -30,7 +30,7 @@ else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
 DTC_BUILD_GOAL = libfdt
 #?libfdt_install is our own install rule added by our patch
-DTC_INSTALL_GOAL = libfdt_install
+DTC_INSTALL_GOAL = install-lib
 
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
@@ -42,7 +42,7 @@ endef
 
 # For staging, only the library is needed
 define DTC_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-- 
2.1.2
