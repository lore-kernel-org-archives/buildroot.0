Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B624AC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 15:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7581F40BBE;
	Sat, 19 Jul 2025 15:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1JCGEu0ETuL; Sat, 19 Jul 2025 15:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E9F40BA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96E9F40BA0;
	Sat, 19 Jul 2025 15:17:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AEA60DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9461B8458D
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZdQhCUg1iLR for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 15:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C99845A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4C99845A3
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:17:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEE56864C5; Sat, 19 Jul 2025 15:17:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 16:45:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e3114cd2f8380ae1fbd15eec78b182efe382303
X-Git-Newrev: 7c8cca9baab5fd97f360a1b5d46397b629a54d6c
X-Patchwork-Hint: ignore
Message-Id: <20250719151750.DEE56864C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: set "nft" path if
 BR2_PACKAGE_NFTABLES=y
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c8cca9baab5fd97f360a1b5d46397b629a54d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nftables should be preferred over iptables if available, which
NetworkManager will do if both paths are set.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/network-manager/network-manager.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 8c517c49e6..1bec053c54 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -131,6 +131,10 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
 endif
 
+ifeq ($(BR2_PACKAGE_NFTABLES),y)
+NETWORK_MANAGER_CONF_OPTS += -Dnft=/usr/sbin/nft
+endif
+
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
 NETWORK_MANAGER_CONF_OPTS += -Dofono=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
