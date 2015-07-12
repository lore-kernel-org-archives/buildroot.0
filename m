From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 Jul 2015 16:35:30 +0200
Subject: [Buildroot] [PATCH 5/5] system: use backtick instead of $(shell
	...) make function
In-Reply-To: <1436711730-20599-1-git-send-email-arnout@mind.be>
References: <1436711730-20599-1-git-send-email-arnout@mind.be>
Message-ID: <1436711730-20599-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only the instance for setting the root password is changed. The
instance in SYSTEM_GETTY is harmless since it just uses echo and tail.

If TARGET_GENERIC_ROOT_PASSWD is passed as a hashed password by the
user, it contains $, so the '-quotes are needed. If it is not, we need
the backtick to be expanded so "-quotes are needed. Therefore, the
quoting is moved to the definition of SYSTEM_ROOT_PASSWORD.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This one is a bit complicated so could perhaps also be dropped. It is
only useful for printvars, not for per-package staging.
---
 system/system.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/system/system.mk b/system/system.mk
index 2794667..a85678f 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -69,19 +69,17 @@ ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
 ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
 SYSTEM_ROOT_PASSWORD =
 else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(TARGET_GENERIC_ROOT_PASSWD)),)
-SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWD)
+SYSTEM_ROOT_PASSWORD = '$(TARGET_GENERIC_ROOT_PASSWD)'
 else
 PACKAGES += host-mkpasswd
-# This variable will only be evaluated in the finalize stage, so we can
-# be sure that host-mkpasswd will have already been built by that time.
-SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
+SYSTEM_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"`"
 endif
 else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-SYSTEM_ROOT_PASSWORD = *
+SYSTEM_ROOT_PASSWORD = "*"
 endif
 
 define SYSTEM_SET_ROOT_PASSWD
-	$(SED) 's,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):,' $(TARGET_DIR)/etc/shadow
+	$(SED) s,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
 endef
 TARGET_FINALIZE_HOOKS += SYSTEM_SET_ROOT_PASSWD
 
-- 
2.1.4
