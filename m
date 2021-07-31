Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF06C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:39:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7535560FE7
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7535560FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2EB831C1;
	Sat, 31 Jul 2021 20:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdeBY8EniGaJ; Sat, 31 Jul 2021 20:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB8E831AE;
	Sat, 31 Jul 2021 20:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82FE41BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70429400F5
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKQPBAwyNoyX for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:39:30 +0000 (UTC)
X-Greylist: delayed 05:52:33 by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47C03400C3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:39:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D1E01827C4; Sat, 31 Jul 2021 22:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627763967; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=YKV5QaEIKiuffgCsevezfaQAg2yjsTFRDvYPk8/5zX4=;
 b=QpmPWERwwNZsN/l8FqNzFZvZw+yrHCPKJSJDJIRthHhk+s4vkZIRA8Zs260VCItI+UghmZ
 cTeKts1vajpr6uCmSbg2TPXh03JLmttHzEzT7G2wsIZN7vozPqBxOv93nXQPDudhKJVxfS
 ipcakfDA373LKjRvscUWdIzjzJbYC2s=
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:38:02 +0200
Message-Id: <20210731203814.68125-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH 00/10] Slimming BlueZ defaults
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

As discussed in the follow-up of the previous patches to the BlueZ Package
I did the following:

* Make the build of the tools optional
* remove the 'default y' line from the new options
* skim threw the packages and see which ones would require the now optional plugins

None of the modified packages failed to build with the new defaults. But looking at
what these packages do at runtime I suppose they require either the audio or the HID
plugins.

If anyone knows one (or more) of those altered packages in detail I would be happy
to get feedback on the changes.

What I left out for now is how to communicate these changes to the user on upgrade.

Regards,
Michael

Michael Nosthoff (10):
  package/bluez5_utils: make tools optional
  package/bluez5_utils: drop default y
  package/cwiid: select BlueZ HID plugin
  package/bluez-alsa: select BlueZ audio plugins
  package/brltty: enable bluez HID plugin
  package/gstreamer1/gst1-plugins-bad: enable BlueZ Audio
  package/pulseaudio: enable BlueZ Audio Plugins
  package/pipewire: enable BlueZ Audio Plugins
  package/supertuxkart: enable BlueZ HID Plugin
  package/kodi: enable BlueZ Audio and HID plugins

 package/bluez-alsa/Config.in                  |  1 +
 package/bluez5_utils/Config.in                | 22 +++++++++++++------
 package/bluez5_utils/bluez5_utils.mk          | 13 +++++++++--
 package/brltty/Config.in                      |  1 +
 package/cwiid/Config.in                       |  1 +
 package/gstreamer1/gst1-plugins-bad/Config.in |  1 +
 package/kodi/Config.in                        |  2 ++
 package/pipewire/Config.in                    |  1 +
 package/pulseaudio/Config.in                  |  1 +
 package/supertuxkart/Config.in                |  1 +
 10 files changed, 35 insertions(+), 9 deletions(-)

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
