From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 23:43:55 +0200
Subject: [Buildroot] [PATCH] pngquant: doesn't support building with ccache
Message-ID: <20170703214355.30076-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pngquant's homegrown configure script doesn't understand CC with a
space, so we can't use ccache with it. Only the host variant is
affected: for the target, we call ccache from the toolchain-wrapper so
it's transparent to the configure script.

This wasn't seen in the autobuilders since they never enable
BR2_CCACHE.

To test, use any configuration and do
make BR2_CCACHE=y host-pngquant

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pngquant/pngquant.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 4a6f32fdca..938603a21d 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -36,6 +36,7 @@ endef
 define HOST_PNGQUANT_CONFIGURE_CMDS
 	(cd $(@D) && \
 		$(HOST_CONFIGURE_OPTS) \
+		CC=$(HOSTCC_NOCCACHE) \
 		./configure --prefix=$(HOST_DIR)/usr \
 		--without-lcms2 \
 	)
-- 
2.13.2
