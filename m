From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:28:12 +0100
Subject: [Buildroot] [PATCH v3 3/4] libfslparser: add install hooks to fix
	libraries path
In-Reply-To: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458138493-12172-4-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, all the libraries are installed under /usr/lib/imx-mm which
causes problems at runtime.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

I'm actually not sure if libfslparser is needed at all. I couldn't find
a library depending on any of the one from the package. But Yocto still has
depency on the package for gst-fsl-plugins:
https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-multimedia/gstreamer/gst-fsl-plugin.inc#L9

Anyway, since the libraries are copied to imx-mm, the package needs that
patch to be of any use.

Regards,
Gary

---
 package/libfslparser/libfslparser.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index c5efc85..62c6053 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -20,4 +20,19 @@ endef
 # The Makefile installs several versions of the libraries, but we only
 # need one of them, depending on the platform.
 
+# Use symlinks in staging dir so every application can link against the libs
+# whether they look at imx-mm or not (gst-fsl-plugins vs. gst1-imx).
+define LIBFSLPARSER_FIXUP_STAGING_PATH
+	cd $(STAGING_DIR)/usr/lib; \
+	find imx-mm -mindepth 2 -maxdepth 2 -not -type d -exec ln -fs {} . \;
+endef
+LIBFSLPARSER_POST_INSTALL_STAGING_HOOKS += LIBFSLPARSER_FIXUP_STAGING_PATH
+
+# Use symlinks for install dir as well to match staging setup.
+define LIBFSLPARSER_FIXUP_TARGET_PATH
+	cd $(TARGET_DIR)/usr/lib; \
+	find imx-mm -mindepth 2 -maxdepth 2 -not -type d -exec ln -fs {} . \;
+endef
+LIBFSLPARSER_POST_INSTALL_TARGET_HOOKS += LIBFSLPARSER_FIXUP_TARGET_PATH
+
 $(eval $(autotools-package))
-- 
2.7.0
