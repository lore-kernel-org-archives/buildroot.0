From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 00:39:40 +0200
Subject: [Buildroot] [git commit] package/collectd: add amqp support
Message-ID: <20190609223950.C0CFD8F48E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=accd0f15592a8adf57ceae054beffd884b0519bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/collectd/Config.in   | 7 +++++++
 package/collectd/collectd.mk | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 0cf04b5180..3110363429 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -524,6 +524,13 @@ menu "write plugins"
 
 comment "Select at least one for collectd to be useful"
 
+config BR2_PACKAGE_COLLECTD_AMQP
+	bool "amqp"
+	select BR2_PACKAGE_RABBITMQ_C
+	help
+	  Send/receive values via the Advanced Message Queuing Protocol
+	  (AMQP).
+
 config BR2_PACKAGE_COLLECTD_CSV
 	bool "csv"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 027df8f111..531b824b26 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -14,7 +14,7 @@ COLLECTD_LICENSE_FILES = COPYING libltdl/COPYING.LIB
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-	amqp apple_sensors aquaero ascent barometer dbi dpdkstat email \
+	apple_sensors aquaero ascent barometer dbi dpdkstat email \
 	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
@@ -45,6 +45,7 @@ COLLECTD_CONF_OPTS += \
 	--disable-werror \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
+	$(if $(BR2_PACKAGE_COLLECTD_AMQP),--enable-amqp,--disable-amqp) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),--enable-apache,--disable-apache) \
 	$(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
 	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
@@ -141,6 +142,7 @@ COLLECTD_CONF_OPTS += \
 
 COLLECTD_DEPENDENCIES = \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_COLLECTD_AMQP),rabbitmq-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_CEPH),yajl) \
