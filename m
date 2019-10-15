From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 15 Oct 2019 23:30:58 +0200
Subject: [Buildroot] [RFC PATCH 1/4] new package: ti-sgx/ti-sgx-libgbm
 libgbm for SGX graphics accelerator
Message-ID: <20191015213101.27460-1-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds a custom ti version of libgbm required by the binary
libraries of the ti-sgx/ti-sgx-um package.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in                             |  1 +
 .../0001_fix_sysmacro_include.patch           | 12 ++++++
 package/ti-sgx-libgbm/Config.in               |  5 +++
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash      |  2 +
 package/ti-sgx-libgbm/ti-sgx-libgbm.mk        | 41 +++++++++++++++++++
 package/ti-sgx/ti-sgx-libgbm/Config.in        |  5 +++
 .../ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash   |  2 +
 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk | 41 +++++++++++++++++++
 8 files changed, 109 insertions(+)
 create mode 100644 package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch
 create mode 100644 package/ti-sgx-libgbm/Config.in
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk

diff --git a/package/Config.in b/package/Config.in
index 3a4b1c33b..69cb35576 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -538,6 +538,7 @@ endmenu
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
+	source "package/ti-sgx-libgbm/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
diff --git a/package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch b/package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch
new file mode 100644
index 000000000..8b671cdcc
--- /dev/null
+++ b/package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch
@@ -0,0 +1,12 @@
+diff --git a/gbm.c b/gbm.c
+index c046b1a..a8660c8 100644
+--- a/gbm.c
++++ b/gbm.c
+@@ -36,6 +36,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <unistd.h>
+ #include <errno.h>
+ 
diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
new file mode 100644
index 000000000..24427c811
--- /dev/null
+++ b/package/ti-sgx-libgbm/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_TI_SGX_LIBGBM
+        bool "libgbm, ti variant"
+        help
+	  TI SGX libgbm variant
+
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.hash b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
new file mode 100644
index 000000000..d316a84e4
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 7be13eed8c357da8060f3db52de48ad8e76bf4784e8b2979f19ddc3bb725ca45 ti-sgx-libgbm-f316cf4b98ca3f4a1ca92a48ddd8aa559894a45c.tar.gz
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
new file mode 100644
index 000000000..eafae12ec
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# ti-sgx-libgbm
+#
+################################################################################
+
+# This correpsonds to SDK 05.03.00.15
+TI_SGX_LIBGBM_VERSION = f316cf4b98ca3f4a1ca92a48ddd8aa559894a45c
+TI_SGX_LIBGBM_SITE = git://git.ti.com/glsdk/libgbm.git
+TI_SGX_LIBGBM_LICENSE = MIT License
+TI_SGX_LIBGBM_LICENSE_FILES = gbm.h
+TI_SGX_LIBGBM_INSTALL_STAGING = YES
+
+TI_SGX_LIBGBM_DEPENDENCIES = libdrm udev
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
diff --git a/package/ti-sgx/ti-sgx-libgbm/Config.in b/package/ti-sgx/ti-sgx-libgbm/Config.in
new file mode 100644
index 000000000..24427c811
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
index 000000000..de4f442a9
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 ecf9848a5cdc46249b3bb6d1119118ab62e926e4826a1dcac6d927c247a26b57 ti-sgx-libgbm-cb86a2f2cecd41023bf1bf12fbcf11be11220f31.tar.gz
diff --git a/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
new file mode 100644
index 000000000..235bc38d2
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# ti-sgx-libgbm
+#
+################################################################################
+
+# This correpsonds to SDK 06.00.00.07
+TI_SGX_LIBGBM_VERSION = f316cf4b98ca3f4a1ca92a48ddd8aa559894a45c
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
2.17.1
