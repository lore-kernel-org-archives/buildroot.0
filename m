From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Aug 2017 00:52:17 +0200
Subject: [Buildroot] [PATCH v5 07/14] skeleton-common: rename
	SKELETON_ROOT_PASSWORD to SKELETON_CUSTOM_ROOT_PASSWORD
In-Reply-To: <20170801225224.16899-1-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
Message-ID: <20170801225224.16899-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package variables should always be prefixed with the package name. For
SKELETON_CUSTOM_ROOT_PASSWORD, this means we set the variable a second
time based on the value it previously had. Fortunately, this is fine
for make, even for recursively expanded variables.

This also allows to simplify the condition of the empty password - it's
not needed to set it again to empty if it already was empty.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5: (Arnout)
 - New patch
---
 package/skeleton-common/skeleton-common.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
index 07c434c07a..06e59c03df 100644
--- a/package/skeleton-common/skeleton-common.mk
+++ b/package/skeleton-common/skeleton-common.mk
@@ -62,20 +62,18 @@ SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ISSUE
 endif
 
 ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
-ifeq ($(SKELETON_COMMON_ROOT_PASSWD),)
-SKELETON_ROOT_PASSWORD =
-else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_COMMON_ROOT_PASSWD)),)
-SKELETON_ROOT_PASSWORD = '$(SKELETON_COMMON_ROOT_PASSWD)'
-else
+ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_COMMON_ROOT_PASSWD)),)
+SKELETON_COMMON_ROOT_PASSWORD = '$(SKELETON_COMMON_ROOT_PASSWD)'
+else ifneq ($(SKELETON_COMMON_ROOT_PASSWD),)
 # This variable will only be evaluated in the finalize stage, so we can
 # be sure that host-mkpasswd will have already been built by that time.
-SKELETON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_COMMON_PASSWD_METHOD)" "$(SKELETON_COMMON_ROOT_PASSWD)"`"
+SKELETON_COMMON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_COMMON_PASSWD_METHOD)" "$(SKELETON_COMMON_ROOT_PASSWD)"`"
 endif
 else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-SKELETON_ROOT_PASSWORD = "*"
+SKELETON_COMMON_ROOT_PASSWORD = "*"
 endif
 define SKELETON_COMMON_SET_ROOT_PASSWD
-	$(SED) s,^root:[^:]*:,root:$(SKELETON_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
+	$(SED) s,^root:[^:]*:,root:$(SKELETON_COMMON_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
 endef
 SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ROOT_PASSWD
 
-- 
2.13.3
