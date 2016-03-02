From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue,  1 Mar 2016 21:56:07 -0500
Subject: [Buildroot] [PATCH 1/1] avahi: move libdns_sd compat hook
	definition inside conditional block
Message-ID: <1456887367-2543-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As directed in the buildroot manual, "Optional hooks: keep hook
definition and assignment together in one if block".  And also
to be consistent with the rest of avahi.mk.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b7ad81d..d014f11 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -220,13 +220,13 @@ define AVAHI_INSTALL_INIT_SYSV
 	$(AVAHI_INSTALL_DAEMON_INIT_SYSV)
 endef
 
+ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
 # applications expects to be able to #include <dns_sd.h>
 define AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
 	ln -sf avahi-compat-libdns_sd/dns_sd.h \
 		$(STAGING_DIR)/usr/include/dns_sd.h
 endef
 
-ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
 AVAHI_POST_INSTALL_STAGING_HOOKS += AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
 endif
 
-- 
1.9.1
