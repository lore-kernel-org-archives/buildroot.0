From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 11:09:58 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5/qt5base: fix
 imx6 eglfs support with imx-gpu-viv
Message-ID: <20201103095732.1EF5083FF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1ca8b6b51931179c124cda4068ee09e770bf26e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Last commit fixed eglfs_kms support for i.MX8 platforms that required to
declare imx-gpu-viv as the gbm provider.
However, this broke the eglfs "fbdev" imx6 support as gbm isn't provided
in this case. So limit the gbm option to imx-gpu-viv when wayland
backend is used only.

Fixes: 82fb51d3b5 ("package/qt5/qt5base: allow to use imx-gpu-viv as GBM
provider")

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 25f2191ed2ff1abc963dde45503bce9c9d48d47e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index f8f50530bc..3e4a7b5f16 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -84,7 +84,7 @@ QT5BASE_DEPENDENCIES += gcnano-binaries
 else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += ti-sgx-libgbm
-else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += imx-gpu-viv
 else
