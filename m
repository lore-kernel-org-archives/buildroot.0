Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40D3CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D44381E7B;
	Fri,  5 Jun 2026 12:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XKl5uyTqdJa; Fri,  5 Jun 2026 12:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9996E82021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663190;
	bh=S9hiMh/Dr1VotGx7iTgyJUjoId+X3cBrFIS45jFRZjk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IbBwZPgC+b1WTulerPqfPqD9C4hzVLdfb6MXEe3tllz0rTyIiAiTj/zSWsdZPGRJk
	 SSiKro+hZWGs73Qz18nK/eMfZ/Nd0HwTXwX8rwUOKxluRww9LefAepYQqiXstvJ3zC
	 HKifRrjrbf5xUjriNOf9K9w78sWj0NdM10SJZOwBEvaNud8c9yl/foJhfU1QUpTMcG
	 NWXfTqbN/5hwF1CwJTbjALtTKoTMTLSbL1JlCIFjzjgTo93bFTRbcWd43xrjVY1c3r
	 tScF0+rI1ht6hI0eXjGciQKgH4E5/wgPw1bxzdaSMmuJC+Fu5ZlUZzDGvMvA/T5lSx
	 UNeOsxlLq7uMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9996E82021;
	Fri,  5 Jun 2026 12:39:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F91BF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F22F782004
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWbT524dbFlD for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B004C81FE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B004C81FE9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5E9687B3A; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:41:28 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: baf285e1ecf8d9eb8d01427d256fb45cb7dac1cb
X-Git-Newrev: c5fbbc198c281bb99cc9ba0fa8d2eb7b8c73117c
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.D5E9687B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/odhcp6c: fix
 build with gcc >= 14.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0698193742309044616=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0698193742309044616==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5fbbc198c281bb99cc9ba0fa8d2eb7b8c73117c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Detected by Gitlab pipeline when testing the other build fixes in this
series. Autobuilders did not detect the problem due to the build error
with glibc 2.43.

https://gitlab.com/bkuhls/buildroot/-/jobs/14571737512

/builds/bkuhls/buildroot/br-test-pkg/bootlin-powerpc-e500mc-uclibc/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/src/dhcpv6.c:1395:58:
 error: comparison of integer expressions of different signedness:
 ‘uint32_t’ {aka ‘unsigned int’} and ‘int’ [-Werror=sign-compare]
 1395 | if (ia_hdr->iaid != htonl(ifindex) && otype == DHCPV6_OPT_IA_NA)

https://gitlab.com/bkuhls/buildroot/-/jobs/14571737510

/builds/bkuhls/buildroot/br-test-pkg/bootlin-openrisc-uclibc/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/src/dhcpv6.c:1395:58:
 error: comparison of integer expressions of different signedness:
 ‘uint32_t’ {aka ‘unsigned int’} and ‘int’ [-Werror=sign-compare]

https://gitlab.com/bkuhls/buildroot/-/jobs/14571737505

/builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-68040-uclibc/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/src/dhcpv6.c:1395:58:
 error: comparison of integer expressions of different signedness:
 ‘uint32_t’ {aka ‘unsigned int’} and ‘int’ [-Werror=sign-compare]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 17b434cf07f2696d9c3b5290c85b7dfb54eff134)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-dhcpv6-use-stable-IAID-for-IA_NA.patch    | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/package/odhcp6c/0002-dhcpv6-use-stable-IAID-for-IA_NA.patch b/package/odhcp6c/0002-dhcpv6-use-stable-IAID-for-IA_NA.patch
