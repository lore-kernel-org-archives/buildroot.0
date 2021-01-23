From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 23 Jan 2021 11:31:55 +0100
Subject: [Buildroot] [PATCH 6/6] package/mrouted: menuconfig support for
 enabling rsrr support
In-Reply-To: <20210123103155.2599311-1-troglobit@gmail.com>
References: <20210123103155.2599311-1-troglobit@gmail.com>
Message-ID: <20210123103155.2599311-7-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/Config.in  | 12 ++++++++++++
 package/mrouted/mrouted.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index 95b4fb3825..30d32a4310 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -11,3 +11,15 @@ config BR2_PACKAGE_MROUTED
 	  Note: at least two interfaces with MULTICAST flag is requried.
 
 	  http://github.com/troglobit/mrouted
+
+if BR2_PACKAGE_MROUTED
+
+config BR2_PACKAGE_MROUTED_RSRR
+	bool "enable RSRR for RSVP"
+	help
+	  Routing Support for Resource Reservation, currently used by RSVP.
+	  This is an EXPERIMENTAL feature.
+
+	  For details, see http://tools.ietf.org/html/draft-ietf-rsvp-routing-02
+
+endif
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 558efa946e..74e4a0e97e 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -11,7 +11,7 @@ MROUTED_DEPENDENCIES = host-bison
 MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
 MROUTED_CONF_OPTS = --prefix=/usr --sysconfdir=/etc --localstatedir=/var
-MROUTED_CONF_OPTS += --enable-rsrr
+MROUTED_CONF_OPTS += $(if $(BR2_PACKAGE_MROUTED_RSRR),--enable-rsrr,--disable-rsrr)
 MROUTED_CPE_ID_VENDOR = troglobit
 
 define MROUTED_INSTALL_INIT_SYSV
-- 
2.25.1
