From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 09:54:01 +0100
Subject: [Buildroot] [git commit] qextserialport: really disable target (and
	not staging) install for static builds
Message-ID: <20170109085750.B6E2A81DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46dd08c275720b259f0c214cf72ee27d1855174f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f09b33a0a (qextserialport: fix static build) adjusted the logic for
static builds, but the change contained a typo - It disabled
_INSTALL_STAGING for static builds, not _INSTALL_TARGET.

The autobuilders didn't detect this as nothing links against qextserialport
(so the missing staging install didn't cause issues) and the target install
command was only defined for !static.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qextserialport/qextserialport.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 1100946..e3e325c 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -35,7 +35,7 @@ define QEXTSERIALPORT_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),y)
-QEXTSERIALPORT_INSTALL_STAGING = NO
+QEXTSERIALPORT_INSTALL_TARGET = NO
 else
 define QEXTSERIALPORT_INSTALL_TARGET_CMDS
 	cp -a $(@D)/*.so.* $(TARGET_DIR)/usr/lib
