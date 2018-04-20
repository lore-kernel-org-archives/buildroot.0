From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 08:40:24 +0200
Subject: [Buildroot] [git commit] lz4: improve static only build support
Message-ID: <20180420064222.64596888EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7c8cd89c9da27dfdf60407e38ed4450fe8af713
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current method of supporting static only build, removal of all lines
that match the SHARED regex from lib/Makefile, is crude and fragile.
Instead, patch lib/Makefile to allow disable of shared libraries.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-lib-allow-to-disable-shared-libraries.patch | 59 ++++++++++++++++++++++
 package/lz4/lz4.mk                                 | 12 ++---
 2 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch b/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch
new file mode 100644
index 0000000000..4f89e85577
--- /dev/null
+++ b/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch
@@ -0,0 +1,59 @@
+From 95bde2a4ae4a92e984a5783ca1f09f44bf04fadb Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 19 Apr 2018 12:28:11 +0300
+Subject: [PATCH] lib: allow to disable shared libraries
+
+Just like BUILD_STATIC=no disables static libraries, BUILD_SHARED=no
+disabled shared libraries. This is useful to support toolchains that do
+not support shared libraries.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/lz4/lz4/pull/504
+
+ lib/Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index dd33f50351a8..976d57cd75ed 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -42,6 +42,7 @@ LIBVER_MINOR := $(shell echo $(LIBVER_MINOR_SCRIPT))
+ LIBVER_PATCH := $(shell echo $(LIBVER_PATCH_SCRIPT))
+ LIBVER  := $(shell echo $(LIBVER_SCRIPT))
+ 
++BUILD_SHARED:=yes
+ BUILD_STATIC:=yes
+ 
+ CPPFLAGS+= -DXXH_NAMESPACE=LZ4_
+@@ -92,6 +93,7 @@ ifeq ($(BUILD_STATIC),yes)  # can be disabled on command line
+ endif
+ 
+ $(LIBLZ4): $(SRCFILES)
++ifeq ($(BUILD_SHARED),yes)  # can be disabled on command line
+ 	@echo compiling dynamic library $(LIBVER)
+ ifneq (,$(filter Windows%,$(OS)))
+ 	@$(CC) $(FLAGS) -DLZ4_DLL_EXPORT=1 -shared $^ -o dll\$@.dll
+@@ -102,6 +104,7 @@ else
+ 	@ln -sf $@ liblz4.$(SHARED_EXT_MAJOR)
+ 	@ln -sf $@ liblz4.$(SHARED_EXT)
+ endif
++endif
+ 
+ liblz4: $(LIBLZ4)
+ 
+@@ -159,9 +162,11 @@ ifeq ($(BUILD_STATIC),yes)
+ 	@$(INSTALL_DATA) liblz4.a $(DESTDIR)$(LIBDIR)/liblz4.a
+ 	@$(INSTALL_DATA) lz4frame_static.h $(DESTDIR)$(INCLUDEDIR)/lz4frame_static.h
+ endif
++ifeq ($(BUILD_SHARED),yes)
+ 	@$(INSTALL_PROGRAM) liblz4.$(SHARED_EXT_VER) $(DESTDIR)$(LIBDIR)
+ 	@ln -sf liblz4.$(SHARED_EXT_VER) $(DESTDIR)$(LIBDIR)/liblz4.$(SHARED_EXT_MAJOR)
+ 	@ln -sf liblz4.$(SHARED_EXT_VER) $(DESTDIR)$(LIBDIR)/liblz4.$(SHARED_EXT)
++endif
+ 	@echo Installing headers in $(INCLUDEDIR)
+ 	@$(INSTALL_DATA) lz4.h $(DESTDIR)$(INCLUDEDIR)/lz4.h
+ 	@$(INSTALL_DATA) lz4hc.h $(DESTDIR)$(INCLUDEDIR)/lz4hc.h
+-- 
+2.17.0
+
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index c88329f797..a77f6b5f5f 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -11,10 +11,7 @@ LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
-define LZ4_DISABLE_SHARED
-	$(SED) '/SHARED/d' $(@D)/lib/Makefile
-endef
-LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
+LZ4_MAKE_OPTS += BUILD_SHARED=no
 endif
 
 define HOST_LZ4_BUILD_CMDS
@@ -27,17 +24,18 @@ define HOST_LZ4_INSTALL_CMDS
 endef
 
 define LZ4_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) lib lz4
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
+		-C $(@D) lib lz4
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
-		PREFIX=/usr install -C $(@D)
+		PREFIX=/usr $(LZ4_MAKE_OPTS) install -C $(@D)
 endef
 
 define LZ4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
-		PREFIX=/usr install -C $(@D)
+		PREFIX=/usr $(LZ4_MAKE_OPTS) install -C $(@D)
 endef
 
 $(eval $(generic-package))
