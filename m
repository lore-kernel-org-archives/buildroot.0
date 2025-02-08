Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22B1C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 17:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A632413B8;
	Sat,  8 Feb 2025 17:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9h7iRtWXy-x; Sat,  8 Feb 2025 17:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664E0411CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664E0411CC;
	Sat,  8 Feb 2025 17:46:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D92831B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBE5240578
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1nvy0d3sQQ5 for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 17:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A1BD400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A1BD400C7
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:46:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80AC187322; Sat,  8 Feb 2025 17:46:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 18:39:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bf27608a77143650fa94994363b444d57db7842
X-Git-Newrev: 71b170d098119feb332d0e4ce180d132d482bf17
X-Patchwork-Hint: ignore
Message-Id: <20250208174634.80AC187322@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: disable
 CONFIG_FEATURE_IP_LINK_CAN if headers < 4.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=71b170d098119feb332d0e4ce180d132d482bf17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the recent bump of Busybox to 1.37.0 in commit
ed84e971c36b43f564df881d86ac459bb5b7dad0, the build fails on
configurations with old kernel headers. Indeed, the new
CONFIG_FEATURE_IP_LINK_CAN Busybox option uses IFLA_CAN_TERMINATION,
which was only introduced in Linux 4.11.

This commit addresses this issue by disabling
CONFIG_FEATURE_IP_LINK_CAN if the headers are not old enough.

Fixes:

  https://gitlab.com/kubu93/buildroot/-/jobs/9059854451

Fixes: ed84e971c36b43f564df881d86ac459bb5b7dad0 ("package/busybox bump version to 1.37.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/busybox/busybox.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f1439fbc..d3074d2218 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -410,6 +410,13 @@ define BUSYBOX_INSTALL_ADD_TO_SHELLS
 endef
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11),)
+# IFLA_CAN_TERMINATION was introduced in Linux 4.11
+define BUSYBOX_DISABLE_IP_LINK_CAN
+	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IP_LINK_CAN)
+endef
+endif
+
 define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_MUSL_DISABLE_SHA_HWACCEL)
 	$(BUSYBOX_SET_MMU)
@@ -422,6 +429,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(BUSYBOX_DISABLE_IP_LINK_CAN)
 	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
