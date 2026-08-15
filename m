Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3E9C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 17:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9F4B606C1;
	Sat, 15 Aug 2026 17:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rFlY8Q5pGvH; Sat, 15 Aug 2026 17:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C75460655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786813744;
	bh=R1lRzCpFmaP+U9F6buSq5HZtH69/9dq5aNavlUEYYP8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cMMRYn9JSKqkHql6QtMC5TW2+mwC92t2P3cYIPSmLlD5K27WTHRUQuPDibb07GUxF
	 G/1jWiY851HECBshNrEXJGqmJkxlp+6keq6iC4/BeKtGtGcaUaWqZ16pZDHWgDH4Fr
	 TTAPOHvP6fW5wsVfQx/oMpP/TQozfID6gjGPrj0A4mgPNM647XTPmW1kLHx2NChRKq
	 ID06l9GiF94PtQu95a4POwIaScw3msZtcpWtgYDUv7Fq9SnHYcz38sjsBaYmloUG6B
	 dns16CBdYnD3Jsunc+xw1d6abcqr0Fy5cTgIqCn9MAcP3E/bzWKjDYCEMYmhrdEvpk
	 RkgkRBniSyjRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C75460655;
	Sat, 15 Aug 2026 17:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C46523F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E5A1400A6
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ebkc0VMWIRB for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 17:09:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E75FE40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E75FE40026
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E75FE40026
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:08:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 758DE1A1670;
 Sat, 15 Aug 2026 17:08:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CF22604AA;
 Sat, 15 Aug 2026 17:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DBC2E11C4F5D6; 
 Sat, 15 Aug 2026 19:08:51 +0200 (CEST)
Date: Sat, 15 Aug 2026 19:08:50 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <aoCchJJvG9qP4NAs@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-2-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709110822.305873-2-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 01/11] package/mpd: install provided
 sample configuration file as mpd.conf
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Thu, Jul 09, 2026 at 01:08:05PM +0200, Andreas Ziegler wrote:
> The configuration file supplied by Buildroot is only a sample; it will not
> start MPD on a default installation. Usually a custom mpd.conf is supplied
> in a rootfs overlay.
> 
> Drop the Buildroot configuration file and install the sample supplied by
> MPD instead, it is more complete, contains useful examples and is updated
> regularly.
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

I am not conviced by this change. Indeed, doc/mpdconf.example in the
mpd code base is basically almost entirely commented out. The options
that are set by our package/mpd/mpd.conf are not set by
doc/mpdconf.example (like log_file, music_directory, etc.).

So I am not sure to understand why doc/mpdconf.example is better, as
it actually doesn't configure anything. The only not commented lines
are:

input {
        plugin "curl"
}

which is clearly a lot less than:

music_directory		"/var/lib/mpd/music"
playlist_directory	"/var/lib/mpd/playlists"
db_file			"/var/lib/mpd/database"
log_file		"/var/log/mpd.log"
pid_file		"/var/run/mpd.pid"
state_file		"/var/lib/mpd/state"
bind_to_address		"any"
bind_to_address		"/var/lib/mpd/socket"

in our mpd.conf.

So overall I don't understand why it is an "improvement". Could you
clarify?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
