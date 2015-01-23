From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:33 +0100
Subject: [Buildroot] [PATCH 04/14 v6] package/khronos-registry-openkode: new
	package
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <ee66b653533e932eb57498f72a3a1f314888f38d.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenKODE Registry provides all OpenKODE headers, directly from the
Khronos group.

Those headers are needed when an OpenKODE implementation does not
provide them, like the NVidia binary blobs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/opengl/Config.in                           |  1 +
 package/opengl/khronos-registry-openkode/Config.in | 15 +++++++
 .../khronos-registry-openkode.hash                 |  7 ++++
 .../khronos-registry-openkode.mk                   | 49 ++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/opengl/khronos-registry-openkode/Config.in
 create mode 100644 package/opengl/khronos-registry-openkode/khronos-registry-openkode.hash
 create mode 100644 package/opengl/khronos-registry-openkode/khronos-registry-openkode.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 0afb158..d9a5c37 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -6,3 +6,4 @@ source "package/opengl/libopenmax/Config.in"
 
 # Khronos headers, from the Khronos Registries
 source "package/opengl/khronos-registry-khrplatform/Config.in"
+source "package/opengl/khronos-registry-openkode/Config.in"
diff --git a/package/opengl/khronos-registry-openkode/Config.in b/package/opengl/khronos-registry-openkode/Config.in
new file mode 100644
index 0000000..ea3e5e7
--- /dev/null
+++ b/package/opengl/khronos-registry-openkode/Config.in
@@ -0,0 +1,15 @@
+# Note: this package has no prompt, because it is to be selected by
+# packages that need it, and does not make sense on its own.
+# Further more, we want to avoid it being enabled alongside any other
+# package that provide their own OpenKODE headers
+
+config BR2_PACKAGE_KHRONOS_REGISTRY_OPENKODE
+	bool
+	select BR2_PACKAGE_KHRONOS_REGISTRY_KHRPLATFORM
+	help
+	  The OpenKODE Registry contains specifications of the core API and
+	  headers, optional OpenKODE extensions and headers, points to other
+	  Khronos APIs required by a conformant OpenKODE implementation, and
+	  includes some related documentation.
+
+	  https://www.khronos.org/registry/kode/
diff --git a/package/opengl/khronos-registry-openkode/khronos-registry-openkode.hash b/package/opengl/khronos-registry-openkode/khronos-registry-openkode.hash
new file mode 100644
index 0000000..2a66ea8
--- /dev/null
+++ b/package/opengl/khronos-registry-openkode/khronos-registry-openkode.hash
@@ -0,0 +1,7 @@
+# Locally computed
+sha256 e55f962ec91f9a58824a8c42d3556ea1d803b589f5d7b1b6d1ab5bae929fd1cd  kd.h
+sha256 a51e0cbda20c393585e08a5035fe1bb6b9bed239a80f95e843686d1567a9f513  kdplatform.h
+sha256 331835322e53fc131774b6116318a2445651b3487e41510a786d5a27ce556e91  KHR_float64.h
+sha256 37a7596ec5377bb17fb157750a584b39b8bc7955a96b4fb29ff0c6cdf7a3fd9e  KHR_formatted.h
+sha256 cea58f28b749c59790327f61c445b09a202ef71c97b13cbbce1310316121c23e  KHR_perfcounter.h
+sha256 aa2bfc742d209e195580a0194352e1b375f9b71688ce7f6b222ab020c397e7f9  KHR_thread_storage.h
diff --git a/package/opengl/khronos-registry-openkode/khronos-registry-openkode.mk b/package/opengl/khronos-registry-openkode/khronos-registry-openkode.mk
new file mode 100644
index 0000000..aaf0ed2
--- /dev/null
+++ b/package/opengl/khronos-registry-openkode/khronos-registry-openkode.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# khronos-registry-openkode
+#
+################################################################################
+
+KHRONOS_REGISTRY_OPENKODE_VERSION = 1.0.3
+KHRONOS_REGISTRY_OPENKODE_SITE = https://www.khronos.org/registry/kode/api/$(KHRONOS_REGISTRY_OPENKODE_VERSION)
+
+# There is no archive available. So, we just have a buncha files to download.
+# Just download everything as _EXTRA downloads.
+# The first two headers are the base for OpenKODE; the KHR headers are core
+# extensions which we always want anyway.
+KHRONOS_REGISTRY_OPENKODE_SOURCE =
+KHRONOS_REGISTRY_OPENKODE_EXTRA_DOWNLOADS = kd.h kdplatform.h \
+	../KHR/KHR_float64.h \
+	../KHR/KHR_formatted.h \
+	../KHR/KHR_perfcounter.h \
+	../KHR/KHR_thread_storage.h
+
+KHRONOS_REGISTRY_OPENKODE_LICENSE = Unknown
+KHRONOS_REGISTRY_OPENKODE_DEPENDENCIES = khronos-registry-khrplatform
+
+# The registry only installs header files
+KHRONOS_REGISTRY_OPENKODE_INSTALL_STAGING = YES
+KHRONOS_REGISTRY_OPENKODE_INSTALL_TARGET = NO
+
+# We could well completely do without an EXTRACT phase, because we will
+# then just copy the files again over to staging. But if we need to patch
+# them, we must have them in the package build dir.
+define KHRONOS_REGISTRY_OPENKODE_EXTRACT_CMDS
+	$(INSTALL) -D -m 0644 $(DL_DIR)/kd.h $(@D)/KD/kd.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/kdplatform.h $(@D)/KD/kdplatform.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_float64.h $(@D)/KHR/KHR_float64.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_formatted.h $(@D)/KHR/KHR_formatted.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_perfcounter.h $(@D)/KHR/KHR_perfcounter.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_thread_storage.h $(@D)/KHR/KHR_thread_storage.h
+endef
+
+define KHRONOS_REGISTRY_OPENKODE_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/KD/kd.h $(STAGING_DIR)/usr/include/KD/kd.h
+	$(INSTALL) -D -m 0644 $(@D)/KD/kdplatform.h $(STAGING_DIR)/usr/include/KD/kdplatform.h
+	$(INSTALL) -D -m 0644 $(@D)/KHR/KHR_float64.h $(STAGING_DIR)/usr/include/KHR/KHR_float64.h
+	$(INSTALL) -D -m 0644 $(@D)/KHR/KHR_formatted.h $(STAGING_DIR)/usr/include/KHR/KHR_formatted.h
+	$(INSTALL) -D -m 0644 $(@D)/KHR/KHR_perfcounter.h $(STAGING_DIR)/usr/include/KHR/KHR_perfcounter.h
+	$(INSTALL) -D -m 0644 $(@D)/KHR/KHR_thread_storage.h $(STAGING_DIR)/usr/include/KHR/KHR_thread_storage.h
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
