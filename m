Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2193DCDE002
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 08:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5994070D;
	Thu, 25 Jun 2026 08:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVnd1toH55Bd; Thu, 25 Jun 2026 08:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC2941067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782376680;
	bh=Cnv9VLl74zuKmaYm+OW6ZBlBas7EahD1veP0gzm56u4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XAvgXJXQXMWjHP7dh0A2dMEBmQlDRPU6H2sco9T59Y79iMA+xZEQ9neevnK09XyyO
	 NUAPdUU5347IhPLhg7XKEPlkv0xmtRU2IyebXZPnMk2s2+2B8gkpKoo7aVMWG+IE2l
	 Lvb5BZ/FoAbQdC6Fd5tDj44HTQzzZHQLN6EKqOelnaXgEYkYKnR7h9Kvg6GtFWW0PK
	 /IsAilYfbBNgGMSjd1RJDfwH5944VSwtXkUqGYvfxhX39Ov8+bLfnFzPbjffZ2Rqy9
	 FYT/QTn6nzViGTiVFFNiFWokMnF+Kzt9uUeBz4EU/4vVe0TaDOfBwx79y74gCZ19bL
	 MUSPQeUXb1dIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC2941067;
	Thu, 25 Jun 2026 08:38:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A49272C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96C8782897
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8boSK0IByZzX for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 08:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E1F82894
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77E1F82894
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07FCF85169; Thu, 25 Jun 2026 08:37:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 10:33:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c384895981eb7d98a8ba5067566601772db0258b
X-Git-Newrev: c57bcf0d4352bf53edf436522918bbb3e75b43ec
X-Patchwork-Hint: ignore
Message-Id: <20260625083730.07FCF85169@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: improve kernel support
 for iptables-legacy and iptables-nft
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c57bcf0d4352bf53edf436522918bbb3e75b43ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
