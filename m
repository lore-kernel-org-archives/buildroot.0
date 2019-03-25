From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Mon, 25 Mar 2019 11:28:19 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/busybox: version bump to 1.30.1
Message-ID: <20190325162819.13056-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

Update from version 1.29.3 to 1.30.1. The new version
includes the removed patches.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 ...l.sh-don-t-clobber-dangling-symlinks.patch |  38 -----
 ...tions-are-indeed-4-byte-closes-11506.patch | 137 ------------------
 ...HCP_SUBNET-ensure-it-is-4-bytes-long.patch |  58 --------
 package/busybox/busybox.hash                  |   4 +-
 package/busybox/busybox.mk                    |   2 +-
 5 files changed, 3 insertions(+), 236 deletions(-)
 delete mode 100644 package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
 delete mode 100644 package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch
 delete mode 100644 package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch

diff --git a/package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch b/package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
deleted file mode 100644
index b6fb5b9236..0000000000
--- a/package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c9f1a877f1b9e2602913600d769edb17ee41d15d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 17 Jul 2018 13:18:09 +0300
-Subject: [PATCH] install.sh: don't clobber dangling symlinks
-
-Symlinks in a subdirectory that is to become target rootfs are sometimes
-dangling because they link to canonical file names that are not present
-on the host, but are present relative to the target rootfs root. Don't
-copy over dangling symlinks when noclobber is enabled
-
-The -e test treats dangling symlinks as non-existent files. Add -h test
-that returns true for all symlinks.
-
-Cc: Yann E. MORIN <yann.morin.1998@free.fr>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: 
-http://lists.busybox.net/pipermail/busybox/2018-July/086555.html
-
- applets/install.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/applets/install.sh b/applets/install.sh
-index 9aede0f530e2..415896893e86 100755
---- a/applets/install.sh
-+++ b/applets/install.sh
-@@ -83,7 +83,7 @@ install -m 755 busybox "$prefix/bin/busybox" || exit 1
- for i in $h; do
- 	appdir=`dirname "$i"`
- 	app=`basename "$i"`
--	if [ x"$noclobber" = x"1" ] && [ -e "$prefix/$i" ]; then
-+	if [ x"$noclobber" = x"1" ] && ([ -e "$prefix/$i" ] || [ -h "$prefix/$i" ]); then
- 		echo "  $prefix/$i already exists"
- 		continue
- 	fi
--- 
-2.18.0
-
diff --git a/package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch b/package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch
deleted file mode 100644
index b40979e359..0000000000
--- a/package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 6d3b4bb24da9a07c263f3c1acf8df85382ff562c Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 17 Dec 2018 18:07:18 +0100
-Subject: udhcpc: check that 4-byte options are indeed 4-byte, closes 11506
-
-function                                             old     new   delta
-udhcp_get_option32                                     -      27     +27
-udhcp_get_option                                     231     248     +17
-------------------------------------------------------------------------------
-(add/remove: 1/0 grow/shrink: 1/0 up/down: 44/0)               Total: 44 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
----
- networking/udhcp/common.c | 19 +++++++++++++++++++
- networking/udhcp/common.h |  4 ++++
- networking/udhcp/dhcpc.c  |  6 +++---
- networking/udhcp/dhcpd.c  |  6 +++---
- 4 files changed, 29 insertions(+), 6 deletions(-)
-
-diff --git a/networking/udhcp/common.c b/networking/udhcp/common.c
-index e5fd74f91..41b05b855 100644
---- a/networking/udhcp/common.c
-+++ b/networking/udhcp/common.c
-@@ -272,6 +272,15 @@ uint8_t* FAST_FUNC udhcp_get_option(struct dhcp_packet *packet, int code)
- 			goto complain; /* complain and return NULL */
- 
- 		if (optionptr[OPT_CODE] == code) {
-+			if (optionptr[OPT_LEN] == 0) {
-+				/* So far no valid option with length 0 known.
-+				 * Having this check means that searching
-+				 * for DHCP_MESSAGE_TYPE need not worry
-+				 * that returned pointer might be unsafe
-+				 * to dereference.
-+				 */
-+				goto complain; /* complain and return NULL */
-+			}
- 			log_option("option found", optionptr);
- 			return optionptr + OPT_DATA;
- 		}
-@@ -289,6 +298,16 @@ uint8_t* FAST_FUNC udhcp_get_option(struct dhcp_packet *packet, int code)
- 	return NULL;
- }
- 
-+uint8_t* FAST_FUNC udhcp_get_option32(struct dhcp_packet *packet, int code)
-+{
-+	uint8_t *r = udhcp_get_option(packet, code);
-+	if (r) {
-+		if (r[-1] != 4)
-+			r = NULL;
-+	}
-+	return r;
-+}
-+
- /* Return the position of the 'end' option (no bounds checking) */
- int FAST_FUNC udhcp_end_option(uint8_t *optionptr)
- {
-diff --git a/networking/udhcp/common.h b/networking/udhcp/common.h
-index 7ad603d33..9511152ff 100644
---- a/networking/udhcp/common.h
-+++ b/networking/udhcp/common.h
-@@ -205,6 +205,10 @@ extern const uint8_t dhcp_option_lengths[] ALIGN1;
- unsigned FAST_FUNC udhcp_option_idx(const char *name, const char *option_strings);
- 
- uint8_t *udhcp_get_option(struct dhcp_packet *packet, int code) FAST_FUNC;
-+/* Same as above + ensures that option length is 4 bytes
-+ * (returns NULL if size is different)
-+ */
-+uint8_t *udhcp_get_option32(struct dhcp_packet *packet, int code) FAST_FUNC;
- int udhcp_end_option(uint8_t *optionptr) FAST_FUNC;
- void udhcp_add_binary_option(struct dhcp_packet *packet, uint8_t *addopt) FAST_FUNC;
- #if ENABLE_UDHCPC || ENABLE_UDHCPD
-diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
-index 4b23e4d39..5b3fd531c 100644
---- a/networking/udhcp/dhcpc.c
-+++ b/networking/udhcp/dhcpc.c
-@@ -1691,7 +1691,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
-  * They say ISC DHCP client supports this case.
-  */
- 				server_addr = 0;
--				temp = udhcp_get_option(&packet, DHCP_SERVER_ID);
-+				temp = udhcp_get_option32(&packet, DHCP_SERVER_ID);
- 				if (!temp) {
- 					bb_error_msg("no server ID, using 0.0.0.0");
- 				} else {
-@@ -1718,7 +1718,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
- 				struct in_addr temp_addr;
- 				uint8_t *temp;
- 
--				temp = udhcp_get_option(&packet, DHCP_LEASE_TIME);
-+				temp = udhcp_get_option32(&packet, DHCP_LEASE_TIME);
- 				if (!temp) {
- 					bb_error_msg("no lease time with ACK, using 1 hour lease");
- 					lease_seconds = 60 * 60;
-@@ -1813,7 +1813,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
- 					uint32_t svid;
- 					uint8_t *temp;
- 
--					temp = udhcp_get_option(&packet, DHCP_SERVER_ID);
-+					temp = udhcp_get_option32(&packet, DHCP_SERVER_ID);
- 					if (!temp) {
-  non_matching_svid:
- 						log1("received DHCP NAK with wrong"
-diff --git a/networking/udhcp/dhcpd.c b/networking/udhcp/dhcpd.c
-index a8cd3f03b..477856d11 100644
---- a/networking/udhcp/dhcpd.c
-+++ b/networking/udhcp/dhcpd.c
-@@ -640,7 +640,7 @@ static void add_server_options(struct dhcp_packet *packet)
- static uint32_t select_lease_time(struct dhcp_packet *packet)
- {
- 	uint32_t lease_time_sec = server_config.max_lease_sec;
--	uint8_t *lease_time_opt = udhcp_get_option(packet, DHCP_LEASE_TIME);
-+	uint8_t *lease_time_opt = udhcp_get_option32(packet, DHCP_LEASE_TIME);
- 	if (lease_time_opt) {
- 		move_from_unaligned32(lease_time_sec, lease_time_opt);
- 		lease_time_sec = ntohl(lease_time_sec);
-@@ -987,7 +987,7 @@ int udhcpd_main(int argc UNUSED_PARAM, char **argv)
- 		}
- 
- 		/* Get SERVER_ID if present */
--		server_id_opt = udhcp_get_option(&packet, DHCP_SERVER_ID);
-+		server_id_opt = udhcp_get_option32(&packet, DHCP_SERVER_ID);
- 		if (server_id_opt) {
- 			uint32_t server_id_network_order;
- 			move_from_unaligned32(server_id_network_order, server_id_opt);
-@@ -1011,7 +1011,7 @@ int udhcpd_main(int argc UNUSED_PARAM, char **argv)
- 		}
- 
- 		/* Get REQUESTED_IP if present */
--		requested_ip_opt = udhcp_get_option(&packet, DHCP_REQUESTED_IP);
-+		requested_ip_opt = udhcp_get_option32(&packet, DHCP_REQUESTED_IP);
- 		if (requested_ip_opt) {
- 			move_from_unaligned32(requested_nip, requested_ip_opt);
- 		}
--- 
-cgit v1.2.1
-
diff --git a/package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch b/package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch
deleted file mode 100644
index 05939db4ab..0000000000
--- a/package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 74d9f1ba37010face4bd1449df4d60dd84450b06 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 7 Jan 2019 15:33:42 +0100
-Subject: udhcpc: when decoding DHCP_SUBNET, ensure it is 4 bytes long
-
-function                                             old     new   delta
-udhcp_run_script                                     795     801      +6
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
----
- networking/udhcp/common.c | 2 +-
- networking/udhcp/common.h | 2 +-
- networking/udhcp/dhcpc.c  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/networking/udhcp/common.c b/networking/udhcp/common.c
-index 4c2221b77..fc4de5716 100644
---- a/networking/udhcp/common.c
-+++ b/networking/udhcp/common.c
-@@ -302,7 +302,7 @@ uint8_t* FAST_FUNC udhcp_get_option32(struct dhcp_packet *packet, int code)
- {
- 	uint8_t *r = udhcp_get_option(packet, code);
- 	if (r) {
--		if (r[-1] != 4)
-+		if (r[-OPT_DATA + OPT_LEN] != 4)
- 			r = NULL;
- 	}
- 	return r;
-diff --git a/networking/udhcp/common.h b/networking/udhcp/common.h
-index 9511152ff..62f9a2a4a 100644
---- a/networking/udhcp/common.h
-+++ b/networking/udhcp/common.h
-@@ -119,7 +119,7 @@ enum {
- //#define DHCP_TIME_SERVER      0x04 /* RFC 868 time server (32-bit, 0 = 1.1.1900) */
- //#define DHCP_NAME_SERVER      0x05 /* IEN 116 _really_ ancient kind of NS */
- //#define DHCP_DNS_SERVER       0x06
--//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog)
-+//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog) */
- //#define DHCP_COOKIE_SERVER    0x08 /* "quote of the day" server */
- //#define DHCP_LPR_SERVER       0x09
- #define DHCP_HOST_NAME          0x0c /* 12: either client informs server or server gives name to client */
-diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
-index 5b3fd531c..dcec8cdfd 100644
---- a/networking/udhcp/dhcpc.c
-+++ b/networking/udhcp/dhcpc.c
-@@ -531,7 +531,7 @@ static char **fill_envp(struct dhcp_packet *packet)
- 		temp = udhcp_get_option(packet, code);
- 		*curr = xmalloc_optname_optval(temp, &dhcp_optflags[i], opt_name);
- 		putenv(*curr++);
--		if (code == DHCP_SUBNET) {
-+		if (code == DHCP_SUBNET && temp[-OPT_DATA + OPT_LEN] == 4) {
- 			/* Subnet option: make things like "$ip/$mask" possible */
- 			uint32_t subnet;
- 			move_from_unaligned32(subnet, temp);
--- 
-cgit v1.2.1
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index b12bc21293..c6804dc1fe 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From https://busybox.net/downloads/busybox-1.29.3.tar.bz2.sha256
-sha256 97648636e579462296478e0218e65e4bc1e9cd69089a3b1aeb810bff7621efb7  busybox-1.29.3.tar.bz2
+# From https://busybox.net/downloads/busybox-1.30.1.tar.bz2.sha256
+sha256 3d1d04a4dbd34048f4794815a5c48ebb9eb53c5277e09ffffc060323b95dfbdc  busybox-1.30.1.tar.bz2
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5c5a8ea839..67b91500e9 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.29.3
+BUSYBOX_VERSION = 1.30.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
-- 
2.18.0
