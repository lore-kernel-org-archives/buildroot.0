From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Nov 2019 20:15:21 +0100
Subject: [Buildroot] [git commit] package/sudo: fix rmdir
Message-ID: <20191108191128.4FF5D8EB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7131269b8c5019831392a647c8eeedb35f1a6dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a previous package (e.g. a custom skeleton) or on a rebuild, the
sudoers.d directory may be non-empty, if the user has installed a custom
config file there, so we do not want to remove the directory if it is
not empty; we just want to remove it if it is empty.

Pass --ignore-fail-on-non-empty to rmdir to fix the following error:

rmdir /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/target/etc/sudoers.d
rmdir: failed to remove '/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/target/etc/sudoers.d': Directory not empty

Fixes:
 - http://autobuild.buildroot.org/results/0cfc61a98760c1d3a98aa0f1e126767881c49abd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - expand commit log to explain why we don't do rm -rf
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7d52eb0b57..a7966047f8 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -66,7 +66,7 @@ endef
 
 define SUDO_REMOVE_DIST_EXAMPLES
 	$(RM) $(TARGET_DIR)/etc/sudoers.dist
-	rmdir $(TARGET_DIR)/etc/sudoers.d
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/sudoers.d
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_DIST_EXAMPLES
 
