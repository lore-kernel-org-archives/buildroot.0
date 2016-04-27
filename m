From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Wed, 27 Apr 2016 09:03:31 +0200
Subject: [Buildroot] [PATCH v3] domoticz: new package
Message-ID: <28446_1461740616_57206448_28446_378_1_b908e8f2-8c6a-4068-b4d9-be1630cc0fa5@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
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
Changes v2 -> v3 (after review of Samuel Martin):
 - Use OFF instead of no for consistency with other cmake packages
 - Always set USE_STATIC_BOOST and USE_STATIC_OPENZWAVE to OFF as
   BR2_STATIC_LIBS will always be false due to mosquitto dependency

Changes v1 -> v2 (after review of Samuel Martin):
 - Add a hash file
 - Replace the dependency on BR2_PACKAGE_LUA_5_2 by a dependency on
   BR2_PACKAGE_LUA_5_2 or BR2_PACKAGE_LUA_5_3
 - Add dependencies on BR2_USE_MMU and !BR2_STATIC_LIBS (from mosquitto)
 - Add dependency on BR2_PACKAGE_BOOST_ARCH_SUPPORTS (from boost)
 - Automatically add zwave support in domoticz if the user has selected
   the openzwave package
 - Set USE_STATIC_BOOST and USE_STATIC_OPENZWAVE to the correct values
   in domoticz.mk depending on BR2_STATIC_LIBS value to avoid breaking
   static-only build

 package/Config.in              |  1 +
 package/domoticz/Config.in     | 32 ++++++++++++++++++++++++++++++++
 package/domoticz/domoticz.hash |  2 ++
 package/domoticz/domoticz.mk   | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/domoticz/Config.in
 create mode 100644 package/domoticz/domoticz.hash
 create mode 100644 package/domoticz/domoticz.mk

diff --git a/package/Config.in b/package/Config.in
index f242181..2156d5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1320,6 +1320,7 @@ menu "Miscellaneous"
 	source "package/bc/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
+	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
new file mode 100644
index 0000000..c7c2878
--- /dev/null
+++ b/package/domoticz/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_DOMOTICZ
+	bool "domoticz"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
+	depends on BR2_USE_MMU # mosquitto
+	depends on !BR2_STATIC_LIBS # mosquitto
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
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
+comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
new file mode 100644
index 0000000..9180a9b
--- /dev/null
+++ b/package/domoticz/domoticz.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	02b4cdde8e376258aeae3d5621edf8bb6b3563c34282e50194db343fcec9c0f5	domoticz-3.4834.tar.gz
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
new file mode 100644
index 0000000..3555640
--- /dev/null
+++ b/package/domoticz/domoticz.mk
@@ -0,0 +1,37 @@
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
+# Due to mosquitto dependency, domoticz depends on !BR2_STATIC_LIBS so sets
+# USE_STATIC_BOOST to OFF
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
+
+# Do not use any built-in libraries which are enabled by default for lua, 
+# sqlite and mqtt
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_LUA=OFF
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_SQLITE=OFF
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_MQTT=OFF
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+DOMOTICZ_DEPENDENCIES += libusb
+endif
+
+ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
+DOMOTICZ_DEPENDENCIES += openzwave
+
+# Due to mosquitto dependency, domoticz depends on !BR2_STATIC_LIBS so sets
+# USE_STATIC_OPENZWAVE to OFF otherwise domoticz will not found openzwave
+# library as it searchs by default a static library
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
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
