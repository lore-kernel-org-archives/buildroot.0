From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 13:11:25 +0100
Subject: [Buildroot] [PATCH 03/11 v4] package/openkode-registry: new package
In-Reply-To: <cover.1421582718.git.yann.morin.1998@free.fr>
References: <cover.1421582718.git.yann.morin.1998@free.fr>
Message-ID: <77c3f4cd052fca9a5c6d7f40c6885e9f6f74779f.1421582718.git.yann.morin.1998@free.fr>
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
 package/opengl/khronos-registry/Config.in          |  1 +
 .../khronos-registry/openkode-registry/Config.in   | 15 +++++++
 .../openkode-registry/openkode-registry.hash       |  7 ++++
 .../openkode-registry/openkode-registry.mk         | 48 ++++++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 package/opengl/khronos-registry/openkode-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/openkode-registry/openkode-registry.hash
 create mode 100644 package/opengl/khronos-registry/openkode-registry/openkode-registry.mk

diff --git a/package/opengl/khronos-registry/Config.in b/package/opengl/khronos-registry/Config.in
index 8def807..770c9be 100644
--- a/package/opengl/khronos-registry/Config.in
+++ b/package/opengl/khronos-registry/Config.in
@@ -1 +1,2 @@
 source "package/opengl/khronos-registry/khrplatform-registry/Config.in"
+source "package/opengl/khronos-registry/openkode-registry/Config.in"
diff --git a/package/opengl/khronos-registry/openkode-registry/Config.in b/package/opengl/khronos-registry/openkode-registry/Config.in
new file mode 100644
index 0000000..b161235
--- /dev/null
+++ b/package/opengl/khronos-registry/openkode-registry/Config.in
@@ -0,0 +1,15 @@
+# Note: this package has no prompt, because it is to be selected by
+# packages that need it, and does not make sense on its own.
+# Further more, we want to avoid it being enabled alongside any other
+# package that provide their own OpenKODE headers
+
+config BR2_PACKAGE_OPENKODE_REGISTRY
+	bool
+	select BR2_PACKAGE_KHRPLATFORM_REGISTRY
+	help
+	  The OpenKODE Registry contains specifications of the core API and
+	  headers, optional OpenKODE extensions and headers, points to other
+	  Khronos APIs required by a conformant OpenKODE implementation, and
+	  includes some related documentation.
+
+	  https://www.khronos.org/registry/kode/
diff --git a/package/opengl/khronos-registry/openkode-registry/openkode-registry.hash b/package/opengl/khronos-registry/openkode-registry/openkode-registry.hash
new file mode 100644
index 0000000..2a66ea8
--- /dev/null
+++ b/package/opengl/khronos-registry/openkode-registry/openkode-registry.hash
@@ -0,0 +1,7 @@
+# Locally computed
+sha256 e55f962ec91f9a58824a8c42d3556ea1d803b589f5d7b1b6d1ab5bae929fd1cd  kd.h
+sha256 a51e0cbda20c393585e08a5035fe1bb6b9bed239a80f95e843686d1567a9f513  kdplatform.h
+sha256 331835322e53fc131774b6116318a2445651b3487e41510a786d5a27ce556e91  KHR_float64.h
+sha256 37a7596ec5377bb17fb157750a584b39b8bc7955a96b4fb29ff0c6cdf7a3fd9e  KHR_formatted.h
+sha256 cea58f28b749c59790327f61c445b09a202ef71c97b13cbbce1310316121c23e  KHR_perfcounter.h
+sha256 aa2bfc742d209e195580a0194352e1b375f9b71688ce7f6b222ab020c397e7f9  KHR_thread_storage.h
diff --git a/package/opengl/khronos-registry/openkode-registry/openkode-registry.mk b/package/opengl/khronos-registry/openkode-registry/openkode-registry.mk
new file mode 100644
index 0000000..fd7711d
--- /dev/null
+++ b/package/opengl/khronos-registry/openkode-registry/openkode-registry.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# openkode-registry
+#
+################################################################################
+
+OPENKODE_REGISTRY_VERSION = 1.0.3
+OPENKODE_REGISTRY_SITE = https://www.khronos.org/registry/kode/api/$(OPENKODE_REGISTRY_VERSION)
+
+# There is no archive available. So, we just have a buncha files to download.
+# Just download everything as _EXTRA downloads.
+# The first two headers are the base for OpenKODE; the KHR headers are core
+# extensions which we always want anyway.
+OPENKODE_REGISTRY_SOURCE =
+OPENKODE_REGISTRY_EXTRA_DOWNLOADS = kd.h kdplatform.h \
+	../KHR/KHR_float64.h \
+	../KHR/KHR_formatted.h \
+	../KHR/KHR_perfcounter.h \
+	../KHR/KHR_thread_storage.h
+
+OPENKODE_REGISTRY_LICENSE = Unknown
+
+# The registry only installs header files
+OPENKODE_REGISTRY_INSTALL_STAGING = YES
+OPENKODE_REGISTRY_INSTALL_TARGET = NO
+
+# We could well completely do without an EXTRACT phase, because we will
+# then just copy the files again over to staging. But if we need to patch
+# them, we must have them in the package build dir.
+define OPENKODE_REGISTRY_EXTRACT_CMDS
+	$(INSTALL) -D -m 0644 $(DL_DIR)/kd.h $(@D)/KD/kd.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/kdplatform.h $(@D)/KD/kdplatform.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_float64.h $(@D)/KHR/KHR_float64.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_formatted.h $(@D)/KHR/KHR_formatted.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_perfcounter.h $(@D)/KHR/KHR_perfcounter.h
+	$(INSTALL) -D -m 0644 $(DL_DIR)/KHR_thread_storage.h $(@D)/KHR/KHR_thread_storage.h
+endef
+
+define OPENKODE_REGISTRY_INSTALL_STAGING_CMDS
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
