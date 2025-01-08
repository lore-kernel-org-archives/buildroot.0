Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50576E77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9263981852;
	Wed,  8 Jan 2025 22:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfroM_tdZiMi; Wed,  8 Jan 2025 22:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35770817FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35770817FF;
	Wed,  8 Jan 2025 22:05:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4A11FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B0E402ED
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7i2-EPzQ4MkL for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B69F740308
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B69F740308
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B047783F2A; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 22:32:13 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 3e51af1dbdde6bf9b0a98f163c4e335814ab8b11
X-Git-Newrev: b76789f5755d2326b7b5a912c98409c304e0df8f
X-Patchwork-Hint: ignore
Message-Id: <20250108220444.B047783F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/v4l2loopback:
 enable CONFIG_MEDIA_CAMERA_SUPPORT kernel option
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

commit: https://git.buildroot.net/buildroot/commit/?id=b76789f5755d2326b7b5a912c98409c304e0df8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
(cherry picked from commit 75d418b59d4ffe251ffcd49c06ccf0f1d0b86e04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
