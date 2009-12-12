From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Dec 2009 01:29:23 +0100
Subject: [Buildroot] [git commit master] Makefile: drop config cache on
	.config changes
Message-ID: <20091212002958.09AF3777EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b5972138c3e6912b29578e12cbe4689a2481abcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The config cache might contain invalid values when .config is changed
(E.G. when adding/removing libraries), so drop it so config checks are
rerun for new packages (existing package still won't be rebuilt).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 904121e..f8303e1 100644
--- a/Makefile
+++ b/Makefile
@@ -440,6 +440,14 @@ external-deps:
 	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
 		SPIDER=--spider source
 
+ifeq ($(BR2_CONFIG_CACHE),y)
+$(BUILD_DIR)/tgt-config.cache: .config
+	rm -f $@
+	touch $@
+
+$(BASE_TARGETS): | $(BUILD_DIR)/tgt-config.cache
+endif
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
-- 
1.6.3.3
