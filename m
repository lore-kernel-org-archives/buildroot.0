From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:25:58 +0100
Subject: [Buildroot] [git commit] package/ebtables: use a foreach make loop
 instead of a for shell loop
Message-ID: <20191222211654.4580B8D9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa5d8a2b3fe3559db1256b8395561088e4500ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

make loops are more commonly used in Buildroot, are shorter, and have
built-in error handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ebtables/ebtables.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 7b2264703c..9a975cc7a1 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -23,10 +23,10 @@ define EBTABLES_INSTALL_TARGET_CMDS
 endef
 else
 define EBTABLES_INSTALL_TARGET_CMDS
-	for so in $(@D)/*.so $(@D)/extensions/*.so; do \
-		$(INSTALL) -m 0755 -D $${so} \
-			$(TARGET_DIR)/lib/ebtables/`basename $${so}` || exit 1; \
-	done
+	$(foreach so,$(wildcard $(@D)/*.so $(@D)/extensions/*.so), \
+		$(INSTALL) -m 0755 -D $(so) \
+			$(TARGET_DIR)/lib/ebtables/$(notdir $(so))
+	)
 	$(INSTALL) -m 0755 -D $(@D)/ebtables $(TARGET_DIR)/sbin/ebtables
 	$(INSTALL) -m 0644 -D $(@D)/ethertypes $(TARGET_DIR)/etc/ethertypes
 endef
