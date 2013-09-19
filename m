From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Thu, 19 Sep 2013 10:17:52 -0500
Subject: [Buildroot] [PATCH v2] iputils: new package
Message-ID: <1379603872-25903-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v1 -> v2:
  * Updated depends in Config.in and added comment
    (Suggested by Thomas/Arnout)
  * Adjusted version to include "s" as part of version
    (Suggested by Arnout)
  * Removed dependency on file capabilities (libcap)
    and sysfs.  Commented that file capabilities is disabled
  * Cleaned up CFLAGS to have minimal complexity
    (Suggested by Arnout)

 package/Config.in          |    1 +
 package/iputils/Config.in  |    8 ++++++
 package/iputils/iputils.mk |   53 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 package/iputils/Config.in
 create mode 100644 package/iputils/iputils.mk

diff --git a/package/Config.in b/package/Config.in
index 56c316e..254145a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -793,6 +793,7 @@ source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/ipset/Config.in"
 source "package/iptables/Config.in"
+source "package/iputils/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/knock/Config.in"
diff --git a/package/iputils/Config.in b/package/iputils/Config.in
new file mode 100644
index 0000000..0c77b5f
--- /dev/null
+++ b/package/iputils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IPUTILS
+	bool "iputils"
+	select BR2_OPENSSL if BR2_INET_IPV6
+	help
+	  This package is set of small useful utilities for Linux networking.
+	  It includes complete versions of ping, traceroute, etc.
+
+	  http://sourceforge.net/projects/iputils/
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
new file mode 100644
index 0000000..5836430
--- /dev/null
+++ b/package/iputils/iputils.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# iputils
+#
+################################################################################
+
+IPUTILS_VERSION = s20121011
+IPUTILS_SITE = http://www.skbuff.net/iputils/
+IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
+IPUTILS_LICENSE = GPLv2+ BSD-3c
+# Only included a license file for BSD.
+IPUTILS_LICENSE_FILES = COPYING
+
+# Build after busybox so target ends up with this package's full
+# versions of the applications instead of busybox applets.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+IPUTILS_DEPENDENCIES += busybox
+endif
+
+# Disabling CAP_SETPCAP (file capabilities)
+IPUTILS_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+	arping clockdiff ping rarpd rdisc tftpd tracepath
+
+ifeq ($(BR2_INET_IPV6),y)
+# To support md5 for ping6
+IPUTILS_DEPENDENCIES += openssl
+
+IPUTILS_MAKE_OPT += ping6 tracepath6 traceroute6
+
+define IPUTILS_IPV6_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
+	$(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
+	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
+endef
+endif
+
+define IPUTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPT)
+endef
+
+define IPUTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/arping      $(TARGET_DIR)/sbin/arping
+	$(INSTALL) -D -m 755 $(@D)/clockdiff   $(TARGET_DIR)/bin/clockdiff
+	$(INSTALL) -D -m 755 $(@D)/ping        $(TARGET_DIR)/bin/ping
+	$(INSTALL) -D -m 755 $(@D)/rarpd       $(TARGET_DIR)/sbin/rarpd
+	$(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
+	$(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
+	$(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
+	$(IPUTILS_IPV6_INSTALL_TARGET_CMDS)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
