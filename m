Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CBCC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A25F6065E;
	Sun, 27 Sep 2026 10:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkAgRFkji1_Z; Sun, 27 Sep 2026 10:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C166460698
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790503695;
	b=UZRxyMjGASVptj2oSLNjvRFbXeYTp/q6R3sh7+xLttJIg0uXYTCf0iW/KGeG+U/T/oVz
	 SoKyzUErn9aZrkMkPdQkuPV0PjCocWkLDiUiEYi/9pTAVRK2qZVzeEqGz7/RA4/2uG6EP
	 kJ/eUY79tvkD/MbNQrY/aabUkUPQ8NIRyqMY7Rj8Vat5OxCLNHVDMLxmpZEpvjszRXRfq
	 qoTAPx0DzSC3NlGcpqAj6FPfR8drq+1sa22i9DtPMZah6QgbpjNo4SqVL+6uCDn20hwBZ
	 aJxEz0xJaZXW+X2CivcVCqCo1N8SucOUdcfdLxhvfyMgbFCdW6P5yR3LIaLv2CU5deg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790503695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Bnlu0fROGshrH76bXq/feF0dBYjp9JhU5xm7fgf+OJ0=;
	b=o5Ke9yLddGDdijw+hRTujILzaUuSY8VlcvXlKtxhmu38dt1L5yUZfPkpkYpw8J/JcVeQ
	 wNPblBflUU8JbHe5XtIRtvgOCQXDueivRUzofJCHFptiRwUweeaq/mAelV+lzwHWh4tUF
	 h1UrZS+4+ilczX5Ov2x/SOE8HnCaUdNCOJBJBd2bC4Hid68HcUo5TvuR+yXwCol+PcI2g
	 37CxlB35k659mEM++c6e2OF0Ych8p4Bx67P8nKaRpU5HcimzWzI7liBhC5scnO5nQMdWD
	 asLHX1rcLx3tB3FZeDirpd926BPo5u4Qk9gsHzu5eDo7BFtvNQyxIEB5+z3kSLQVyEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790503695;
	bh=Bnlu0fROGshrH76bXq/feF0dBYjp9JhU5xm7fgf+OJ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mhl/dEtscVmizD171IXcmy9Qu9tkzGefS6JsdMFyMHdB5b+vSlo/qYqjSRMuXDEbs
	 fxNyBptzPb8VWQOaoOZ+LXCke/1Qlk/48WW6uo0nEEUshTM5+cT2j6XMLfd1zgy3pL
	 C+tHvD82z6IHf1DaPX86xEYNxLtj54/HpyCO+2BveRp2FAqZmrEu+B5g/bQaTBeS+D
	 J+qV7NVOqF7VOWIwF9rqGXT6lircBEMW2KNz8p1jGanN9YzbNx4vPFyxWaxIzpf33c
	 EcWRKuawdor9RGdoEbMAgAQSh9r30lqXJH8d//rNlukyvSzS7F/Zdh0BUtS+OTaegJ
	 m/4hD3OzX23tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C166460698;
	Sun, 27 Sep 2026 10:08:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 009D824E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E69666061D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHUfH2uue4gi for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9C9CE6062C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790503687;
 b=j2ZHGjxYWsmEeyiNzv0kFcTPBp5tXklzdXpyIB+EUj2jWlO2ybhLf2jrFvcmvQ5AnBku
 vksTBVouX4vPgLCMhivspEYdVYFPPDgf/GVZf3BS4hnpW+PU51n0I3EiDVQAlsdYDI1ss
 //8RBhbNj54M8cfT4GepmpZTlkouRPookG7nDipXTqlRL+RRSRPxw0L7+BCZOqDed4wFr
 GAG7+ktxGjO/pgLfQvnL9h5x5koE9wputfueXeq+NUwbzeQZFL7FcvOW6Cb6J4m2Ju4zs
 N/IcgtmIs79hr1Xe67N6IWSjOIsz75ttQpXt+bIgMOJG6j/fq7mgzI1SfqEOoQR1wNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790503687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RPFPJuQt0E10ZO9OP5CetKcALckcrGiUbZruNlx2r/0=;
 b=VXyQ3m58Ipq6+lXZKQOwqWtlDS+X1j7ByB8W3u0KUEkgamF8sXWOMrFflumkMkUwm8z0
 mJY1Zftrv24/GF4JGyvyHFhlMbC28Y8LpcHsjxKFhlDgcwdLJz5vVCAeQ4WVNy/v0sw56
 khNqwOcpbgWv6cxdImRbe11YtYBewT0VT8iOpAFFjGJGrTldq807NEJLY97f3MxpmQyYk
 oZ9iGIcZvxfoj8mRsKsT3RicZjffvFmjLHhYMLOuIAqOwFIXNp5nU13jSGLL1GnNzZNof
 b2T2XzypNBKfl0t0fk6OP8nEWBOMCauljtIYGZtG26jlaPx72OJ4HdUvf3lZDRWIjFw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C9CE6062C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC78591FED; Sun, 27 Sep 2026 10:06:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 10:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7626aada6a08a45ec07ace5c0529b95ca165db19
