From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:45:24 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: fix imx6 eglfs
 support with imx-gpu-viv
Message-ID: <20201031223251.BE6B681171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25f2191ed2ff1abc963dde45503bce9c9d48d47e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last commit fixed eglfs_kms support for i.MX8 platforms that required to
declare imx-gpu-viv as the gbm provider.
However, this broke the eglfs "fbdev" imx6 support as gbm isn't provided
in this case. So limit the gbm option to imx-gpu-viv when wayland
backend is used only.

Fixes: 82fb51d3b5 ("package/qt5/qt5base: allow to use imx-gpu-viv as GBM
provider")

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e0189599a7..ed308c1fa2 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -79,7 +79,7 @@ QT5BASE_DEPENDENCIES += gcnano-binaries
 else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += ti-sgx-libgbm
-else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += imx-gpu-viv
 else
