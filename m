From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 May 2015 13:24:42 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: cleanup
Message-ID: <20150502112622.B605480113@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e8e3e8209edad816e149612d419a7ec14241676
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HOST_CONFIGURE_OPTS is a superset of HOST_MAKE_ENV, so there is no need to
pass them both.  Also use HOST_CONFIGURE_OPTS for the install step for
consistency, and finally, add host-pkgconf to _DEPENDENCIES as it is
explicitly used (currently gets pulled in by host-libusb though).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imx-usb-loader/imx-usb-loader.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index fdabb6a..280ffc0 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -8,14 +8,14 @@ IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPLv2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
-IMX_USB_LOADER_DEPENDENCIES = host-libusb
+IMX_USB_LOADER_DEPENDENCIES = host-libusb host-pkgconf
 
 define HOST_IMX_USB_LOADER_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define HOST_IMX_USB_LOADER_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		DESTDIR=$(HOST_DIR) sysconfdir=/etc install
 endef
 
