Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF7C5DF6D
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 03:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B63B6060E;
	Mon, 17 Aug 2026 03:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QYadtdMQSvW; Mon, 17 Aug 2026 03:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA539606B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786936716;
	bh=w16Wp0HF4biJuJN88JoITuopON+zxJNb16NSEaot/ic=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2r9e8yUQFVZSSoz6vNHa8VAu9RdF7gYiDOg97ZujHE1xH/6DYieA/6s3+liBZrer
	 1r+hEz6dwta1WRg/xPWD8C32jDOtY1gaEvyYoMcdKL/ZYJ7wRveviYc2He4RS8xXp4
	 vhRl6iqazvSTNrpanNivA922SnTwnlBrcNZFsRwOARSi1pdahZN30KWalXYZHkVwpk
	 d8z4S6jx+kmOJOZl/6bv+PJ2EFJB+DPZKld7W221LqpgnzAkEeThEhYMuquftSgG6Y
	 tebkeLzuXCrHvchVsalsQ5sZvUxiT+glb2bJj3UPLKk95Tuv1Q7xZnFIUrBM+nvCex
	 ICPEiw/i4Vl3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA539606B1;
	Mon, 17 Aug 2026 03:18:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 905242EF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8279F60611
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heOR83E5Dk1x for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 03:18:32 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF4166060E
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF4166060E
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=QngD81mQ
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF4166060E
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1786936706; bh=ZkGNUAZGIKT+UfGEAMU4Uz4Qcy+7yzc0vETWFW+QZCk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QngD81mQ+ijNTaihT1lW7yHCd+Qc3BLnB6CtL9FKCHHu7ibbSUlrpxTkCd1WSd9D+
 z39709OdudxwhXlxgfBDbUOOe1DgTaR39JpUkvg6E/x6XonCnkQZYHuTsDdpf1cdZe
 XjgNeETAbj9kl3SPJtOKMgC90Hji+nsLsBvyOz30=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id A383ABDE078D;
 Mon, 17 Aug 2026 05:18:26 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 03:18:26 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <aoCchJJvG9qP4NAs@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-2-br025@umbiko.net> <aoCchJJvG9qP4NAs@windsurf>
Message-ID: <c696334dc51a1599e864f7104f5a9eb9@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Everyone

Thank you for the review.

On 2026-08-15 17:08, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Thu, Jul 09, 2026 at 01:08:05PM +0200, Andreas Ziegler wrote:
>> The configuration file supplied by Buildroot is only a sample; it will 
>> not
>> start MPD on a default installation. Usually a custom mpd.conf is 
>> supplied
>> in a rootfs overlay.
>> 
>> Drop the Buildroot configuration file and install the sample supplied 
>> by
>> MPD instead, it is more complete, contains useful examples and is 
>> updated
>> regularly.
>> 
>> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> 
> I am not conviced by this change. Indeed, doc/mpdconf.example in the
> mpd code base is basically almost entirely commented out. The options
> that are set by our package/mpd/mpd.conf are not set by
> doc/mpdconf.example (like log_file, music_directory, etc.).

Reason for switching was just because the Buildroot configuration does 
not start mpd, due to a missing output section [1]. Rather than fix it I 
would like to switch to a more complete example.

It is not more than an example, since a working mpd instance needs a 
custom configuration file supplied via overlay or post-build script, 
there are too many use cases and possible hard- and software layouts. 
The default script would normally never be used, unless someone just 
started to add and configure mpd. A highly complete and commented 
example would definitely help. It is also kept up-to-date automatically.

> So I am not sure to understand why doc/mpdconf.example is better, as
> it actually doesn't configure anything. The only not commented lines
> are:
> 
> input {
>         plugin "curl"
> }
> 
> which is clearly a lot less than:
> 
> music_directory		"/var/lib/mpd/music"
> playlist_directory	"/var/lib/mpd/playlists"
> db_file			"/var/lib/mpd/database"
> log_file		"/var/log/mpd.log"
> pid_file		"/var/run/mpd.pid"
> state_file		"/var/lib/mpd/state"
> bind_to_address		"any"
> bind_to_address		"/var/lib/mpd/socket"
> 
> in our mpd.conf.

The commented-out configuration items are not unusual, many default 
configurations contain all available parameters with their default 
values, all of them commented. Unless someone changes anything, the 
default is used. (one example: /etc/ssh/sshd_config). The single 
uncommented entry for libsamplerate is probably a typo.

The Buildroot mpd.conf is from 2013; at that time it represented the 
only valid topology for mpd: both database and output on one machine. 
Since version 0.20, mpd can be configured as server (database, no 
output), client (remote access to database, output) or standalone. You 
might also use mpd as a streaming only solution, with input exclusively 
from the internet. So which is the correct configuration to use for 
Buildroot?

There is one issue that still prevents the mpd supplied sample 
configuration to run mpd properly: not setting a value for pid_file 
prevents the file to be used (OK for a systemd install, not OK for 
sysV), which results in mpd refusing to terminate gracefully.

Mitigation: inject pid_file and log_file via POST_BUILD_HOOK for builds 
without systemd.

Thoughts?

> So overall I don't understand why it is an "improvement". Could you
> clarify?
> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Kind regards,
Andreas

[1] Actually this changed in the latest version, mpd now auto-detects 
alsa devices, if present.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
