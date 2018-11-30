From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Fri, 30 Nov 2018 13:01:20 +0100
Subject: [Buildroot] [PATCH 2/5] package/qt5: Use any libgbm provider
In-Reply-To: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
References: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <1543579283-20496-3-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgbm is not limited to mesa3d

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>

-------------------
Only tested for libgbm-ti-sgx - not sunxi_mali.
I have not been able to test on actual hardware, but I do get qt to build with gbm
*** ./output_ti/build/qt5base-5.11.2/config.summary    2018-11-08 13:18:20.553522890 +0100
--- ./output_ti/build/qt5base-5.11.2-nogbm/config.summary  2018-11-08 11:55:04.709670885 +0100
***************
*** 90,96 ****
      EGLFS i.Mx6 Wayland .................. no
      EGLFS RCAR ........................... no
      EGLFS EGLDevice ...................... no
!     EGLFS GBM ............................ yes
      EGLFS VSP2 ........................... no
      EGLFS Mali ........................... no
      EGLFS Raspberry Pi ................... no
--- 90,96 ----
      EGLFS i.Mx6 Wayland .................. no
      EGLFS RCAR ........................... no
      EGLFS EGLDevice ...................... no
!     EGLFS GBM ............................ no
      EGLFS VSP2 ........................... no
      EGLFS Mali ........................... no
      EGLFS Raspberry Pi ................... no

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 2b6fd39..4cd6ac0 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -42,10 +42,10 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-kms
 endif
 
-# Uses libgbm from mesa3d
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+# Uses libgbm from mesa3d,ti-sgx-libgbm or sunxi_mali
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
-QT5BASE_DEPENDENCIES += mesa3d
+QT5BASE_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBGBM))
 else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
-- 
2.7.4
