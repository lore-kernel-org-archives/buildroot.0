From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:25 +0200
Subject: [Buildroot] [PATCH 4/7] new package: ti-sgx/ti-sgx-libgbm libgbm
	for SGX graphics accelerator
In-Reply-To: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468311988-22059-5-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds a custom ti version of libgbm required by the binary
libraries of the ti-sgx/ti-sgx-um package.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/ti-sgx/ti-sgx-libgbm/Config.in          |  5 +++
 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash |  2 ++
 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk   | 41 +++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk

diff --git a/package/ti-sgx/ti-sgx-libgbm/Config.in b/package/ti-sgx/ti-sgx-libgbm/Config.in
new file mode 100644
index 0000000..24427c8
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-libgbm/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_TI_SGX_LIBGBM
+        bool "libgbm, ti variant"
+        help
+	  TI SGX libgbm variant
+
diff --git a/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash
new file mode 100644
index 0000000..de4f442
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 ecf9848a5cdc46249b3bb6d1119118ab62e926e4826a1dcac6d927c247a26b57 ti-sgx-libgbm-cb86a2f2cecd41023bf1bf12fbcf11be11220f31.tar.gz
diff --git a/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
new file mode 100644
index 0000000..c92c8dc
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# ti-sgx-libgbm
+#
+################################################################################
+
+# This correpsonds to SDK 02.00.00.00
+TI_SGX_LIBGBM_VERSION = cb86a2f2cecd41023bf1bf12fbcf11be11220f31
+TI_SGX_LIBGBM_SITE = git://git.ti.com/glsdk/libgbm.git
+TI_SGX_LIBGBM_LICENSE = MIT License
+TI_SGX_LIBGBM_LICENSE_FILES = gbm.h
+TI_SGX_LIBGBM_INSTALL_STAGING = YES
+
+TI_SGX_LIBGBM_DEPENDENCIES = linux
+
+# This package uses autoconf, but not automake, so we need to call
+# their special autogen.sh script, and have custom target and staging
+# installation commands.
+
+define TI_SGX_LIBGBM_RUN_AUTOGEN
+        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+TI_SGX_LIBGBM_PRE_CONFIGURE_HOOKS += TI_SGX_LIBGBM_RUN_AUTOGEN
+
+define TI_SGX_LIBGBM_INSTALL_TARGET_CMDS
+        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+                PREFIX=/usr \
+                STRIP=/bin/true \
+                DESTDIR=$(TARGET_DIR) \
+                install
+endef
+
+define TI_SGX_LIBGBM_INSTALL_STAGING_CMDS
+        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+                PREFIX=/usr \
+                STRIP=/bin/true \
+                DESTDIR=$(STAGING_DIR) \
+                install
+endef
+
+$(eval $(autotools-package))
-- 
1.9.1
