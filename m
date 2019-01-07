From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon,  7 Jan 2019 19:14:36 +0100
Subject: [Buildroot] [PATCH v2 4/6] package/imx-mkimage: Add support for
 both other SOC families (i.MX8 and i.MX8X)
In-Reply-To: <20190107181438.23857-1-nerv@dawncrow.de>
References: <20190107181438.23857-1-nerv@dawncrow.de>
Message-ID: <20190107181438.23857-5-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/imx-mkimage/imx-mkimage.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index ac22c974ac..06d3157dc1 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -11,15 +11,23 @@ IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
 HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
+# i.MX8M needs a different binary
 define HOST_IMX_MKIMAGE_BUILD_CMDS
-	# Currently this only supports iMX8M. When more hardware is available
-	# this needs to be selectable based on iMX8-version (iMX8M,iMXQ etc).
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/iMX8M -f soc.mak mkimage_imx8
 endef
-
 define HOST_IMX_MKIMAGE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
 	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin/mkimage_fit_atf.sh
 endef
+else
+# i.MX8 and i.MX8X
+define HOST_IMX_MKIMAGE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) MKIMG=mkimage_imx8 mkimage_imx8
+endef
+define HOST_IMX_MKIMAGE_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
+endef
+endif
 
 $(eval $(host-generic-package))
-- 
2.17.1
