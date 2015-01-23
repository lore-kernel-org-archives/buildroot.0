From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:37 +0100
Subject: [Buildroot] [PATCH 08/14 v6] package/khronos-registry-openmaxil:
	new package
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <cdd844f872ef2316b998a4b8a78c46abe0e2d8f4.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenMAX Registry provides all OpenMAX headers, directly from the
Khronos group.

Those headers are needed when an OpenMAX implementation does not
provide them, like the NVidia binary blob.

These are the OpenMAX Inegration Layer (IL) headers.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/opengl/Config.in                           |  1 +
 .../opengl/khronos-registry-openmaxil/Config.in    | 20 ++++++++++++++
 .../khronos-registry-openmax.hash                  |  3 ++
 .../khronos-registry-openmaxil.mk                  | 32 ++++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/opengl/khronos-registry-openmaxil/Config.in
 create mode 100644 package/opengl/khronos-registry-openmaxil/khronos-registry-openmax.hash
 create mode 100644 package/opengl/khronos-registry-openmaxil/khronos-registry-openmaxil.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 0c3f2cb..efe31a3 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -8,3 +8,4 @@ source "package/opengl/libopenmax/Config.in"
 source "package/opengl/khronos-registry-khrplatform/Config.in"
 source "package/opengl/khronos-registry-openkode/Config.in"
 source "package/opengl/khronos-registry-opengl/Config.in"
+source "package/opengl/khronos-registry-openmaxil/Config.in"
diff --git a/package/opengl/khronos-registry-openmaxil/Config.in b/package/opengl/khronos-registry-openmaxil/Config.in
new file mode 100644
index 0000000..35dddf9
--- /dev/null
+++ b/package/opengl/khronos-registry-openmaxil/Config.in
@@ -0,0 +1,20 @@
+# Note: this package has no prompt, because it is to be selected by
+# packages that need it, and does not make sense on its own.
+# Further more, we want to avoid it being enabled alongside any other
+# package that provide their own OpenMAX headers, like rpi-userland...
+
+config BR2_PACKAGE_KHRONOS_REGISTRY_OPENMAXIL
+	bool
+	select BR2_PACKAGE_KHRONOS_REGISTRY_KHRPLATFORM
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
diff --git a/package/opengl/khronos-registry-openmaxil/khronos-registry-openmax.hash b/package/opengl/khronos-registry-openmaxil/khronos-registry-openmax.hash
new file mode 100644
index 0000000..e2f5014
--- /dev/null
+++ b/package/opengl/khronos-registry-openmaxil/khronos-registry-openmax.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha1   35b2c565a050b4235feac3f22bbbf4bf80092a00                          OpenMAX_IL_1_1_2_Header.zip
+sha256 9e8aee85f37946202ff15a52836233f983e90a751c0816ba341ba0c1ffedf99e  OpenMAX_IL_1_1_2_Header.zip
diff --git a/package/opengl/khronos-registry-openmaxil/khronos-registry-openmaxil.mk b/package/opengl/khronos-registry-openmaxil/khronos-registry-openmaxil.mk
new file mode 100644
index 0000000..10b6896
--- /dev/null
+++ b/package/opengl/khronos-registry-openmaxil/khronos-registry-openmaxil.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# khronos-registry-openmaxil
+#
+################################################################################
+
+# The latest 'stable' version is 1.1.2; the 1.2.0 version is only
+# considered "provisional", so we keep using 1.1.2 for now.
+KHRONOS_REGISTRY_OPENMAXIL_VERSION = 1.1.2
+KHRONOS_REGISTRY_OPENMAXIL_SOURCE = OpenMAX_IL_$(subst .,_,$(KHRONOS_REGISTRY_OPENMAXIL_VERSION))_Header.zip
+KHRONOS_REGISTRY_OPENMAXIL_SITE = https://www.khronos.org/registry/omxil/api/$(KHRONOS_REGISTRY_OPENMAXIL_VERSION)
+
+# No license file, license text in each header file
+KHRONOS_REGISTRY_OPENMAXIL_LICENSE = MIT
+
+# The registry only installs header files
+KHRONOS_REGISTRY_OPENMAXIL_INSTALL_STAGING = YES
+KHRONOS_REGISTRY_OPENMAXIL_INSTALL_TARGET = NO
+
+define KHRONOS_REGISTRY_OPENMAXIL_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(KHRONOS_REGISTRY_OPENMAXIL_SOURCE) -d $(@D)
+endef
+
+# OpenMAX headers go directly into /usr/include, no sub-dir
+# At least, that's what bellagio does...
+define KHRONOS_REGISTRY_OPENMAXIL_INSTALL_STAGING_CMDS
+	for h in $(@D)/*.h; do \
+		$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$${h##*/} || exit 1; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
