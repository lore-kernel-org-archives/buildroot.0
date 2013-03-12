From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 19:10:54 +0100
Subject: [Buildroot] [PATCH 1 of 3] libpfm4: new package
In-Reply-To: <patchbomb.1363111853@BEANTN0L019720>
References: <patchbomb.1363111853@BEANTN0L019720>
Message-ID: <331f2a83706c939542f9.1363111854@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Config.in          |   1 +
 package/libpfm4/Config.in  |   7 +++++++
 package/libpfm4/libpfm4.mk |  27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -556,6 +556,7 @@ source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
+source "package/libpfm4/Config.in"
 source "package/libsigc/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
new file mode 100644
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
--- /dev/null
+++ b/package/libpfm4/libpfm4.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# libpfm4
+#
+#############################################################
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