X-Git-Newrev: 236fd61a83a2a6f4c666b6e53f79c27ccdd4591a
X-Patchwork-Hint: ignore
Message-Id: <20260927100655.EC78591FED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: bump version to 1.8.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6055266086809888416=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6055266086809888416==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/236fd61a83a2a6f4c666b6e53f79c27ccdd4591a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.8.13 (for details see [1] and [2])
- remove 0001-nft-fix-interface-comparisons-in-C-commands.patch
  (from upstream [3])

[1] https://netfilter.org/projects/iptables/files/changes-iptables-1.8.12.txt
[2] https://netfilter.org/projects/iptables/files/changes-iptables-1.8.13.txt
[3] https://git.netfilter.org/iptables/commit/?id=40406dbfaefbc204134452b2747bae4f6a122848

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t-fix-interface-comparisons-in-C-commands.patch | 175 ---------------------
 package/iptables/iptables.hash                     |   2 +-
 package/iptables/iptables.mk                       |   2 +-
 3 files changed, 2 insertions(+), 177 deletions(-)

diff --git a/package/iptables/0001-nft-fix-interface-comparisons-in-C-commands.patch b/package/iptables/0001-nft-fix-interface-comparisons-in-C-commands.patch
deleted file mode 100644
index 308f75bbd8..0000000000
--- a/package/iptables/0001-nft-fix-interface-comparisons-in-C-commands.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From 1f11d1004923eb941c9b4b33c8021dd9c4a2f3da Mon Sep 17 00:00:00 2001
-From: Jeremy Sowden <jeremy@azazel.net>
-Date: Mon, 18 Nov 2024 13:56:50 +0000
-Subject: [PATCH] nft: fix interface comparisons in `-C` commands
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 9ccae6397475 ("nft: Leave interface masks alone when parsing from
-kernel") removed code which explicitly set interface masks to all ones.  The
-result of this is that they are zero.  However, they are used to mask interfaces
-in `is_same_interfaces`.  Consequently, the masked values are alway zero, the
-comparisons are always true, and check commands which ought to fail succeed:
-
-  # iptables -N test
-  # iptables -A test -i lo \! -o lo -j REJECT
-  # iptables -v -L test
-  Chain test (0 references)
-   pkts bytes target     prot opt in     out     source               destination
-      0     0 REJECT     all  --  lo     !lo     anywhere             anywhere             reject-with icmp-port-unreachable
-  # iptables -v -C test -i abcdefgh \! -o abcdefgh -j REJECT
-  REJECT  all opt -- in lo out !lo  0.0.0.0/0  -> 0.0.0.0/0   reject-with icmp-port-unreachable
-
-Remove the mask parameters from `is_same_interfaces`.  Add a test-case.
-
-Fixes: 9ccae6397475 ("nft: Leave interface masks alone when parsing from kernel")
-Signed-off-by: Jeremy Sowden <jeremy@azazel.net>
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-
-Upstream: https://git.netfilter.org/iptables/commit/?id=40406dbfaefbc204134452b2747bae4f6a122848
-Signed-off-by: Jan Čermák <sairon@sairon.cz>
----
- iptables/nft-arp.c                            | 10 ++----
- iptables/nft-ipv4.c                           |  4 +--
- iptables/nft-ipv6.c                           |  6 +---
- iptables/nft-shared.c                         | 36 +++++--------------
- iptables/nft-shared.h                         |  6 +---
- .../nft-only/0020-compare-interfaces_0        |  9 +++++
- 6 files changed, 22 insertions(+), 49 deletions(-)
- create mode 100755 iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0
-
-diff --git a/iptables/nft-arp.c b/iptables/nft-arp.c
-index 264864c3..c11d64c3 100644
---- a/iptables/nft-arp.c
-+++ b/iptables/nft-arp.c
-@@ -385,14 +385,8 @@ static bool nft_arp_is_same(const struct iptables_command_state *cs_a,
- 		return false;
- 	}
- 
--	return is_same_interfaces(a->arp.iniface,
--				  a->arp.outiface,
--				  (unsigned char *)a->arp.iniface_mask,
--				  (unsigned char *)a->arp.outiface_mask,
--				  b->arp.iniface,
--				  b->arp.outiface,
--				  (unsigned char *)b->arp.iniface_mask,
--				  (unsigned char *)b->arp.outiface_mask);
-+	return is_same_interfaces(a->arp.iniface, a->arp.outiface,
-+				  b->arp.iniface, b->arp.outiface);
- }
- 
- static void nft_arp_save_chain(const struct nftnl_chain *c, const char *policy)
-diff --git a/iptables/nft-ipv4.c b/iptables/nft-ipv4.c
-index 74092875..0c8bd291 100644
---- a/iptables/nft-ipv4.c
-+++ b/iptables/nft-ipv4.c
-@@ -113,9 +113,7 @@ static bool nft_ipv4_is_same(const struct iptables_command_state *a,
- 	}
- 
- 	return is_same_interfaces(a->fw.ip.iniface, a->fw.ip.outiface,
--				  a->fw.ip.iniface_mask, a->fw.ip.outiface_mask,
--				  b->fw.ip.iniface, b->fw.ip.outiface,
--				  b->fw.ip.iniface_mask, b->fw.ip.outiface_mask);
-+				  b->fw.ip.iniface, b->fw.ip.outiface);
- }
- 
- static void nft_ipv4_set_goto_flag(struct iptables_command_state *cs)
-diff --git a/iptables/nft-ipv6.c b/iptables/nft-ipv6.c
-index b184f8af..4dbb2af2 100644
---- a/iptables/nft-ipv6.c
-+++ b/iptables/nft-ipv6.c
-@@ -99,11 +99,7 @@ static bool nft_ipv6_is_same(const struct iptables_command_state *a,
- 	}
- 
- 	return is_same_interfaces(a->fw6.ipv6.iniface, a->fw6.ipv6.outiface,
--				  a->fw6.ipv6.iniface_mask,
--				  a->fw6.ipv6.outiface_mask,
--				  b->fw6.ipv6.iniface, b->fw6.ipv6.outiface,
--				  b->fw6.ipv6.iniface_mask,
--				  b->fw6.ipv6.outiface_mask);
-+				  b->fw6.ipv6.iniface, b->fw6.ipv6.outiface);
- }
- 
- static void nft_ipv6_set_goto_flag(struct iptables_command_state *cs)
-diff --git a/iptables/nft-shared.c b/iptables/nft-shared.c
-index 6775578b..2c29e68f 100644
---- a/iptables/nft-shared.c
-+++ b/iptables/nft-shared.c
-@@ -220,36 +220,16 @@ void add_l4proto(struct nft_handle *h, struct nftnl_rule *r,
- }
- 
- bool is_same_interfaces(const char *a_iniface, const char *a_outiface,
--			unsigned const char *a_iniface_mask,
--			unsigned const char *a_outiface_mask,
--			const char *b_iniface, const char *b_outiface,
--			unsigned const char *b_iniface_mask,
--			unsigned const char *b_outiface_mask)
-+			const char *b_iniface, const char *b_outiface)
- {
--	int i;
--
--	for (i = 0; i < IFNAMSIZ; i++) {
--		if (a_iniface_mask[i] != b_iniface_mask[i]) {
--			DEBUGP("different iniface mask %x, %x (%d)\n",
--			a_iniface_mask[i] & 0xff, b_iniface_mask[i] & 0xff, i);
--			return false;
--		}
--		if ((a_iniface[i] & a_iniface_mask[i])
--		    != (b_iniface[i] & b_iniface_mask[i])) {
--			DEBUGP("different iniface\n");
--			return false;
--		}
--		if (a_outiface_mask[i] != b_outiface_mask[i]) {
--			DEBUGP("different outiface mask\n");
--			return false;
--		}
--		if ((a_outiface[i] & a_outiface_mask[i])
--		    != (b_outiface[i] & b_outiface_mask[i])) {
--			DEBUGP("different outiface\n");
--			return false;
--		}
-+	if (strncmp(a_iniface, b_iniface, IFNAMSIZ)) {
-+		DEBUGP("different iniface\n");
-+		return false;
-+	}
-+	if (strncmp(a_outiface, b_outiface, IFNAMSIZ)) {
-+		DEBUGP("different outiface\n");
-+		return false;
- 	}
--
- 	return true;
- }
- 
-diff --git a/iptables/nft-shared.h b/iptables/nft-shared.h
-index 51d1e460..b57aee1f 100644
---- a/iptables/nft-shared.h
-+++ b/iptables/nft-shared.h
-@@ -105,11 +105,7 @@ void add_l4proto(struct nft_handle *h, struct nftnl_rule *r, uint8_t proto, uint
- void add_compat(struct nftnl_rule *r, uint32_t proto, bool inv);
- 
- bool is_same_interfaces(const char *a_iniface, const char *a_outiface,
--			unsigned const char *a_iniface_mask,
--			unsigned const char *a_outiface_mask,
--			const char *b_iniface, const char *b_outiface,
--			unsigned const char *b_iniface_mask,
--			unsigned const char *b_outiface_mask);
-+			const char *b_iniface, const char *b_outiface);
- 
- void __get_cmp_data(struct nftnl_expr *e, void *data, size_t dlen, uint8_t *op);
- void get_cmp_data(struct nftnl_expr *e, void *data, size_t dlen, bool *inv);
-diff --git a/iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0 b/iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0
-new file mode 100755
-index 00000000..278cd648
---- /dev/null
-+++ b/iptables/tests/shell/testcases/nft-only/0020-compare-interfaces_0
-@@ -0,0 +1,9 @@
-+#!/bin/bash
-+
-+[[ $XT_MULTI == *xtables-nft-multi ]] || { echo "skip $XT_MULTI"; exit 0; }
-+
-+$XT_MULTI iptables -N test
-+$XT_MULTI iptables -A test -i lo \! -o lo -j REJECT
-+$XT_MULTI iptables -C test -i abcdefgh \! -o abcdefgh -j REJECT 2>/dev/null && exit 1
-+
-+exit 0
diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 727fb709b1..c7a3bcbe88 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  d87303d55ef8c92bcad4dd3f978b26d272013642b029425775f5bad1009fe7b2  iptables-1.8.11.tar.xz
+sha256  1afcd33da9e8f913ace6a2126788162e207e26f5d5e29c6573c0e581ffc58b99  iptables-1.8.13.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index bb01c07a43..e8bb5ba7e3 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.11
+IPTABLES_VERSION = 1.8.13
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.xz
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES

--===============6055266086809888416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6055266086809888416==--
