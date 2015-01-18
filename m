From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 13:11:27 +0100
Subject: [Buildroot] [PATCH 05/11 v4] package/openmax-registry: new package
In-Reply-To: <cover.1421582718.git.yann.morin.1998@free.fr>
References: <cover.1421582718.git.yann.morin.1998@free.fr>
Message-ID: <f08bfea87d9d45de14661d39bb606b26991ea23e.1421582718.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenMAX Registry provides all OpenMAX headers, directly from the
Khronos group.

Those headers are needed when an OpenMAX implementation does not
provide them, like the NVidia binary blob.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/opengl/khronos-registry/Config.in          |  1 +
 .../khronos-registry/openmax-registry/Config.in    | 20 ++++++++++++++++
 .../openmax-registry/opengl-registry.hash          |  3 +++
 .../openmax-registry/opengl-registry.mk            | 27 ++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/opengl/khronos-registry/openmax-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/openmax-registry/opengl-registry.hash
 create mode 100644 package/opengl/khronos-registry/openmax-registry/opengl-registry.mk

diff --git a/package/opengl/khronos-registry/Config.in b/package/opengl/khronos-registry/Config.in
index ee550e9..e936b9e 100644
--- a/package/opengl/khronos-registry/Config.in
+++ b/package/opengl/khronos-registry/Config.in
@@ -1,3 +1,4 @@
 source "package/opengl/khronos-registry/khrplatform-registry/Config.in"
 source "package/opengl/khronos-registry/openkode-registry/Config.in"
 source "package/opengl/khronos-registry/opengl-registry/Config.in"
+source "package/opengl/khronos-registry/openmax-registry/Config.in"
diff --git a/package/opengl/khronos-registry/openmax-registry/Config.in b/package/opengl/khronos-registry/openmax-registry/Config.in
new file mode 100644
index 0000000..c9af0bb
--- /dev/null
+++ b/package/opengl/khronos-registry/openmax-registry/Config.in
@@ -0,0 +1,20 @@
+# Note: this package has no prompt, because it is to be selected by
+# packages that need it, and does not make sense on its own.
+# Further more, we want to avoid it being enabled alongside any other
+# package that provide their own OpenMAX headers, like rpi-userland...
+
+config BR2_PACKAGE_OPENMAX_REGISTRY
+	bool
+	select BR2_PACKAGE_KHRPLATFORM_REGISTRY
+	help
+	  The OpenMAX IL registry contains specifications of the core API;
+	  specifications of Khronos- and vendor-approved OpenMAX IL extensions;
+	  header files corresponding to the specifications; and other related
+	  documentation.
+
+	  This package installs the OpenMAX header files. You do not need them
+	  if the OpenMAX implementation provides its own headers.
+	  Currently, the only known implementation requiring OpenGL Resgistry
+	  is the NVidia proprietary driver.
+
+	  https://www.khronos.org/registry/omxil/
diff --git a/package/opengl/khronos-registry/openmax-registry/opengl-registry.hash b/package/opengl/khronos-registry/openmax-registry/opengl-registry.hash
new file mode 100644
index 0000000..e2f5014
--- /dev/null
+++ b/package/opengl/khronos-registry/openmax-registry/opengl-registry.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha1   35b2c565a050b4235feac3f22bbbf4bf80092a00                          OpenMAX_IL_1_1_2_Header.zip
+sha256 9e8aee85f37946202ff15a52836233f983e90a751c0816ba341ba0c1ffedf99e  OpenMAX_IL_1_1_2_Header.zip
diff --git a/package/opengl/khronos-registry/openmax-registry/opengl-registry.mk b/package/opengl/khronos-registry/openmax-registry/opengl-registry.mk
new file mode 100644
index 0000000..aecca00
--- /dev/null
+++ b/package/opengl/khronos-registry/openmax-registry/opengl-registry.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# openmax-registry
+#
+################################################################################
+
+# Using last revision at which the 'api' directory was *changed*
+OPENMAX_REGISTRY_VERSION = 1.1.2
+OPENMAX_REGISTRY_SOURCE = OpenMAX_IL_$(subst .,_,$(OPENMAX_REGISTRY_VERSION))_Header.zip
+OPENMAX_REGISTRY_SITE = https://www.khronos.org/registry/omxil/api/$(OPENMAX_REGISTRY_VERSION)
+OPENMAX_REGISTRY_LICENSE = MIT
+
+# The registry only installs header files
+OPENMAX_REGISTRY_INSTALL_STAGING = YES
+OPENMAX_REGISTRY_INSTALL_TARGET = NO
+
+define OPENMAX_REGISTRY_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(OPENMAX_REGISTRY_SOURCE) -d $(@D)
+endef
+
+define OPENMAX_REGISTRY_INSTALL_STAGING_CMDS
+	for h in $(@D)/*.h; do \
+		$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$${h##*/} || exit 1; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
