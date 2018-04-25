From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:46:55 +0200
Subject: [Buildroot] [git commit] zstd: add libzstd support
Message-ID: <20180425214804.7393A88E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e7fbf007ca316ea55c2466a69de93a7926f755e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to split libzstd install target into pc, static, shared and
includes target. Call only the needed ones for the buildroot
staging/target install steps (respect the static/shared
configuration).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: as suggested by Yann E. Morin, refactor the build/install
commands to use only one invocation, with intermediate ZSTD_BUILD_LIBS
and ZSTD_INSTALL_LIBS variables, defined depending on whether
static/shared/static+shared is selected.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ry-install-target-into-pc-static-shared-a.patch | 51 ++++++++++++++++++++++
 package/zstd/zstd.mk                               | 22 ++++++++++
 2 files changed, 73 insertions(+)

diff --git a/package/zstd/0001-Split-library-install-target-into-pc-static-shared-a.patch b/package/zstd/0001-Split-library-install-target-into-pc-static-shared-a.patch
new file mode 100644
index 0000000000..af9b2bf3f9
--- /dev/null
+++ b/package/zstd/0001-Split-library-install-target-into-pc-static-shared-a.patch
@@ -0,0 +1,51 @@
+From 2623a12bff19049b6ad5bc066e3ef9c6259d415c Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 16 Apr 2018 20:44:49 +0200
+Subject: [PATCH] Split library install target into pc, static, shared and
+ include only target
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/Makefile | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index cdfdc5c..b592aa6 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -159,20 +159,29 @@ libzstd.pc: libzstd.pc.in
+              -e 's|@VERSION@|$(VERSION)|' \
+              $< >$@
+ 
+-install: libzstd.a libzstd libzstd.pc
++install: install-pc install-static install-shared install-includes
++	@echo zstd static and shared library installed
++
++install-pc: libzstd.pc
+ 	@$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/ $(DESTDIR)$(INCLUDEDIR)/
+ 	@$(INSTALL_DATA) libzstd.pc $(DESTDIR)$(PKGCONFIGDIR)/
+-	@echo Installing libraries
++
++install-static: libzstd.a
++	@echo Installing static library
+ 	@$(INSTALL_DATA) libzstd.a $(DESTDIR)$(LIBDIR)
++
++install-shared: libzstd
++	@echo Installing shared library
+ 	@$(INSTALL_PROGRAM) $(LIBZSTD) $(DESTDIR)$(LIBDIR)
+ 	@ln -sf $(LIBZSTD) $(DESTDIR)$(LIBDIR)/libzstd.$(SHARED_EXT_MAJOR)
+ 	@ln -sf $(LIBZSTD) $(DESTDIR)$(LIBDIR)/libzstd.$(SHARED_EXT)
++
++install-includes:
+ 	@echo Installing includes
+ 	@$(INSTALL_DATA) zstd.h $(DESTDIR)$(INCLUDEDIR)
+ 	@$(INSTALL_DATA) common/zstd_errors.h $(DESTDIR)$(INCLUDEDIR)
+ 	@$(INSTALL_DATA) deprecated/zbuff.h $(DESTDIR)$(INCLUDEDIR)     # prototypes generate deprecation warnings
+ 	@$(INSTALL_DATA) dictBuilder/zdict.h $(DESTDIR)$(INCLUDEDIR)
+-	@echo zstd static and shared library installed
+ 
+ uninstall:
+ 	@$(RM) $(DESTDIR)$(LIBDIR)/libzstd.a
+-- 
+2.16.3
+
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 5376e86c43..c74c8f24b6 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -6,6 +6,7 @@
 
 ZSTD_VERSION = v1.3.3
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
+ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
 
@@ -36,14 +37,35 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+ZSTD_BUILD_LIBS = libzstd.a
+ZSTD_INSTALL_LIBS = install-static
+else ifeq ($(BR2_SHARED_LIBS),y)
+ZSTD_BUILD_LIBS = libzstd
+ZSTD_INSTALL_LIBS = install-shared
+else
+ZSTD_BUILD_LIBS = libzstd.a libzstd
+ZSTD_INSTALL_LIBS = install-static install-shared
+endif
+
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D) zstd
 endef
 
+define ZSTD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
+		install-pc install-includes $(ZSTD_INSTALL_LIBS)
+endef
+
 define ZSTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
 endef
 
 # note: no 'HAVE_...' options for host library build only
