From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:31:09 +0100
Subject: [Buildroot] [git commit] logrotate: install configuration file
	unconditionally
Message-ID: <20141201234334.681127FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a28ed55f84ac75ac1b3f2374ef0b10aafb61d7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/logrotate/logrotate.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 2e49feb..dc26d85 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -17,9 +17,7 @@ endef
 
 define LOGROTATE_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX=$(TARGET_DIR) -C $(@D) install
-	if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then \
-		$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf; \
-	fi
+	$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 endef
 
