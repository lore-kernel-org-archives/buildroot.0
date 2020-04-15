From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 Apr 2020 08:30:07 +0200
Subject: [Buildroot] [PATCH v3,
 5/6] package/collectd: add capabilities option
In-Reply-To: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
Message-ID: <20200415063008.2237470-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

capabilities plugin is available since version 5.11.0 and
https://github.com/collectd/collectd/commit/b934f1572cdb54cf485b600546a72dbf9929ba2c

It is currently enabled by default depending on jansson and
libmicrohttpd availability

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Add dmidecode runtime dependency

 package/collectd/Config.in   | 10 ++++++++++
 package/collectd/collectd.mk |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 7186d67c36..3fc07a9014 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -128,6 +128,16 @@ config BR2_PACKAGE_COLLECTD_BIND
 	help
 	  Collects BIND DNS statistics.
 
+config BR2_PACKAGE_COLLECTD_CAPABILITIES
+	bool "capabilities"
+	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64 # dmidecode
+	select BR2_PACKAGE_DMIDECODE # runtime
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  Collects selected static platform data using dmidecode and
+	  expose it through micro embedded webserver.
+
 config BR2_PACKAGE_COLLECTD_CEPH
 	bool "ceph"
 	select BR2_PACKAGE_YAJL
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 964f4dc694..f04ccdb2ff 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -51,6 +51,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
 	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),--enable-bind,--disable-bind) \
+	$(if $(BR2_PACKAGE_COLLECTD_CAPABILITIES),--enable-capabilities,--disable-capabilities) \
 	$(if $(BR2_PACKAGE_COLLECTD_CEPH),--enable-ceph,--disable-ceph) \
 	$(if $(BR2_PACKAGE_COLLECTD_CHRONY),--enable-chrony,--disable-chrony) \
 	$(if $(BR2_PACKAGE_COLLECTD_CGROUPS),--enable-cgroups,--disable-cgroups) \
@@ -153,6 +154,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_AMQP),rabbitmq-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),libcurl libxml2) \
+	$(if $(BR2_PACKAGE_COLLECTD_CAPABILITIES),jansson libmicrohttpd) \
 	$(if $(BR2_PACKAGE_COLLECTD_CEPH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
-- 
2.25.1
