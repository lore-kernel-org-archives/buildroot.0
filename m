Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3320CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90AEB41347;
	Wed,  5 Nov 2025 22:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AXyMjxG9LNt; Wed,  5 Nov 2025 22:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9FA4133F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9FA4133F;
	Wed,  5 Nov 2025 22:30:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3F9B2A
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06F41412BE
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tp1vPiQcWtXw for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159C2412C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 159C2412C1
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13A3F828BC; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f0fdc960394d004e38799c859509241d1cc426d
X-Git-Newrev: 812e7e43becbb8bea632016284ea641a3edd888b
X-Patchwork-Hint: ignore
Message-Id: <20251105222950.13A3F828BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/net-tools: no need for
 ifconfig+route workarounds with merged-bin
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=812e7e43becbb8bea632016284ea641a3edd888b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With a merged-bin setup, there is no need to move ifconfig and route, as
they would already be in the proper place.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/net-tools/net-tools.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 0468a00bf0..344abee8b3 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -42,10 +42,16 @@ endef
 
 # ifconfig & route reside in /sbin for busybox, so ensure we don't end
 # up with two versions of those.
-define NET_TOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
+define NET_TOOLS_INSTALL_MV_BINS
 	mv -f $(TARGET_DIR)/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig
 	mv -f $(TARGET_DIR)/bin/route $(TARGET_DIR)/sbin/route
 endef
+endif
+
+define NET_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(NET_TOOLS_INSTALL_MV_BINS)
+endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
