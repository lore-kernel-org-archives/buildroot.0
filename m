From: Artem Panfilov <panfilov.artyom@gmail.com>
Date: Wed, 13 Mar 2019 01:21:57 +0300
Subject: [Buildroot] [PATCH 1/1] package/avahi: add upstream security fix
Message-ID: <20190312222157.19390-1-panfilov.artyom@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-6519: avahi-daemon in Avahi through 0.6.32 and 0.7
inadvertently responds to IPv6 unicast queries with source addresses
that are not on-link, which allows remote attackers to cause a denial
of service (traffic amplification) and may cause information leakage
by obtaining potentially sensitive information from the responding
device via port-5353 UDP packets.

Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
---
 ...eries-from-address-not-on-local-link.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/avahi/0001-drop-legacy-unicast-queries-from-address-not-on-local-link.patch

diff --git a/package/avahi/0001-drop-legacy-unicast-queries-from-address-not-on-local-link.patch b/package/avahi/0001-drop-legacy-unicast-queries-from-address-not-on-local-link.patch
new file mode 100644
index 0000000000..e5b13e0bee
--- /dev/null
+++ b/package/avahi/0001-drop-legacy-unicast-queries-from-address-not-on-local-link.patch
@@ -0,0 +1,42 @@
+From e111def44a7df4624a4aa3f85fe98054bffb6b4f Mon Sep 17 00:00:00 2001
+From: Trent Lloyd <trent@lloyd.id.au>
+Date: Sat, 22 Dec 2018 09:06:07 +0800
+Subject: [PATCH] Drop legacy unicast queries from address not on local link
+
+When handling legacy unicast queries, ensure that the source IP is
+inside a subnet on the local link, otherwise drop the packet.
+
+Fixes #145
+Fixes #203
+CVE-2017-6519
+CVE-2018-100084
+---
+ avahi-core/server.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/avahi-core/server.c b/avahi-core/server.c
+index a2cb19a8..a2580e38 100644
+--- a/avahi-core/server.c
++++ b/avahi-core/server.c
+@@ -930,6 +930,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
+ 
+     if (avahi_dns_packet_is_query(p)) {
+         int legacy_unicast = 0;
++        char t[AVAHI_ADDRESS_STR_MAX];
+ 
+         /* For queries EDNS0 might allow ARCOUNT != 0. We ignore the
+          * AR section completely here, so far. Until the day we add
+@@ -947,6 +948,13 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
+             legacy_unicast = 1;
+         }
+ 
++        if (!is_mdns_mcast_address(dst_address) &&
++            !avahi_interface_address_on_link(i, src_address)) {
++
++            avahi_log_debug("Received non-local unicast query from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
++            return;
++        }
++
+         if (legacy_unicast)
+             reflect_legacy_unicast_query_packet(s, p, i, src_address, port);
+ 
-- 
2.19.1
