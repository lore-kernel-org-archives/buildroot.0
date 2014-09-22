From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Sep 2014 23:04:59 +0200
Subject: [Buildroot] [git commit] avahi: add option to build the libdns_sd
	(Bonjour) compatibility library
Message-ID: <20140922210718.BA99F9D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ab5a23e730a19dece727ffe59ae97b65d0a1ccc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As requested on the list.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/Config.in |    8 ++++++++
 package/avahi/avahi.mk  |   14 ++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 483d976..b52cc78 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -35,6 +35,14 @@ config BR2_PACKAGE_AVAHI_DAEMON
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
 
+config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
+	bool "libdns_sd compatibility (Bonjour)"
+	depends on BR2_PACKAGE_AVAHI_DAEMON
+	select BR2_PACKAGE_DBUS
+	help
+	  Enable the libdns_sd (Bonjour) compatibility library support
+	  for legacy applications.
+
 endif
 
 comment "avahi needs a toolchain w/ threads"
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 08364df..55527dc 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -101,6 +101,10 @@ else
 AVAHI_CONF_OPT += --with-xml=none
 endif
 
+ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
+AVAHI_CONF_OPT += --enable-compat-libdns_sd
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 AVAHI_DEPENDENCIES += dbus
 else
@@ -181,4 +185,14 @@ endef
 
 endif
 
+# applications expects to be able to #include <dns_sd.h>
+define AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
+	ln -sf avahi-compat-libdns_sd/dns_sd.h \
+		$(STAGING_DIR)/usr/include/dns_sd.h
+endef
+
+ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
+AVAHI_POST_INSTALL_STAGING_HOOKS += AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
+endif
+
 $(eval $(autotools-package))
