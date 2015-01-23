From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:32 +0100
Subject: [Buildroot] [PATCH 03/14 v6] package/khronos-registry-khrplatform:
	new package
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <7af218fa9953837f6ee8de02e73193c646961946.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Khronos is the group behind OpenGL and its siblings, OpenMAX and all
other GFX-related Open-something.

Khronos maintains the Registry, in which the reference headers for the
different Open-something are maintained.

khrplatform is the header used by most (if not all) other Khronos headers.

Note: there is no version for that file, so we rely on the hash to
decide whether we have to re-download it or not. That's unfortunate,
however, as an old build will not be reproducible in the future... :-(

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/opengl/Config.in                           |  3 +++
 .../opengl/khronos-registry-khrplatform/Config.in  | 11 +++++++++
 .../khronos-registry-khrplatform.hash              |  2 ++
 .../khronos-registry-khrplatform.mk                | 28 ++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/opengl/khronos-registry-khrplatform/Config.in
 create mode 100644 package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.hash
 create mode 100644 package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index 20ee28b..0afb158 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -3,3 +3,6 @@ source "package/opengl/libegl/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopenvg/Config.in"
 source "package/opengl/libopenmax/Config.in"
+
+# Khronos headers, from the Khronos Registries
+source "package/opengl/khronos-registry-khrplatform/Config.in"
diff --git a/package/opengl/khronos-registry-khrplatform/Config.in b/package/opengl/khronos-registry-khrplatform/Config.in
new file mode 100644
index 0000000..c653a69
--- /dev/null
+++ b/package/opengl/khronos-registry-khrplatform/Config.in
@@ -0,0 +1,11 @@
+# Promptless package, because we do not want the user be responsible
+# for enabling this package. Instead, it should be selected by those
+# packages that need the KHR header(s).
+
+config BR2_PACKAGE_KHRONOS_REGISTRY_KHRPLATFORM
+	bool
+	help
+	  khrplatform installs the khrplatform.h headers, used by most
+	  other Khronos headers.
+
+	  https://www.khronos.org/registry/
diff --git a/package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.hash b/package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.hash
new file mode 100644
index 0000000..9abb73c
--- /dev/null
+++ b/package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  7631de0f2ce64747bfd893486eaa41aa08b9e8c5e5c6501b81c045c6ebf04b2a  khrplatform.h
diff --git a/package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.mk b/package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.mk
new file mode 100644
index 0000000..a8ea4cc
--- /dev/null
+++ b/package/opengl/khronos-registry-khrplatform/khronos-registry-khrplatform.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# khronos-registry-khrplatform
+#
+################################################################################
+
+# There is no version for that file :-(
+
+KHRONOS_REGISTRY_KHRPLATFORM_SOURCE = khrplatform.h
+KHRONOS_REGISTRY_KHRPLATFORM_SITE = https://www.khronos.org/registry/egl/api/KHR
+
+# No license file, license in the header file itself
+KHRONOS_REGISTRY_KHRPLATFORM_LICENSE = MIT
+
+# Only installs a header
+KHRONOS_REGISTRY_KHRPLATFORM_INSTALL_STAGING = YES
+KHRONOS_REGISTRY_KHRPLATFORM_INSTALL_TARGET = NO
+
+define KHRONOS_REGISTRY_KHRPLATFORM_EXTRACT_CMDS
+	$(INSTALL) -d $(@D)
+	$(INSTALL) -D -m 0644 $(DL_DIR)/khrplatform.h $(@D)/khrplatform.h
+endef
+
+define KHRONOS_REGISTRY_KHRPLATFORM_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/khrplatform.h $(STAGING_DIR)/usr/include/KHR/khrplatform.h
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