new file mode 100644
index 0000000000..fc70205ccc
--- /dev/null
+++ b/package/odhcp6c/0002-dhcpv6-use-stable-IAID-for-IA_NA.patch
@@ -0,0 +1,95 @@
+From 9a4d6fe802d21e4fc1b84f7d55b5c3c23e71d6ba Mon Sep 17 00:00:00 2001
+From: Paul Donald <newtwen+github@gmail.com>
+Date: Thu, 18 Dec 2025 15:10:24 +0100
+Subject: [PATCH] dhcpv6: use stable IAID for IA_NA
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+https://www.rfc-editor.org/rfc/rfc8415.html#section-12
+
+   ........  The IAID is chosen by the client.  For any given use of an
+   IA by the client, the IAID for that IA MUST be consistent across
+   restarts of the DHCP client.  The client may maintain consistency by
+   either storing the IAID in non-volatile storage or using an algorithm
+   that will consistently produce the same IAID as long as the
+   configuration of the client has not changed.
+
+Signed-off-by: Paul Donald <newtwen+github@gmail.com>
+Link: https://github.com/openwrt/odhcp6c/pull/140
+Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
+
+Upstream: https://github.com/openwrt/odhcp6c/commit/9a4d6fe802d21e4fc1b84f7d55b5c3c23e71d6ba
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/dhcpv6.c  | 15 +++++++++++++--
+ src/odhcp6c.h |  1 +
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/dhcpv6.c b/src/dhcpv6.c
+index d8bb8be..97860b1 100644
+--- a/src/dhcpv6.c
++++ b/src/dhcpv6.c
+@@ -262,6 +262,9 @@ static struct dhcpv6_stats dhcpv6_stats = {0};
+ // config
+ static struct config_dhcp* config_dhcp = NULL;
+ 
++// store unique ifname hash to use as IA->IAID
++static uint32_t ifname_hash_iaid = 0;
++
+ static uint32_t ntohl_unaligned(const uint8_t *data)
+ {
+ 	uint32_t buf;
+@@ -542,6 +545,12 @@ void dhcpv6_reset_stats(void)
+ 	memset(&dhcpv6_stats, 0, sizeof(dhcpv6_stats));
+ }
+ 
++uint32_t hash_ifname(const char *s) {
++	uint32_t h = 0;
++	while (*s) h = h * 31 + *s++;
++	return h;
++}
++
+ int init_dhcpv6(const char *ifname)
+ {
+ 	config_dhcp = config_dhcp_get();
+@@ -566,6 +575,8 @@ int init_dhcpv6(const char *ifname)
+ 	if (ioctl(sock, SIOCGIFINDEX, &ifr) < 0)
+ 		goto failure;
+ 
++	ifname_hash_iaid = hash_ifname(ifname);
++
+ 	ifindex = ifr.ifr_ifindex;
+ 
+ 	// Set the socket to non-blocking mode
+@@ -838,7 +849,7 @@ static void dhcpv6_send(enum dhcpv6_msg req_msg_type, uint8_t trid[3], uint32_t
+ 	struct dhcpv6_ia_hdr hdr_ia_na = {
+ 		.type = htons(DHCPV6_OPT_IA_NA),
+ 		.len = htons(sizeof(hdr_ia_na) - DHCPV6_OPT_HDR_SIZE),
+-		.iaid = htonl(ifindex),
++		.iaid = htonl(ifname_hash_iaid),
+ 		.t1 = 0,
+ 		.t2 = 0,
+ 	};
+@@ -1392,7 +1403,7 @@ static int dhcpv6_handle_reply(enum dhcpv6_msg orig, _o_unused const int rc,
+ 						continue;
+ 
+ 					// Test ID
+-					if (ia_hdr->iaid != htonl(ifindex) && otype == DHCPV6_OPT_IA_NA)
++					if (ia_hdr->iaid != htonl(ifname_hash_iaid) && otype == DHCPV6_OPT_IA_NA)
+ 						continue;
+ 
+ 					uint16_t code = DHCPV6_Success;
+diff --git a/src/odhcp6c.h b/src/odhcp6c.h
+index aa73bbc..c57f885 100644
+--- a/src/odhcp6c.h
++++ b/src/odhcp6c.h
+@@ -540,6 +540,7 @@ struct odhcp6c_opt {
+ 	const char *str;
+ };
+ 
++uint32_t hash_ifname(const char *s);
+ int init_dhcpv6(const char *ifname);
+ int dhcpv6_get_ia_mode(void);
+ int dhcpv6_promote_server_cand(void);

--===============0698193742309044616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0698193742309044616==--
