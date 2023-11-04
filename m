Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76455C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C2F82342;
	Sat,  4 Nov 2023 14:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C2F82342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KG1XjXmuaiRX; Sat,  4 Nov 2023 14:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB5B8232D;
	Sat,  4 Nov 2023 14:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB5B8232D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD6A11BF37C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CB7F60F34
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB7F60F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4lLw5Mrju7X for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:23:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49B6660F31
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B6660F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 285EA86574; Sat,  4 Nov 2023 14:23:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 15:23:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4155139365247ea702bb536848dd1e771f98f0d2
X-Git-Newrev: d4608453913f3fbb9209546b058896cdc62bc9c6
X-Patchwork-Hint: ignore
Message-Id: <20231104142347.285EA86574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: enable missing kernel
 config options
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4608453913f3fbb9209546b058896cdc62bc9c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Firewalld requires IPV6 to function. We also should enable the
other dependencies such as networking support to ensure all other
options in the giant list of kernel config options are selected
properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/firewalld/firewalld.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 188550d449..23ba1e6c2a 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -72,9 +72,16 @@ define FIREWALLD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S46firewalld
 endef
 
+# Firewalld needs ipv6
 # Firewalld requires almost every single nftable option selected.
 define FIREWALLD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_DIAG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_FILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MANGLE)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
