From: Refik TUZAKLI <refik.tuzakli@savronik.com.tr>
Date: Fri, 22 Mar 2019 11:10:44 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/paho-mqtt-cpp: add paho-mqtt-cpp
Message-ID: <1553253044-29318-1-git-send-email-refik.tuzakli@savronik.com.tr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/paho-mqtt-cpp/Config.in          | 12 ++++++++++++
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash |  4 ++++
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 22 ++++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/paho-mqtt-cpp/Config.in
 create mode 100644 package/paho-mqtt-cpp/paho-mqtt-cpp.hash
 create mode 100644 package/paho-mqtt-cpp/paho-mqtt-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3e0ac08..23cbbcc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1836,6 +1836,9 @@ N:	Rahul Jain <rahul.jain@imgtec.com>
 F:	package/uhttpd/
 F:	package/ustream-ssl/
 
+N:	Refik Tuzakli <refik.tuzakli@savronik.com.tr>
+F:	package/paho-mqtt-cpp/
+
 N:	R?mi R?rolle <remi.rerolle@gmail.com>
 F:	package/libfreeimage/
 
diff --git a/package/Config.in b/package/Config.in
index b5321ae..e372e0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1603,6 +1603,7 @@ menu "Networking"
 	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
 	source "package/paho-mqtt-c/Config.in"
+	source "package/paho-mqtt-cpp/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
diff --git a/package/paho-mqtt-cpp/Config.in b/package/paho-mqtt-cpp/Config.in
new file mode 100644
index 0000000..c7675e1
--- /dev/null
+++ b/package/paho-mqtt-cpp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PAHO_MQTT_CPP
+	bool "paho-mqtt-cpp"
+	depends on !BR2_STATIC_LIBS  # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_PAHO_MQTT_C
+	help
+	  MQTT client C++ library
+
+	  https://eclipse.org/paho/clients/cpp/
+
+comment "paho-mqtt-cpp needs a toolchain w/ threads and dynamic library support"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
new file mode 100644
index 0000000..20374e9
--- /dev/null
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  9f78afb988e9ce9bb7cb74805053221efbb073b74683e222d1d087633178b51f  paho-mqtt-cpp-v1.0.0.tar.gz
+sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
+sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
new file mode 100644
index 0000000..6afb637
--- /dev/null
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# paho-mqtt-cpp
+#
+################################################################################
+
+PAHO_MQTT_CPP_VERSION = v1.0.0
+PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,$(PAHO_MQTT_CPP_VERSION))
+PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
+PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
+PAHO_MQTT_CPP_INSTALL_STAGING = YES
+PAHO_MQTT_CPP_DEPENDENCIES = paho-mqtt-c
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PAHO_MQTT_CPP_DEPENDENCIES += openssl
+PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=TRUE
+else
+PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=FALSE
+endif
+PAHO_MQTT_CPP_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
+$(eval $(cmake-package))
-- 
2.7.4
