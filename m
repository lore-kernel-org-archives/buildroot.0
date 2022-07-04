Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F45C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 16:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF95D81501;
	Mon,  4 Jul 2022 16:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF95D81501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XA8ioLOiZ52R; Mon,  4 Jul 2022 16:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F8A8142C;
	Mon,  4 Jul 2022 16:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F8A8142C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABCB11BF373
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94BD660B00
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BD660B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3WHlJmejhxu for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 16:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7002D60BDF
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 16:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7002D60BDF
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8B1CE82210; Mon,  4 Jul 2022 16:39:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Jul 2022 18:50:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a49d70a3f2e02e08333d716547ec9e0d59cb1371
X-Git-Newrev: a0b8eee63599d95cdfe16bb560d55938f3d1887d
X-Patchwork-Hint: ignore
Message-Id: <20220704163932.8B1CE82210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: fix build with musl libc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2706216182393896397=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2706216182393896397==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a0b8eee63599d95cdfe16bb560d55938f3d1887d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing collision of struct ethhdr definition with
kernel headers.

Add another upstream patch to remove undefined u_int16_t type build
breakage.

Fixes:
http://autobuild.buildroot.net/results/2a449752ee51eed8b8d569a52eb69f635e0369cd/
http://autobuild.buildroot.net/results/23e97f88259850ecb12f2444365b34fa6fac8211/
http://autobuild.buildroot.net/results/b8e3809d469c949a755808b7132717b0325ebafa/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...fix-build-for-missing-ETH_ALEN-definition.patch |  69 +++++++++
 .../0002-treewide-use-uint-instead-of-u_int.patch  | 167 +++++++++++++++++++++
 2 files changed, 236 insertions(+)

