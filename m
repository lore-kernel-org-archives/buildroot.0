From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 13:17:03 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/dhcp: install
 shared libraries
Message-ID: <20190902113832.B01E088FD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e654b07def22018dff5d5384a220125dfd09e214
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

We don't use "make install" for target installation because we build all
utilities (server, relay, client) but install only the selected ones.

The utilities, however, require the shared libraries to work, so use the
"install-exec" make target to install them. This also installs static
libraries but they are removed later by target-finalize.

With this change the omshell utility is installed if server is selected.
We keep it, since it is small and may be useful at run-time.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=12086

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a404d48e7eeb919b279b4023fee5c9b307ce1f7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 86f5c69a77..5f56c86414 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -40,7 +40,15 @@ ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
+define DHCP_INSTALL_LIBS
+	$(MAKE) -C $(@D)/common install-exec DESTDIR=$(TARGET_DIR)
+	$(MAKE) -C $(@D)/omapip install-exec DESTDIR=$(TARGET_DIR)
+endef
+
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
+define DHCP_INSTALL_CTL_LIBS
+	$(MAKE) -C $(@D)/dhcpctl install-exec DESTDIR=$(TARGET_DIR)
+endef
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
@@ -99,6 +107,8 @@ endef
 endif
 
 define DHCP_INSTALL_TARGET_CMDS
+	$(DHCP_INSTALL_LIBS)
+	$(DHCP_INSTALL_CTL_LIBS)
 	$(DHCP_INSTALL_RELAY)
 	$(DHCP_INSTALL_SERVER)
 	$(DHCP_INSTALL_CLIENT)
