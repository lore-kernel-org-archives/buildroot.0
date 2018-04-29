From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Apr 2018 14:15:21 +0200
Subject: [Buildroot] [PATCH 2/3] package/qemu: declare target variant before
 host variant
In-Reply-To: <cover.1525004110.git.yann.morin.1998@free.fr>
References: <cover.1525004110.git.yann.morin.1998@free.fr>
Message-ID: <f4870d366565219911a28713e681a3beb0a72ab7.1525004110.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Our package infrastructure uses inheritance of a number of values from
the target package to the host package, which assumes the target
package is defined before the host package. In addition, future
changes are going to make this requirement even more important.

Therefore, let's fix the qemu package so that it declares its target
variant before its host variant, like all other packages in
Buildroot. We handle qemu separately from other packages, because
unlike other packages, it didn't had the "eval" for the host and
target packages at the end of the file, but rather all variables
related to the host variant first, then the call to the package
infrastructure for the host variant, then the variables related to the
target variant, and finally the call to the package infrastructure for
the target variant. We are inverting the order of those two big parts
in this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 242 +++++++++++++++++++++++++--------------------------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index f6f4a2b870..0a6a6c0609 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -13,6 +13,127 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #       the non-(L)GPL license texts are specified in the affected
 #       individual source files.
 
+#-------------------------------------------------------------
+# Target-qemu
+
+QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
+
+# Need the LIBS variable because librt and libm are
+# not automatically pulled. :-(
+QEMU_LIBS = -lrt -lm
+
+QEMU_OPTS =
+
+QEMU_VARS = \
+	LIBTOOL=$(HOST_DIR)/bin/libtool \
+	PYTHON=$(HOST_DIR)/bin/python2 \
+	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+# If we want to specify only a subset of targets, we must still enable all
+# of them, so that QEMU properly builds its list of default targets, from
+# which it then checks if the specified sub-set is valid. That's what we
+# do in the first part of the if-clause.
+# Otherwise, if we do not want to pass a sub-set of targets, we then need
+# to either enable or disable -user and/or -system emulation appropriately.
+# That's what we do in the else-clause.
+ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
+QEMU_OPTS += --enable-system --enable-linux-user
+QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
+else
+
+ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
+QEMU_OPTS += --enable-system
+else
+QEMU_OPTS += --disable-system
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_LINUX_USER),y)
+QEMU_OPTS += --enable-linux-user
+else
+QEMU_OPTS += --disable-linux-user
+endif
+
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
+QEMU_OPTS += --enable-sdl
+QEMU_DEPENDENCIES += sdl
+QEMU_VARS += SDL_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl-config
+else
+QEMU_OPTS += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_FDT),y)
+QEMU_OPTS += --enable-fdt
+QEMU_DEPENDENCIES += dtc
+else
+QEMU_OPTS += --disable-fdt
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_TOOLS),y)
+QEMU_OPTS += --enable-tools
+else
+QEMU_OPTS += --disable-tools
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+QEMU_OPTS += --enable-libssh2
+QEMU_DEPENDENCIES += libssh2
+else
+QEMU_OPTS += --disable-libssh2
+endif
+
+# Override CPP, as it expects to be able to call it like it'd
+# call the compiler.
+define QEMU_CONFIGURE_CMDS
+	( cd $(@D); \
+		LIBS='$(QEMU_LIBS)' \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		CPP="$(TARGET_CC) -E" \
+		$(QEMU_VARS) \
+		./configure \
+			--prefix=/usr \
+			--cross-prefix=$(TARGET_CROSS) \
+			--with-system-pixman \
+			--audio-drv-list= \
+			--enable-kvm \
+			--enable-attr \
+			--enable-vhost-net \
+			--disable-bsd-user \
+			--disable-xen \
+			--disable-slirp \
+			--disable-vnc \
+			--disable-virtfs \
+			--disable-brlapi \
+			--disable-curses \
+			--disable-curl \
+			--disable-bluez \
+			--disable-vde \
+			--disable-linux-aio \
+			--disable-cap-ng \
+			--disable-docs \
+			--disable-spice \
+			--disable-rbd \
+			--disable-libiscsi \
+			--disable-usb-redir \
+			--disable-strip \
+			--disable-seccomp \
+			--disable-sparse \
+			$(QEMU_OPTS) \
+	)
+endef
+
+define QEMU_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QEMU_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
+
 #-------------------------------------------------------------
 # Host-qemu
 
