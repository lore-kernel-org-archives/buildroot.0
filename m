From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Apr 2011 23:28:59 +0200
Subject: [Buildroot] [git commit] New package: gdisk
Message-ID: <20110425213010.DA95C82A52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d5a772f63660b84c7c755518fd91cb1a7c7d0c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes two separately configurable parition manipulation
utilities: gdsik and sgdisk are to GPT disks what fdisk and sfdisk are
in MBR land.

[Peter: patch source, fix typos, fix partial build, pass correct flags]
Signed-off-by: Malte Starostik <m-starostik@versanet.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                       |    1 +
 package/gdisk/Config.in                 |   34 +++++++++++++++++++++++++++
 package/gdisk/gdisk-0.6.14-uuid.h.patch |   22 +++++++++++++++++
 package/gdisk/gdisk.mk                  |   39 +++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 package/gdisk/Config.in
 create mode 100644 package/gdisk/gdisk-0.6.14-uuid.h.patch
 create mode 100644 package/gdisk/gdisk.mk

diff --git a/package/Config.in b/package/Config.in
index 76b2076..46ecbcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -165,6 +165,7 @@ source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/gadgetfs-test/Config.in"
+source "package/gdisk/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
 source "package/gpsd/Config.in"
diff --git a/package/gdisk/Config.in b/package/gdisk/Config.in
new file mode 100644
index 0000000..0daec5d
--- /dev/null
+++ b/package/gdisk/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_GDISK
+	bool "gdisk"
+	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	help
+	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
+	  text-mode partitioning tool that works on Globally Unique Identifier
+	  (GUID) Partition Table (GPT) disks, rather than on the more common
+	  (through 2010) Master Boot Record (MBR) partition tables.
+
+	  http://www.rodsbooks.com/gdisk/
+
+config BR2_PACKAGE_GDISK_GDISK
+	bool "interactive gdisk"
+	depends on BR2_PACKAGE_GDISK
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	help
+	  Install the interactive GUID partition table (GPT) manipulator
+	  /usr/sbin/gdisk which is modelled after and quite similar in use
+	  to the traditional MBR based fdisk tool.
+
+config BR2_PACKAGE_GDISK_SGDISK
+	bool "command line sgdisk"
+	depends on BR2_PACKAGE_GDISK
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	select BR2_PACKAGE_POPT
+	help
+	  Install the command-line GUID partition table (GPT) manipulator
+	  /usr/sbin/sgdisk which is named after the traditional MBR based
+	  sfdisk tool albeit with an entirely different option syntax.
+
+comment "gdisk requires a toolchain with LARGEFILE and C++ support enabled"
+	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gdisk/gdisk-0.6.14-uuid.h.patch b/package/gdisk/gdisk-0.6.14-uuid.h.patch
new file mode 100644
index 0000000..ba447a1
--- /dev/null
+++ b/package/gdisk/gdisk-0.6.14-uuid.h.patch
@@ -0,0 +1,22 @@
+[PATCH] Don't hardcode uuid.h location
+
+Breaks cross compilation.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ guid.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: gdisk-0.6.14/guid.h
+===================================================================
+--- gdisk-0.6.14.orig/guid.h
++++ gdisk-0.6.14/guid.h
+@@ -22,7 +22,7 @@
+ #ifdef _WIN32
+ typedef unsigned char my_uuid_t[16];
+ #else
+-#include </usr/include/uuid/uuid.h>
++#include <uuid/uuid.h>
+ typedef uuid_t my_uuid_t;
+ #endif
+ 
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
new file mode 100644
index 0000000..ef4627d
--- /dev/null
+++ b/package/gdisk/gdisk.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# gdisk
+#
+#############################################################
+
+GDISK_VERSION = 0.6.14
+GDISK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gptfdisk
+GDISK_SOURCE = gdisk-$(GDISK_VERSION).tgz
+
+GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
+GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
+
+ifneq ($(GDISK_TARGETS_y),)
+
+GDISK_DEPENDENCIES += e2fsprogs
+ifeq ($(BR2_PACKAGE_GDISK_SGDISK),y)
+    GDISK_DEPENDENCIES += popt
+endif
+
+
+define GDISK_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
+		-C $(@D) $(GDISK_TARGETS_y)
+endef
+
+define GDISK_INSTALL_TARGET_CMDS
+	for i in $(GDISK_TARGETS_y); do \
+	    $(INSTALL) -D $(@D)/$$i $(TARGET_DIR)/usr/sbin/; \
+	done
+endef
+
+define GDISK_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GDISK_TARGETS_y))
+endef
+
+endif
+
+$(eval $(call GENTARGETS,package,gdisk))
-- 
1.7.3.4
