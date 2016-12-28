From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 23:18:06 +0100
Subject: [Buildroot] [PATCH 2/2] collectd: fix riemann write plugin
	dependencies
In-Reply-To: <20161228221806.32321-1-peter@korsgaard.com>
References: <20161228221806.32321-1-peter@korsgaard.com>
Message-ID: <20161228221806.32321-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/fe5/fe5b5ed6355a794e84894c4aaf62eda6529ed184/
http://autobuild.buildroot.org/results/6c3/6c393cffb6ad4e676e311e9fc23ddbb2bcc2cf36/

The plugin uses the riemann-c-client library since commit d55584214206
(write_riemann: Use riemann-c-client), so adjust the dependencies to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 2 +-
 package/collectd/collectd.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ab49b71..683141b 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -550,7 +550,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	# protobuf-c -> host-protobuf
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
 	  Sends data to Riemann, a stream processing and monitoring system.
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 28c1b31..7ab7dd4 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -146,7 +146,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
 	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),postgresql) \
-	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool protobuf-c) \
+	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool riemann-c-client) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
 	$(if $(BR2_PACKAGE_COLLECTD_SMART),libatasmart) \
-- 
2.10.2
