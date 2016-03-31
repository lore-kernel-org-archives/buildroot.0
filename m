From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 04:02:49 +0200
Subject: [Buildroot] [git commit] package/systemd: Respect
	BR2_TARGET_GENERIC_GETTY_BAUDRATE
Message-ID: <20160331021536.CA75881D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e44b9c565433363dc8962654fb758192e5e069fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently systemd getty services ignore baudrates set in buildroot in
favour of a hardcoded 115200. This patch SEDs out that hardcoded value with
what is selected.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 75ad961..8a6aa44 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -227,6 +227,7 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
+# also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
 define SYSTEMD_INSTALL_SERVICE_TTY
 	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
 	then \
@@ -235,7 +236,11 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 		SERVICE="serial-getty"; \
 	fi; \
 	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
-		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
+	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
+	then \
+		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \
+	fi
 endef
 endif
 
