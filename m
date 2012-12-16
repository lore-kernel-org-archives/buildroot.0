From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 20:13:23 +0100
Subject: [Buildroot] [git commit] package/qemu: use autotools-package
	infrastructure
Message-ID: <20121216200125.7C21D9A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c8b0e6166ea5c8c001485bc6fbf1d146e55c29b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Turns out that, with a little bit of tweaking, we can use
the autotools-package infrastructure to build QEMU.

That's better than defining all the _CMDS and using the
generic-package infra.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |   17 ++++-------------
 1 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 315886f..bd42481 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -62,6 +62,9 @@ ifeq ($(HOST_QEMU_ARCH),powerpc)
 endif
 HOST_QEMU_TARGETS=$(HOST_QEMU_ARCH)-linux-user
 
+# Note: although QEMU has a ./configure script, it is not a real autotools
+# package, and ./configure chokes on options such as --host or --target.
+# So, provide out own _CONFIGURE_CMDS to override the defaults.
 define HOST_QEMU_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure   \
 		--target-list="$(HOST_QEMU_TARGETS)"    \
@@ -74,19 +77,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 	)
 endef
 
-define HOST_QEMU_BUILD_CMDS
-	$(MAKE) -C $(@D) all
-endef
-
-define HOST_QEMU_INSTALL_CMDS
-	$(MAKE) -C $(@D) install
-endef
-
-define HOST_QEMU_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-$(eval $(host-generic-package))
+$(eval $(host-autotools-package))
 
 # variable used by other packages
 QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
