Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4700BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA6D84016;
	Tue, 24 May 2022 15:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdtQzXZk0i17; Tue, 24 May 2022 15:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E6784012;
	Tue, 24 May 2022 15:08:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2214B1BF395
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C064960D96
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLVyo4VFBLmo for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F0C860E1B
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:07:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7A29C8648E; Tue, 24 May 2022 14:56:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 17:07:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 85e0bbd7860a349d57349fca9fbbfc4705d0acd9
X-Git-Newrev: c716238bbd8904a3e9fc30d8ad712221860f13e6
X-Patchwork-Hint: ignore
Message-Id: <20220524145615.7A29C8648E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/batman-adv: needs
 CONFIG_CRC16
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

commit: https://git.buildroot.net/buildroot/commit/?id=c716238bbd8904a3e9fc30d8ad712221860f13e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

CONFIG_CRC16 is needed to avoid the following build failure:

ERROR: modpost: "crc16" [/nvmedata/autobuild/instance-6/output-1/build/batman-adv-2021.4/net/batman-adv/batman-adv.ko] undefined!

Fixes:
 - http://autobuild.buildroot.org/results/64bf0f89ef444dda4d1277c0e46d189ad2515713

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5c7f712c4814c0aacbd11bf71e2f81a3b33365bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/batman-adv/batman-adv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 838f9b1851..6a1aaa699c 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -35,6 +35,7 @@ define BATMAN_ADV_CONFIGURE_CMDS
 endef
 
 define BATMAN_ADV_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC16)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LIBCRC32C)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
