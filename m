From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:48:36 +0100
Subject: [Buildroot] [git commit] busybox: don't overwrite existing inittab
Message-ID: <20191208154011.0CEFB88D40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10c7610bb9bd57c34feedf9856777e067cd93347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a inittab file was already provided in the skeleton, don't overwrite
it with the one that comes with the busybox package.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 301e72bdd2..6283bc96ea 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -277,7 +277,9 @@ endif
 
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
-	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
+	if test ! -e $(TARGET_DIR)/etc/inittab; then \
+		$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab; \
+	fi
 endef
 endif
 
