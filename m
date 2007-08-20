From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 22:03:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dhcp
Message-ID: <20070820050321.D078BA459C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 22:03:21 -0700 (Sun, 19 Aug 2007)
New Revision: 19585

Log:
Make sure directories are available before install of dhcp targets

Modified:
   trunk/buildroot/package/dhcp/dhcp.mk


Changeset:
Modified: trunk/buildroot/package/dhcp/dhcp.mk
===================================================================
--- trunk/buildroot/package/dhcp/dhcp.mk	2007-08-19 23:32:33 UTC (rev 19584)
+++ trunk/buildroot/package/dhcp/dhcp.mk	2007-08-20 05:03:21 UTC (rev 19585)
@@ -44,23 +44,30 @@
 	$(STRIP) $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
 
 $(TARGET_DIR)/$(DHCP_SERVER_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
+	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(DHCP_DIR)/$(DHCP_SERVER_BINARY) $(TARGET_DIR)/$(DHCP_SERVER_TARGET_BINARY)
+	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server $(TARGET_DIR)/etc/init.d
+	mkdir -p $(TARGET_DIR)/etc/dhcp
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf $(TARGET_DIR)/etc/dhcp/dhcpd.conf
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
 $(TARGET_DIR)/$(DHCP_RELAY_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
+	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(DHCP_DIR)/$(DHCP_RELAY_BINARY) $(TARGET_DIR)/$(DHCP_RELAY_TARGET_BINARY)
+	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay $(TARGET_DIR)/etc/init.d
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
 $(TARGET_DIR)/$(DHCP_CLIENT_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
+	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(DHCP_DIR)/$(DHCP_CLIENT_BINARY) $(TARGET_DIR)/$(DHCP_CLIENT_TARGET_BINARY)
+	mkdir -p $(TARGET_DIR)/etc/dhcp
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf $(TARGET_DIR)/etc/dhcp/dhclient.conf
 	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script $(TARGET_DIR)/sbin/dhclient-script
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
