From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jan 2015 21:40:32 +0100
Subject: [Buildroot] [PATCH 02/11 v5] package/khrplatform-registry: new
	package
In-Reply-To: <cover.1421699898.git.yann.morin.1998@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
Message-ID: <e54ab4506debce9d07fda2797b739c6d20d34d3d.1421699898.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Khronos is the group behind OpenGL and its siblings, OpenMAX and all
other Open-something.

Khronos maintains the Registry, in which the reference headers for the
different Open-something are maintained.

khrplatform is the header used by most other Khronos headers.

Note: there is no version for that file, so we rely on the hash to
decide whether we have to re-download it or not. That's unfortunate,
however, as an old build will not be reproducible in the future... :-(

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/opengl/Config.in                           |  3 +++
 package/opengl/khronos-registry/Config.in          |  1 +
 .../opengl/khronos-registry/khronos-registry.mk    |  1 +
 .../khrplatform-registry/Config.in                 |  7 ++++++
 .../khrplatform-registry/khrplatform-registry.hash |  2 ++
 .../khrplatform-registry/khrplatform-registry.mk   | 25 ++++++++++++++++++++++
 6 files changed, 39 insertions(+)
 create mode 100644 package/opengl/khronos-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/khronos-registry.mk
 create mode 100644 package/opengl/khronos-registry/khrplatform-registry/Config.in
 create mode 100644 package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.hash
 create mode 100644 package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 20ee28b..47d00d1 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -3,3 +3,6 @@ source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
 source "package/opengl/libopenmax/Config.in"
+
+# Khronos headers, from the Khronos Registries
+source "package/opengl/khronos-registry/Config.in"
diff --git a/package/opengl/khronos-registry/Config.in b/package/opengl/khronos-registry/Config.in
new file mode 100644
index 0000000..8def807
--- /dev/null
+++ b/package/opengl/khronos-registry/Config.in
@@ -0,0 +1 @@
+source "package/opengl/khronos-registry/khrplatform-registry/Config.in"
diff --git a/package/opengl/khronos-registry/khronos-registry.mk b/package/opengl/khronos-registry/khronos-registry.mk
new file mode 100644
index 0000000..6bf916c
--- /dev/null
+++ b/package/opengl/khronos-registry/khronos-registry.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard package/opengl/khronos-registry/*/*.mk))
diff --git a/package/opengl/khronos-registry/khrplatform-registry/Config.in b/package/opengl/khronos-registry/khrplatform-registry/Config.in
new file mode 100644
index 0000000..dcff578
--- /dev/null
+++ b/package/opengl/khronos-registry/khrplatform-registry/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KHRPLATFORM_REGISTRY
+	bool
+	help
+	  khrplatform installs the khrplatform.h headers, used by most
+	  other Khronos headers.
+
+	  https://www.khronos.org/registry/
diff --git a/package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.hash b/package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.hash
new file mode 100644
index 0000000..9abb73c
--- /dev/null
+++ b/package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  7631de0f2ce64747bfd893486eaa41aa08b9e8c5e5c6501b81c045c6ebf04b2a  khrplatform.h
diff --git a/package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.mk b/package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.mk
new file mode 100644
index 0000000..f32dbb2
--- /dev/null
+++ b/package/opengl/khronos-registry/khrplatform-registry/khrplatform-registry.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# khrplatform-registry
+#
+################################################################################
+
+# There is no version for that file :-(
+
+KHRPLATFORM_REGISTRY_SOURCE = khrplatform.h
+KHRPLATFORM_REGISTRY_SITE = https://www.khronos.org/registry/egl/api/KHR
+
+# Only installs a header
+KHRPLATFORM_REGISTRY_INSTALL_STAGING = YES
+KHRPLATFORM_REGISTRY_INSTALL_TARGET = NO
+
+define KHRPLATFORM_REGISTRY_EXTRACT_CMDS
+	$(INSTALL) -d $(@D)
+	$(INSTALL) -D -m 0644 $(DL_DIR)/khrplatform.h $(@D)/khrplatform.h
+endef
+
+define KHRPLATFORM_REGISTRY_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/khrplatform.h $(STAGING_DIR)/usr/include/KHR/khrplatform.h
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
