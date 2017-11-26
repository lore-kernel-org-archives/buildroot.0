From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:23:34 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] fs: add missing $$(sep)
 to pre- and post-command hooks code
Message-ID: <20171126213855.4956F804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36ff040f8a4e55615117d45f7f09713aa8542b26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

When multiple hooks are registred, both pre-a and post-command hooks'
foreach loops need to have a separator at the end in order for the
code to work as intended. Without the separator all hooks end up as a
one single line command thus making all but the first hook into
no-ops.

Fixes: 4628b6f3b4 ("fs: add pre- and post-command hooks")
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3f9476df07200fd86d59fb19b4183dafed5934f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 9a7758f..5b612a3 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -96,13 +96,13 @@ endif
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
-		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT))
+		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 ifeq ($$(BR2_REPRODUCIBLE),y)
 	echo "find $$(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$$(SOURCE_DATE_EPOCH)" >> $$(FAKEROOT_SCRIPT)
 endif
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	$$(foreach hook,$$(ROOTFS_POST_CMD_HOOKS),\
-		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT))
+		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
