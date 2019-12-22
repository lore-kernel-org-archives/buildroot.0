From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:13:45 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] busybox: don't overwrite
 existing inittab
Message-ID: <20191222204333.E847E8D784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd0d785be1a96654b68813533c5a0fb4925cf341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

If a inittab file was already provided in the skeleton, don't overwrite
it with the one that comes with the busybox package.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 10c7610bb9bd57c34feedf9856777e067cd93347)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 179af6aea3..565488ce1a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -262,7 +262,9 @@ endif
 
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
-	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
+	if test ! -e $(TARGET_DIR)/etc/inittab; then \
+		$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab; \
+	fi
 endef
 endif
 
