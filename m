Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DC3C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB41482BE5;
	Fri, 28 Feb 2025 16:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nd8yU4Rx0hP; Fri, 28 Feb 2025 16:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B93D182EE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B93D182EE1;
	Fri, 28 Feb 2025 16:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB421DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D0F842E84
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nz_hYsgnRIYb for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED546427A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED546427A7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E704886612; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Jan 2025 19:10:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1a5d680c53f41dae6b6f67b526927d08b335212d
X-Git-Newrev: 75d418b59d4ffe251ffcd49c06ccf0f1d0b86e04
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.E704886612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/v4l2loopback: enable
 CONFIG_MEDIA_CAMERA_SUPPORT kernel option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=75d418b59d4ffe251ffcd49c06ccf0f1d0b86e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Setting CONFIG_VIDEO_DEV is no sufficient as drivers/media/Kconfig has
some very convoluted logic to hide some options behind a
CONFIG_MEDIA_SUPPORT_FILTER option, unless CONFIG_EXPERT is
enabled. Due to this, several arch defconfigs don't have
CONFIG_VIDEO_DEV enabled when doing $(call
KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV).

To fix this, we enable one of the possible options that ensures
CONFIG_VIDEO_DEV is enabled, and we've more or less arbitrarily chosen
CONFIG_MEDIA_CAMERA_SUPPORT.

Fixes:

  http://autobuild.buildroot.net/results/2a337d29e7870564027bcd42bd0addd228eb6a24/

We've tried to track down which kernel version introduced this
exactly, but it's been introduced a while ago and step by step making
it difficult to pin-point which version version exactly introduced
this. But the issue has been appearing for quite some time in the
autobuilders, so it's clearly not a recent issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/v4l2loopback/v4l2loopback.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index abc2929d12..0e1d20c0cc 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -24,6 +24,7 @@ define V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_SUPPORT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_CAMERA_SUPPORT)
 endef
 
 $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
