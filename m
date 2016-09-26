From: Pranit Tanaji Sirsat <Pranit.Sirsat@imgtec.com>
Date: Mon, 26 Sep 2016 12:00:31 +0530
Subject: [Buildroot] [PATCH] pahomqtt-c: new package
Message-ID: <1474871431-19111-1-git-send-email-Pranit.Sirsat@imgtec.com>
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
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/pahomqtt-c/Config.in       | 11 +++++++++++
 package/pahomqtt-c/pahomqtt-c.hash |  2 ++
 package/pahomqtt-c/pahomqtt-c.mk   | 18 ++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/pahomqtt-c/Config.in
 create mode 100644 package/pahomqtt-c/pahomqtt-c.hash
 create mode 100644 package/pahomqtt-c/pahomqtt-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 84e00c8..19a4270 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1148,6 +1148,9 @@ N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
 
+N:	Pranit Sirsat <Pranit.Sirsat@imgtec.com>
+F:	package/pahomqtt-c/
+
 N:	Qais Yousef <Qais.Yousef@imgtec.com>
 F:	package/bellagio/
 
diff --git a/package/Config.in b/package/Config.in
index 9ca6c15..c0d92ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1239,6 +1239,7 @@ menu "Networking"
 	source "package/openpgm/Config.in"
 	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
+	source "package/pahomqtt-c/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
diff --git a/package/pahomqtt-c/Config.in b/package/pahomqtt-c/Config.in
new file mode 100644
index 0000000..53ccef2
--- /dev/null
+++ b/package/pahomqtt-c/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PAHOMQTT_C
+	bool "pahomqtt-c"
+	depends on !BR2_STATIC_LIBS  # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  MQTT client C library
+
+	  https://eclipse.org/paho/clients/c/
+
+comment "pahomqtt-c needs a toolchain w/ threads and dynamic library support"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pahomqtt-c/pahomqtt-c.hash b/package/pahomqtt-c/pahomqtt-c.hash
new file mode 100644
index 0000000..4bd1e5c
--- /dev/null
+++ b/package/pahomqtt-c/pahomqtt-c.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  970b9621efc24251441d386274cd0a90cf6ad52b64031f3c8cb53fdd5526f5f3  pahomqtt-c-v1.1.0.tar.gz
diff --git a/package/pahomqtt-c/pahomqtt-c.mk b/package/pahomqtt-c/pahomqtt-c.mk
new file mode 100644
index 0000000..2a533d1
--- /dev/null
+++ b/package/pahomqtt-c/pahomqtt-c.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# pahomqtt-c
+#
+################################################################################
+
+PAHOMQTT_C_VERSION = v1.1.0
+PAHOMQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHOMQTT_C_VERSION))
+PAHOMQTT_C_LICENSE = EPLv1.0, EDLv1.0
+PAHOMQTT_C_LICENSE_FILES = epl-v10 edl-v10
+PAHOMQTT_C_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PAHOMQTT_C_DEPENDENCIES = openssl
+PAHOMQTT_C_CONF_OPTS = -DPAHO_WITH_SSL=TRUE
+endif
+
+$(eval $(cmake-package))
-- 
2.6.2
