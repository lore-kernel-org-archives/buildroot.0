From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 25 Mar 2017 15:39:17 +0300
Subject: [Buildroot] [PATCH v2 1/2] odroid-mali: fix broken headers.
Message-ID: <20170325123918.19055-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upstream has updated the headers, (https://github.com/mdrjr/c2_mali/issues/1)
it should fix failures such as http://autobuild.buildroot.net/results/ed8/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/
in addition, incase BR2_PACKAGE_XLIB_LIBX11 is not set, update cflags in
egl.pc to pass -DMESA_EGL_NO_X11_HEADERS.

Reported By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

 v1 -> v2:
 	update egl.pc to pass -DMESA_EGL_NO_X11_HEADERS in cflags if libX11 is not installed (Thomas)

 package/odroid-mali/odroid-mali.hash | 2 +-
 package/odroid-mali/odroid-mali.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-mali/odroid-mali.hash
index 4d2482422..b71ebab13 100644
--- a/package/odroid-mali/odroid-mali.hash
+++ b/package/odroid-mali/odroid-mali.hash
@@ -1,2 +1,2 @@
 # Locally computed hash
-sha256 29d98ed4b8694b860d9289787c416faa847b0de26d36580a53add1752b4c2e9a  odroid-mali-46fe49f37e3506c6205ad8c50980eca9bfff11e3.tar.gz
+sha256 6c85e96f3372c24c6497f2a1cbea867a8dbf3a7b3edd736802c762176006aec6  odroid-mali-4f8a541693fee5fdcaa162a7fd8922861a4ba0a9.tar.gz
diff --git a/package/odroid-mali/odroid-mali.mk b/package/odroid-mali/odroid-mali.mk
index 142fd97c6..4ebc31605 100644
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
@@ -44,4 +44,11 @@ define ODROID_MALI_INSTALL_TARGET_CMDS
 	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR))
 endef
 
+ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+define ODROID_MALI_FIX_EGL_PC
+	$(SED) "s/: -I/: -DMESA_EGL_NO_X11_HEADERS -I/" $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+endef
+ODROID_MALI_POST_INSTALL_TARGET_HOOKS += ODROID_MALI_FIX_EGL_PC
+endif
+
 $(eval $(generic-package))
-- 
2.12.1
