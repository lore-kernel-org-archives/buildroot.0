From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 00:37:04 +0200
Subject: [Buildroot] [git commit] pngquant: doesn't support building with
	ccache
Message-ID: <20170703223727.69E2D81D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a6168db97db6501af42e96091da3218ae64d5c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pngquant's homegrown configure script doesn't understand CC with a
space, so we can't use ccache with it. Only the host variant is
affected: for the target, we call ccache from the toolchain-wrapper so
it's transparent to the configure script.

This wasn't seen in the autobuilders since they never enable
BR2_CCACHE.

To test, use any configuration and do
make BR2_CCACHE=y host-pngquant

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pngquant/pngquant.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 4a6f32f..938603a 100644
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
