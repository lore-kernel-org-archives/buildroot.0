From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat,  2 Nov 2019 16:17:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix service installation
Message-ID: <20191102151726.7341-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

service files aren't installed by meson for some reason,
thus install them manually.
This is temporary fix, until it's fixed upstream.
It might be caused by install_dir ignoring the prefix and installing
always into systemd.get_pkgconfig_variable('systemdsystemunitdir').

Fixes: ada815afcf ("package/iputils: enable systemd services")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Quick fix, going to submit solution to upstream.
Feel free to wait for proper fix.

Kind regards,
Petr

 package/iputils/iputils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 57e90a973a..98f6f60dfe 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -59,6 +59,8 @@ IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 else
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=true
 define IPUTILS_INSTALL_SERVICE_NINFOD
+	$(INSTALL) -D -m 0644 $(@D)/systemd/ninfod.service.in \
+		$(TARGET_DIR)/usr/lib/systemd/system/ninfod.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../lib/systemd/system/ninfod.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ninfod.service
@@ -115,6 +117,8 @@ endef
 endif
 
 define IPUTILS_INSTALL_SERVICE_RDISC
+	$(INSTALL) -D -m 0644 $(@D)/systemd/rdisc.service.in \
+		$(TARGET_DIR)/usr/lib/systemd/system/rdisc.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../lib/systemd/system/rdisc.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rdisc.service
-- 
2.24.0.rc2
