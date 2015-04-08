From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 07:20:44 -0300
Subject: [Buildroot] [PATCH 2/2] strongswan: bump to version 5.3.0
In-Reply-To: <1428488444-8124-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428488444-8124-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428488444-8124-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable connmark and forecast plugins when iptables is selected.
And always enable the led plugin, though it's not new to 5.3.0.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/strongswan.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

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
-- 
2.0.5
