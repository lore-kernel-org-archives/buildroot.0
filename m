From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 10 Dec 2015 14:52:39 +0100
Subject: [Buildroot] [PATCH v2 3/4] libfslparser: add install hooks to fix
	libraries path
In-Reply-To: <1449755560-2911-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1449755560-2911-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1449755560-2911-4-git-send-email-gary.bisson@boundarydevices.com>
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

Regards,
Gary

---
 package/libfslparser/libfslparser.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 2b53d62..221d5e4 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -20,4 +20,19 @@ endef
 # The Makefile installs several versions of the libraries, but we only
 # need one of them, depending on the platform.
 
+# Use symlinks in staging dir so every application can link against the libs
+# whether they look at imx-mm or not (gst-fsl-plugins vs. gst1-imx).
+define LIBFSLPARSER_FIXUP_STAGING_PATH
+	find $(STAGING_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
+		-exec ln -fs {} $(STAGING_DIR)/usr/lib \;
+endef
+LIBFSLPARSER_POST_INSTALL_STAGING_HOOKS += LIBFSLPARSER_FIXUP_STAGING_PATH
+
+# Use symlinks for install dir as well to match staging setup.
+define LIBFSLPARSER_FIXUP_TARGET_PATH
+	find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
+		-exec ln -fs {} $(TARGET_DIR)/usr/lib \;
+endef
+LIBFSLPARSER_POST_INSTALL_TARGET_HOOKS += LIBFSLPARSER_FIXUP_TARGET_PATH
+
 $(eval $(autotools-package))
-- 
2.6.2
