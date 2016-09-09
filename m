From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri,  9 Sep 2016 18:10:18 +0200
Subject: [Buildroot] [PATCH] systemd: let getty instead of serial-getty
	handle /dev/console
Message-ID: <1473437418-27792-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The serial-getty unit depends on dev-%i.device which does not
seem to be created for /dev/console
Workaround this by letting normal getty unit handle things
if BR2_TARGET_GENERIC_GETTY_PORT is set to 'console'

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fb07819..975bfb6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -357,7 +357,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
 # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
 define SYSTEMD_INSTALL_SERVICE_TTY
-	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
+	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'console|tty[0-9]*$$'; \
 	then \
 		SERVICE="getty"; \
 	else \
-- 
2.7.4
