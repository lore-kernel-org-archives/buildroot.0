From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 22:06:17 +0100
Subject: [Buildroot] [git commit] package/paho-mqtt-cpp: new package
Message-ID: <20190325210416.79490846DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d638d26d94f80bd1cc5b0bea0913661e2cc3e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
[Thomas:
 - add missing dependency on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 and
   corresponding Config.in comment
 - add missing dependency on BR2_INSTALL_LIBSTDCPP and update
   Config.in comment
 - add comment to explain why -DTHREADS_PTHREAD_ARG=OFF is passed in
   CONF_OPTS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/paho-mqtt-cpp/Config.in          | 19 +++++++++++++++++++
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash |  4 ++++
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0a4814a86..002ffa09c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1839,6 +1839,9 @@ N:	Rahul Jain <rahul.jain@imgtec.com>
 F:	package/uhttpd/
 F:	package/ustream-ssl/
 
+N:	Refik Tuzakli <refik.tuzakli@savronik.com.tr>
+F:	package/paho-mqtt-cpp/
+
 N:	R??mi R??rolle <remi.rerolle@gmail.com>
 F:	package/libfreeimage/
 
diff --git a/package/Config.in b/package/Config.in
index b5321aeb49..e372e0c430 100644
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
index 0000000000..dfeb5545f0
--- /dev/null
+++ b/package/paho-mqtt-cpp/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PAHO_MQTT_CPP
+	bool "paho-mqtt-cpp"
+	depends on !BR2_STATIC_LIBS  # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PAHO_MQTT_C
+	help
+	  MQTT client C++ library
+
+	  https://eclipse.org/paho/clients/cpp/
+
+comment "paho-mqtt-cpp needs a toolchain w/ threads, C++, dynamic library support"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+comment "paho-mqtt-cpp needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
new file mode 100644
index 0000000000..20374e9dc1
--- /dev/null
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  9f78afb988e9ce9bb7cb74805053221efbb073b74683e222d1d087633178b51f  paho-mqtt-cpp-v1.0.0.tar.gz
+sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
+sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
new file mode 100644
index 0000000000..694d30d0eb
--- /dev/null
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -0,0 +1,25 @@
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
+# The following CMake variable disables a TRY_RUN call in the -pthread
+# test which is not allowed when cross-compiling (for cmake < 3.10)
+PAHO_MQTT_CPP_CONF_OPTS = -DTHREADS_PTHREAD_ARG=OFF
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PAHO_MQTT_CPP_DEPENDENCIES += openssl
+PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=TRUE
+else
+PAHO_MQTT_CPP_CONF_OPTS += -DPAHO_WITH_SSL=FALSE
+endif
+
+$(eval $(cmake-package))
