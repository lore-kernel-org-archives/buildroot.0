From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:14:11 +0200
Subject: [Buildroot] [git commit] strongswan: bump to version 5.3.0
Message-ID: <20150408191441.2E8CE800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6117fa4501bcf35d46c60a79b954f92673f7bd39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable connmark and forecast plugins when iptables is selected.
And always enable the led plugin, though it's not new to 5.3.0.

[Thomas: also update hash file.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/strongswan.hash |    4 ++--
 package/strongswan/strongswan.mk   |   14 +++++++++++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 6073b36..626356a 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,2 +1,2 @@
-# From http://download.strongswan.org/strongswan-5.2.2.tar.bz2.md5
-md5	7ee1a33060b2bde35be0f6d78a1d26d0	strongswan-5.2.2.tar.bz2
+# From http://download.strongswan.org/strongswan-5.3.0.tar.bz2.md5
+md5	c52d4228231c2025d9c320d0e9990327	strongswan-5.3.0.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 059955d..057870f 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.2.2
+STRONGSWAN_VERSION = 5.3.0
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
@@ -12,6 +12,7 @@ STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
+	--enable-led \
 	--enable-pkcs11=yes \
 	--enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no) \
 	--enable-socket-default=$(if $(BR2_INET_IPV6),yes,no) \
@@ -70,4 +71,15 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MYSQL),mysql)
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+STRONGSWAN_DEPENDENCIES += iptables
+STRONGSWAN_CONF_OPTS += \
+	--enable-connmark \
+	--enable-forecast
+else
+STRONGSWAN_COF_OPTS += \
+	--disable-connmark \
+	--disable-forecast
+endif
+
 $(eval $(autotools-package))
