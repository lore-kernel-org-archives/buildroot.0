From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:41:06 +0200
Subject: [Buildroot] [git commit] Makefile: target-finalize: add
	TARGET_FINALIZE_HOOKS
Message-ID: <20140629145327.BDAE69D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d384fa849e9a285bc5b70e392bd898f8eb073bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add TARGET_FINALIZE_HOOKS to the "target-finalize" rule to be able to
add to it commands as needed.
This is useful for having a nicer output because commands are executed
after the "target-finalize" initial message, also it is useful to ensure
an executing order even when top-level parallel makefile is being used.

Also convert "TARGET_PURGE_LOCALES" to a hook that uses
"TARGET_FINALIZE_HOOKS".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9c54992..c106c71 100644
--- a/Makefile
+++ b/Makefile
@@ -514,7 +514,7 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
-define TARGET_PURGE_LOCALES
+define PURGE_LOCALES
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
 
@@ -526,13 +526,14 @@ define TARGET_PURGE_LOCALES
 		done; \
 	done
 endef
+TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
 	@$(call MESSAGE,"Finalizing target directory")
-	$(TARGET_PURGE_LOCALES)
+	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
