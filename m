From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 22:49:50 +0200
Subject: [Buildroot] [git commit] system: directly use system shell as root
 shell
Message-ID: <20190801204717.A0B088A509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffe9eaf3377222b76bafc7e7f49f499e5b5a65e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than through the /bin/sh symlink, because because invocating bash as
sh causes bash to mimic sh (see INVOCATION in bash(1)).

Signed-off-by: Philip Molloy <philip.a.molloy@gmail.com>
[yann.morin.1998 at free.fr: use the system shell, not a new option,
 as suggested by Arnout]
[Peter: describe why this is done using the description from Philip's help
 text]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton-init-common/skeleton-init-common.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index e429b13d78..4a67f51c19 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -95,6 +95,8 @@ SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_ADD_SH_TO_SHE
 ifneq ($(SKELETON_INIT_COMMON_BIN_SH),)
 define SKELETON_INIT_COMMON_SET_BIN_SH
 	ln -sf $(SKELETON_INIT_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
+	$(SED) '/^root:/s,[^/]*$$,$(SKELETON_INIT_COMMON_BIN_SH),' \
+		$(TARGET_DIR)/etc/passwd
 endef
 endif
 endif
