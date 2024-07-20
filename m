Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7013AC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF3740204;
	Sat, 20 Jul 2024 21:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R1-ZQ2Y0CVY; Sat, 20 Jul 2024 21:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C3284023C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3284023C;
	Sat, 20 Jul 2024 21:04:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 283EF1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A4981865
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 824vDXs6dmoQ for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5957C80B36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5957C80B36
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:04:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D68286E6E; Sat, 20 Jul 2024 21:04:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:03:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e66a1a5e864ba78f78b01ea373bbb6ad31f0cba4
X-Git-Newrev: 16598146fbbbf492283f7b42d7c02e0d9fde2000
X-Patchwork-Hint: ignore
Message-Id: <20240720210453.3D68286E6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkiostream: fix build with
 alsa-lib
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

commit: https://git.buildroot.net/buildroot/commit/?id=16598146fbbbf492283f7b42d7c02e0d9fde2000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select BR2_PACKAGE_ALSA_LIB_MIXER if needed to fix the following build
failure with alsa-lib raised since the addition of the package in commit
fab48302865e5c0c98d91b696bc90e75e38189bb:

In file included from ../include/ALSA/MixerElement.H:20,
                 from ../include/ALSA/Mixer.H:20,
                 from ../include/ALSA/ALSA.H:56,
                 from ALSAControlMonitor.C:19:
../include/ALSA/MixerElementTypes.H:26:5: error: 'snd_mixer_selem_channel_id_t' does not name a type
   26 |     snd_mixer_selem_channel_id_t channel; ///< The ALSA channel ID
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
 - http://autobuild.buildroot.org/results/6be71c9fbdccbdf4f5e540bafa748dda833aeedb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtkiostream/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
index 17480b8ff8..1d1ec27346 100644
--- a/package/gtkiostream/Config.in
+++ b/package/gtkiostream/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GTKIOSTREAM
 	bool "gtkiostream"
 	depends on BR2_INSTALL_LIBSTDCPP # eigen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_EIGEN
 	select BR2_PACKAGE_FFTW
 	select BR2_PACKAGE_FFTW_DOUBLE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
