Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9869C35FF3
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64DED81EF3;
	Tue, 18 Mar 2025 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7J0HrDZBmma; Tue, 18 Mar 2025 15:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B4AB81E55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B4AB81E55;
	Tue, 18 Mar 2025 15:02:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7A2D94
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75136408CF
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfBIp3OPNQcF for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5829940733
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5829940733
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E288880ED; Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 21:10:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a639e31268ba5483b607b32b32896346f62509d6
X-Git-Newrev: 2625440614b6000109ff1c8fc3a64e5b92d90f77
X-Patchwork-Hint: ignore
Message-Id: <20250318150241.4E288880ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: optionally default to
 nftables compat
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2625440614b6000109ff1c8fc3a64e5b92d90f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an nftables-based firewall setup it may be desirable to use
iptables-nft as the "iptables" binary, in particular to better
integrate legacy applications that do not support nftables directly
and call iptables. If the BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT option
introduced by this patch is enabled, iptables, iptables-restore, and
iptables-save are symlinked to the -nft version of iptables. The
-legacy options can still be called directly if desired.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iptables/Config.in   | 12 ++++++++++++
 package/iptables/iptables.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index e6b12603e0..ef02c26242 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -24,6 +24,18 @@ config BR2_PACKAGE_IPTABLES_NFTABLES
 	help
 	  Build nftables compat utilities.
 
+if BR2_PACKAGE_IPTABLES_NFTABLES
+
+config BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT
+	bool "use nftables compat by default"
+	help
+	  Make the nftables compat variant of iptables, iptables-save,
+	  and iptables-restore the default. This only adjusts symlinks
+	  in /usr/sbin, the legacy variants can still be called
+	  directly.
+
+endif
+
 comment "nftables compat needs a toolchain w/ wchar, dynamic library, headers >= 3.12"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 533f56a992..8d23dca249 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -62,4 +62,16 @@ define IPTABLES_INSTALL_INIT_SYSV
 	touch $(TARGET_DIR)/etc/iptables.conf
 endef
 
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
+define IPTABLES_MAKE_NFTABLES_DEFAULT
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables-restore
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables-save
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
+	ln -sf xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
+endef
+IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_MAKE_NFTABLES_DEFAULT
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
