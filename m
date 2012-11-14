From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:57:23 +0100
Subject: [Buildroot] [git commit] conntrack-tools: do not depend on
	BR2_INET_RPC and use libtirpc when available
Message-ID: <20121114220318.B0F9C99FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=637f852f1a4904206a23442eff06d78514ba7265
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/conntrack-tools/Config.in          |    6 +++---
 package/conntrack-tools/conntrack-tools.mk |    6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index f109adf..ddede0e 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_INET_IPV6
-	depends on BR2_INET_RPC
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
 	select BR2_PACKAGE_LIBNETFILTER_QUEUE
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  The conntrack-tools are a set of tools targeted at
 	  system administrators.
@@ -15,5 +15,5 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools requires a toolchain with IPV6, LARGEFILE and RPC support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_INET_RPC
+comment "conntrack-tools requires a toolchain with IPV6 and LARGEFILE support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index ce64021..ece3090 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -13,4 +13,10 @@ CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 CONNTRACK_TOOLS_LICENSE = GPLv2
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+CONNTRACK_TOOLS_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
+CONNTRACK_TOOLS_DEPENDENCIES += libtirpc
+endif
+
 $(eval $(autotools-package))
