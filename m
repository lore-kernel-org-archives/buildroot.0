From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 21:32:29 +0100
Subject: [Buildroot] [git commit] smcroute: new package
Message-ID: <20131216204200.7604E9C0B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfa3c83181bdc0357bf5fb860f811d1618c10e16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Sean Gerhardt <sagerhar@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/smcroute/Config.in   |   15 +++++++++++++++
 package/smcroute/smcroute.mk |   16 ++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

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
index 0000000..63a44c9
--- /dev/null
+++ b/package/smcroute/smcroute.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# smcroute
+#
+################################################################################
+
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
