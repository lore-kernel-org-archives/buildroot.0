From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:15:57 +0200
Subject: [Buildroot] [git commit] package/collectd: add capabilities option
Message-ID: <20200817100942.8155682775@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79f5fed545c4be730ff713ee98fae21d984782e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

capabilities plugin is available since version 5.11.0 and
https://github.com/collectd/collectd/commit/b934f1572cdb54cf485b600546a72dbf9929ba2c

It is currently enabled by default depending on jansson and
libmicrohttpd availability

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 10 ++++++++++
 package/collectd/collectd.mk |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index e3e3c5401f..ca45130c4d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -131,6 +131,16 @@ config BR2_PACKAGE_COLLECTD_BIND
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
index ad79e1cb0b..b36975daf0 100644
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
