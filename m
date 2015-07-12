From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 11:56:19 +0200
Subject: [Buildroot] [git commit] package/sysdig: use kernel-module helper
Message-ID: <20150712095704.ABE0B8010C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6391bfd76b3733a49e1bfd96e22ffaaf36db509a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysdig's Makefile was already calling the Linux buildsystem to build its
modules, so switch to using the new kernel-module infra.

This has the benefit of making sysdig actually buildable, otherwise it
fails because it tries to use the kernel headers from the host:

    make: *** /lib/modules/3.13.0-53-generic/build: No such file or directory.  Stop.
    make[5]: *** [all] Error 2
    make[4]: *** [driver/CMakeFiles/driver] Error 2
    make[3]: *** [driver/CMakeFiles/driver.dir/all] Error 2

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysdig/sysdig.mk |   22 ++++++++++++++++++----
 1 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index d07d467..85d16a4 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -10,13 +10,27 @@ SYSDIG_LICENSE = GPLv2
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
 	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF
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
+define SYSDIG_MODULE_GEN_MAKEFILE
+	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
+	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
 endef
+SYSDIG_POST_PATCH_HOOKS += SYSDIG_MODULE_GEN_MAKEFILE
 
-SYSDIG_POST_INSTALL_TARGET_HOOKS += SYSDIG_INSTALL_DRIVER
+# Don't build the driver as part of the 'standard' procedure, we'll
+# build it on our own with the kernel-module infra.
+SYSDIG_CONF_OPTS += -DBUILD_DRIVER=OFF
 
+SYSDIG_MODULE_SUBDIRS = driver
+SYSDIG_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
+
+$(eval $(kernel-module))
 $(eval $(cmake-package))
