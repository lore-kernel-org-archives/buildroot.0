Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164F6C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D259E41E82;
	Thu,  9 May 2024 16:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLly68cnIbtM; Thu,  9 May 2024 16:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950B141E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950B141E85;
	Thu,  9 May 2024 16:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B71171BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B5D8195C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2-1CMSGrv7R for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C99C7817B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C99C7817B1
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B324F86D01; Thu,  9 May 2024 16:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:48:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92117ac3915ec64f010781d93b05034b43e9e381
X-Git-Newrev: e99c3c413c201417a91e3596888cdcc49d9badb3
X-Patchwork-Hint: ignore
Message-Id: <20240509164940.B324F86D01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix build with ffmpeg
 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e99c3c413c201417a91e3596888cdcc49d9badb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-mod_av-fix-build-with-ffmpeg-6.0.patch    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch b/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch
new file mode 100644
index 0000000000..bd38d76d85
--- /dev/null
+++ b/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch
@@ -0,0 +1,48 @@
+From 2e75bb8b2c7f70c5d16c9e3d14b1427f4eb80c9c Mon Sep 17 00:00:00 2001
+From: Korynkai <matt@qmxtech.com>
+Date: Thu, 17 Aug 2023 21:10:31 +0200
+Subject: [PATCH] mod_av: fix build with ffmpeg 6.0
+
+Upstream: https://github.com/signalwire/freeswitch/issues/2202
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/applications/mod_av/avformat.c | 2 ++
+ src/mod/applications/mod_av/mod_av.h   | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
+index 69475c169f..0a1662aed6 100644
+--- a/src/mod/applications/mod_av/avformat.c
++++ b/src/mod/applications/mod_av/avformat.c
+@@ -455,6 +455,7 @@ static int mod_avformat_alloc_output_context2(AVFormatContext **avctx, const cha
+ 	}
+ 
+ 	s->oformat = oformat;
++#if (LIBAVFORMAT_VERSION_MAJOR < LIBAVFORMAT_N)
+ 	if (s->oformat->priv_data_size > 0) {
+ 		s->priv_data = av_mallocz(s->oformat->priv_data_size);
+ 		if (!s->priv_data) {
+@@ -468,6 +469,7 @@ static int mod_avformat_alloc_output_context2(AVFormatContext **avctx, const cha
+ 	} else {
+ 		s->priv_data = NULL;
+ 	}
++#endif
+ 
+ 	if (filename) {
+ #if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(58,7,100))
+diff --git a/src/mod/applications/mod_av/mod_av.h b/src/mod/applications/mod_av/mod_av.h
+index a89e6cb8f7..ef9bd48d73 100644
+--- a/src/mod/applications/mod_av/mod_av.h
++++ b/src/mod/applications/mod_av/mod_av.h
+@@ -42,6 +42,7 @@
+ 
+ #define LIBAVCODEC_V 59
+ #define LIBAVFORMAT_V 59
++#define LIBAVFORMAT_N 60
+ #define LIBAVUTIL_V 57
+ 
+ struct mod_av_globals {
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
