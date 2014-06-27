From: Fabio Porcedda <fabio.porcedda@telit.com>
Date: Fri, 27 Jun 2014 14:15:55 +0200
Subject: [Buildroot] [PATCH v3 1/5] Makefile: target-finalize: add
	TARGET_FINALIZE_HOOKS
In-Reply-To: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
References: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <1403871359-18849-2-git-send-email-fabio.porcedda@telit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

Add TARGET_FINALIZE_HOOKS to the "target-finalize" rule to be able to
add to it commands as needed.
This is useful for having a nicer output because commands are executed
after the "target-finalize" initial message, also it is useful to ensure
an executing order even when top-level parallel makefile is being used.

Also convert "TARGET_PURGE_LOCALES" to a hook that uses
"TARGET_FINALIZE_HOOKS".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---

Notes:
    v3:
     - Add in the description a note about TARGET_PURGE_LOCALES (Arnout)
     - Add Reviewed-by: Arnout

 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index af694b9..3e845f6 100644
--- a/Makefile
+++ b/Makefile
@@ -513,7 +513,7 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
-define TARGET_PURGE_LOCALES
+define PURGE_LOCALES
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
 
@@ -525,13 +525,14 @@ define TARGET_PURGE_LOCALES
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
-- 
2.0.0
