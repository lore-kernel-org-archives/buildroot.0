From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 07:21:13 +0200
Subject: [Buildroot] [git commit] mdadm: also install mdmon
Message-ID: <20181015052049.BBE737F903@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45498bbc62d8dfbaa337854a93c379fe3aed1cd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adjusts the mdadm package to also install the mdmon
utility, which is used to "monitor MD external metadata arrays". It
adds ~250 KB to the installed size:

-rwxr-xr-x 1 thomas thomas 446064 Oct 14 21:55 mdadm
-rwxr-xr-x 1 thomas thomas 244672 Oct 14 21:55 mdmon

Fixes bug #11376.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdadm/mdadm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index bdf77fcd56..3ee4ddd059 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -16,13 +16,13 @@ define MDADM_BUILD_CMDS
 		CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
 		CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 		CHECK_RUN_DIR=0 \
-		mdadm
+		mdadm mdmon
 endef
 
 define MDADM_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) \
-		install-mdadm
+		install-mdadm install-mdmon
 endef
 
 $(eval $(generic-package))
