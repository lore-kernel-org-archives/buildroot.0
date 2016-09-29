From: Pranit Tanaji Sirsat <Pranit.Sirsat@imgtec.com>
Date: Thu, 29 Sep 2016 15:09:58 +0530
Subject: [Buildroot] [PATCH v3 1/2] paho-mqtt-c: new package
Message-ID: <1475141999-19771-1-git-send-email-Pranit.Sirsat@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mqtt client c library

Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Pranit Tanaji Sirsat <Pranit.Sirsat@imgtec.com>

---
Chnages v2 -> v3:
  - rename the package (suggested by Arnout)
  - correct license info (suggested by Arnout)
  - add explicit cmake option (suggested by Arnout)

Changes v1 -> v2:
  - remove updates to DEVELOPERS file (suggested by Baruch Siach)
---
 package/Config.in                    |  1 +
 package/paho-mqtt-c/Config.in        | 11 +++++++++++
 package/paho-mqtt-c/paho-mqtt-c.hash |  2 ++
 package/paho-mqtt-c/paho-mqtt-c.mk   | 20 ++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/paho-mqtt-c/Config.in
 create mode 100644 package/paho-mqtt-c/paho-mqtt-c.hash
 create mode 100644 package/paho-mqtt-c/paho-mqtt-c.mk

diff --git a/package/Config.in b/package/Config.in
index 9ca6c15..a04d6d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1239,6 +1239,7 @@ menu "Networking"
 	source "package/openpgm/Config.in"
 	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
+	source "package/paho-mqtt-c/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
diff --git a/package/paho-mqtt-c/Config.in b/package/paho-mqtt-c/Config.in
new file mode 100644
index 0000000..3560d8c
--- /dev/null
+++ b/package/paho-mqtt-c/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PAHO_MQTT_C
+	bool "paho-mqtt-c"
+	depends on !BR2_STATIC_LIBS  # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  MQTT client C library
+
+	  https://eclipse.org/paho/clients/c/
+
+comment "paho-mqtt-c needs a toolchain w/ threads and dynamic library support"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
new file mode 100644
index 0000000..8807d78
--- /dev/null
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  970b9621efc24251441d386274cd0a90cf6ad52b64031f3c8cb53fdd5526f5f3  paho-mqtt-c-v1.1.0.tar.gz
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
new file mode 100644
index 0000000..9180ead
--- /dev/null
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# paho-mqtt-c
+#
+################################################################################
+
+PAHO_MQTT_C_VERSION = v1.1.0
+PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHO_MQTT_C_VERSION))
+PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3c
+PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
+PAHO_MQTT_C_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PAHO_MQTT_C_DEPENDENCIES = openssl
+PAHO_MQTT_C_CONF_OPTS = -DPAHO_WITH_SSL=TRUE
+else
+PAHO_MQTT_C_CONF_OPTS = -DPAHO_WITH_SSL=FALSE
+endif
+
+$(eval $(cmake-package))
-- 
2.6.2
