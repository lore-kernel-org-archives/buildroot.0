Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D732C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCCBD41A40;
	Fri, 12 Jul 2024 20:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Rwhas4jNKqW; Fri, 12 Jul 2024 20:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EDF41A4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EDF41A4A;
	Fri, 12 Jul 2024 20:11:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A38081BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F77B41A3F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzU4YgCAzOkB for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A92C41A38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A92C41A38
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:11:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85A5C86189; Fri, 12 Jul 2024 20:11:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:10:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceba36f28bc790af40508ed1011e4e88d55f6d27
X-Git-Newrev: e6d5cdcd5b45d812a6f091e78b51212a46682c90
X-Patchwork-Hint: ignore
Message-Id: <20240712201148.85A5C86189@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mediastreamer: fix patch fuzz
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e6d5cdcd5b45d812a6f091e78b51212a46682c90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, mediastreamer fails to build with output:

    Applying 0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch using patch:
    patching file src/utils/ffmpeg-priv.h
    Hunk #1 FAILED at 102.
    1 out of 1 hunk FAILED -- saving rejects to file src/utils/ffmpeg-priv.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
index fc66e9a9f9..9fd3fda2ec 100644
--- a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
+++ b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
@@ -19,6 +19,8 @@ https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901735
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Fabrice: updated for 4.3.1]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/utils/ffmpeg-priv.h     | 4 ++++
  src/videofilters/nowebcam.c | 4 ++--
@@ -28,8 +30,8 @@ diff --git a/src/utils/ffmpeg-priv.h b/src/utils/ffmpeg-priv.h
 index c0745a9a..d59ea0e1 100644
 --- a/src/utils/ffmpeg-priv.h
 +++ b/src/utils/ffmpeg-priv.h
-@@ -102,6 +102,10 @@ static inline int avcodec_decode_video2(AVCodecContext *avctx, AVFrame *picture,
- #endif
+@@ -115,6 +115,10 @@
+ extern "C" {
  #endif
  
 +#ifndef AV_INPUT_BUFFER_PADDING_SIZE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
