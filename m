From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Mon, 16 Dec 2013 09:58:21 -0600
Subject: [Buildroot] [PATCH v2] smcroute: new package
Message-ID: <1387209501-15147-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Sean Gerhardt <sagerhar@rockwellcollins.com>
---

Changes v1 -> v2
	- Fixed double spaces in both files (Suggested by Thomas)
	- Removed source archive definition (Suggested by Thomas)
	- Fixed spelling in Config.in (Suggested by Peter)
	- Added dependency on IPV6 (Suggested by Peter)
	- Tested for uclibc compatibility
---
 package/Config.in            |    1 +
 package/smcroute/Config.in   |   15 +++++++++++++++
 package/smcroute/smcroute.mk |   15 +++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100755 package/smcroute/Config.in
 create mode 100755 package/smcroute/smcroute.mk

diff --git a/package/Config.in b/package/Config.in
index be16714..78a9e16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -891,6 +891,7 @@ source "package/rtptools/Config.in"
 source "package/samba/Config.in"
 source "package/sconeserver/Config.in"
 source "package/ser2net/Config.in"
+source "package/smcroute/Config.in"
 source "package/socat/Config.in"
 source "package/socketcand/Config.in"
 source "package/spawn-fcgi/Config.in"
diff --git a/package/smcroute/Config.in b/package/smcroute/Config.in
new file mode 100755
index 0000000..df42db3
--- /dev/null
+++ b/package/smcroute/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_SMCROUTE
+	bool "smcroute"
+	depends on BR2_INET_IPV6
+	help
+	  SMCRoute is a command line tool to manipulate the multicast
+	  routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast
+	  routing.  SMCRoute can be used as an alternative to dynamic
+	  multicast routers like mrouted or pimd in setups where static
+	  multicast routes should be maintained and/or no proper IGMP or
+	  MLD signaling exists.
+
+	  https://github.com/troglobit/smcroute
+
+comment "smcroute needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
new file mode 100755
index 0000000..896db8c
--- /dev/null
+++ b/package/smcroute/smcroute.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# smcroute
+#
+################################################################################
+SMCROUTE_VERSION = 1.99.2
+SMCROUTE_SITE = $(call github,troglobit,smcroute,$(SMCROUTE_VERSION))
+SMCROUTE_LICENSE = GPLv2+
+SMCROUTE_LICENSE_FILES = COPYING
+
+SMCROUTE_CONF_OPT = ac_cv_func_setpgrp_void=yes
+#BUG:The package Makefile uses CC?= even though the package is autotools based
+SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+
+$(eval $(autotools-package))
-- 
1.7.1
