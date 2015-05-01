From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 May 2015 18:35:34 +0200
Subject: [Buildroot] [PATCHv2] doc/manual: fix generating manual after
	legacy overhaul
Message-ID: <1430498134-8798-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 53903a15 (*config: improve handling of BR2_LEGACY) added an
option to entirely skip legacy entries, by passing a variable in the
environment.

However, it missed one location where that variable is also needed,
which is generating the list of packages and deprecated features for
inclusion in the manual.

Fix that by re-using the global $(COMMON_CONFIG_ENV) variable,
overriding just what we don't want (i.e. br2-external location and
defconfig path).

Also, slightly re-order variables so the ones we override come right
after the common settings, moving the specific ones at the end, one
variable per line.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - only one variable per line  (Arnout)
  - typoes  (arnout)
---
 docs/manual/manual.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index d5db2c2..ad9bd90 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -12,8 +12,11 @@ MANUAL_RESOURCES = $(TOPDIR)/docs/images
 # should not be included in the manual.
 define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
-	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(@D) \
+	$(Q)$(COMMON_CONFIG_ENV) \
+		BR2_DEFCONFIG="" \
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
+		TOPDIR=$(TOPDIR) \
+		O=$(@D) \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
 endef
 MANUAL_POST_RSYNC_HOOKS += MANUAL_GEN_LISTS
-- 
1.9.1
