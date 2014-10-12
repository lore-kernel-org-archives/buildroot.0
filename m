From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 15:43:55 +0200
Subject: [Buildroot] [git commit] package/systemd: check
	BR2_TARGET_GENERIC_GETTY
Message-ID: <20141012134426.3C930B2610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a8ceecd80baf21df509c96d0cbc9a1b39cd7d4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not create a [serial-]getty link if BR2_TARGET_GENERIC_GETTY is not set.
Might be useful for custom setups (rootfs overlay).

[Peter: use BR2_TARGET_GENERIC_GETTY_PORT to match the code below]
Signed-off-by: Andr?? Erdmann <dywi@mailerd.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index dafc65c..94407ab 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -187,6 +187,7 @@ define SYSTEMD_DISABLE_SERVICE_TTY1
 	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
 endef
 
+ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
 define SYSTEMD_INSTALL_SERVICE_TTY
 	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
@@ -198,6 +199,7 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
 		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
 endef
+endif
 
 define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_DISABLE_SERVICE_TTY1)
