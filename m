From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:23:15 +0200
Subject: [Buildroot] [git commit] qt5base: fix activation of i.MX visual ID
	workaround
Message-ID: <20150728212406.7EA358040E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad53b303e75691c5e85462cc7f7a2116b547bddf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The workaround implemented in 0001-Force_egl_visual_ID_33.patch has to
be enabled as soon as gpu_vivante/xorg is used. This does not depends
on eglfs option.

[Thomas: minor commit log tweaks.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 6f0f526..753b069 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -118,12 +118,13 @@ endif
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
-ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
-QT5BASE_CONFIGURE_OPTS += -eglfs
-QT5BASE_DEPENDENCIES   += libegl
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND
 endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
+QT5BASE_CONFIGURE_OPTS += -eglfs
+QT5BASE_DEPENDENCIES   += libegl
 else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
