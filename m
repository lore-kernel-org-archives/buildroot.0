From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] vpnc: pass CFLAGS at link time
Message-ID: <20100521184449.CFFE29C156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=56407a4efa4f0da90462e4eb71180b3c2c8bb874
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

External toolchain builds absolutely require the --sysroot option to
be passed at link time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vpnc/vpnc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 5d0f87a..c4f23fa 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -26,7 +26,7 @@ $(VPNC_BINARY): $(VPNC_DIR)/.unpacked
 	rm -f $@
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) INCLUDE=$(STAGING_DIR)/usr/include \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS+=-lgcrypt LDFLAGS+=-lgpg-error \
+		LDFLAGS+=-lgcrypt LDFLAGS+=-lgpg-error LDFLAGS+="$(TARGET_CFLAGS)" \
 		CC="$(TARGET_CC)" -C $(VPNC_DIR)
 
 $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
@@ -38,7 +38,7 @@ $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
 		MANDIR=/usr/share/man \
 		VERSION=$(VPNC_VERSION) \
 		INCLUDE=$(STAGING_DIR)/usr/include \
-		LDFLAGS="-lgcrypt -lgpg-error" \
+		LDFLAGS="-lgcrypt -lgpg-error $(TARGET_CFLAGS)" \
 		-C $(VPNC_DIR) install
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(VPNC_TARGET_BINARY)
 
-- 
1.6.3.3
