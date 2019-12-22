From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:25:58 +0100
Subject: [Buildroot] [git commit] package/ebtables: drop useless
 EBTABLES_SUBDIR variable
Message-ID: <20191222211654.3B3238D9DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6febe48c82d0a65e17aab1eadfb70921e40c354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable is never defined, so it is empty. Using it makes the
code needlessly more complicated than it needs to be, so let's drop
it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ebtables/ebtables.mk | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index aae0c91a10..7b2264703c 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -19,19 +19,15 @@ endef
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define EBTABLES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/static \
-		$(TARGET_DIR)/sbin/ebtables
+	$(INSTALL) -m 0755 -D $(@D)/static $(TARGET_DIR)/sbin/ebtables
 endef
 else
 define EBTABLES_INSTALL_TARGET_CMDS
-	for so in $(@D)/$(EBTABLES_SUBDIR)/*.so \
-		$(@D)/$(EBTABLES_SUBDIR)/extensions/*.so; \
-		do \
+	for so in $(@D)/*.so $(@D)/extensions/*.so; do \
 		$(INSTALL) -m 0755 -D $${so} \
 			$(TARGET_DIR)/lib/ebtables/`basename $${so}` || exit 1; \
 	done
-	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
-		$(TARGET_DIR)/sbin/ebtables
+	$(INSTALL) -m 0755 -D $(@D)/ebtables $(TARGET_DIR)/sbin/ebtables
 	$(INSTALL) -m 0644 -D $(@D)/ethertypes $(TARGET_DIR)/etc/ethertypes
 endef
 endif
