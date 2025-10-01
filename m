Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DBBCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D08FB84172;
	Wed,  1 Oct 2025 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ce54Li4A-kad; Wed,  1 Oct 2025 21:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF51C84174
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF51C84174;
	Wed,  1 Oct 2025 21:39:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9E9872
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0AE46151A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vob87QX64430 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AB461505
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7AB461505
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:39:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B98866D5; Wed,  1 Oct 2025 21:39:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Oct 2025 22:13:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd71e2ad7f0291f40e26ebc2858d3984c3b8c476
X-Git-Newrev: d03d19338bdb334639608892a7ebb9ffe207a24f
X-Patchwork-Hint: ignore
Message-Id: <20251001213911.C6B98866D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: enable CONFIG_MDIO_BUS
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

commit: https://git.buildroot.net/buildroot/commit/?id=d03d19338bdb334639608892a7ebb9ffe207a24f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CONFIG_MDIO_BUS was previously a hidden symbol that was selected by
CONFIG_MDIO_DEVICE, however since kernel 6.16 this changed.

CONFIG_MDIO_DEVICE was dropped and now CONFIG_MDIO_BUS is visible and must
be directly selected[1].

So, enable CONFIG_MDIO_BUS directly as otherwise building mdio-tools can
fail with:
ERROR: modpost: "mdio_find_bus" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_write" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_read" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_read" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_write" [mdio-netlink.ko] undefined!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.16.9&id=31be641d74267d98317ef5a2b90e6200511cabb3
Fixes: https://autobuild.buildroot.org/results/8595997794a2f603fcef95b559f60f83abfe4d83/

Signed-off-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mdio-tools/mdio-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index b42ea41c79..e61f847e13 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -16,6 +16,7 @@ define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_BUS)
 endef
 
 $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
