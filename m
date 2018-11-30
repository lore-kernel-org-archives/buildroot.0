From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Fri, 30 Nov 2018 13:01:21 +0100
Subject: [Buildroot] [PATCH 3/5] package/qt5: fix EGLFS for embedded boards
In-Reply-To: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
References: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <1543579283-20496-4-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that on some boards the special value of none is
used instead of an actual plugin. This indicates that
no special integration is necessary to use EGL with the
framebuffer and so no plugins must be loaded.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
-----------
see http://doc.qt.io/qt-5/embedded-linux.html

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4cd6ac0..ee72ba9 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -254,6 +254,9 @@ QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
 else ifeq ($(BR2_PACKAGE_SUNXI_MALI)$(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
+else ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
+# avoid error "EGL library doesn't support Emulator extensions". Needed for ti_sgx
+QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = none
 endif
 endif
 
-- 
2.7.4
