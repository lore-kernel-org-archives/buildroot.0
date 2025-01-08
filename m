Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC08DE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9630D8188D;
	Wed,  8 Jan 2025 22:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlCnLtQU0kXb; Wed,  8 Jan 2025 22:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96693818B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96693818B5;
	Wed,  8 Jan 2025 22:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED33B1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E542F60C2A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUMTwX0l29_t for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB1060BAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BB1060BAE
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19DBD83F99; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 22:45:49 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 445badfa8bada57bb9526a81846878ef688878fb
X-Git-Newrev: d1b481bf80eaca2197f511444b04a76430f70f60
X-Patchwork-Hint: ignore
Message-Id: <20250108220554.19DBD83F99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/v4l2loopback:
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1b481bf80eaca2197f511444b04a76430f70f60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index 50a168fcab..e2dfcb02f5 100644
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
