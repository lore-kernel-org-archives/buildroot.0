From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 4 Apr 2018 23:35:22 +0200
Subject: [Buildroot] [git commit] qt5base: add support for sunxi-mali{,
 -mainline} eglfs backend
Message-ID: <20180404213959.B45AF83FE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8252118c5a1e208e3a62b47647bad78833a7b94c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only one of the two can be selected (they are conflicting virtual
packages) so testing against a single 'y' is enough.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Arnout: add sunxi-mali and sunxi-mali-mainline in a single patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5base/qt5base.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a9a79ba087..e6307fb3fe 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -240,9 +240,14 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
+else ifeq ($(BR2_PACKAGE_SUNXI_MALI)$(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
+# use mali backend
+QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
+endif
 endif
 
 ifneq ($(QT5BASE_CONFIG_FILE),)
