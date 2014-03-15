From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 22:42:05 +0100
Subject: [Buildroot] [git commit] network-manager: add support for
	ModemManager
Message-ID: <20140315214420.8050A9BF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3be3e53de232e88d7dbf7411e389ddcc7400237
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in          |    8 ++++++++
 package/network-manager/network-manager.mk |    7 +++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a6fbf0b..5b388b7 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -28,6 +28,14 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 if BR2_PACKAGE_NETWORK_MANAGER
 
+config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
+	bool "modem-manager support"
+	select BR2_PACKAGE_MODEM_MANAGER
+	select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
+	select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
+	help
+	  This option enables support for ModemManager
+
 config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	bool "pppd support"
 	select BR2_PACKAGE_PPPD
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 03057a6..89e0b29 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -40,6 +40,13 @@ else
 	NETWORK_MANAGER_CONF_OPT += --disable-ppp
 endif
 
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
+	NETWORK_MANAGER_DEPENDENCIES += modem-manager
+	NETWORK_MANAGER_CONF_OPT += --with-modem-manager-1
+else
+	NETWORK_MANAGER_CONF_OPT += --without-modem-manager-1
+endif
+
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 NETWORK_MANAGER_CONF_OPT += --with-dhclient=/usr/sbin/dhclient
 endif
