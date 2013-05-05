From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 21:31:19 +0200
Subject: [Buildroot] [git commit] IOzone: new package
Message-ID: <20130505193418.DFE5A99B4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baebf863ea11dbbcfea55a5877f4be0e85c1f37b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: lower case package name, strip trailing newline]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/iozone/Config.in |   12 ++++++++++++
 package/iozone/iozone.mk |   38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3537de1..79b6b8f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -23,6 +23,7 @@ source "package/dhrystone/Config.in"
 source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
 source "package/gdb/Config.in"
+source "package/iozone/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
 source "package/lmbench/Config.in"
diff --git a/package/iozone/Config.in b/package/iozone/Config.in
new file mode 100644
index 0000000..5481ca1
--- /dev/null
+++ b/package/iozone/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_IOZONE
+	bool "iozone"
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
+	help
+	  IOzone is a filesystem benchmark tool.
+	  The benchmark generates and measures a variety of file operations
+
+	  http://www.iozone.org/
+
+comment "IOzone requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
new file mode 100644
index 0000000..71c6840
--- /dev/null
+++ b/package/iozone/iozone.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# IOZONE
+#
+#############################################################
+
+IOZONE_VERSION = 3_414
+IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
+IOZONE_SITE = http://www.iozone.org/src/current
+IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
+# IOzone license details can be found at:
+# http://www.iozone.org/docs/Iozone_License.txt
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+# aio.h is not available on uClibc. Select "generic" target that does not use it.
+IOZONE_TARGET = generic
+else ifeq ($(BR2_powerpc),y)
+IOZONE_TARGET = linux-powerpc
+else ifeq ($(BR2_sparc),y)
+IOZONE_TARGET = linux-sparc
+else
+IOZONE_TARGET = linux
+endif
+
+define IOZONE_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(IOZONE_TARGET) -C $(@D)/src/current
+endef
+
+define IOZONE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/src/current/iozone \
+		$(TARGET_DIR)/usr/bin/iozone
+endef
+
+define IOZONE_CLEAN_CMDS
+       $(MAKE) -C $(@D)/src/current clean
+endef
+
+$(eval $(generic-package))
