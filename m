From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Apr 2020 19:12:42 +0200
Subject: [Buildroot] [PATCH v2,
 3/6] package/collectd: add DPDK_TELEMETRY option
In-Reply-To: <20200414171245.2235154-1-fontaine.fabrice@gmail.com>
References: <20200414171245.2235154-1-fontaine.fabrice@gmail.com>
Message-ID: <20200414171245.2235154-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DPDK support is available since version 5.11.0 and
https://github.com/collectd/collectd/commit/00cbd4d2c016a676db476ae66bbc58d6bf11a6a0

It depends on jansson and is currently enabled by default raising the
following build failure on musl:

src/dpdk_telemetry.c:43:10: fatal error: sys/unistd.h: No such file or directory
 #include <sys/unistd.h>
          ^~~~~~~~~~~~~~

Fixes:
 - autobuild.buildroot.org/results/aafb8c72f147fefc7a988c45e4dc17de48b07a95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-dpdk_telemetry.c-fix-build-on-musl.patch | 37 +++++++++++++++++++
 package/collectd/Config.in                    |  7 ++++
 package/collectd/collectd.mk                  |  5 +++
 3 files changed, 49 insertions(+)
 create mode 100644 package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch

diff --git a/package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch b/package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch
new file mode 100644
index 0000000000..8378cd0d33
--- /dev/null
+++ b/package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch
@@ -0,0 +1,37 @@
+From 70318d6bcf7ef89e1a73fc775d33f4c854aed484 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 14 Apr 2020 14:49:19 +0200
+Subject: [PATCH] src/dpdk_telemetry.c: fix build on musl
+
+Include unistd.h instead of sys/unistd.h to fix the following build
+failure on musl:
+
+src/dpdk_telemetry.c:43:10: fatal error: sys/unistd.h: No such file or directory
+ #include <sys/unistd.h>
+          ^~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/aafb8c72f147fefc7a988c45e4dc17de48b07a95
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/collectd/collectd/pull/3439]
+---
+ src/dpdk_telemetry.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dpdk_telemetry.c b/src/dpdk_telemetry.c
+index b46e8574..cfee5f12 100755
+--- a/src/dpdk_telemetry.c
++++ b/src/dpdk_telemetry.c
+@@ -40,7 +40,7 @@
+ #include <sys/queue.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ 
+ #define BUF_SIZE 100000
+ #define PLUGIN_NAME "dpdk_telemetry"
+-- 
+2.25.1
+
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 1b6b3384c4..f1f3c2ed9f 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -210,6 +210,13 @@ config BR2_PACKAGE_COLLECTD_DNS
 	help
 	  Collects statistics of DNS traffic using libpcap.
 
+config BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY
+	bool "dpdk_telemetry"
+	select BR2_PACKAGE_JANSSON
+	help
+	  Collects DPDK ethernet device metrics via dpdk_telemetry
+	  library.
+
 config BR2_PACKAGE_COLLECTD_DRBD
 	bool "drbd"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 24cdad7e1b..52b218e139 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -66,6 +66,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_DF),--enable-df,--disable-df) \
 	$(if $(BR2_PACKAGE_COLLECTD_DISK),--enable-disk,--disable-disk) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),--enable-dns,--disable-dns) \
+	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),--enable-dpdk_telemetry,--disable-dpdk_telemetry) \
 	$(if $(BR2_PACKAGE_COLLECTD_DRBD),--enable-drbd,--disable-drbd) \
 	$(if $(BR2_PACKAGE_COLLECTD_EMPTY_COUNTER),--enable-match_empty_counter,--disable-match_empty_counter) \
 	$(if $(BR2_PACKAGE_COLLECTD_ENTROPY),--enable-entropy,--disable-entropy) \
@@ -156,6 +157,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
+	$(if $(BR2_PACKAGE_COLLECTD_DPKD_TELEMETRY),jansson) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
@@ -186,6 +188,9 @@ COLLECTD_DEPENDENCIES = \
 ifeq ($(BR2_PACKAGE_GRPC),y)
 COLLECTD_CONF_OPTS += --with-libgrpc++=$(STAGING_DIR)/usr
 endif
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+COLLECTD_CONF_OPTS += --with-libjansson=$(STAGING_DIR)/usr
+endif
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
 endif
-- 
2.25.1
