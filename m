Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F96C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D695D81975;
	Sat,  9 Aug 2025 16:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnnrePqOUrCe; Sat,  9 Aug 2025 16:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34BD8197D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E34BD8197D;
	Sat,  9 Aug 2025 16:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C260B21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A94F360BC2
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPpAGWRBNAgv for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD6660BB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD6660BB1
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:41:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D941787070; Sat,  9 Aug 2025 16:41:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 18:38:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc28c3df6fb6a812de689a25d0d2dea1388b4b9d
X-Git-Newrev: 37b35546ebd699a75033c525b74d264a363e9a01
X-Patchwork-Hint: ignore
Message-Id: <20250809164151.D941787070@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: add kernel TUN dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=37b35546ebd699a75033c525b74d264a363e9a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Grout automatically creates a TUN interface at runtime, so the target
kernel must have CONFIG_TUN enabled.  Add a fix-up to ensure that option
is selected.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grout/grout.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 46d3cf5f0a..53271dd913 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -20,4 +20,8 @@ GROUT_DEPENDENCIES = \
 	libecoli \
 	util-linux
 
+define GROUT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
