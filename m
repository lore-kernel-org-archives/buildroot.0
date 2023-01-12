Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A62C54EBE
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68DC341746;
	Thu, 12 Jan 2023 19:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68DC341746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfmBJekUKiHr; Thu, 12 Jan 2023 19:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA3C4157D;
	Thu, 12 Jan 2023 19:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA3C4157D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 629441BF281
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F8941793
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F8941793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qymqZmcSoCV for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F4341796
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F4341796
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 145A987A9F; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:32:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb79d78554632e96df52f41333aa62f928b6817f
X-Git-Newrev: 49ca11e339c41ea2dd0484556b7b5beacff9fee9
X-Patchwork-Hint: ignore
Message-Id: <20230112193230.145A987A9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trinity: fix build with kernel >=
 6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49ca11e339c41ea2dd0484556b7b5beacff9fee9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel >= 6.1:

net/proto-decnet.c:5:10: fatal error: linux/dn.h: No such file or directory
    5 | #include <linux/dn.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/47e0a5e0b6fcf33ab4f9848d5d8c2be9e5283950

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trinity/0004-drop-decnet.patch | 130 +++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/package/trinity/0004-drop-decnet.patch b/package/trinity/0004-drop-decnet.patch
new file mode 100644
index 0000000000..15ba7f8e82
--- /dev/null
+++ b/package/trinity/0004-drop-decnet.patch
@@ -0,0 +1,130 @@
+From ec8dcc7faf13c57f5f6d785e4429818f1239a058 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Jan 2023 20:50:18 +0100
+Subject: [PATCH] drop decnet
+
+Drop decnet as it has been removed since kernel 6.1 and
+https://github.com/torvalds/linux/commit/1202cdd665315c525b5237e96e0bedc76d7e754f
+resulting in the following build failure:
+
+net/proto-decnet.c:5:10: fatal error: linux/dn.h: No such file or directory
+    5 | #include <linux/dn.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/47e0a5e0b6fcf33ab4f9848d5d8c2be9e5283950
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kernelslacker/trinity/pull/41]
+---
+ include/net.h      |  1 -
+ net/proto-decnet.c | 59 ----------------------------------------------
+ net/proto-unix.c   |  1 -
+ net/protocols.c    |  1 -
+ 4 files changed, 62 deletions(-)
+ delete mode 100644 net/proto-decnet.c
+
+diff --git a/include/net.h b/include/net.h
+index 99d55363..791e8090 100644
+--- a/include/net.h
++++ b/include/net.h
+@@ -80,7 +80,6 @@ extern const struct netproto proto_atmpvc;
+ extern const struct netproto proto_atmsvc;
+ extern const struct netproto proto_x25;
+ extern const struct netproto proto_rose;
+-extern const struct netproto proto_decnet;
+ extern const struct netproto proto_llc;
+ extern const struct netproto proto_netlink;
+ extern const struct netproto proto_packet;
+diff --git a/net/proto-decnet.c b/net/proto-decnet.c
+deleted file mode 100644
+index 7711cf00..00000000
+--- a/net/proto-decnet.c
++++ /dev/null
+@@ -1,59 +0,0 @@
+-#include <sys/types.h>
+-#include <sys/socket.h>
+-#include <sys/un.h>
+-#include <netinet/in.h>
+-#include <linux/dn.h>
+-#include <stdlib.h>
+-#include "net.h"
+-#include "random.h"
+-#include "utils.h"	// RAND_ARRAY
+-#include "compat.h"
+-
+-static void decnet_gen_sockaddr(struct sockaddr **addr, socklen_t *addrlen)
+-{
+-	struct sockaddr_dn *dn;
+-	unsigned int i;
+-
+-	dn = zmalloc(sizeof(struct sockaddr_dn));
+-
+-	dn->sdn_family = PF_DECnet;
+-	dn->sdn_flags = rnd();
+-	dn->sdn_objnum = rnd();
+-	dn->sdn_objnamel = rnd() % 16;
+-	for (i = 0; i < dn->sdn_objnamel; i++)
+-		dn->sdn_objname[i] = rnd();
+-	dn->sdn_add.a_len = RAND_BOOL();
+-	dn->sdn_add.a_addr[0] = rnd();
+-	dn->sdn_add.a_addr[1] = rnd();
+-	*addr = (struct sockaddr *) dn;
+-	*addrlen = sizeof(struct sockaddr_dn);
+-}
+-
+-static const unsigned int decnet_opts[] = {
+-	SO_CONDATA, SO_CONACCESS, SO_PROXYUSR, SO_LINKINFO,
+-	DSO_CONDATA, DSO_DISDATA, DSO_CONACCESS, DSO_ACCEPTMODE,
+-	DSO_CONACCEPT, DSO_CONREJECT, DSO_LINKINFO, DSO_STREAM,
+-	DSO_SEQPACKET, DSO_MAXWINDOW, DSO_NODELAY, DSO_CORK,
+-	DSO_SERVICES, DSO_INFO
+-};
+-
+-static void decnet_setsockopt(struct sockopt *so, __unused__ struct socket_triplet *triplet)
+-{
+-	so->level = SOL_DECNET;
+-	so->optname = RAND_ARRAY(decnet_opts);
+-
+-	// TODO: set optlen correctly
+-}
+-
+-static struct socket_triplet decnet_triplets[] = {
+-	{ .family = PF_DECnet, .protocol = DNPROTO_NSP, .type = SOCK_SEQPACKET },
+-	{ .family = PF_DECnet, .protocol = DNPROTO_NSP, .type = SOCK_STREAM },
+-};
+-
+-const struct netproto proto_decnet = {
+-	.name = "decnet",
+-	.setsockopt = decnet_setsockopt,
+-	.gen_sockaddr = decnet_gen_sockaddr,
+-	.valid_triplets = decnet_triplets,
+-	.nr_triplets = ARRAY_SIZE(decnet_triplets),
+-};
+diff --git a/net/proto-unix.c b/net/proto-unix.c
+index f7427a22..119c1429 100644
+--- a/net/proto-unix.c
++++ b/net/proto-unix.c
+@@ -2,7 +2,6 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <netinet/in.h>
+-#include <linux/dn.h>
+ #include <stdlib.h>
+ #include "net.h"
+ #include "random.h"
+diff --git a/net/protocols.c b/net/protocols.c
+index ea64d5f5..278f08b5 100644
+--- a/net/protocols.c
++++ b/net/protocols.c
+@@ -18,7 +18,6 @@ const struct protoptr net_protocols[TRINITY_PF_MAX] = {
+ #ifdef USE_IPV6
+ 	[PF_INET6] = { .proto = &proto_inet6 },
+ #endif
+-	[PF_DECnet] = { .proto = &proto_decnet },
+ 	[PF_PACKET] = { .proto = &proto_packet },
+ #ifdef USE_NETECONET
+ 	[PF_ECONET] = { .proto = &proto_econet },
+-- 
+2.39.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
