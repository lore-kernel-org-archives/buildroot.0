From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:39 +0200
Subject: [Buildroot] [PATCH 33/49 v2] package/corosync: add optional snmp
	support
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <67a602b6025c3d942bc40c9d0ac2332ef7753305.1504993178.git.yann.morin.1998@free.fr>
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
index a20edd4535..ca73043319 100644
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
2.11.0
