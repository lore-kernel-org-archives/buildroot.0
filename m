From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 22:13:46 +0100
Subject: [Buildroot] [git commit] libpfm4: new package
Message-ID: <20130318212049.35BE29B169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5fca1330ce572bcfcc3d783b34ba1517b9b41b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libpfm4/Config.in  |    7 +++++++
 package/libpfm4/libpfm4.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 167eb5b..777e06b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -561,6 +561,7 @@ source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
+source "package/libpfm4/Config.in"
 source "package/libsigc/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
new file mode 100644
index 0000000..6b491a4
--- /dev/null
+++ b/package/libpfm4/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBPFM4
+	bool "libpfm4"
+	help
+	  A helper library to help encode Performance Events to use with
+	  Operating system kernels performance monitoring interfaces.
+
+	  http://perfmon2.sourceforge.net/
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
new file mode 100644
index 0000000..8689bbe
--- /dev/null
+++ b/package/libpfm4/libpfm4.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# libpfm4
+#
+#############################################################
+
+LIBPFM4_VERSION = 4.3.0
+LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
+LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
+LIBPFM4_LICENSE = libpfm4 license
+LIBPFM4_LICENSE_FILES = COPYING
+LIBPFM4_INSTALL_STAGING = YES
+
+LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" LDCONFIG=true
+
+define LIBPFM4_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
+endef
+
+define LIBPFM4_INSTALL_STAGING_CMDS
+	make -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
+endef
+
+define LIBPFM4_INSTALL_TARGET_CMDS
+	make -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
