From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 22:06:36 +0200
Subject: [Buildroot] [git commit] imx-parser: add install hooks to fix
	libraries path
Message-ID: <20160803200947.7829F81E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=317bcd4c902e466a0ad2c3236f0267ad3d864dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, all the libraries are installed under /usr/lib/imx-mm
which causes problems at runtime.

[Peter: drop -mindepth/-maxdepth, add comment explaining why this is done]
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-parser/imx-parser.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index a207d6e..7dd1402 100644
--- a/package/freescale-imx/imx-parser/imx-parser.mk
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -20,4 +20,13 @@ endef
 # The Makefile installs several versions of the libraries, but we only
 # need one of them, depending on the platform.
 
+# Upstream installs libraries into usr/lib/imx-mm, but the dynamic
+# loader only looks in usr/lib, so move the libraries there
+define IMX_PARSER_FIXUP_TARGET_PATH
+	find $(TARGET_DIR)/usr/lib/imx-mm -not -type d \
+		-exec mv {} $(TARGET_DIR)/usr/lib \;
+	rm -rf $(TARGET_DIR)/usr/lib/imx-mm
+endef
+IMX_PARSER_POST_INSTALL_TARGET_HOOKS += IMX_PARSER_FIXUP_TARGET_PATH
+
 $(eval $(autotools-package))
