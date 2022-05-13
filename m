Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C718410DC;
	Fri, 13 May 2022 22:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6kTPppglxor; Fri, 13 May 2022 22:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072AE40984;
	Fri, 13 May 2022 22:12:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14CA31C1189
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F311B40949
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QS1JvMjLKzma for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53AEB4091F
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1DC9C85E29; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd654b3ba7d257801c25d1b95a060055d75c5953
X-Git-Newrev: a191d391382557dc2fbf9306c3126cf2bddcf7e1
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.1DC9C85E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: enable required
 kernel options
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

commit: https://git.buildroot.net/buildroot/commit/?id=a191d391382557dc2fbf9306c3126cf2bddcf7e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable Linux kernel configuration options required by xradio driver.
Those are wireless networking support, sdio support, and power
management core functions.

Fixes:
- http://autobuild.buildroot.net/results/7ad4a4b6b1612460427e667d98efc6df7b4a2153/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xr819-xradio/xr819-xradio.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index d4b9826f64..835e229347 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -9,5 +9,13 @@ XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
 
+define XR819_XRADIO_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PM)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
