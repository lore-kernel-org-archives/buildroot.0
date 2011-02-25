From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 13:18:45 +0100
Subject: [Buildroot] [git commit master 1/1] crosstool-ng: fix
	ctng-menuconfig with ccache enabled
Message-ID: <20110225122131.7625C8F6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c016c07e49a2272f2d71ac8d542665fb65903de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If ccache is enabled, we need to ensure it is built for the host before
anything else.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 8db8eac..edd643b 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -395,7 +395,8 @@ $(CTNG_DIR)/.patched: $(CTNG_DIR)/.unpacked
 # considered always remade. But we do not want
 # to reconfigure and rebuild ct-ng every time
 # we need to run it...
-$(CTNG_DIR)/.configured: | host-gawk        \
+$(CTNG_DIR)/.configured: | $(if $(BR2_CCACHE),host-ccache) \
+                           host-gawk        \
                            host-automake
 
 $(CTNG_DIR)/.configured: $(CTNG_DIR)/.patched
-- 
1.7.3.4
