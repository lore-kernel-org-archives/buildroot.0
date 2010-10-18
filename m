From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 11:30:31 +0200
Subject: [Buildroot] [git commit master 1/1] net-snmp: broken with parallel
	jobs
Message-ID: <20101018093103.5A68F8C9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fe5945a043a294d5abdfe530858d707211efefbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/netsnmp.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 47c792f..0fe2bc8 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -9,6 +9,7 @@ NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/n
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_LIBTOOL_PATCH = NO
+NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
 NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--with-defaults --enable-mini-agent --without-rpm \
@@ -40,14 +41,14 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 endif
 
 define NETSNMP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
 		$(TARGET_DIR)/etc/init.d/S59snmpd
 endef
 
 define NETSNMP_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) uninstall
 	rm -f $(TARGET_DIR)/etc/init.d/S59snmpd
 	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
-- 
1.7.1
