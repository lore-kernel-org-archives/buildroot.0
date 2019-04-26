From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 26 Apr 2019 18:56:13 +0200
Subject: [Buildroot] [PATCH v3,4/4] package/dhcp: use system bind
In-Reply-To: <20190426165613.31812-1-fontaine.fabrice@gmail.com>
References: <20190426165613.31812-1-fontaine.fabrice@gmail.com>
Message-ID: <20190426165613.31812-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select bind instead of using the embedded bind libraries. This will help
managing correctly all the bind dependencies such as zlib

Fixes:
 - http://autobuild.buildroot.org/results/a61f24e9f117c81893c58befb20d21179e61b85b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Move bind9-config under BR2_STATIC_LIBS condition
 - Drop DHCP_MAKE and DHCP_MAKE_ENV as these variables were set for the
   embedded bind

Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Enable/disable libtool depending on BR2_STATIC_LIBS value

 ...ibility-headers-updated-util-bind-sh.patch | 87 +++++++++++++++++++
 package/dhcp/Config.in                        |  1 +
 package/dhcp/dhcp.mk                          | 31 ++-----
 3 files changed, 96 insertions(+), 23 deletions(-)
 create mode 100644 package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch

diff --git a/package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch b/package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch
new file mode 100644
index 0000000000..b8b187f17b
--- /dev/null
+++ b/package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch
@@ -0,0 +1,87 @@
+From 8194daabfd590f17825f0c61e9534bee5c99cc86 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Fri, 14 Sep 2018 13:41:41 -0400
+Subject: [PATCH] [master] Added includes of new BIND9 compatibility headers,
+ updated util/bind.sh
+
+    Merges in rt48072.
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and updated to remvove bind.sh update) from:
+https://gitlab.isc.org/isc-projects/dhcp/commit/8194daabfd590f17825f0c61e9534bee5c99cc86]
+---
+ includes/omapip/isclib.h |  3 +++
+ includes/omapip/result.h |  1 +
+ server/dhcpv6.c          | 13 +++++++++----
+ 3 files changed, 39 insertions(+), 12 deletions(-)
+
+diff --git a/includes/omapip/isclib.h b/includes/omapip/isclib.h
+index 75a87ff6..538b927f 100644
+--- a/includes/omapip/isclib.h
++++ b/includes/omapip/isclib.h
+@@ -48,6 +48,9 @@
+ #include <string.h>
+ #include <netdb.h>
+ 
++#include <isc/boolean.h>
++#include <isc/int.h>
++
+ #include <isc/buffer.h>
+ #include <isc/lex.h>
+ #include <isc/lib.h>
+diff --git a/includes/omapip/result.h b/includes/omapip/result.h
+index 91243e1b..860298f6 100644
+--- a/includes/omapip/result.h
++++ b/includes/omapip/result.h
+@@ -26,6 +26,7 @@
+ #ifndef DHCP_RESULT_H
+ #define DHCP_RESULT_H 1
+ 
++#include <isc/boolean.h>
+ #include <isc/lang.h>
+ #include <isc/resultclass.h>
+ #include <isc/types.h>
+diff --git a/server/dhcpv6.c b/server/dhcpv6.c
+index a7110f98..cde4f617 100644
+--- a/server/dhcpv6.c
++++ b/server/dhcpv6.c
+@@ -1034,7 +1034,8 @@ void check_pool6_threshold(struct reply_state *reply,
+ 				  shared_name,
+ 				  inet_ntop(AF_INET6, &lease->addr,
+ 					    tmp_addr, sizeof(tmp_addr)),
+-				  used, count);
++				  (long long unsigned)(used),
++				  (long long unsigned)(count));
+ 		}
+ 		return;
+ 	}
+@@ -1066,7 +1067,8 @@ void check_pool6_threshold(struct reply_state *reply,
+ 		  "address: %s; high threshold %d%% %llu/%llu.",
+ 		  shared_name,
+ 		  inet_ntop(AF_INET6, &lease->addr, tmp_addr, sizeof(tmp_addr)),
+-		  poolhigh, used, count);
++		  poolhigh, (long long unsigned)(used),
++		  (long long unsigned)(count));
+ 
+ 	/* handle the low threshold now, if we don't
+ 	 * have one we default to 0. */
+@@ -1436,12 +1438,15 @@ pick_v6_address(struct reply_state *reply)
+ 		log_debug("Unable to pick client address: "
+ 			  "no addresses available  - shared network %s: "
+ 			  " 2^64-1 < total, %llu active,  %llu abandoned",
+-			  shared_name, active - abandoned, abandoned);
++			  shared_name, (long long unsigned)(active - abandoned),
++			  (long long unsigned)(abandoned));
+ 	} else {
+ 		log_debug("Unable to pick client address: "
+ 			  "no addresses available  - shared network %s: "
+ 			  "%llu total, %llu active,  %llu abandoned",
+-			  shared_name, total, active - abandoned, abandoned);
++			  shared_name, (long long unsigned)(total),
++			  (long long unsigned)(active - abandoned),
++		          (long long unsigned)(abandoned));
+ 	}
+ 
+ 	return ISC_R_NORESOURCES;
+-- 
+2.18.1
+
diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 5340830902..a4930e53ba 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DHCP
 	# fork()
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_BIND
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 9e7444eea6..1cef9724bd 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,13 +9,14 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
+DHCP_DEPENDENCIES = bind
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
 DHCP_CONF_OPTS = \
-	--with-bind-extra-config="$(DHCP_BIND_CONF_OPTS)" \
+	--with-libbind=$(STAGING_DIR)/usr \
 	--with-randomdev=/dev/random \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
@@ -28,31 +29,15 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
-# bind does not support parallel builds.
-DHCP_MAKE = $(MAKE1)
-
-# bind configure is called via dhcp make instead of dhcp configure. The make env
-# needs extra values for bind configure.
-DHCP_MAKE_ENV = \
-	$(TARGET_CONFIGURE_OPTS) \
-	BUILD_CC="$(HOSTCC)" \
-	BUILD_CFLAGS="$(HOST_CFLAGS)" \
-	BUILD_CPPFLAGS="$(HOST_CPPFLAGS)" \
-	BUILD_LDFLAGS="$(HOST_LDFLAGS)"
-
-ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
-DHCP_CONF_OPTS += --enable-delayed-ack
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-DHCP_DEPENDENCIES += zlib
-DHCP_BIND_CONF_OPTS += --with-zlib
+ifeq ($(BR2_STATIC_LIBS),y)
+DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
+DHCP_CONF_OPTS += --disable-libtool
 else
-DHCP_BIND_CONF_OPTS += --without-zlib
+DHCP_CONF_OPTS += --enable-libtool
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DHCP_BIND_CONF_OPTS += --without-dlopen
+ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
+DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
-- 
2.20.1
