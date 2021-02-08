From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 22:08:00 +0100
Subject: [Buildroot] [git commit] package/connman: add upstream security
 fixes for CVE-2021-2667{5, 6}
Message-ID: <20210208205603.51E3482DEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf1dd7e007156f1995c0c1586b66bcdf8bd83655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-26675: Remote (adjacent network) code execution flaw
- CVE-2021-26676: Remote stack information leak

For details, see the advisory:
https://www.openwall.com/lists/oss-security/2021/02/08/2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-reading-invalid-data-in-dhcp_get_option.patch | 226 +++++++++++++++++++++
 ...-leaking-stack-data-via-unitiialized-vari.patch |  27 +++
 ...d-length-checks-to-prevent-buffer-overflo.patch |  56 +++++
 3 files changed, 309 insertions(+)

diff --git a/package/connman/0001-gdhcp-Avoid-reading-invalid-data-in-dhcp_get_option.patch b/package/connman/0001-gdhcp-Avoid-reading-invalid-data-in-dhcp_get_option.patch
new file mode 100644
index 0000000000..0c29895abf
--- /dev/null
+++ b/package/connman/0001-gdhcp-Avoid-reading-invalid-data-in-dhcp_get_option.patch
@@ -0,0 +1,226 @@
+From 58d397ba74873384aee449690a9070bacd5676fa Mon Sep 17 00:00:00 2001
+From: Colin Wee <cwee@tesla.com>
+Date: Thu, 28 Jan 2021 19:39:14 +0100
+Subject: [PATCH] gdhcp: Avoid reading invalid data in dhcp_get_option
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ gdhcp/client.c | 20 +++++++++++---------
+ gdhcp/common.c | 24 +++++++++++++++++++-----
+ gdhcp/common.h |  2 +-
+ gdhcp/server.c | 12 +++++++-----
+ 4 files changed, 38 insertions(+), 20 deletions(-)
+
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index 09dfe5ec..6a5613e7 100644
+--- a/gdhcp/client.c
++++ b/gdhcp/client.c
+@@ -1629,12 +1629,12 @@ static void start_request(GDHCPClient *dhcp_client)
+ 							NULL);
+ }
+ 
+-static uint32_t get_lease(struct dhcp_packet *packet)
++static uint32_t get_lease(struct dhcp_packet *packet, uint16_t packet_len)
+ {
+ 	uint8_t *option;
+ 	uint32_t lease_seconds;
+ 
+-	option = dhcp_get_option(packet, DHCP_LEASE_TIME);
++	option = dhcp_get_option(packet, packet_len, DHCP_LEASE_TIME);
+ 	if (!option)
+ 		return 3600;
+ 
+@@ -2226,7 +2226,8 @@ static void get_dhcpv6_request(GDHCPClient *dhcp_client,
+ 	}
+ }
+ 
+-static void get_request(GDHCPClient *dhcp_client, struct dhcp_packet *packet)
++static void get_request(GDHCPClient *dhcp_client, struct dhcp_packet *packet,
++		uint16_t packet_len)
+ {
+ 	GDHCPOptionType type;
+ 	GList *list, *value_list;
+@@ -2237,7 +2238,7 @@ static void get_request(GDHCPClient *dhcp_client, struct dhcp_packet *packet)
+ 	for (list = dhcp_client->request_list; list; list = list->next) {
+ 		code = (uint8_t) GPOINTER_TO_INT(list->data);
+ 
+-		option = dhcp_get_option(packet, code);
++		option = dhcp_get_option(packet, packet_len, code);
+ 		if (!option) {
+ 			g_hash_table_remove(dhcp_client->code_value_hash,
+ 						GINT_TO_POINTER((int) code));
+@@ -2297,6 +2298,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 		re = dhcp_recv_l2_packet(&packet,
+ 					dhcp_client->listener_sockfd,
+ 					&dst_addr);
++		pkt_len = (uint16_t)(unsigned int)re;
+ 		xid = packet.xid;
+ 	} else if (dhcp_client->listen_mode == L3) {
+ 		if (dhcp_client->type == G_DHCP_IPV6) {
+@@ -2361,7 +2363,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 			dhcp_client->status_code = status;
+ 		}
+ 	} else {
+-		message_type = dhcp_get_option(&packet, DHCP_MESSAGE_TYPE);
++		message_type = dhcp_get_option(&packet, pkt_len, DHCP_MESSAGE_TYPE);
+ 		if (!message_type)
+ 			return TRUE;
+ 	}
+@@ -2378,7 +2380,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 		dhcp_client->timeout = 0;
+ 		dhcp_client->retry_times = 0;
+ 
+-		option = dhcp_get_option(&packet, DHCP_SERVER_ID);
++		option = dhcp_get_option(&packet, pkt_len, DHCP_SERVER_ID);
+ 		dhcp_client->server_ip = get_be32(option);
+ 		dhcp_client->requested_ip = ntohl(packet.yiaddr);
+ 
+@@ -2428,9 +2430,9 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 
+ 			remove_timeouts(dhcp_client);
+ 
+-			dhcp_client->lease_seconds = get_lease(&packet);
++			dhcp_client->lease_seconds = get_lease(&packet, pkt_len);
+ 
+-			get_request(dhcp_client, &packet);
++			get_request(dhcp_client, &packet, pkt_len);
+ 
+ 			switch_listening_mode(dhcp_client, L_NONE);
+ 
+@@ -2438,7 +2440,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 			dhcp_client->assigned_ip = get_ip(packet.yiaddr);
+ 
+ 			if (dhcp_client->state == REBOOTING) {
+-				option = dhcp_get_option(&packet,
++				option = dhcp_get_option(&packet, pkt_len,
+ 							DHCP_SERVER_ID);
+ 				dhcp_client->server_ip = get_be32(option);
+ 			}
+diff --git a/gdhcp/common.c b/gdhcp/common.c
+index 1d667d17..c8916aa8 100644
+--- a/gdhcp/common.c
++++ b/gdhcp/common.c
+@@ -73,18 +73,21 @@ GDHCPOptionType dhcp_get_code_type(uint8_t code)
+ 	return OPTION_UNKNOWN;
+ }
+ 
+-uint8_t *dhcp_get_option(struct dhcp_packet *packet, int code)
++uint8_t *dhcp_get_option(struct dhcp_packet *packet, uint16_t packet_len, int code)
+ {
+ 	int len, rem;
+-	uint8_t *optionptr;
++	uint8_t *optionptr, *options_end;
++	size_t options_len;
+ 	uint8_t overload = 0;
+ 
+ 	/* option bytes: [code][len][data1][data2]..[dataLEN] */
+ 	optionptr = packet->options;
+ 	rem = sizeof(packet->options);
++	options_len = packet_len - (sizeof(*packet) - sizeof(packet->options));
++	options_end = optionptr + options_len - 1;
+ 
+ 	while (1) {
+-		if (rem <= 0)
++		if ((rem <= 0) && (optionptr + OPT_CODE > options_end))
+ 			/* Bad packet, malformed option field */
+ 			return NULL;
+ 
+@@ -115,14 +118,25 @@ uint8_t *dhcp_get_option(struct dhcp_packet *packet, int code)
+ 			break;
+ 		}
+ 
++		if (optionptr + OPT_LEN > options_end) {
++			/* bad packet, would read length field from OOB */
++			return NULL;
++		}
++
+ 		len = 2 + optionptr[OPT_LEN];
+ 
+ 		rem -= len;
+ 		if (rem < 0)
+ 			continue; /* complain and return NULL */
+ 
+-		if (optionptr[OPT_CODE] == code)
+-			return optionptr + OPT_DATA;
++		if (optionptr[OPT_CODE] == code) {
++			if (optionptr + len > options_end) {
++				/* bad packet, option length points OOB */
++				return NULL;
++			} else {
++				return optionptr + OPT_DATA;
++			}
++		}
+ 
+ 		if (optionptr[OPT_CODE] == DHCP_OPTION_OVERLOAD)
+ 			overload |= optionptr[OPT_DATA];
+diff --git a/gdhcp/common.h b/gdhcp/common.h
+index 9660231c..8f63fd75 100644
+--- a/gdhcp/common.h
++++ b/gdhcp/common.h
+@@ -179,7 +179,7 @@ struct in6_pktinfo {
+ };
+ #endif
+ 
+-uint8_t *dhcp_get_option(struct dhcp_packet *packet, int code);
++uint8_t *dhcp_get_option(struct dhcp_packet *packet, uint16_t packet_len, int code);
+ uint8_t *dhcpv6_get_option(struct dhcpv6_packet *packet, uint16_t pkt_len,
+ 			int code, uint16_t *option_len, int *option_count);
+ uint8_t *dhcpv6_get_sub_option(unsigned char *option, uint16_t max_len,
+diff --git a/gdhcp/server.c b/gdhcp/server.c
+index 85405f19..52ea2a55 100644
+--- a/gdhcp/server.c
++++ b/gdhcp/server.c
+@@ -413,7 +413,7 @@ error:
+ }
+ 
+ 
+-static uint8_t check_packet_type(struct dhcp_packet *packet)
++static uint8_t check_packet_type(struct dhcp_packet *packet, uint16_t packet_len)
+ {
+ 	uint8_t *type;
+ 
+@@ -423,7 +423,7 @@ static uint8_t check_packet_type(struct dhcp_packet *packet)
+ 	if (packet->op != BOOTREQUEST)
+ 		return 0;
+ 
+-	type = dhcp_get_option(packet, DHCP_MESSAGE_TYPE);
++	type = dhcp_get_option(packet, packet_len, DHCP_MESSAGE_TYPE);
+ 
+ 	if (!type)
+ 		return 0;
+@@ -651,6 +651,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 	struct dhcp_lease *lease;
+ 	uint32_t requested_nip = 0;
+ 	uint8_t type, *server_id_option, *request_ip_option;
++	uint16_t packet_len;
+ 	int re;
+ 
+ 	if (condition & (G_IO_NVAL | G_IO_ERR | G_IO_HUP)) {
+@@ -661,12 +662,13 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 	re = dhcp_recv_l3_packet(&packet, dhcp_server->listener_sockfd);
+ 	if (re < 0)
+ 		return TRUE;
++	packet_len = (uint16_t)(unsigned int)re;
+ 
+-	type = check_packet_type(&packet);
++	type = check_packet_type(&packet, packet_len);
+ 	if (type == 0)
+ 		return TRUE;
+ 
+-	server_id_option = dhcp_get_option(&packet, DHCP_SERVER_ID);
++	server_id_option = dhcp_get_option(&packet, packet_len, DHCP_SERVER_ID);
+ 	if (server_id_option) {
+ 		uint32_t server_nid =
+ 			get_unaligned((const uint32_t *) server_id_option);
+@@ -675,7 +677,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ 			return TRUE;
+ 	}
+ 
+-	request_ip_option = dhcp_get_option(&packet, DHCP_REQUESTED_IP);
++	request_ip_option = dhcp_get_option(&packet, packet_len, DHCP_REQUESTED_IP);
+ 	if (request_ip_option)
+ 		requested_nip = get_be32(request_ip_option);
+ 
+-- 
+2.20.1
+
diff --git a/package/connman/0002-gdhcp-Avoid-leaking-stack-data-via-unitiialized-vari.patch b/package/connman/0002-gdhcp-Avoid-leaking-stack-data-via-unitiialized-vari.patch
new file mode 100644
index 0000000000..dc15ac3be3
--- /dev/null
+++ b/package/connman/0002-gdhcp-Avoid-leaking-stack-data-via-unitiialized-vari.patch
@@ -0,0 +1,27 @@
+From a74524b3e3fad81b0fd1084ffdf9f2ea469cd9b1 Mon Sep 17 00:00:00 2001
+From: Colin Wee <cwee@tesla.com>
+Date: Thu, 28 Jan 2021 19:41:09 +0100
+Subject: [PATCH] gdhcp: Avoid leaking stack data via unitiialized variable
+
+Fixes: CVE-2021-26676
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ gdhcp/client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index 6a5613e7..c7b85e58 100644
+--- a/gdhcp/client.c
++++ b/gdhcp/client.c
+@@ -2270,7 +2270,7 @@ static gboolean listener_event(GIOChannel *channel, GIOCondition condition,
+ {
+ 	GDHCPClient *dhcp_client = user_data;
+ 	struct sockaddr_in dst_addr = { 0 };
+-	struct dhcp_packet packet;
++	struct dhcp_packet packet = { 0 };
+ 	struct dhcpv6_packet *packet6 = NULL;
+ 	uint8_t *message_type = NULL, *client_id = NULL, *option,
+ 		*server_id = NULL;
+-- 
+2.20.1
+
diff --git a/package/connman/0003-dnsproxy-Add-length-checks-to-prevent-buffer-overflo.patch b/package/connman/0003-dnsproxy-Add-length-checks-to-prevent-buffer-overflo.patch
new file mode 100644
index 0000000000..cde1339816
--- /dev/null
+++ b/package/connman/0003-dnsproxy-Add-length-checks-to-prevent-buffer-overflo.patch
@@ -0,0 +1,56 @@
+From e4079a20f617a4b076af503f6e4e8b0304c9f2cb Mon Sep 17 00:00:00 2001
+From: Colin Wee <cwee@tesla.com>
+Date: Thu, 28 Jan 2021 19:41:53 +0100
+Subject: [PATCH] dnsproxy: Add length checks to prevent buffer overflow
+
+Fixes: CVE-2021-26675
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/dnsproxy.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index a7bf87a1..4f5c897f 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1767,6 +1767,7 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+ 			char **uncompressed_ptr)
+ {
+ 	char *uptr = *uncompressed_ptr; /* position in result buffer */
++	char * const uncomp_end = uncompressed + uncomp_len - 1;
+ 
+ 	debug("count %d ptr %p end %p uptr %p", field_count, ptr, end, uptr);
+ 
+@@ -1787,12 +1788,15 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+ 		 * tmp buffer.
+ 		 */
+ 
+-		ulen = strlen(name);
+-		strncpy(uptr, name, uncomp_len - (uptr - uncompressed));
+-
+ 		debug("pos %d ulen %d left %d name %s", pos, ulen,
+ 			(int)(uncomp_len - (uptr - uncompressed)), uptr);
+ 
++		ulen = strlen(name);
++		if ((uptr + ulen + 1) > uncomp_end) {
++			goto out;
++		}
++		strncpy(uptr, name, uncomp_len - (uptr - uncompressed));
++
+ 		uptr += ulen;
+ 		*uptr++ = '\0';
+ 
+@@ -1802,6 +1806,10 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+ 		 * We copy also the fixed portion of the result (type, class,
+ 		 * ttl, address length and the address)
+ 		 */
++		if ((uptr + NS_RRFIXEDSZ) > uncomp_end) {
++			debug("uncompressed data too large for buffer");
++			goto out;
++		}
+ 		memcpy(uptr, ptr, NS_RRFIXEDSZ);
+ 
+ 		dns_type = uptr[0] << 8 | uptr[1];
+-- 
+2.20.1
+
