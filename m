From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 May 2014 06:51:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] netsnmp: Remove ldconfig calls
Message-ID: <1400043072-22885-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ldconfig breaks links created by gpu-viv-bin-mx6q.

fixes
http://autobuild.buildroot.net/results/ab5/ab57dd3729d529366808cbfc802f49360b2ec2b9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rework the fix to not need a separate patch file

 package/netsnmp/netsnmp.mk |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 63ec97a..665b564 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -67,9 +67,14 @@ ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 	NETSNMP_CONF_OPT += --disable-debugging
 endif
 
+define NETSNMP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
+endef
+
 define NETSNMP_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
+		DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
 		$(TARGET_DIR)/etc/init.d/S59snmpd
 	for mib in $(NETSNMP_BLOAT_MIBS); do \
-- 
1.7.10.4
