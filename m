From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 15 Feb 2018 16:56:12 -0800
Subject: [Buildroot] [RFC 6/6] package: use BR2_ROOTFS_LIB_DIR for all
 libraries we use
In-Reply-To: <20180216005612.69593-1-mmayer@broadcom.com>
References: <20180216005612.69593-1-mmayer@broadcom.com>
Message-ID: <20180216005612.69593-7-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure to pass $(BR2_ROOTFS_LIB_DIR) as the library directory name
to all library packages we use.

Autoconf packages are easy. They only require a single added line in
pkg-autotools.mk. It is the generic packages not using autoconf that
need to be tweaked individually.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/bzip2/bzip2.mk                        | 4 +++-
 package/dmalloc/dmalloc.mk                    | 7 ++++---
 package/e2fsprogs/e2fsprogs.mk                | 2 ++
 package/libzlib/libzlib.mk                    | 3 ++-
 package/linux-tools/linux-tool-cpupower.mk.in | 7 ++++++-
 package/pciutils/pciutils.mk                  | 2 ++
 package/pkg-autotools.mk                      | 1 +
 package/readline/readline.mk                  | 2 +-
 9 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index e43533072b2d..67f0239944ca 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -39,6 +39,7 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 define BZIP2_INSTALL_TARGET_SHARED_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
+		LIBDIR=$(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR) \
 		-f Makefile-libbz2_so PREFIX=$(TARGET_DIR)/usr -C $(@D) install
 endef
 endif
@@ -47,7 +48,8 @@ endif
 define BZIP2_INSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,bzip2 bunzip2 bzcat)
 	$(TARGET_MAKE_ENV) $(MAKE) \
-		PREFIX=$(TARGET_DIR)/usr -C $(@D) install
+		PREFIX=$(TARGET_DIR)/usr \
+		LIBDIR=$(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR) -C $(@D) install
 	$(BZIP2_INSTALL_TARGET_SHARED_CMDS)
 endef
 
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 6ebb44c5c068..d54950fec5a1 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -50,15 +50,16 @@ DMALLOC_POST_PATCH_HOOKS += DMALLOC_POST_PATCH
 define DMALLOC_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) includedir="$(STAGING_DIR)/usr/include" \
 		bindir="$(STAGING_DIR)/usr/bin" \
-		libdir="$(STAGING_DIR)/usr/lib" \
-		shlibdir="$(STAGING_DIR)/usr/lib" \
+		libdir="$(STAGING_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)" \
+		shlibdir="$(STAGING_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)" \
 		infodir="$(STAGING_DIR)/usr/share/info/" \
 		-C $(@D) install
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
 define DMALLOC_INSTALL_SHARED_LIB
-	cp -dpf $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)/libdmalloc*.so \
+		$(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)
 endef
 endif
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e77b10f26dae..5cf2445562c9 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -65,6 +65,8 @@ ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
 endif
 
+E2FSPROGS_CONF_ENV += PKG_CONFIG_PATH="$(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)/pkgconfig"
+
 # Some programs are built for the host, but use definitions guessed by
 # the configure script (i.e with the cross-compiler). Help them by
 # saying that <sys/stat.h> is available on the host, which is needed
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index eea0c12f2209..7ef79bac21b7 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -31,6 +31,7 @@ define LIBZLIB_CONFIGURE_CMDS
 		./configure \
 		$(LIBZLIB_SHARED) \
 		--prefix=/usr \
+		--libdir='$${exec_prefix}/$(BR2_ROOTFS_LIB_DIR)' \
 	)
 endef
 
@@ -65,7 +66,7 @@ endef
 # assembling the filesystem images anyway.
 ifeq ($(BR2_SHARED_LIBS),y)
 define LIBZLIB_RM_STATIC_STAGING
-	rm -f $(STAGING_DIR)/usr/lib/libz.a
+	rm -f $(STAGING_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)/libz.a
 endef
 LIBZLIB_POST_INSTALL_STAGING_HOOKS += LIBZLIB_RM_STATIC_STAGING
 endif
diff --git a/package/linux-tools/linux-tool-cpupower.mk.in b/package/linux-tools/linux-tool-cpupower.mk.in
index 2a2d3e01dd5a..9a5a32efb2de 100644
--- a/package/linux-tools/linux-tool-cpupower.mk.in
+++ b/package/linux-tools/linux-tool-cpupower.mk.in
@@ -8,10 +8,13 @@ LINUX_TOOLS += cpupower
 
 CPUPOWER_DEPENDENCIES = pciutils $(TARGET_NLS_DEPENDENCIES)
 
+CPUPOWER_LDFLAGS = -L$(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)
+CPUPOWER_LDFLAGS += $(TARGET_NLS_LIBS)
+
 CPUPOWER_MAKE_OPTS = CROSS=$(TARGET_CROSS) \
 	CPUFREQ_BENCH=false \
 	NLS=false \
-	LDFLAGS=$(TARGET_NLS_LIBS) \
+	LDFLAGS=$(CPUPOWER_LDFLAGS) \
 	DEBUG=false
 
 define CPUPOWER_BUILD_CMDS
@@ -30,6 +33,7 @@ define CPUPOWER_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(STAGING_DIR) \
+		libdir=/usr/$(BR2_ROOTFS_LIB_DIR) \
 		cpupower_install
 endef
 
@@ -37,5 +41,6 @@ define CPUPOWER_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
+		libdir=/usr/$(BR2_ROOTFS_LIB_DIR) \
 		cpupower_install
 endef
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 2dd5771f2193..775425c1d5a4 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -67,12 +67,14 @@ endef
 define PCIUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
 		PREFIX=$(TARGET_DIR)/usr SBINDIR=$(TARGET_DIR)/usr/bin \
+		LIBDIR=$(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR) \
 		install install-lib install-pcilib
 endef
 
 define PCIUTILS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
 		PREFIX=$(STAGING_DIR)/usr SBINDIR=$(STAGING_DIR)/usr/bin \
+		LIBDIR=$(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR) \
 		install install-lib install-pcilib
 endef
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 45de99356f5f..95f423737074 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -189,6 +189,7 @@ define $(2)_CONFIGURE_CMDS
 		--build=$$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
+		--libdir='$$$${exec_prefix}/$(BR2_ROOTFS_LIB_DIR)' \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--program-prefix="" \
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index cc5d4f29201e..decb88cfa73c 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -27,7 +27,7 @@ READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
 ifneq ($(BR2_STATIC_LIBS),y)
 # libraries get installed read only, so strip fails
 define READLINE_INSTALL_FIXUPS_SHARED
-	chmod +w $(addprefix $(TARGET_DIR)/usr/lib/,libhistory.so.* libreadline.so.*)
+	chmod +w $(addprefix $(TARGET_DIR)/usr/$(BR2_ROOTFS_LIB_DIR)/,libhistory.so.* libreadline.so.*)
 endef
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_FIXUPS_SHARED
 endif
-- 
2.7.4
