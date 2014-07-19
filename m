From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Jul 2014 11:35:34 -0300
Subject: [Buildroot] [PATCH 2/2] collectd: add memcachec plugin support
In-Reply-To: <1405780534-691-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405780534-691-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1405780534-691-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we've got a libmemcached package we can add support for the
memcachec plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in   | 10 ++++++++++
 package/collectd/collectd.mk |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index fbb4282..75c90d1 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -226,6 +226,16 @@ config BR2_PACKAGE_COLLECTD_MD
 	help
 	  Collects software-RAID device information.
 
+config BR2_PACKAGE_COLLECTD_MEMCACHEC
+	bool "memcachec"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBMEMCACHED
+	help
+	  Query and parse data from a memcache daemon.
+
+comment "memcachec needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_COLLECTD_MEMCACHED
 	bool "memcached"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9040406..e5ac626 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -57,6 +57,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_LOAD),--enable-load,--disable-load) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
 	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
+	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),--enable-memcachec,--disable-memcachec) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMORY),--enable-memory,--disable-memory) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),--enable-mysql,--disable-mysql) \
@@ -105,6 +106,7 @@ COLLECTD_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
+	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
-- 
1.8.5.5
