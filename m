Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13736C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE17482428;
	Thu,  9 May 2024 15:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNufM-wR_qDr; Thu,  9 May 2024 15:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A47581FA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A47581FA6;
	Thu,  9 May 2024 15:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB4CE1BF995
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B5740595
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6EYRQMMeFjy for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D32E64057B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D32E64057B
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:49:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC4AD86C43; Thu,  9 May 2024 15:49:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:46:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4237949d51cc169acf70f966e5a19418b432d8d
X-Git-Newrev: 419d39b2615973711404fc143e848755f6692cfc
X-Patchwork-Hint: ignore
Message-Id: <20240509154903.BC4AD86C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lvm2: enable device-mapper in
 Kernel config
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

commit: https://git.buildroot.net/buildroot/commit/?id=419d39b2615973711404fc143e848755f6692cfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LVM2 has a hard dependency on the device-mapper presence in the Kernel.
This commit enables those mandatory Kernel configuration by defining
the _LINUX_CONFIG_FIXUPS macro. This will make sure the final system
image will end up in a working configuration.

This was suggested by Arnout in [1].

[1] https://lists.buildroot.org/pipermail/buildroot/2024-April/688776.html

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lvm2/lvm2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index bda1648955..4fcfddb1bb 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -76,5 +76,10 @@ HOST_LVM2_CONF_OPTS = \
 	--disable-selinux \
 	--with-confdir=$(HOST_DIR)/etc
 
+define LVM2_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_DM)
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
