From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:49:56 +0100
Subject: [Buildroot] [git commit] package/mrouted: menuconfig support for
 enabling rsrr support
Message-ID: <20210123203027.B9DC580298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f744e6dea1a03f8e2f74b966ec2fa918c272272c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr:
  - split long lines in help text
  - use traditional ifeq-else-endif block
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mrouted/Config.in  | 13 +++++++++++++
 package/mrouted/mrouted.mk |  7 ++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index 95b4fb3825..f8dd173c4a 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -11,3 +11,16 @@ config BR2_PACKAGE_MROUTED
 	  Note: at least two interfaces with MULTICAST flag is requried.
 
 	  http://github.com/troglobit/mrouted
+
+if BR2_PACKAGE_MROUTED
+
+config BR2_PACKAGE_MROUTED_RSRR
+	bool "enable RSRR for RSVP"
+	help
+	  Routing Support for Resource Reservation, currently used by
+	  RSVP. This is an EXPERIMENTAL feature.
+
+	  For details, see:
+	    http://tools.ietf.org/html/draft-ietf-rsvp-routing-02
+
+endif
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 46a0958d8d..95da0c622c 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -10,9 +10,14 @@ MROUTED_SITE = \
 MROUTED_DEPENDENCIES = host-bison
 MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
-MROUTED_CONFIGURE_OPTS = --enable-rsrr
 MROUTED_CPE_ID_VENDOR = troglobit
 
+ifeq ($(BR2_PACKAGE_MROUTED_RSRR),y)
+MROUTED_CONF_OPTS += --enable-rsrr
+else
+MROUTED_CONF_OPTS += --disable-rsrr
+endif
+
 define MROUTED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/mrouted/S41mrouted \
 		$(TARGET_DIR)/etc/init.d/S41mrouted
