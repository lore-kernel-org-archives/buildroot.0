From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 13:18:45 +0100
Subject: [Buildroot] [git commit master 1/1] uClibc: fix uclibc-menuconfig
	with ccache enabled
Message-ID: <20110225122131.AAE238F6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=92090917804e513a47b847b7ce3290d7abd446c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If ccache is enabled, we need to ensure it is built for the host before
anything else.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index a677be7..19256bb 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -395,6 +395,13 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 		oldconfig
 	touch $@
 
+ifeq ($(BR2_CCACHE),y)
+# we'll need ccache for the host built before make oldconfig
+# if configured, otherwise uclibc-menuconfig will fail.
+# Use order-only dependency as host-ccache is a virtual target
+$(UCLIBC_DIR)/.config: | host-ccache
+endif
+
 $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
-- 
1.7.3.4
