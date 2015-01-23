From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:36 +0100
Subject: [Buildroot] [PATCH 07/14 v6] package/khronos-registry-opengl:
	download and install extra headers
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <95faa60645759053eca93ba18d08b89945ed555f.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those headers are not part of the OpenGL registry, and are provided by
Khronos in a location different from the OpenGL registry.

We get the registry via svn, and we want to download the extra headers
with wget. But extra-downloads are currently always using the same
ite-methos as the main download, so we have to define our own download
function, like we are doing for the Linux kernel patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../khronos-registry-opengl.hash                   |  4 +++
 .../khronos-registry-opengl.mk                     | 32 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 package/opengl/khronos-registry-opengl/khronos-registry-opengl.hash

diff --git a/package/opengl/khronos-registry-opengl/khronos-registry-opengl.hash b/package/opengl/khronos-registry-opengl/khronos-registry-opengl.hash
new file mode 100644
index 0000000..8933646
--- /dev/null
+++ b/package/opengl/khronos-registry-opengl/khronos-registry-opengl.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  03552610f3dd821c020264745d7aa37d760ca68ab44d3c7314b0959a0a24ae8e  glplatform.h
+sha256  9fa1b645c46dee2ff091628f3804572403ba5e424785595d3d97068c3fdc7522  gl2platform.h
+sha256  3eae5adc8ad2adef24c2a9fc5572a8ea73dc953fd519d3fe7d374cd7f7b9aba8  gl3platform.h
diff --git a/package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk b/package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk
index a66def4..aee9ff1 100644
--- a/package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk
+++ b/package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk
@@ -27,6 +27,38 @@ KHRONOS_REGISTRY_OPENGL_DIRS = \
 	$(if $(BR2_PACKAGE_HAS_LIBEGL),EGL) \
 	$(if $(BR2_PACKAGE_HAS_LIBGLES),GLES GLES2 GLES3)
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+
+KHRONOS_REGISTRY_OPENGL_EXTRA_HEADERS_BASE = http://www.khronos.org/registry/gles/api
+KHRONOS_REGISTRY_OPENGL_EXTRA_HEADERS = \
+	GLES/glplatform.h \
+	GLES2/gl2platform.h \
+	GLES3/gl3platform.h
+
+# Extra downloads can only be dowloaded with the same site-method as the main
+# sources, so we can not use them. Instead, we have to download them manually
+# as a post-download hook.
+define KHRONOS_REGISTRY_OPENGL_DOWNLOAD_PATCHES
+	$(foreach h,$(KHRONOS_REGISTRY_OPENGL_EXTRA_HEADERS),\
+		$(call DOWNLOAD_WGET,$(KHRONOS_REGISTRY_OPENGL_EXTRA_HEADERS_BASE)/$(h),$(notdir $(h)))$(sep))
+endef
+KHRONOS_REGISTRY_OPENGL_POST_DOWNLOAD_HOOKS += KHRONOS_REGISTRY_OPENGL_DOWNLOAD_PATCHES
+
+# Destination directories already exist
+define KHRONOS_REGISTRY_OPENGL_EXTRACT_PATCHES
+	$(foreach h,$(KHRONOS_REGISTRY_OPENGL_EXTRA_HEADERS),\
+		cp $(DL_DIR)/$(notdir $(h)) $(@D)/$(h)$(sep))
+endef
+KHRONOS_REGISTRY_OPENGL_POST_EXTRACT_HOOKS += KHRONOS_REGISTRY_OPENGL_EXTRACT_PATCHES
+
+define KHRONOS_REGISTRY_OPENGL_INSTALL_PATCHES
+	$(foreach h,$(KHRONOS_REGISTRY_OPENGL_EXTRA_HEADERS),\
+		$(INSTALL) -m 0644 -D $(@D)/$(h) $(STAGING_DIR)/usr/include/$(h)$(sep))
+endef
+KHRONOS_REGISTRY_OPENGL_POST_INSTALL_STAGING_HOOKS += KHRONOS_REGISTRY_OPENGL_INSTALL_PATCHES
+
+endif # GLES
+
 # Remove pre-generated files
 define KHRONOS_REGISTRY_OPENGL_RM_H
 	rm -f $(@D)/GL/*.h
-- 
1.9.1
