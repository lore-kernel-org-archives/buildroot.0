From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 29 Oct 2015 21:06:51 +0100
Subject: [Buildroot] [PATCH 3/4] libfslparser: add install hooks to fix
	libraries path
In-Reply-To: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1446149212-12048-4-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, all the libraries are installed under /usr/lib/imx-mm which
causes problems at runtime.

This has been tested implicitely by running Gstreamer without any special
setup (no ld.so.conf nor LD_LIBRARY_PATH modification):
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-0.10 audiotestsrc ! mfw_mp3encoder ! fakesink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

I'm actually not sure if libfslparser is needed at all. I couldn't find
a library depending on any of the one from the package. But Yocto still has
depency on the package for gst-fsl-plugins:
https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-multimedia/gstreamer/gst-fsl-plugin.inc#L9

Regards,
Gary

---
 package/libfslparser/libfslparser.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 2b53d62..aa02f19 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -20,4 +20,12 @@ endef
 # The Makefile installs several versions of the libraries, but we only
 # need one of them, depending on the platform.
 
+# no need to symlink in target image, just move libraries around
+define LIBFSLPARSER_FIXUP_TARGET_PATH
+	find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
+		-exec mv {} $(TARGET_DIR)/usr/lib \;
+	rm -fr $(TARGET_DIR)/usr/lib/imx-mm
+endef
+LIBFSLPARSER_POST_INSTALL_TARGET_HOOKS += LIBFSLPARSER_FIXUP_TARGET_PATH
+
 $(eval $(autotools-package))
-- 
2.6.1
