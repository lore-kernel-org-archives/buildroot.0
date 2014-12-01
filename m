From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:34:52 +0100
Subject: [Buildroot] [git commit] sysklogd: install configuration file
	unconditionally
Message-ID: <20141201234334.7984C80052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=428f1e7e70c6bc410b12bbb6f8137eae1fffaa6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/sysklogd.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 2b60b45..1e8652d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -21,10 +21,8 @@ endef
 define SYSKLOGD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/sbin/syslogd
 	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/sbin/klogd
-	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
-		$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
-			$(TARGET_DIR)/etc/syslog.conf; \
-	fi
+	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
+		$(TARGET_DIR)/etc/syslog.conf; \
 endef
 
 define SYSKLOGD_INSTALL_INIT_SYSV
