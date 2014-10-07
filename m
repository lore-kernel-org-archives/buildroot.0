From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:10 +0200
Subject: [Buildroot] [PATCH 01/30] package/qemu: do not use autotools for
	qemu
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <f313b2d07f3feda77583a7a4ffa23299cb7b69e9.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although QEMU has a ./configure script, it is not an autotools-package,
so switch to providing build and install commands, and to using
generic-package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 827bb77..9654b90 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -59,22 +59,26 @@ ifeq ($(HOST_QEMU_ARCH),powerpc)
 endif
 HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
 
-# Note: although QEMU has a ./configure script, it is not a real autotools
-# package, and ./configure chokes on options such as --host or --target.
-# So, provide out own _CONFIGURE_CMDS to override the defaults.
 define HOST_QEMU_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure   \
+	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
 		--target-list="$(HOST_QEMU_TARGETS)"    \
 		--prefix="$(HOST_DIR)/usr"              \
 		--interp-prefix=$(STAGING_DIR)          \
 		--cc="$(HOSTCC)"                        \
 		--host-cc="$(HOSTCC)"                   \
 		--extra-cflags="$(HOST_CFLAGS)"         \
-		--extra-ldflags="$(HOST_LDFLAGS)"       \
-	)
+		--extra-ldflags="$(HOST_LDFLAGS)"
 endef
 
-$(eval $(host-autotools-package))
+define HOST_QEMU_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_QEMU_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+endef
+
+$(eval $(host-generic-package))
 
 # variable used by other packages
 QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
-- 
1.9.1
