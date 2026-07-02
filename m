Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3117C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7FCD411DF;
	Fri,  3 Jul 2026 14:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocRllrxA2yMw; Fri,  3 Jul 2026 14:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33FEE411A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088914;
	bh=jF9P0XXHPgT/Qu6t/CiQCStBpBoXWw/m5CIh8AEZhvU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gRYs6ffBWVQp9tiOMLGkaNEucPfymmqHOtKEkwcIyIQXgMQiqVyDXgiWWRDebiFRz
	 ADtkUHNqeHy2ovKf+H3VUqMUkufewi5KD0Xw3oITEC29wLr3yP9qecQV5T3Fu/Q+yY
	 yrt8es/dlPpyG1/1EDiWg8hvhAXhhNISGtn6Qy/xFpsENEcBUyu45XOoJ3BdHvAq77
	 sJJcDgk7jIjb3nZ+E6m2qU14cVqx/ob8VhA/W3VwAKh7ftzLNzhXiCskwwlD9x1SWk
	 0nbBFBjt7zkl0jqBmcm3gPHIP6V3QzQjUjoseJVT7vVhFnviiRc31jiJeTpvsV/blq
	 HqX5R8r+G9FZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33FEE411A0;
	Fri,  3 Jul 2026 14:28:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29F5F47E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F26540420
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLeRKY25hFiQ for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 552C44008F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 552C44008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEA13883A3; Fri,  3 Jul 2026 14:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:30:34 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 67b13f3c8da2fd6bb9fd8920ed9d52200ed1019b
X-Git-Newrev: 8e913e6c385ce234e1d541ba923e3aeab091f719
X-Patchwork-Hint: ignore
Message-Id: <20260703142757.DEA13883A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/iptables: improve
 kernel support for iptables-legacy and iptables-nft
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e913e6c385ce234e1d541ba923e3aeab091f719
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Since kernels 6.17, support for netfilter legacy tables were disabled
by default [1] but iptables package needs Netfilter legacy tables
support enabled in the kernel when nftables compat is not enabled.

Make sure to enable CONFIG_IP_NF_IPTABLES_LEGACY and
CONFIG_NETFILTER_XTABLES_LEGACY for kernels >= 6.17.

Fixes:

  [BRTEST# iptables --flush
  modprobe: module ip_tables not found in modules.dep
  iptables v1.8.11 (legacy): can't initialize iptables table `filter': Table does not exist (do you need to insmod?)
  Perhaps iptables or your kernel needs to be upgraded.

On the other hand, when nftables compat (iptables-nft) is used by
default (BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y) we have to enable
nft protocol support in the kernel.

  iptables --version
  iptables: Failed to initialize nft: Protocol not supported

Enable CONFIG_NF_TABLES and CONFIG_NF_TABLES_INET as for
NFTABLES_LINUX_CONFIG_FIXUPS and complete the list with
CONFIG_NFT_SOCKET needed to pass the TestIptables with
nftables compat (iptables-nft) enabled.

Without CONFIG_NFT_SOCKET:

  iptables --policy INPUT ACCEPT
  iptables v1.8.11 (nf_tables):  TABLE_ADD failed (Operation not supported): table filter

So, enable kernel support for iptables-legacy only if nftables compat
is not enabled by default. Enable iptables-nft support when nftables
compat is enabled, even if not used by default.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9fce66583f06c212e95e4b76dd61d8432ffa56b6

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Fiona: fix typo in commit message]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit c57bcf0d4352bf53edf436522918bbb3e75b43ec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iptables/iptables.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a9d912f6cc..bb01c07a43 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -49,11 +49,33 @@ else
 IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
 endif
 
+# Enable kernel support for iptables-nft even if nftables compat is not
+# enabled by default.
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
+define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
+endef
+endif
+
+# Enable kernel support for iptables-legacy only if nftables compat is not
+# enabled by default.
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),)
+define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY
+	# [for Linux kernel versions 6.17 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES_LEGACY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES_LEGACY)
+endef
+endif
+
 define IPTABLES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY)
+	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT)
 endef
 
 define IPTABLES_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
