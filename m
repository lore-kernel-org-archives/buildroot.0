From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  3 Oct 2019 17:29:22 +0200
Subject: [Buildroot] [PATCH v1] package/collectd: needs host-bison
Message-ID: <20191003152922.21881-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 5.9.1 the file src/liboconfig/parser.c is missing from the
tar download file, triggering the need for host-bison.

Fixes [1]:

  configure: error: bison is missing and you do not have ./src/liboconfig/parser.c. Please install bison

[1] http://autobuild.buildroot.net/results/4e6f3e5fd0e64f166ae4f7db4832b37ae1fa99e0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/collectd/collectd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index c409a391c3..4c65ae2832 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -143,7 +143,10 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITETSDB),--enable-write_tsdb,--disable-write_tsdb) \
 	$(if $(BR2_PACKAGE_COLLECTD_ZOOKEEPER),--enable-zookeeper,--disable-zookeeper)

+# since 5.9.1 the file src/liboconfig/parser.c is missing from the tar
+# download file, triggering the need for host-bison
 COLLECTD_DEPENDENCIES = \
+	host-bison \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_AMQP),rabbitmq-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
--
2.23.0
