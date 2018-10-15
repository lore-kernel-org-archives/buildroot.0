From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 07:20:42 +0200
Subject: [Buildroot] [git commit] mdadm: move from /usr/sbin to /sbin
Message-ID: <20181015052049.B36EE8374C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0500d1a67a6870fbc259bfcb593240c8267b25e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream Makefile by default installs to /sbin but we override
that to install it in /usr/sbin. Since mdadm is a pretty core utility
for the boot process, it makes sense to comply with upstream's default
behavior, so we change mdadm.mk to install mdadm in /sbin. This also
removes the somewhat non-standard DESTDIR value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdadm/mdadm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 6efade981d..bdf77fcd56 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -14,14 +14,14 @@ define MDADM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
-		CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/usr/sbin\\\"" \
+		CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 		CHECK_RUN_DIR=0 \
 		mdadm
 endef
 
 define MDADM_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR)/usr \
+		DESTDIR=$(TARGET_DIR) \
 		install-mdadm
 endef
 
