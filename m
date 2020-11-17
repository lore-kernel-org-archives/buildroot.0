From: Markus Zehnder <zehnder@live.com>
Date: Tue, 17 Nov 2020 14:30:20 -0600 (CST)
Subject: [Buildroot] [PATCH 1/1] package/ti-sgx-{km,
 um}: bump to SDK 06.01.00.08 versions
In-Reply-To: <CAFSsvmr1GpWw1Zno8qa8wNOOZn7Hf0KhbqTZ9eEcXAOsS4yjZQ@mail.gmail.com>
References: <20200702201125.3639873-1-aduskett@gmail.com>
 <CAFSsvmr1GpWw1Zno8qa8wNOOZn7Hf0KhbqTZ9eEcXAOsS4yjZQ@mail.gmail.com>
Message-ID: <1605645020061-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm the happy ti-sgx patch user and newly subscribed to the mailing list.
BR2_PACKAGE_TI_SGX_DEMOS, the Qt examples and the famous
BR2_PACKAGE_QT5CINEX_HD are working now in Qt 5.12.8 and 5.15.0.

For the patch to work I had to add two small things:
- patching qt5base.mk as mentioned in the description, but missing in the
patch
- patch Qt core to fix a compile error with the eglfs backend, related to:
https://bugreports.qt.io/browse/QTBUG-72567

What's the proper way to proceed with the patch, resubmit a new patch
series? It would be great if it could be included.
If anyone needs them immediately, here's what I've added to Adam's patch:

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e0189599a7..c402f42008 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -76,9 +76,9 @@ QT5BASE_DEPENDENCIES += mesa3d
 else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += gcnano-binaries
-else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
+else ifeq ($(BR2_PACKAGE_TI_SGX_UM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
-QT5BASE_DEPENDENCIES += ti-sgx-libgbm
+QT5BASE_DEPENDENCIES += ti-sgx-um
 else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += imx-gpu-viv

qt5base patch:

diff -Naur
a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
---
a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
+++
b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
@@ -80,7 +80,8 @@
     }
 
     if (getPlatformDisplay) {
-        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay,
nullptr);
+        qintptr nativeDisplayPtr =
reinterpret_cast<qintptr>(nativeDisplay);
+        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR,
reinterpret_cast<void *>(&nativeDisplayPtr), nullptr);
     } else {
         qCDebug(qLcEglfsKmsDebug, "No eglGetPlatformDisplay for GBM,
falling back to eglGetDisplay");
         display = eglGetDisplay(nativeDisplay);




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
