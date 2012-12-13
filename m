From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Dec 2012 22:39:39 +0100
Subject: [Buildroot] [PATCH 3/4] package/qemu: use autotools-package
	infrastructure
In-Reply-To: <cover.1355434710.git.yann.morin.1998@free.fr>
References: <cover.1355434710.git.yann.morin.1998@free.fr>
Message-ID: <6a41394a946c21e36107309d8ed180d50cb7f12f.1355434710.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Turns out that, with a little bit of tweaking, we can use
the autotools-package infrastructure to build QEMU.

That's better than defining all the _CMDS and using the
generic-package infra.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/qemu/qemu.mk |   17 ++++-------------
 1 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2c0dbde..91d0eb8 100644
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
 QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(QEMU_ARCH)
-- 
1.7.2.5
