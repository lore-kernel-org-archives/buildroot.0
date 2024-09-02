Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E2FCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 12:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75316081A;
	Mon,  2 Sep 2024 12:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmMLUnCBCLvT; Mon,  2 Sep 2024 12:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC8560839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC8560839;
	Mon,  2 Sep 2024 12:09:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4D101BF40F
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B228140640
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUBSURNqIAAh for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 12:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C194F4060E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C194F4060E
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 12:09:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC4AE869B8; Mon,  2 Sep 2024 12:09:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 13:24:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4bb569bccaeaf3adfc9d421075cd6cdfd2e5f4f7
X-Git-Newrev: fa638cc8de60f6e443509c9f9bcd0fd2889ab685
X-Patchwork-Hint: ignore
Message-Id: <20240902120931.BC4AE869B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ffmpeg: add
 optional dependency on jack
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa638cc8de60f6e443509c9f9bcd0fd2889ab685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add automatic JACK audio sound server support to ffmpeg if either JACK
or JACK2 are enabled.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 15e411d800999a70cc04a8d506ead40ea3dba210)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ce285bcc60..89c99f4b64 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -86,6 +86,16 @@ else
 FFMPEG_CONF_OPTS += --disable-ffplay
 endif
 
+ifeq ($(BR2_PACKAGE_JACK1),y)
+FFMPEG_CONF_OPTS += --enable-libjack
+FFMPEG_DEPENDENCIES += jack1
+else ifeq ($(BR2_PACKAGE_JACK2),y)
+FFMPEG_CONF_OPTS += --enable-libjack
+FFMPEG_DEPENDENCIES += jack2
+else
+FFMPEG_CONF_OPTS += --disable-libjack
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
