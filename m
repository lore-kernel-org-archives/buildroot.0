From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Thu, 14 Nov 2013 15:40:38 +0200
Subject: [Buildroot] [PATCH 2/2] qt5base: use ccache if enabled
In-Reply-To: <1384436438-2119-1-git-send-email-fatih.asici@gmail.com>
References: <1384436438-2119-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1384436438-2119-2-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For now, it doesn't use ccache when compiling host tools (e.g. qmake).
It seems the fix is not trivial.

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/qt5base-0002-mkspecs-files.patch | 6 +++++-
 package/qt5/qt5base/qt5base.mk                       | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
index 3fddeac..6fa8a92 100644
--- a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
@@ -14,9 +14,13 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 ===================================================================
 --- /dev/null
 +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
-@@ -0,0 +1,11 @@
+@@ -0,0 +1,15 @@
 +include(../common/linux_device_pre.conf)
 +
++# modifications to g++.conf
++QMAKE_CC                = $${BUILDROOT_CCACHE} $${QMAKE_CC}
++QMAKE_CXX               = $${BUILDROOT_CCACHE} $${QMAKE_CXX}
++
 +#modifications to gcc-base.conf
 +QMAKE_CFLAGS           += $${BUILDROOT_COMPILER_CFLAGS}
 +QMAKE_CXXFLAGS         += $${BUILDROOT_COMPILER_CXXFLAGS}
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index febdc9b..a1d5dba 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -168,6 +168,7 @@ define QT5BASE_CONFIGURE_CMDS
 		-nomake examples -nomake tests \
 		-device buildroot \
 		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
+		-device-option BUILDROOT_CCACHE="$(CCACHE)" \
 		-device-option BUILDROOT_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
 		-device-option BUILDROOT_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
-- 
1.8.4.rc3
