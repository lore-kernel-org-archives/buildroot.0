From: Matt Weber <matt@thewebers.ws>
Date: Thu, 21 Jan 2016 03:31:47 +0000
Subject: [Buildroot] [PATCH v4 1/1] iputils: resolve musl compatibility
Message-ID: <1453347107-2275-1-git-send-email-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new upstream is a fork of the original that consolidates other distro's
patches.  This fork resolves a series of musl build failures noted in the
autobuilder log.

http://autobuild.buildroot.net/results/12cb73f3def95efe706bcd957bc2c091e7931d5a/

  - Updated to github fork, selected merge from Nov 3 2015
    which provided musl fixes (last release was to old, 20150815)
  - Why the fork ? (http://www.spinics.net/lists/netdev/msg279881.html)
  - Added missing dependencies for kernel capabilies lib
  - Accounted for new consolidated ping (ipv4/6)

Tested against a buildroot arm musl/glibc toolchains, as well as
autobuilder defconfig.

Signed-off-by: Matt Weber <matt@thewebers.ws>
---
v3 -> v4
  - Made libcap optional and if selected set make ops
          (Suggested by Thomas)
v2 -> v3
  - Added comment about fork status (Suggested by Thomas)

v1 -> v2
  - Removed old hash (Suggested by Thomas)
  - Added libcap depends to Config.in (Suggested by Thomas)
  - Moved comments up to commit log (Suggested by Thomas)

 .../0001-ping-ping6-Fix-hang-with-f-option.patch   | 34 ----------------------
 package/iputils/Config.in                          |  2 +-
 package/iputils/iputils.hash                       |  4 +--
 package/iputils/iputils.mk                         | 29 +++++++++++-------
 4 files changed, 22 insertions(+), 47 deletions(-)
 delete mode 100644 package/iputils/0001-ping-ping6-Fix-hang-with-f-option.patch

diff --git a/package/iputils/0001-ping-ping6-Fix-hang-with-f-option.patch b/package/iputils/0001-ping-ping6-Fix-hang-with-f-option.patch
deleted file mode 100644
index fe1ab77..0000000
--- a/package/iputils/0001-ping-ping6-Fix-hang-with-f-option.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 712fddacfb5c4a8a48d9c5debe1870bc051d836c Mon Sep 17 00:00:00 2001
-From: YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>
-Date: Tue, 6 Nov 2012 02:44:12 +0900
-Subject: [PATCH] ping,ping6: Fix hang with -f option.
-
-Bug was introduced by commit 8feb586c4... (ping,ping6: Check return
-value of write(2) for stdout.).
-
-https://bugs.archlinux.org/task/32306
-
-Patch-by: Jan Synacek <jsynacek@redhat.com>
-Reported-by: Mohammad Alsaleh <msal@tormail.org>
-Signed-off-by: YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- ping_common.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ping_common.h b/ping_common.h
-index d2a2b5c..6726e1b 100644
---- a/ping_common.h
-+++ b/ping_common.h
-@@ -140,7 +140,7 @@ static inline void write_stdout(const char *str, size_t len)
- 	do {
- 		cc = write(STDOUT_FILENO, str + o, len - o);
- 		o += cc;
--	} while (len >= o || cc < 0);
-+	} while (len > o || cc < 0);
- }
- 
- /*
--- 
-2.1.3
-
diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 5324639..40580d2 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_IPUTILS
 	  This package is set of small useful utilities for Linux networking.
 	  It includes complete versions of ping, traceroute, etc.
 
-	  http://sourceforge.net/projects/iputils/
+	  https://github.com/iputils/iputils
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 21a2044..e32e134 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,2 @@
-# From http://sourceforge.net/projects/iputils/files/
-sha1	3e85179746fd93000d6267bd55addfe97f321ba7	iputils-s20121011.tar.bz2
+# Locally computed
+sha256	0e98cb527fa175d1e08afb969c124e452b30968f10ec2c3b078f1440c8977a94	iputils-c8ff6feaf0442f8efd96ccb415770c54f9e84d47.tar.gz
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 7510d99..6392dec 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,10 +4,16 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = s20121011
-IPUTILS_SITE = http://www.skbuff.net/iputils
-IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
-IPUTILS_LICENSE = GPLv2+, BSD-3c
+# The original upstream was forked to the github repository in 2014 to
+# pull fixes from other distribution and centralize the changes after
+# the upstream seemed to have gone dormant.  The fork contains the
+# latest changes including msul support, removing a libsysfs dependency
+# and IPv6 updates.
+# http://www.spinics.net/lists/netdev/msg279881.html
+
+IPUTILS_VERSION = c8ff6feaf0442f8efd96ccb415770c54f9e84d47
+IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
+IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 IPUTILS_DEPENDENCIES = openssl
@@ -18,11 +24,15 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 IPUTILS_DEPENDENCIES += busybox
 endif
 
-# Disabling CAP_SETPCAP (file capabilities)
-IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
-	arping clockdiff ping rarpd rdisc tftpd tracepath \
-	ping6 tracepath6 traceroute6
+IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+IPUTILS_MAKE_OPTS += USE_CAP=yes
+IPUTILS_DEPENDENCIES += libcap
+else
+IPUTILS_MAKE_OPTS += USE_CAP=no
+endif
 
 define IPUTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
@@ -36,7 +46,6 @@ define IPUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
 	$(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
 	$(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
-	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
 	$(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
 	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
 endef
-- 
1.9.1
