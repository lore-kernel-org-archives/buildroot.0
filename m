From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 13 Jun 2014 10:31:30 +0200
Subject: [Buildroot] [PATCH 2/2] network-manager: add terminal based UI
	support
In-Reply-To: <1402648290-9967-1-git-send-email-yegorslists@googlemail.com>
References: <1402648290-9967-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1402648290-9967-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

NM provides a newt based UI. One can create, modify and delete NM
connections via this interface.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/network-manager/Config.in          | 6 ++++++
 package/network-manager/network-manager.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 4503f3a..b7f223e 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -30,6 +30,12 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 if BR2_PACKAGE_NETWORK_MANAGER
 
+config BR2_PACKAGE_NETWORK_MANAGER_TUI
+	bool "nmtui support"
+	select BR2_PACKAGE_NEWT
+	help
+	  This option enables terminal based UI
+
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 47c91d5..282e1e5 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -34,6 +34,13 @@ NETWORK_MANAGER_CONF_OPT = \
 		--disable-ifupdown \
 		--disable-ifnet
 
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
+	NETWORK_MANAGER_DEPENDENCIES += newt
+	NETWORK_MANAGER_CONF_OPT += --with-nmtui=yes
+else
+	NETWORK_MANAGER_CONF_OPT += --with-nmtui=no
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
 	NETWORK_MANAGER_DEPENDENCIES += pppd
 	NETWORK_MANAGER_CONF_OPT += --enable-ppp
-- 
1.8.1.2
