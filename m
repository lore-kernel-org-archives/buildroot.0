From: Nathaniel Roach <nroach44@gmail.com>
Date: Mon, 28 Jul 2014 19:57:29 +0800
Subject: [Buildroot] [PATCH 2/2] bandwidthd: new package
In-Reply-To: <1406548649-4649-1-git-send-email-nroach44@gmail.com>
References: <1406548649-4649-1-git-send-email-nroach44@gmail.com>
Message-ID: <1406548649-4649-2-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/Config.in                |  1 +
 package/bandwidthd/Config.in     | 39 +++++++++++++++++++++++++++++++++++++++
 package/bandwidthd/bandwidthd.mk | 25 +++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 package/bandwidthd/Config.in
 create mode 100644 package/bandwidthd/bandwidthd.mk

diff --git a/package/Config.in b/package/Config.in
index 559b895..04d666e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -937,6 +937,7 @@ menu "Networking applications"
 	source "package/autossh/Config.in"
 	source "package/avahi/Config.in"
 	source "package/axel/Config.in"
+	source "package/bandwidthd/Config.in"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
 	source "package/bluez_utils/Config.in"
diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
new file mode 100644
index 0000000..7305060
--- /dev/null
+++ b/package/bandwidthd/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_BANDWIDTHD
+	bool "bandwidthd"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_GD
+	help
+	  BandwidthD - Bandwidth monitoring
+
+	  Provides a method to measure the bandwidth that travels through the
+	  machine, grouped by subnet and IP. This information can be stored
+	  locally in /var/lib/bandwidthd and can be configured to generate
+	  static HTML pages which can be hosted by a web server.
+
+	  It is highly recommended that the target has some way of retaining the
+	  time between reboots. (e.g. NTP on boot or an RTC)
+	  
+	  It is suggested to install sqlite for logfile storage but works fine
+	  without, and can be completely ignored if the postgresql portion
+	  is used. 
+
+	  As upstream is no longer actively maintained, a fork is available
+	  on github that works on making BandwidthD's build process more
+	  compatible with buildroot's.
+
+	  Upstream: http://bandwidthd.sourceforge.net/
+	  Github fork: http://github.com/nroach44/bandwidthd
+
+if BR2_PACKAGE_BANDWIDTHD
+config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
+	bool "enable postgresql log target support"
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Enable logging the bandwidthd data to a remote (or local) postgresql
+	  server. This can then be accessed through a php site. See 
+	  README in the source code (github.com/nroach44/bandwidthd) for more
+	  information.
+
+endif
diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
new file mode 100644
index 0000000..e294af3
--- /dev/null
+++ b/package/bandwidthd/bandwidthd.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# bandwidthd
+################################################################################
+
+BANDWIDTHD_VERSION = v2.0.1-auto-r03
+BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
+BANDWIDTHD_CONF_OPT = 
+BANDWIDTHD_CONF_ENV =
+BANDWIDTHD_LICENSE = GPL+
+
+BANDWIDTHD_DEPENDENCIES += gd
+BANDWIDTHD_DEPENDENCIES += libpng
+BANDWIDTHD_DEPENDENCIES += libpcap
+
+BANDWIDTHD_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
+BANDWIDTHD_DEPENDENCIES += postgresql
+BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
+else
+BANDWIDTHD_CONF_OPT += --with-postgresql-logging=false
+endif
+
+$(eval $(autotools-package))
-- 
2.0.1
