From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Thu,  9 Oct 2014 15:58:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd: check
	BR2_TARGET_GENERIC_GETTY
In-Reply-To: <1412863083-24764-1-git-send-email-dywi@mailerd.de>
References: <1412863083-24764-1-git-send-email-dywi@mailerd.de>
Message-ID: <1412863083-24764-2-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not create a [serial-]getty link if BR2_TARGET_GENERIC_GETTY is not set.
Might be useful for custom setups (rootfs overlay).

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fec96d0..3034b76 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -187,6 +187,7 @@ define SYSTEMD_DISABLE_SERVICE_TTY1
 	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
 endef
 
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
 # strip_tty_name :: str -> str
 #  removes digits at the end of the given str; ttyS0 => ttyS, tty1 => tty
 SYSTEMD_STRIP_TTY_NAME = $(shell \
@@ -201,6 +202,7 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 	ln -fs ../../../../lib/systemd/system/getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
 endef
 endif
+endif
 
 define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_DISABLE_SERVICE_TTY1)
-- 
2.1.2
