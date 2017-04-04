From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 21:58:57 +0200
Subject: [Buildroot] [git commit] odroid-mali: fix broken headers
Message-ID: <20170404195954.9B84180286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cbc5b4bad1520f4f246aa198b86e7be2d574c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has updated the OpenGL
headers (https://github.com/mdrjr/c2_mali/issues/1) it should fix
failures such as:

  http://autobuild.buildroot.net/results/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/

in addition, when the framebuffer variant (i.e not X11) is used, we
update the cflags in egl.pc to pass -DMESA_EGL_NO_X11_HEADERS so that
X11 headers are not included.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odroid-mali/odroid-mali.hash | 2 +-
 package/odroid-mali/odroid-mali.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-mali/odroid-mali.hash
index 4d24824..b71ebab 100644
--- a/package/odroid-mali/odroid-mali.hash
+++ b/package/odroid-mali/odroid-mali.hash
@@ -1,2 +1,2 @@
 # Locally computed hash
-sha256 29d98ed4b8694b860d9289787c416faa847b0de26d36580a53add1752b4c2e9a  odroid-mali-46fe49f37e3506c6205ad8c50980eca9bfff11e3.tar.gz
+sha256 6c85e96f3372c24c6497f2a1cbea867a8dbf3a7b3edd736802c762176006aec6  odroid-mali-4f8a541693fee5fdcaa162a7fd8922861a4ba0a9.tar.gz
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
index 142fd97..86215a1 100644
--- a/package/odroid-mali/odroid-mali.mk
+++ b/package/odroid-mali/odroid-mali.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODROID_MALI_VERSION = 46fe49f37e3506c6205ad8c50980eca9bfff11e3
+ODROID_MALI_VERSION = 4f8a541693fee5fdcaa162a7fd8922861a4ba0a9
 ODROID_MALI_SITE = $(call github,mdrjr,c2_mali,$(ODROID_MALI_VERSION))
 ODROID_MALI_LICENSE = Hardkernel EULA
 ODROID_MALI_LICENSE_FILES = README.md
@@ -21,6 +21,10 @@ ODROID_MALI_DEPENDENCIES += \
 	libdrm xlib_libX11 xlib_libXdamage \
 	xlib_libXext xlib_libXfixes
 else
+define ODROID_MALI_FIX_EGL_PC
+	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+endef
 ODROID_MALI_HEADERS_SUBDIR = fbdev/mali_headers/
 ifeq ($(BR2_aarch64),y)
 ODROID_MALI_LIBS_SUBDIR = fbdev/mali_libs/
@@ -38,6 +42,7 @@ define ODROID_MALI_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
 	cp -dpfr $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 	cp -dpfr $(@D)/$(ODROID_MALI_HEADERS_SUBDIR)/* $(STAGING_DIR)/usr/include
+	$(ODROID_MALI_FIX_EGL_PC)
 endef
 
 define ODROID_MALI_INSTALL_TARGET_CMDS
