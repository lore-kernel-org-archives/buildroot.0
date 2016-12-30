From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:37 +0100
Subject: [Buildroot] [PATCH 36/52] package/corosync: add optional snmp
	support
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <e43beaf4583073d0bea112c97e1951d1c452c746.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/corosync/corosync.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/corosync/corosync.mk b/package/corosync/corosync.mk
index a20edd4..ca73043 100644
--- a/package/corosync/corosync.mk
+++ b/package/corosync/corosync.mk
@@ -38,7 +38,6 @@ COROSYNC_CONF_OPTS = \
 	--disable-upstart \
 	$(if $(BR2_INIT_SYSTEMD),--enable-systemd,--disable-systemd) \
 	--disable-upstart \
-	--disable-snmp \
 	--disable-xmlconf \
 	--disable-qdevices \
 	--disable-qnet
@@ -50,4 +49,12 @@ else
 COROSYNC_CONF_OPTS += --disable-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+COROSYNC_DEPENDENCIES += netsnmp
+COROSYNC_CONF_OPTS += --enable-snmp
+COROSYNC_CONF_ENV += SNMPCONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
+else
+COROSYNC_CONF_OPTS += --disable-snmp
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
