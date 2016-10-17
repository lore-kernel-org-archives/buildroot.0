From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 17 Oct 2016 13:14:30 -0700
Subject: [Buildroot] [PATCH v3 1/2] inadyn: bump to version 2.0
Message-ID: <20161017201431.23273-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v2 -> v3:
  - updated default conf file instead of removing it (suggested by Thomas)
Changes v1 -> v2:
  - added explaination for removal of default conf (suggested by Thomas)
  - moved changes to DEVELOPERS file into separate patch (suggested by Thomas)
  - reordered "select" statements in Config.in (suggested by Thomas)
  - moved dependencies in inadyn.mk (suggested by Thomas)
---
 package/inadyn/Config.in   |  2 ++
 package/inadyn/inadyn.conf | 14 +++++++-------
 package/inadyn/inadyn.hash |  4 ++--
 package/inadyn/inadyn.mk   | 13 ++++++++++---
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 65f6851..d03db83 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_INADYN
 	bool "inadyn"
 	depends on BR2_USE_MMU # Uses fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_LIBCONFUSE
+	select BR2_PACKAGE_LIBITE
 	help
 	  INADYN is a free DynDNS client. It gives the possibility
 	  to have your own fixed hostname registered on the internet,
diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
index ab8aa36..1b29027 100644
--- a/package/inadyn/inadyn.conf
+++ b/package/inadyn/inadyn.conf
@@ -1,11 +1,11 @@
 # Basic configuration file for inadyn
 #
 # /etc/inadyn.conf
-pidfile /var/run/inadyn.pid
-update_period_sec 600 # Check for a new IP every 600 seconds
-username test		# replace 'test' with your username
-password test		# replace 'test' with your password
-dyndns_system default at dyndns.org   # replace w/ your provider
+iface    = eth0
+period   = 300
 
-alias test.homeip.net
-# replace 'test.homeip.net' with yourdomainname for actual (non-test) use
+provider default at dyndns.org {
+	username    = test
+	password    = test
+	hostname    = test
+}
diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 940bd16..a4e60c9 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,2 +1,2 @@
-# From https://github.com/troglobit/inadyn/releases/download/1.99.12/inadyn-1.99.12.tar.xz.md5
-md5	a620c9eab9cd31c8923e7264b08376f3	inadyn-1.99.12.tar.xz
+# Locally computed
+sha256	763c53eb3856decfe8b921cab8a54b428b079a62264fbcf6c89690713d63529a  inadyn-v2.0.tar.gz
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 8ceca4c..f23955b 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-INADYN_VERSION = 1.99.12
-INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/$(INADYN_VERSION)
-INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
+INADYN_VERSION = v2.0
+INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
 INADYN_LICENSE = GPLv2+
 INADYN_LICENSE_FILES = COPYING
+INADYN_AUTORECONF = YES
+INADYN_DEPENDENCIES = host-pkgconf libconfuse libite
+
+# Needed for autoreconf to work properly, see ./autogen.sh
+define INADYN_FIXUP_M4_DIR
+	mkdir $(@D)/m4
+endef
+INADYN_POST_EXTRACT_HOOKS += INADYN_FIXUP_M4_DIR
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 INADYN_CONF_OPTS += --enable-openssl
-- 
2.9.3
