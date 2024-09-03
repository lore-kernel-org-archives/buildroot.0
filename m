Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A352CD379F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1874260634;
	Tue,  3 Sep 2024 16:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reZ6loAXuPLD; Tue,  3 Sep 2024 16:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E9A6073C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E9A6073C;
	Tue,  3 Sep 2024 16:29:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 727821BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CDEC60634
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvOh7Ylk_bDL for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E8F60592
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91E8F60592
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:29:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8035B86A2C; Tue,  3 Sep 2024 16:29:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 18:18:02 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 49600cb5f0f110456d800dc5e1975d90aff798b3
X-Git-Newrev: eb834ee93bb6dafb9b011a1a3aa27f3d7b916f39
X-Patchwork-Hint: ignore
Message-Id: <20240903162915.8035B86A2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mdio-tools:
 enable CONFIG_NETDEVICES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb834ee93bb6dafb9b011a1a3aa27f3d7b916f39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

mdio-tools depends on CONFIG_MDIO_DEVICE in order for mdiobus driver to
be built, but CONFIG_MDIO_DEVICE depends on CONFIG_NETDEVICES which we
are not enabling so on platforms without it enabled in kernel config
building mdio-tools will fail with:

ERROR: modpost: "mdio_find_bus" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_read" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_read" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_write" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_write" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!

So enable CONFIG_NETDEVICES as well to make sure CONFIG_MDIO_DEVICE can be enabled.

Fixes: http://autobuild.buildroot.net/results/edf47df96cde6094c890c0b74034cced90335a39/

Signed-off-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b95fff0185803bac5c8cfb558d60234e59a1469b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdio-tools/mdio-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index 16eba74734..b42ea41c79 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -14,6 +14,7 @@ MDIO_TOOLS_MODULE_SUBDIRS = kernel
 
 define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
