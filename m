From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:25:32 +0200
Subject: [Buildroot] [git commit] skeleton-common: rename
	SKELETON_ROOT_PASSWORD to SKELETON_COMMON_ROOT_PASSWORD
Message-ID: <20170802172439.5820482156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22cf98c6af45492b942ba2956873cb3c85f2de7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package variables should always be prefixed with the package name. For
SKELETON_COMMON_ROOT_PASSWORD, this means we set the variable a second
time based on the value it previously had. Fortunately, this is fine
for make, even for recursively expanded variables.

This also allows to simplify the condition of the empty password - it's
not needed to set it again to empty if it already was empty.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton-common/skeleton-common.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
index 07c434c..06e59c0 100644
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
 
