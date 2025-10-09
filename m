Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7490CCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3FC612C1;
	Thu,  9 Oct 2025 09:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKXa_mRqTm3D; Thu,  9 Oct 2025 09:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0954561209
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0954561209;
	Thu,  9 Oct 2025 09:56:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49D9521B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E895840C50
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeAMEqVUjBiF for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE7B40F89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE7B40F89
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C811586C3B; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:29:54 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: d519942192a401532a66767326d324eb3d6ec249
X-Git-Newrev: cf211a0ba19e4988f4a071e555e794eb3f22a1ad
X-Patchwork-Hint: ignore
Message-Id: <20251009095539.C811586C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/mdio-tools:
 enable CONFIG_MDIO_BUS
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf211a0ba19e4988f4a071e555e794eb3f22a1ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
(cherry picked from commit d03d19338bdb334639608892a7ebb9ffe207a24f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
