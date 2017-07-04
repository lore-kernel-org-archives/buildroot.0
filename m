From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:35:32 +0200
Subject: [Buildroot] [PATCH] avahi: create missing "services" directory
Message-ID: <20170704163533.13923-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a warning in avahi-daemon startup log:
"Failed to read /etc/avahi/services."

This directory can contain services files that you want avahi to
advertise.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/avahi/avahi.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index a356a08291..5f6f3c36b3 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -180,6 +180,12 @@ endef

 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_INITSCRIPT

+define AVAHI_CREATE_SERVICES_DIRECTORY
+	mkdir -p $(TARGET_DIR)/etc/avahi/services
+endef
+
+AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_CREATE_SERVICES_DIRECTORY
+
 ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
 define AVAHI_INSTALL_AUTOIPD
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
--
2.13.2
