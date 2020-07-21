From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:50:13 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Makefile: delete debug
 libs when debug is not enabled
Message-ID: <20200721204713.0DB3B87E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ade40aa1e7a863edb2223f6fafcf2e03e94deab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Some toolchains, like the Linaro gcc7 toolchains, now install libstdc++ debug
library symbols to /lib/debug, which can be as large as the library itself.
This commit removes the extra debug content if debugging is not enabled.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 04e9a1ec8c0dee17728f7a213855bef2f8300b64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 2ed4551653..7461632c43 100644
--- a/Makefile
+++ b/Makefile
@@ -765,6 +765,9 @@ endif
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
+ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
+	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
+endif
 	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
 	$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $(STRIPCMD) $(STRIP_STRIP_DEBUG) 2>/dev/null || true
 
