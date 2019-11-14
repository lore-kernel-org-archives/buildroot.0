From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 14 Nov 2019 09:38:47 -0300
Subject: [Buildroot] [PATCH/next v2 1/5] package/ti-sgx-libgbm: new package
Message-ID: <20191114123847.12741-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lothar Felten <lothar.felten@gmail.com>

A custom ti version of libgbm for SGX graphics accelerator, required by
the binary libraries of the ti-sgx-um package.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v1->v2
- Fix SDK version (comment in ti-sgx-libgbm.mk)
- Remove duplicate package in package/ti-sgx/ti-sgx-libgbm

package/ti-sgx-libgbm

package/ti-sgx
---
 package/Config.in                             |  1 +
 .../0001_fix_sysmacro_include.patch           | 12 ++++++
 package/ti-sgx-libgbm/Config.in               |  5 +++
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash      |  2 +
 package/ti-sgx-libgbm/ti-sgx-libgbm.mk        | 41 +++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch
 create mode 100644 package/ti-sgx-libgbm/Config.in
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk

diff --git a/package/Config.in b/package/Config.in
index f72c77b416..0a0499421c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -541,6 +541,7 @@ endmenu
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
+	source "package/ti-sgx-libgbm/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
diff --git a/package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch b/package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch
new file mode 100644
index 0000000000..8b671cdcca
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
index 0000000000..24427c8112
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
index 0000000000..d316a84e45
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 7be13eed8c357da8060f3db52de48ad8e76bf4784e8b2979f19ddc3bb725ca45 ti-sgx-libgbm-f316cf4b98ca3f4a1ca92a48ddd8aa559894a45c.tar.gz
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
new file mode 100644
index 0000000000..9c7bd43881
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
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
-- 
2.18.1