diff --git a/package/iptables/0001-Revert-fix-build-for-missing-ETH_ALEN-definition.patch b/package/iptables/0001-Revert-fix-build-for-missing-ETH_ALEN-definition.patch
new file mode 100644
index 0000000000..4f3831d9e4
--- /dev/null
+++ b/package/iptables/0001-Revert-fix-build-for-missing-ETH_ALEN-definition.patch
@@ -0,0 +1,69 @@
+From 0e7cf0ad306cdf95dc3c28d15a254532206a888e Mon Sep 17 00:00:00 2001
+Message-Id: <0e7cf0ad306cdf95dc3c28d15a254532206a888e.1656908815.git.baruch@tkos.co.il>
+From: Phil Sutter <phil@nwl.cc>
+Date: Wed, 18 May 2022 16:04:09 +0200
+Subject: [PATCH] Revert "fix build for missing ETH_ALEN definition"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts commit c5d9a723b5159a28f547b577711787295a14fd84 as it broke
+compiling against musl libc. Might be a bug in the latter, but for the
+time being try to please both by avoiding the include and instead
+defining ETH_ALEN if unset.
+
+While being at it, move netinet/ether.h include up.
+
+Fixes: 1bdb5535f561a ("libxtables: Extend MAC address printing/parsing support")
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+Reviewed-by: Maciej Żenczykowski <maze@google.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 0e7cf0ad306cdf95dc3c28d15a254532206a888e
+
+ libxtables/xtables.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/libxtables/xtables.c b/libxtables/xtables.c
+index 96fd783a066c..0638f9271c60 100644
+--- a/libxtables/xtables.c
++++ b/libxtables/xtables.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <netinet/ether.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <sys/statfs.h>
+@@ -45,7 +46,6 @@
+ 
+ #include <xtables.h>
+ #include <limits.h> /* INT_MAX in ip_tables.h/ip6_tables.h */
+-#include <linux/if_ether.h> /* ETH_ALEN */
+ #include <linux/netfilter_ipv4/ip_tables.h>
+ #include <linux/netfilter_ipv6/ip6_tables.h>
+ #include <libiptc/libxtc.h>
+@@ -72,6 +72,10 @@
+ #define PROC_SYS_MODPROBE "/proc/sys/kernel/modprobe"
+ #endif
+ 
++#ifndef ETH_ALEN
++#define ETH_ALEN 6
++#endif
++
+ /* we need this for ip6?tables-restore.  ip6?tables-restore.c sets line to the
+  * current line of the input file, in order  to give a more precise error
+  * message.  ip6?tables itself doesn't need this, so it is initialized to the
+@@ -2245,8 +2249,6 @@ void xtables_print_num(uint64_t number, unsigned int format)
+ 	printf(FMT("%4lluT ","%lluT "), (unsigned long long)number);
+ }
+ 
+-#include <netinet/ether.h>
+-
+ static const unsigned char mac_type_unicast[ETH_ALEN] =   {};
+ static const unsigned char msk_type_unicast[ETH_ALEN] =   {1};
+ static const unsigned char mac_type_multicast[ETH_ALEN] = {1};
+-- 
+2.35.1
+
diff --git a/package/iptables/0002-treewide-use-uint-instead-of-u_int.patch b/package/iptables/0002-treewide-use-uint-instead-of-u_int.patch
new file mode 100644
index 0000000000..e254c061af
--- /dev/null
+++ b/package/iptables/0002-treewide-use-uint-instead-of-u_int.patch
@@ -0,0 +1,167 @@
+From f319389525b066b7dc6d389c88f16a0df3b8f189 Mon Sep 17 00:00:00 2001
+Message-Id: <f319389525b066b7dc6d389c88f16a0df3b8f189.1656908915.git.baruch@tkos.co.il>
+From: Nick Hainke <vincent@systemli.org>
+Date: Mon, 16 May 2022 18:16:41 +0200
+Subject: [PATCH] treewide: use uint* instead of u_int*
+
+Gcc complains about missing types. Some commits introduced u_int* instead
+of uint*. Use uint treewide.
+
+Fixes errors in the form of:
+In file included from xtables-legacy-multi.c:5:
+xshared.h:83:56: error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
+    83 | set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
+        |                                                        ^~~~~~~~~
+        |                                                        uint16_t
+make[6]: *** [Makefile:712: xtables_legacy_multi-xtables-legacy-multi.o] Error 1
+
+Avoid libipq API breakage by adjusting libipq.h include accordingly. For
+arpt_mangle.h kernel uAPI header, apply same change as in kernel commit
+e91ded8db5747 ("uapi: netfilter_arp: use __u8 instead of u_int8_t").
+
+Signed-off-by: Nick Hainke <vincent@systemli.org>
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit f319389525b066b7dc6d389c88f16a0df3b8f189
+
+ extensions/libxt_conntrack.c              | 2 +-
+ include/libipq/libipq.h                   | 8 ++++----
+ include/libiptc/libxtc.h                  | 2 +-
+ include/linux/netfilter_arp/arpt_mangle.h | 2 +-
+ iptables/xshared.c                        | 2 +-
+ iptables/xshared.h                        | 2 +-
+ libipq/ipq_create_handle.3                | 2 +-
+ libipq/ipq_set_mode.3                     | 2 +-
+ 8 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/extensions/libxt_conntrack.c b/extensions/libxt_conntrack.c
+index 64018ce152b7..234085c5211c 100644
+--- a/extensions/libxt_conntrack.c
++++ b/extensions/libxt_conntrack.c
+@@ -778,7 +778,7 @@ matchinfo_print(const void *ip, const struct xt_entry_match *match, int numeric,
+ 
+ static void
+ conntrack_dump_ports(const char *prefix, const char *opt,
+-		     u_int16_t port_low, u_int16_t port_high)
++		     uint16_t port_low, uint16_t port_high)
+ {
+ 	if (port_high == 0 || port_low == port_high)
+ 		printf(" %s%s %u", prefix, opt, port_low);
+diff --git a/include/libipq/libipq.h b/include/libipq/libipq.h
+index 3cd1329217a0..dd0cb205179c 100644
+--- a/include/libipq/libipq.h
++++ b/include/libipq/libipq.h
+@@ -24,7 +24,7 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+-#include <sys/types.h>
++#include <stdint.h>
+ #include <sys/socket.h>
+ #include <sys/uio.h>
+ #include <asm/types.h>
+@@ -48,19 +48,19 @@ typedef unsigned long ipq_id_t;
+ struct ipq_handle
+ {
+ 	int fd;
+-	u_int8_t blocking;
++	uint8_t blocking;
+ 	struct sockaddr_nl local;
+ 	struct sockaddr_nl peer;
+ };
+ 
+-struct ipq_handle *ipq_create_handle(u_int32_t flags, u_int32_t protocol);
++struct ipq_handle *ipq_create_handle(uint32_t flags, uint32_t protocol);
+ 
+ int ipq_destroy_handle(struct ipq_handle *h);
+ 
+ ssize_t ipq_read(const struct ipq_handle *h,
+                 unsigned char *buf, size_t len, int timeout);
+ 
+-int ipq_set_mode(const struct ipq_handle *h, u_int8_t mode, size_t len);
++int ipq_set_mode(const struct ipq_handle *h, uint8_t mode, size_t len);
+ 
+ ipq_packet_msg_t *ipq_get_packet(const unsigned char *buf);
+ 
+diff --git a/include/libiptc/libxtc.h b/include/libiptc/libxtc.h
+index 37010188b64f..a1d16ef996d7 100644
+--- a/include/libiptc/libxtc.h
++++ b/include/libiptc/libxtc.h
+@@ -10,7 +10,7 @@ extern "C" {
+ #endif
+ 
+ #ifndef XT_MIN_ALIGN
+-/* xt_entry has pointers and u_int64_t's in it, so if you align to
++/* xt_entry has pointers and uint64_t's in it, so if you align to
+    it, you'll also align to any crazy matches and targets someone
+    might write */
+ #define XT_MIN_ALIGN (__alignof__(struct xt_entry))
+diff --git a/include/linux/netfilter_arp/arpt_mangle.h b/include/linux/netfilter_arp/arpt_mangle.h
+index 250f502902bb..8c2b16a1f5a0 100644
+--- a/include/linux/netfilter_arp/arpt_mangle.h
++++ b/include/linux/netfilter_arp/arpt_mangle.h
+@@ -13,7 +13,7 @@ struct arpt_mangle
+ 	union {
+ 		struct in_addr tgt_ip;
+ 	} u_t;
+-	u_int8_t flags;
++	__u8 flags;
+ 	int target;
+ };
+ 
+diff --git a/iptables/xshared.c b/iptables/xshared.c
+index a8512d380815..9b5e5b5bddc2 100644
+--- a/iptables/xshared.c
++++ b/iptables/xshared.c
+@@ -1025,7 +1025,7 @@ static const int inverse_for_options[NUMBER_OF_OPT] =
+ };
+ 
+ void
+-set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
++set_option(unsigned int *options, unsigned int option, uint16_t *invflg,
+ 	   bool invert)
+ {
+ 	if (*options & option)
+diff --git a/iptables/xshared.h b/iptables/xshared.h
+index 14568bb00fb6..f82129883968 100644
+--- a/iptables/xshared.h
++++ b/iptables/xshared.h
+@@ -80,7 +80,7 @@ struct xtables_target;
+ #define IPT_INV_ARPHRD		0x0800
+ 
+ void
+-set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
++set_option(unsigned int *options, unsigned int option, uint16_t *invflg,
+ 	   bool invert);
+ 
+ /**
+diff --git a/libipq/ipq_create_handle.3 b/libipq/ipq_create_handle.3
+index 11ef95c4b79f..ebe46daab92d 100644
+--- a/libipq/ipq_create_handle.3
++++ b/libipq/ipq_create_handle.3
+@@ -24,7 +24,7 @@ ipq_create_handle, ipq_destroy_handle \(em create and destroy libipq handles.
+ .br
+ .B #include <libipq.h>
+ .sp
+-.BI "struct ipq_handle *ipq_create_handle(u_int32_t " flags ", u_int32_t " protocol ");"
++.BI "struct ipq_handle *ipq_create_handle(uint32_t " flags ", uint32_t " protocol ");"
+ .br
+ .BI "int ipq_destroy_handle(struct ipq_handle *" h );
+ .SH DESCRIPTION
+diff --git a/libipq/ipq_set_mode.3 b/libipq/ipq_set_mode.3
+index 0edd3c00a84f..e206886c8c62 100644
+--- a/libipq/ipq_set_mode.3
++++ b/libipq/ipq_set_mode.3
+@@ -24,7 +24,7 @@ ipq_set_mode \(em set the ip_queue queuing mode
+ .br
+ .B #include <libipq.h>
+ .sp
+-.BI "int ipq_set_mode(const struct ipq_handle *" h ", u_int8_t " mode ", size_t " range );
++.BI "int ipq_set_mode(const struct ipq_handle *" h ", uint8_t " mode ", size_t " range );
+ .SH DESCRIPTION
+ The
+ .B ipq_set_mode
+-- 
+2.35.1
+

--===============2706216182393896397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2706216182393896397==--
