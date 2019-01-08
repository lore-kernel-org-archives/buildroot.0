From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jan 2019 16:04:46 +0100
Subject: [Buildroot] [git commit] efibootmgr: drop unneeded include path
 workaround
Message-ID: <20190108151257.60BF0836D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4c987980316129dfba59e770481147b0f399031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hard coded -I/usr/include/efivar has been dropped from the Makefile in
commit 000eb0020c02 (Set pkg-config binary as variable) which is part of
v13, so drop the unneeded (misnamed) EFIBOOTMSR_PATCH_HEADER_PATH workaround.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efibootmgr/efibootmgr.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index bdc0019d99..079a9b7281 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -12,12 +12,6 @@ EFIBOOTMGR_DEPENDENCIES = host-pkgconf efivar popt $(TARGET_NLS_DEPENDENCIES)
 EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 EFIBOOTMGR_MAKE_ARGS = EFIDIR=buildroot
 
-define EFIBOOTMSR_PATCH_HEADER_PATH
-	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile
-endef
-
-EFIBOOTMGR_POST_PATCH_HOOKS += EFIBOOTMSR_PATCH_HEADER_PATH
-
 define EFIBOOTMGR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 		LDFLAGS="$(EFIBOOTMGR_LDFLAGS)" $(MAKE1) -C $(@D) \
