From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jun 2015 21:22:15 +0200
Subject: [Buildroot] [PATCH 11/11 v2] package/sysdig: use kernel-module
	helper
In-Reply-To: <cover.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <d5dd0daf87cc08d3da3d20f37ac6c62c5f781df2.1433964001.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This has the benefit of making sysdig actually buildable, otherwise it
fails because it tries to use the kernel headers from the host:

    make: *** /lib/modules/3.13.0-53-generic/build: No such file or directory.  Stop.
    make[5]: *** [all] Error 2
    make[4]: *** [driver/CMakeFiles/driver] Error 2
    make[3]: *** [driver/CMakeFiles/driver.dir/all] Error 2

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysdig/sysdig.mk | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index fb348ff..fde1810 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -10,13 +10,27 @@ SYSDIG_LICENSE = GPLv2
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
 	-DUSE_BUNDLED_JSONCPP=OFF
-SYSDIG_DEPENDENCIES = zlib luajit jsoncpp linux
+SYSDIG_DEPENDENCIES = zlib luajit jsoncpp
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
-define SYSDIG_INSTALL_DRIVER
-	$(MAKE) -C $(SYSDIG_BUILDDIR) $(LINUX_MAKE_FLAGS) KERNELDIR="$(LINUX_DIR)" install_driver
+# sysdig creates the module Makefile from a template, which contains a
+# single place-holder, KBUILD_FLAGS, wich is only replaced with two
+# things:
+#   - debug flags, which we don't care about here,
+#   - 'sysdig-feature' flags, which are never set, so always empty
+# So, just replace the place-holder with the only meaningful value: nothing.
+define SYSDIG_KERNEL_MAKEFILE
+	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
+	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
 endef
+SYSDIG_POST_PATCH_HOOKS += SYSDIG_KERNEL_MAKEFILE
 
-SYSDIG_POST_INSTALL_TARGET_HOOKS += SYSDIG_INSTALL_DRIVER
+# Don't build the driver as part of the 'standard' procedure, we'll
+# build it on our own with the kernel-module infra.
+SYSDIG_CONF_OPTS += -DBUILD_DRIVER=OFF
 
+SYSDIG_MODULE_SUBDIRS = driver
+SYSDIG_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
+
+$(eval $(kernel-module))
 $(eval $(cmake-package))
-- 
1.9.1
