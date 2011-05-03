From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 3 May 2011 22:43:55 +0200
Subject: [Buildroot] [git commit] bind: security bump to version 9.6-ESV-R4
Message-ID: <20110503204511.9769A82BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6780d0ba04ecf4cf4bf2ec1dc9f13c78868cf95c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump bind to version 9.6-ESV-R4 since the 9.5 series is no longer
supported.
While at it switch to the ESV (Extended Support Version) branch instead
of going for the latest.

Also adjust the package to build against OpenSSL when available for
proper DNSSEC support and libxml2 too.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |   32 +++++++++++++++++++-------------
 1 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index ff0ec04..e3341bd 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,26 +4,32 @@
 #
 #############################################################
 
-BIND_VERSION = 9.5.2-P4
+BIND_VERSION = 9.6-ESV-R4
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
-BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen
-BIND_TARGET_SBINS += dnssec-keygen dnssec-signzone
+BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen dnssec-dsfromkey
+BIND_TARGET_SBINS += dnssec-keyfromlabel dnssec-keygen dnssec-signzone
 BIND_TARGET_BINS = dig host nslookup nsupdate
-BIND_TARGET_LIBS = libbind9.* libdns.* libisccc.* libisccfg.* libisc.* liblwres.*
-BIND_MAKE = $(MAKE1)
+BIND_TARGET_LIBS = libbind9.* libdns.* libisc.* libisccc.* libisccfg.* liblwres.*
 BIND_CONF_ENV =	BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
-BIND_CONF_OPT =	\
-		--sysconfdir=/etc \
+BIND_CONF_OPT =	--sysconfdir=/etc \
 		--localstatedir=/var \
 		--with-randomdev=/dev/urandom \
-		--with-openssl=no \
-		--with-libxml2=no \
-		--with-pic \
-		--with-libtool \
-		--disable-epoll \
-		--disable-threads
+		--enable-epoll --with-libtool
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+	BIND_CONF_OPT += --with-libxml2=$(STAGING_DIR)/usr
+	BIND_DEPENDENCIES += libxml2
+else
+	BIND_CONF_OPT += --with-libxml2=no
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	BIND_DEPENDENCIES += openssl
+else
+	BIND_CONF_OPT += --with-openssl=no
+endif
 
 define BIND_TARGET_INSTALL_FIXES
 	rm -f $(TARGET_DIR)/usr/bin/isc-config.sh
-- 
1.7.3.4
