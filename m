From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Fri, 22 Apr 2016 16:49:30 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: new package
Message-ID: <30737_1461336609_571A3A21_30737_6929_1_000623e0-df53-498e-8145-247406707520@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Domoticz is a Home Automation System that lets you monitor andi
configure various devices like: Lights, Switches, various
sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
and much more. Notifications/Alerts can be sent to any mobile device.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in            |  1 +
 package/domoticz/Config.in   | 39 +++++++++++++++++++++++++++++++++++++++
 package/domoticz/domoticz.mk | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 package/domoticz/Config.in
 create mode 100644 package/domoticz/domoticz.mk

diff --git a/package/Config.in b/package/Config.in
index cf697ab..15ed544 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1319,6 +1319,7 @@ menu "Miscellaneous"
 	source "package/bc/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
+	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
new file mode 100644
index 0000000..085b260
--- /dev/null
+++ b/package/domoticz/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_DOMOTICZ
+	bool "domoticz"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LUA_5_2
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_MOSQUITTO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	help
+	  Domoticz is a Home Automation System that lets you monitor andi
+	  configure various devices like: Lights, Switches, various
+	  sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
+	  and much more. Notifications/Alerts can be sent to any mobile device.
+
+	  http://domoticz.com
+
+comment "domoticz needs lua 5.2 and a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || !BR2_PACKAGE_LUA_5_2
+
+if BR2_PACKAGE_DOMOTICZ
+
+config BR2_PACKAGE_DOMOTICZ_ZWAVE_SUPPORT
+	bool "domoticz zwave support"
+	depends on BR2_PACKAGE_OPENZWAVE
+	help
+	  Enable ZWave support through openzwave library.
+
+comment "domoticz zwave support depends on openzwave library"
+	depends on !BR2_PACKAGE_OPENZWAVE
+
+endif
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
new file mode 100644
index 0000000..3a427c0
--- /dev/null
+++ b/package/domoticz/domoticz.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# domoticz
+#
+################################################################################
+
+DOMOTICZ_VERSION = 3.4834
+DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
+DOMOTICZ_LICENSE = GPLv3
+DOMOTICZ_LICENSE_FILES = License.txt
+DOMOTICZ_DEPENDENCIES = boost host-pkgconf libcurl lua mosquitto openssl \
+        sqlite zlib
+
+# Do not use static version of boost
+DOMOTICZ_CONF_OPTS = -DUSE_STATIC_BOOST=no
+
+# Do not use any built-in libraries which are enabled by default for lua, 
+# sqlite and mqtt
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_LUA=no
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_SQLITE=no
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_MQTT=no
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+DOMOTICZ_DEPENDENCIES += libusb
+endif
+
+# ZWave support depends on open-zwave.
+ifeq ($(BR2_PACKAGE_DOMOTICZ_ZWAVE_SUPPORT),y)
+DOMOTICZ_DEPENDENCIES += openzwave
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=no
+endif
+
+$(eval $(cmake-package))
-- 
1.9.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
