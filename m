From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 22:26:03 +0100
Subject: [Buildroot] [git commit] package/avahi: bump to version 0.8
Message-ID: <20200309140904.A86C77F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d779dac23fb516d340e805cc6a3b329ea444ae3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump also includes:
 * Drop upstream security patch which is included in the new version
 * Unconditionally disable support for Qt5 [1] (same as Qt3 and Qt4)
 * Drop dependency on host-inttool, as avahi switched to host-gettext [2]
 * Conditionally enable support for libevent [3]

[1] https://github.com/lathiat/avahi/commit/5dbb32767ae3f5a371cfbd04b4e3a9a634b8efc4
[2] https://github.com/lathiat/avahi/commit/3d5a0c68057e2ed76187a0bb565baaa10d566003
[3] https://github.com/lathiat/avahi/commit/998e20cd76927ce978fb5676820a38308e21f45d

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-unicast-queries-from-address-not-on-loca.patch | 48 ----------------------
 package/avahi/avahi.hash                           |  2 +-
 package/avahi/avahi.mk                             | 13 ++++--
 3 files changed, 10 insertions(+), 53 deletions(-)

diff --git a/package/avahi/0001-Drop-legacy-unicast-queries-from-address-not-on-loca.patch b/package/avahi/0001-Drop-legacy-unicast-queries-from-address-not-on-loca.patch
deleted file mode 100644
index 0e8408c830..0000000000
--- a/package/avahi/0001-Drop-legacy-unicast-queries-from-address-not-on-loca.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From e111def44a7df4624a4aa3f85fe98054bffb6b4f Mon Sep 17 00:00:00 2001
-From: Trent Lloyd <trent@lloyd.id.au>
-Date: Sat, 22 Dec 2018 09:06:07 +0800
-Subject: [PATCH] Drop legacy unicast queries from address not on local link
-
-When handling legacy unicast queries, ensure that the source IP is
-inside a subnet on the local link, otherwise drop the packet.
-
-Fixes #145
-Fixes #203
-CVE-2017-6519
-CVE-2018-100084
-
-Backported from: e111def44a7df4624a4aa3f85fe98054bffb6b4f
-Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
----
- avahi-core/server.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/avahi-core/server.c b/avahi-core/server.c
-index a2cb19a8..a2580e38 100644
---- a/avahi-core/server.c
-+++ b/avahi-core/server.c
-@@ -930,6 +930,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
- 
-     if (avahi_dns_packet_is_query(p)) {
-         int legacy_unicast = 0;
-+        char t[AVAHI_ADDRESS_STR_MAX];
- 
-         /* For queries EDNS0 might allow ARCOUNT != 0. We ignore the
-          * AR section completely here, so far. Until the day we add
-@@ -947,6 +948,13 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
-             legacy_unicast = 1;
-         }
- 
-+        if (!is_mdns_mcast_address(dst_address) &&
-+            !avahi_interface_address_on_link(i, src_address)) {
-+
-+            avahi_log_debug("Received non-local unicast query from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
-+            return;
-+        }
-+
-         if (legacy_unicast)
-             reflect_legacy_unicast_query_packet(s, p, i, src_address, port);
- 
--- 
-2.19.1
-
diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
index b4d36ffe50..cfc7ba020d 100644
--- a/package/avahi/avahi.hash
+++ b/package/avahi/avahi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804  avahi-0.7.tar.gz
+sha256 060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda  avahi-0.8.tar.gz
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 23127edcb9..39289bd636 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVAHI_VERSION = 0.7
+AVAHI_VERSION = 0.8
 AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
@@ -25,6 +25,7 @@ AVAHI_CONF_ENV = DATADIRNAME=share
 AVAHI_CONF_OPTS = \
 	--disable-qt3 \
 	--disable-qt4 \
+	--disable-qt5 \
 	--disable-gtk \
 	--disable-gtk3 \
 	--disable-gdbm \
@@ -40,9 +41,7 @@ AVAHI_CONF_OPTS = \
 	--with-autoipd-user=avahi \
 	--with-autoipd-group=avahi
 
-AVAHI_DEPENDENCIES = \
-	host-intltool host-pkgconf \
-	$(TARGET_NLS_DEPENDENCIES)
+AVAHI_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 AVAHI_CFLAGS = $(TARGET_CFLAGS)
 
@@ -81,6 +80,12 @@ else
 AVAHI_CONF_OPTS += --disable-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+AVAHI_DEPENDENCIES += libevent
+else
+AVAHI_CONF_OPTS += --disable-libevent
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 AVAHI_DEPENDENCIES += libglib2
 else
