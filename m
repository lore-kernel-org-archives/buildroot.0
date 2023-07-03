Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C690CC30654
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 772CC81C81;
	Mon,  3 Jul 2023 19:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 772CC81C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKYJwNJ1cBen; Mon,  3 Jul 2023 19:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74AE81DF1;
	Mon,  3 Jul 2023 19:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B74AE81DF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 911661BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8B1405FD
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8B1405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xsl1PRbe5Yp for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB9ED40420
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB9ED40420
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9916B8648C; Mon,  3 Jul 2023 19:16:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:16:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 200d371d5ec65a087ecb7ec2a75a25938fee73da
X-Git-Newrev: f80063aecbc80f3154271febb60fe797fdeb3b03
X-Patchwork-Hint: ignore
Message-Id: <20230703191652.9916B8648C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: allow a samplerate
 conversion for audio playback
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

commit: https://git.buildroot.net/buildroot/commit/?id=f80063aecbc80f3154271febb60fe797fdeb3b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the case of bluetooth audio thet incoming audio stream will be
coming from bluetooth devices at varying sample rates like (44.1, 48,
96, 192 kHz) and the odds of a sound device matching that samplerate
exactly is a bit slim. So in the case of a bluez audio playback the
system will need to do a samplerate conversion.

Thus when enabling bluez-alsa and the alsa plugins select libsamplerate
to support the shift from the incoming samplerates to an often fix-rated
audio device.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 73ae3d5333..d70172646f 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -13,6 +13,9 @@ config BR2_PACKAGE_BLUEZ_ALSA
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_SBC
+	# samplerate ALSA plugin is needed for proper sample rate
+	# conversion with Bluetooth devices
+	select BR2_PACKAGE_LIBSAMPLERATE if BR2_PACKAGE_ALSA_PLUGINS
 	help
 	  Bluetooth Audio ALSA Backend.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
