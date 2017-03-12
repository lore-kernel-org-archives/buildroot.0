From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:27:34 +0100
Subject: [Buildroot] [git commit] package/nbd: fix utilities locations
Message-ID: <20170312132800.F2A908071A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aabbeb245794862e8434317e885d6d028d23679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the code expects both the client and server to be in
/usr/bin, while the client is in /usr/sbin

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nbd/nbd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index c7c327e..92660c2 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -19,14 +19,14 @@ NBD_CONF_ENV = ac_cv_header_linux_falloc_h=no
 endif
 
 ifneq ($(BR2_PACKAGE_NBD_CLIENT),y)
-NBD_TOREMOVE += nbd-client
+NBD_TOREMOVE += /usr/sbin/nbd-client
 endif
 ifneq ($(BR2_PACKAGE_NBD_SERVER),y)
-NBD_TOREMOVE += nbd-server
+NBD_TOREMOVE += /usr/bin/nbd-server
 endif
 
 define NBD_CLEANUP_AFTER_INSTALL
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(NBD_TOREMOVE))
+	rm -f $(addprefix $(TARGET_DIR), $(NBD_TOREMOVE))
 endef
 
 NBD_POST_INSTALL_TARGET_HOOKS += NBD_CLEANUP_AFTER_INSTALL
