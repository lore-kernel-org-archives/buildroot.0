Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E78C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1398149D;
	Sat, 19 Apr 2025 14:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWeq7-7Dj2a8; Sat, 19 Apr 2025 14:10:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 511F381468
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 511F381468;
	Sat, 19 Apr 2025 14:10:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 336B222F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309E540151
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbigDOWruiHe for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E3C7400EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E3C7400EA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 267DF8498F; Sat, 19 Apr 2025 14:10:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:08:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fd537ae0550c3f66e575cfd380cad5334821046
X-Git-Newrev: f5e7cefe778dc65b6e36a4b2af94018ed9005d0c
X-Patchwork-Hint: ignore
Message-Id: <20250419141014.267DF8498F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: backport fix for
 interface comparisons in `-C` commands
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6705404021140437312=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6705404021140437312==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f5e7cefe778dc65b6e36a4b2af94018ed9005d0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since iptables v1.8.11, `iptables -C` commands return unexpected zero status
even for cases when the rules don't exist. This breaks e.g. standard Docker
operation, where checking for existing rules is used extensively when creating
networks.

The patch fixing the behavior is available upstream - apply it to v1.8.11
before a newer version is available.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-fix-interface-comparisons-in-C-commands.patch | 175 +++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/package/iptables/0001-nft-fix-interface-comparisons-in-C-commands.patch b/package/iptables/0001-nft-fix-interface-comparisons-in-C-commands.patch
new file mode 100644
index 0000000000..308f75bbd8
--- /dev/null
+++ b/package/iptables/0001-nft-fix-interface-comparisons-in-C-commands.patch
@@ -0,0 +1,175 @@
+From 1f11d1004923eb941c9b4b33c8021dd9c4a2f3da Mon Sep 17 00:00:00 2001
+From: Jeremy Sowden <jeremy@azazel.net>
+Date: Mon, 18 Nov 2024 13:56:50 +0000
+Subject: [PATCH] nft: fix interface comparisons in `-C` commands
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 9ccae6397475 ("nft: Leave interface masks alone when parsing from
+kernel") removed code which explicitly set interface masks to all ones.  The
+result of this is that they are zero.  However, they are used to mask interfaces
+in `is_same_interfaces`.  Consequently, the masked values are alway zero, the
+comparisons are always true, and check commands which ought to fail succeed:
+
+  # iptables -N test
+  # iptables -A test -i lo \! -o lo -j REJECT
+  # iptables -v -L test
+  Chain test (0 references)
+   pkts bytes target     prot opt in     out     source               destination
+      0     0 REJECT     all  --  lo     !lo     anywhere             anywhere             reject-with icmp-port-unreachable
+  # iptables -v -C test -i abcdefgh \! -o abcdefgh -j REJECT
+  REJECT  all opt -- in lo out !lo  0.0.0.0/0  -> 0.0.0.0/0   reject-with icmp-port-unreachable
+
+Remove the mask parameters from `is_same_interfaces`.  Add a test-case.
+
+Fixes: 9ccae6397475 ("nft: Leave interface masks alone when parsing from kernel")
+Signed-off-by: Jeremy Sowden <jeremy@azazel.net>
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+
+Upstream: https://git.netfilter.org/iptables/commit/?id=40406dbfaefbc204134452b2747bae4f6a122848
+Signed-off-by: Jan Čermák <sairon@sairon.cz>
+---
+ iptables/nft-arp.c                            | 10 ++----
+ iptables/nft-ipv4.c                           |  4 +--
+ iptables/nft-ipv6.c                           |  6 +---
+ iptables/nft-shared.c                         | 36 +++++--------------
+ iptables/nft-shared.h                         |  6 +---
+ .../nft-only/0020-compare-interfaces_0        |  9 +++++
+ 6 files changed, 22 insertions(+), 49 deletions(-)
+ create mode 100755 iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0
+
+diff --git a/iptables/nft-arp.c b/iptables/nft-arp.c
+index 264864c3..c11d64c3 100644
+--- a/iptables/nft-arp.c
++++ b/iptables/nft-arp.c
+@@ -385,14 +385,8 @@ static bool nft_arp_is_same(const struct iptables_command_state *cs_a,
+ 		return false;
+ 	}
+ 
+-	return is_same_interfaces(a->arp.iniface,
+-				  a->arp.outiface,
+-				  (unsigned char *)a->arp.iniface_mask,
+-				  (unsigned char *)a->arp.outiface_mask,
+-				  b->arp.iniface,
+-				  b->arp.outiface,
+-				  (unsigned char *)b->arp.iniface_mask,
+-				  (unsigned char *)b->arp.outiface_mask);
++	return is_same_interfaces(a->arp.iniface, a->arp.outiface,
++				  b->arp.iniface, b->arp.outiface);
+ }
+ 
+ static void nft_arp_save_chain(const struct nftnl_chain *c, const char *policy)
+diff --git a/iptables/nft-ipv4.c b/iptables/nft-ipv4.c
+index 74092875..0c8bd291 100644
+--- a/iptables/nft-ipv4.c
++++ b/iptables/nft-ipv4.c
+@@ -113,9 +113,7 @@ static bool nft_ipv4_is_same(const struct iptables_command_state *a,
+ 	}
+ 
+ 	return is_same_interfaces(a->fw.ip.iniface, a->fw.ip.outiface,
+-				  a->fw.ip.iniface_mask, a->fw.ip.outiface_mask,
+-				  b->fw.ip.iniface, b->fw.ip.outiface,
+-				  b->fw.ip.iniface_mask, b->fw.ip.outiface_mask);
++				  b->fw.ip.iniface, b->fw.ip.outiface);
+ }
+ 
+ static void nft_ipv4_set_goto_flag(struct iptables_command_state *cs)
+diff --git a/iptables/nft-ipv6.c b/iptables/nft-ipv6.c
+index b184f8af..4dbb2af2 100644
+--- a/iptables/nft-ipv6.c
++++ b/iptables/nft-ipv6.c
+@@ -99,11 +99,7 @@ static bool nft_ipv6_is_same(const struct iptables_command_state *a,
+ 	}
+ 
+ 	return is_same_interfaces(a->fw6.ipv6.iniface, a->fw6.ipv6.outiface,
+-				  a->fw6.ipv6.iniface_mask,
+-				  a->fw6.ipv6.outiface_mask,
+-				  b->fw6.ipv6.iniface, b->fw6.ipv6.outiface,
+-				  b->fw6.ipv6.iniface_mask,
+-				  b->fw6.ipv6.outiface_mask);
++				  b->fw6.ipv6.iniface, b->fw6.ipv6.outiface);
+ }
+ 
+ static void nft_ipv6_set_goto_flag(struct iptables_command_state *cs)
+diff --git a/iptables/nft-shared.c b/iptables/nft-shared.c
+index 6775578b..2c29e68f 100644
+--- a/iptables/nft-shared.c
++++ b/iptables/nft-shared.c
+@@ -220,36 +220,16 @@ void add_l4proto(struct nft_handle *h, struct nftnl_rule *r,
+ }
+ 
+ bool is_same_interfaces(const char *a_iniface, const char *a_outiface,
+-			unsigned const char *a_iniface_mask,
+-			unsigned const char *a_outiface_mask,
+-			const char *b_iniface, const char *b_outiface,
+-			unsigned const char *b_iniface_mask,
+-			unsigned const char *b_outiface_mask)
++			const char *b_iniface, const char *b_outiface)
+ {
+-	int i;
+-
+-	for (i = 0; i < IFNAMSIZ; i++) {
+-		if (a_iniface_mask[i] != b_iniface_mask[i]) {
+-			DEBUGP("different iniface mask %x, %x (%d)\n",
+-			a_iniface_mask[i] & 0xff, b_iniface_mask[i] & 0xff, i);
+-			return false;
+-		}
+-		if ((a_iniface[i] & a_iniface_mask[i])
+-		    != (b_iniface[i] & b_iniface_mask[i])) {
+-			DEBUGP("different iniface\n");
+-			return false;
+-		}
+-		if (a_outiface_mask[i] != b_outiface_mask[i]) {
+-			DEBUGP("different outiface mask\n");
+-			return false;
+-		}
+-		if ((a_outiface[i] & a_outiface_mask[i])
+-		    != (b_outiface[i] & b_outiface_mask[i])) {
+-			DEBUGP("different outiface\n");
+-			return false;
+-		}
++	if (strncmp(a_iniface, b_iniface, IFNAMSIZ)) {
++		DEBUGP("different iniface\n");
++		return false;
++	}
++	if (strncmp(a_outiface, b_outiface, IFNAMSIZ)) {
++		DEBUGP("different outiface\n");
++		return false;
+ 	}
+-
+ 	return true;
+ }
+ 
+diff --git a/iptables/nft-shared.h b/iptables/nft-shared.h
+index 51d1e460..b57aee1f 100644
+--- a/iptables/nft-shared.h
++++ b/iptables/nft-shared.h
+@@ -105,11 +105,7 @@ void add_l4proto(struct nft_handle *h, struct nftnl_rule *r, uint8_t proto, uint
+ void add_compat(struct nftnl_rule *r, uint32_t proto, bool inv);
+ 
+ bool is_same_interfaces(const char *a_iniface, const char *a_outiface,
+-			unsigned const char *a_iniface_mask,
+-			unsigned const char *a_outiface_mask,
+-			const char *b_iniface, const char *b_outiface,
+-			unsigned const char *b_iniface_mask,
+-			unsigned const char *b_outiface_mask);
++			const char *b_iniface, const char *b_outiface);
+ 
+ void __get_cmp_data(struct nftnl_expr *e, void *data, size_t dlen, uint8_t *op);
+ void get_cmp_data(struct nftnl_expr *e, void *data, size_t dlen, bool *inv);
+diff --git a/iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0 b/iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0
+new file mode 100755
+index 00000000..278cd648
+--- /dev/null
++++ b/iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0
+@@ -0,0 +1,9 @@
++#!/bin/bash
++
++[[ $XT_MULTI == *xtables-nft-multi ]] || { echo "skip $XT_MULTI"; exit 0; }
++
++$XT_MULTI iptables -N test
++$XT_MULTI iptables -A test -i lo \! -o lo -j REJECT
++$XT_MULTI iptables -C test -i abcdefgh \! -o abcdefgh -j REJECT 2>/dev/null && exit 1
++
++exit 0

--===============6705404021140437312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6705404021140437312==--
