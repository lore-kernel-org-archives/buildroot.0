From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 21:58:39 +0200
Subject: [Buildroot] [git commit] imx-codec: add install hooks to fix
	libraries path
Message-ID: <20160803200947.5A9DB81E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a1f5d1ebaf39c757f64ec083034f50c16288901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, all the libraries are installed under /usr/lib/imx-mm
which causes problems at runtime.

The hooks are inspired from the mechanism used in the Yocto recipe:
https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-codec/imx-codec.inc

Tested with the following commands:
 # gst-launch-0.10 audiotestsrc ! mfw_mp3encoder ! fakesink
 # gst-launch-1.0 audiotestsrc ! imxmp3audioenc ! fakesink

[Peter: drop -mindepth/-maxdepth, add comment explaining why this is done]
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-codec/imx-codec.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 67d3390..2577cf8 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -20,4 +20,13 @@ endef
 # FIXME The Makefile installs both the arm9 and arm11 versions of the
 # libraries, but we only need one of them.
 
+# Upstream installs libraries into usr/lib/imx-mm, but the dynamic
+# loader only looks in usr/lib, so move the libraries there
+define IMX_CODEC_FIXUP_TARGET_PATH
+	find $(TARGET_DIR)/usr/lib/imx-mm -not -type d \
+		-exec mv {} $(TARGET_DIR)/usr/lib \;
+	rm -rf $(TARGET_DIR)/usr/lib/imx-mm
+endef
+IMX_CODEC_POST_INSTALL_TARGET_HOOKS += IMX_CODEC_FIXUP_TARGET_PATH
+
 $(eval $(autotools-package))
