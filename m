From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:15:23 +0100
Subject: [Buildroot] [git commit] aiccu: install init script and config file
	unconditionally
Message-ID: <20141201233009.178BC80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc82dea73b878432bde1b2b164f4c746036fd772
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aiccu/aiccu.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index 4413f86..faa861c 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -28,14 +28,12 @@ endef
 define AICCU_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu \
 		$(TARGET_DIR)/usr/sbin/aiccu
-	[ -f $(TARGET_DIR)/etc/aiccu.conf ] || \
-		$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf \
+	$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf \
 		$(TARGET_DIR)/etc/aiccu.conf
 endef
 
 define AICCU_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S50aiccu ] || \
-		$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
+	$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
 		$(TARGET_DIR)/etc/init.d/S50aiccu
 endef
 
