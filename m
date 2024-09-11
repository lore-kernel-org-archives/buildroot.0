Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE4DEE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AB5940525;
	Wed, 11 Sep 2024 19:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO4F9l-OYgJ1; Wed, 11 Sep 2024 19:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 617B440B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 617B440B8B;
	Wed, 11 Sep 2024 19:41:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0E031BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF9FB80D3F
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K86Ica5cHs47 for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1A1880CBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1A1880CBA
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBCD786FBA; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 21:41:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14b1b8ca8dc92851aa7400af432874621cfdb776
X-Git-Newrev: 57fdc3cb8eb90970bd488b8c3906750376e46764
X-Patchwork-Hint: ignore
Message-Id: <20240911194152.BBCD786FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: add option to build the
 AAC codec in spa-bluez
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=57fdc3cb8eb90970bd488b8c3906750376e46764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows for more precise control of the AAC codec feature,
instead of it being silently enabled if the fdk-aac library happens
to be built earlier, or disabled otherwise.

Also remove the -Dbluez5-codec-opus=disabled option in the case where
the entire bluez5 integration is disabled. -Dbluez5=disabled implies
that all codecs are also disabled.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pipewire/pipewire.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index f0f3cd847c..481ef22d38 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -120,8 +120,14 @@ PIPEWIRE_DEPENDENCIES += opus
 else
 PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=disabled
 endif
+ifeq ($(BR2_PACKAGE_FDK_AAC),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-aac=enabled
+PIPEWIRE_DEPENDENCIES += fdk-aac
 else
-PIPEWIRE_CONF_OPTS += -Dbluez5=disabled -Dbluez5-codec-opus=disabled
+PIPEWIRE_CONF_OPTS += -Dbluez5-codec-aac=disabled
+endif
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