@@ -147,124 +268,3 @@ $(eval $(host-generic-package))
 
 # variable used by other packages
 QEMU_USER = $(HOST_DIR)/bin/qemu-$(HOST_QEMU_ARCH)
-
-#-------------------------------------------------------------
-# Target-qemu
-
-QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
-
-# Need the LIBS variable because librt and libm are
-# not automatically pulled. :-(
-QEMU_LIBS = -lrt -lm
-
-QEMU_OPTS =
-
-QEMU_VARS = \
-	LIBTOOL=$(HOST_DIR)/bin/libtool \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-
-# If we want to specify only a subset of targets, we must still enable all
-# of them, so that QEMU properly builds its list of default targets, from
-# which it then checks if the specified sub-set is valid. That's what we
-# do in the first part of the if-clause.
-# Otherwise, if we do not want to pass a sub-set of targets, we then need
-# to either enable or disable -user and/or -system emulation appropriately.
-# That's what we do in the else-clause.
-ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
-QEMU_OPTS += --enable-system --enable-linux-user
-QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
-else
-
-ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
-QEMU_OPTS += --enable-system
-else
-QEMU_OPTS += --disable-system
-endif
-
-ifeq ($(BR2_PACKAGE_QEMU_LINUX_USER),y)
-QEMU_OPTS += --enable-linux-user
-else
-QEMU_OPTS += --disable-linux-user
-endif
-
-endif
-
-ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
-QEMU_OPTS += --enable-sdl
-QEMU_DEPENDENCIES += sdl
-QEMU_VARS += SDL_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl-config
-else
-QEMU_OPTS += --disable-sdl
-endif
-
-ifeq ($(BR2_PACKAGE_QEMU_FDT),y)
-QEMU_OPTS += --enable-fdt
-QEMU_DEPENDENCIES += dtc
-else
-QEMU_OPTS += --disable-fdt
-endif
-
-ifeq ($(BR2_PACKAGE_QEMU_TOOLS),y)
-QEMU_OPTS += --enable-tools
-else
-QEMU_OPTS += --disable-tools
-endif
-
-ifeq ($(BR2_PACKAGE_LIBSSH2),y)
-QEMU_OPTS += --enable-libssh2
-QEMU_DEPENDENCIES += libssh2
-else
-QEMU_OPTS += --disable-libssh2
-endif
-
-# Override CPP, as it expects to be able to call it like it'd
-# call the compiler.
-define QEMU_CONFIGURE_CMDS
-	( cd $(@D); \
-		LIBS='$(QEMU_LIBS)' \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CPP="$(TARGET_CC) -E" \
-		$(QEMU_VARS) \
-		./configure \
-			--prefix=/usr \
-			--cross-prefix=$(TARGET_CROSS) \
-			--with-system-pixman \
-			--audio-drv-list= \
-			--enable-kvm \
-			--enable-attr \
-			--enable-vhost-net \
-			--disable-bsd-user \
-			--disable-xen \
-			--disable-slirp \
-			--disable-vnc \
-			--disable-virtfs \
-			--disable-brlapi \
-			--disable-curses \
-			--disable-curl \
-			--disable-bluez \
-			--disable-vde \
-			--disable-linux-aio \
-			--disable-cap-ng \
-			--disable-docs \
-			--disable-spice \
-			--disable-rbd \
-			--disable-libiscsi \
-			--disable-usb-redir \
-			--disable-strip \
-			--disable-seccomp \
-			--disable-sparse \
-			$(QEMU_OPTS) \
-	)
-endef
-
-define QEMU_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QEMU_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
2.14.1
