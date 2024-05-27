Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B00C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4196F60619;
	Mon, 27 May 2024 14:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ED4QI-rTuixx; Mon, 27 May 2024 14:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC6D60690
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC6D60690;
	Mon, 27 May 2024 14:43:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00A0F1D1DE8
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE4DF81E05
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vySDh998OcIU for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7C0181E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C0181E03
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7C0181E03
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:43:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0F654000C;
 Mon, 27 May 2024 14:43:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBbZM-005T2M-0Z;
 Mon, 27 May 2024 16:43:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240506205250.1264901-1-fontaine.fabrice@gmail.com>
Date: Mon, 27 May 2024 16:43:24 +0200
In-Reply-To: <20240506205250.1264901-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 May 2024 22:52:49 +0200")
Message-ID: <87r0dn9uyb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: fix build with
 libgpiod2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > openocd is not compatible with libgpiod2 resulting in the following
 > build failure since the addition of libgpiod2 in commit
 > 57391fad2e619395340b81957ddceab1b1df2e20:

 > src/jtag/drivers/linuxgpiod.c: In function 'helper_get_line':
 > src/jtag/drivers/linuxgpiod.c:283:19: error:
 > 'GPIOD_LINE_REQUEST_DIRECTION_INPUT' undeclared (first use in this
 > function); did you mean 'GPIOD_LINE_DIRECTION_INPUT'?
 >   283 |         int dir = GPIOD_LINE_REQUEST_DIRECTION_INPUT, flags = 0, val = 0, retval;
 >       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >       |                   GPIOD_LINE_DIRECTION_INPUT

 > Fixes: 57391fad2e619395340b81957ddceab1b1df2e20
 >  - http://autobuild.buildroot.org/results/7195e8b76350f26ab3b963702d88b254512e6928

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
