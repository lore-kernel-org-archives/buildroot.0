From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 17:12:00 +0200
Subject: [Buildroot] [git commit] collectd: add memcachec plugin support
Message-ID: <20140719151205.2F7FC9CC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad4a90617c5365de94ea021126c176f74eb3d30e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we've got a libmemcached package we can add support for the
memcachec plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/Config.in   |   10 ++++++++++
 package/collectd/collectd.mk |    2 ++
 2 files changed, 12 insertions(+), 0 deletions(-)

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
