Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD96C54EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 19:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A08D81919;
	Sun,  8 Jan 2023 19:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A08D81919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QliNGa2FljYs; Sun,  8 Jan 2023 19:56:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B64F9818DC;
	Sun,  8 Jan 2023 19:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B64F9818DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1A4E1BF577
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CFE34013C
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CFE34013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnwPwV3sI4Rd for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 19:56:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6509C400C8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6509C400C8
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 19:56:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so2725963wma.1
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 11:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=75srsSJaTP3y508IuNNmOGDgr8YsZJqpNh0uCXO5Je4=;
 b=xf/Jymo62oAkdV+gJsDzoxcLVjcwc7yxEdCN/LZKeuKdw5WJcksPTPJvQutHfW0C4q
 ci5FEWD/OCs6C+kGIkgzHWRkLx12wwLhpLdJIUu+wo0xQIrTNSnpcBBKZgB2iRlxlzHf
 MMZA+ogl4GXrCK7nMO+dUA9UeuyMyS0fRi3oFVYzZt4CRPDV1UbcTSaNgNI3oJC5tB1V
 520y3Mxy1ToKRmFD1OiAEWFUhnNLOVuzkKuflB+tawuq/qQ/PATnfSwk6Uj0+ELlBSDQ
 zboDJ5xznozsFKPRvVusnPLhCNiyteU4Y9i7/Sdy0YPnvXaV+EVNISmsRSgQsb0Csg/f
 2vmQ==
X-Gm-Message-State: AFqh2krV9L2/UabHDqWCUHwGVg5qofqoA+sIg3mroTAzyHBtTjth2xKN
 Xhb9JGkwnLLd39R1F6PSDDZzM+XCXYs=
X-Google-Smtp-Source: AMrXdXud/+tXI7AKS+wanBrhDM/L90npVna2rXE77bxTNuiavoFjYy1kgpZnrIpEbLO2yrOCMZjw5Q==
X-Received: by 2002:a05:600c:250:b0:3d2:2043:9cbf with SMTP id
 16-20020a05600c025000b003d220439cbfmr43694337wmj.10.1673207789245; 
 Sun, 08 Jan 2023 11:56:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm10770715wmm.23.2023.01.08.11.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 11:56:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:56:26 +0100
Message-Id: <20230108195626.328941-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=75srsSJaTP3y508IuNNmOGDgr8YsZJqpNh0uCXO5Je4=;
 b=bAkR2LWQc++mHLwoIu3C0ZM1CwVqHI1QaCslbOyqOZPGo+bmPXpKKmoCeLpc/8uyaA
 Qx53WSLEguYXs4miJRVZF1H4tusUM4g/1X1IpAu+IkZWVgS+rlaEcJZwYOiPVpimzEJZ
 k7V/g4QPjsUYTFCIzNwaxQg4J/jzoK1uRFATPO97WhZ16VuX0KxhwLJsyH9QxcEEPKp3
 uhOUGUlY0ALE8stzDFQC2KmMbdqW3qNoiS6f8glV2K2emht98z40rPQaz/UeG1Fgatbc
 Hra+7gkkeo5r0LBoNrpP9IMm9d/QxPhlQbNsp1WgvLk46GGhnadrgDDsiM41uZ6uQTT7
 4Dnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bAkR2LWQ
Subject: [Buildroot] [PATCH 1/1] package/trinity: fix build with kernel >=
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with kernel >= 6.1:

net/proto-decnet.c:5:10: fatal error: linux/dn.h: No such file or directory
    5 | #include <linux/dn.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/47e0a5e0b6fcf33ab4f9848d5d8c2be9e5283950

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trinity/0004-drop-decnet.patch | 130 +++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 package/trinity/0004-drop-decnet.patch

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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
