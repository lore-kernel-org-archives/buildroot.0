From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:36 +0200
Subject: [Buildroot] [PATCH 11/12] vpnc: pass CFLAGS at link time
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b0a06250a5d34ee31a9f6cffd890682cfcc1b539.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
