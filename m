From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 13:11:41 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: fix build issue
Message-ID: <20150502111256.CC390800AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2acb231eaec310f80980e3f1d0eccb4136bf02f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-imx-usb-loader uses pkg-config to find libusb-1.0, but since it's
a host package, pkg-config needs to be passed the appropriate
environment variables, which are in $(HOST_CONFIGURE_OPTS). Therefore,
we now pass $(HOST_CONFIGURE_OPTS) in the environment when building
host-imx-usb-loader.

Fixes:

  http://autobuild.buildroot.org/results/fba/fba11afe003c512ed5c529c417f3a0feb920b0ed/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imx-usb-loader/imx-usb-loader.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 4b60505..fdabb6a 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -11,7 +11,7 @@ IMX_USB_LOADER_LICENSE_FILES = COPYING
 IMX_USB_LOADER_DEPENDENCIES = host-libusb
 
 define HOST_IMX_USB_LOADER_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define HOST_IMX_USB_LOADER_INSTALL_CMDS
