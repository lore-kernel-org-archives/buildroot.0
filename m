From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Jul 2011 07:34:09 +0200
Subject: [Buildroot] [git commit] iproute2: ensure TARGET_CFLAGS are used
Message-ID: <20110722053532.AA74A8B3D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9bd1fab4ea7721b40d9b72db6a46688a83e292fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index fd78b3c..bafb8c0 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -29,13 +29,12 @@ define IPROUTE2_CONFIGURE_CMDS
 	rm -r $(IPROUTE2_DIR)/include/netinet
 	# arpd needs berkeleydb
 	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
-	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(IPROUTE2_DIR)/Makefile
 	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
 	$(IPROUTE2_WITH_IPTABLES)
 endef
 
 define IPROUTE2_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC)" CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
-- 
1.7.3.4
