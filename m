From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:51 -0000
Subject: [Buildroot] [git commit branch/next] skeleton: use backtick instead
	of $(shell ...) make function
Message-ID: <20150808105633.DBAB780414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0291f7c22015a1c04bbddeaf71c75bad38b5e317
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Only the instance for setting the root password is changed. The
instance in SYSTEM_GETTY is harmless since it just uses echo and tail.

If SKELETON_TARGET_GENERIC_ROOT_PASSWD is passed as a hashed password
by the user, it contains $, so the '-quotes are needed. If it is not,
we need the backtick to be expanded so "-quotes are needed. Therefore,
the quoting is moved to the definition of SYSTEM_ROOT_PASSWORD.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton/skeleton.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 70d1258..48e7085 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -95,19 +95,19 @@ ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
 ifeq ($(SKELETON_TARGET_GENERIC_ROOT_PASSWD),)
 SYSTEM_ROOT_PASSWORD =
 else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)),)
-SYSTEM_ROOT_PASSWORD = $(SKELETON_TARGET_GENERIC_ROOT_PASSWD)
+SYSTEM_ROOT_PASSWORD = '$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)'
 else
 SKELETON_DEPENDENCIES += host-mkpasswd
 # This variable will only be evaluated in the finalize stage, so we can
 # be sure that host-mkpasswd will have already been built by that time.
-SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)")
+SYSTEM_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)"`"
 endif
 else # !BR2_TARGET_ENABLE_ROOT_LOGIN
-SYSTEM_ROOT_PASSWORD = *
+SYSTEM_ROOT_PASSWORD = "*"
 endif
 
 define SKELETON_SYSTEM_SET_ROOT_PASSWD
-	$(SED) 's,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):,' $(TARGET_DIR)/etc/shadow
+	$(SED) s,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
 endef
 TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_SET_ROOT_PASSWD
 
