From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Mon, 13 Jul 2015 20:55:20 +0200
Subject: [Buildroot] [PATCH] avahi: fix systemd service file install path
Message-ID: <1436813720-4458-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/avahi/avahi.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 24967f4..b241748 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -90,8 +90,11 @@ AVAHI_DEPENDENCIES = \
 
 AVAHI_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),)
-AVAHI_CFLAGS += -DDISABLE_SYSTEMD
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+	AVAHI_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+else
+	AVAHI_CONF_OPTS += --with-systemdsystemunitdir=no
+	AVAHI_CFLAGS += -DDISABLE_SYSTEMD
 endif
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
-- 
2.4.5
