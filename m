From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 15:37:01 +0200
Subject: [Buildroot] [git commit] package/systemd: fix getty setup
Message-ID: <20141012134426.354A4B25BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c95bf441a6e13d74a67bef95cc12ec5ae80ebbca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When trying to run a buildroot system configured with
BR2_TARGET_GENERIC_GETTY_PORT="tty1" (x86_64), the boot process hangs
with the following message:
  "A start job is running for dev-tty1.device (<time> / 1min 30s)"

Replacing /etc/systemd/system/getty.target.wants/serial-getty at tty1.service
(linking to serial-getty@) with getty at tty1.service (-> getty@) fixes the issue.

This patch adds a check that "detects" the tty type by removing digits at the
end of BR2_TARGET_GENERIC_GETTY_PORT and comparing the resulting base name.
An instance of getty at service gets created if the name matches "tty",
otherwise serial-getty@ gets instantiated (as before).

So, tty1,tty2,... are created as links getty at tty1.service -> getty@,
while ttyS0, ttyAMA0, ... are created as instances of serial-getty at .

[Peter: simplify logic]
Signed-off-by: Andr?? Erdmann <dywi@mailerd.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index face849..dafc65c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -183,12 +183,24 @@ define SYSTEMD_USERS
 	systemd-network -1 systemd-network -1 * - - - Network Manager
 endef
 
-define SYSTEMD_INSTALL_SERVICE_TTY
+define SYSTEMD_DISABLE_SERVICE_TTY1
 	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
-	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+endef
+
+# systemd needs getty.service for VTs and serial-getty.service for serial ttys
+define SYSTEMD_INSTALL_SERVICE_TTY
+	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
+	then \
+		SERVICE="getty"; \
+	else \
+		SERVICE="serial-getty"; \
+	fi; \
+	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
+		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
 endef
 
 define SYSTEMD_INSTALL_INIT_SYSTEMD
+	$(SYSTEMD_DISABLE_SERVICE_TTY1)
 	$(SYSTEMD_INSTALL_SERVICE_TTY)
 	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
 	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
