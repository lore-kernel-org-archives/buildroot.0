Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604A4C5DF74
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 03:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186E840872;
	Tue, 18 Aug 2026 03:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrrFPaOJ1Dln; Tue, 18 Aug 2026 03:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 949F0405E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787022667;
	bh=UbZ8arBaEG/PKSJdk9cYOC5o729pUhjEd8coEglocfs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DxQUOenHuUYXdQ0/bUHaDET9mXQXqKupl6eVIjvtA3+24+IW+8HPtr2Ctr1BQYkkk
	 BWoqBVlOq4cg/danmcA6aqMjhRNKsMD+tbECS6Et51t1cyjJ7lETcYDoqcYrPRFCzk
	 B2rXBBBpLd4T0/MXvBrZXEgfmkX2SzD/0/cc47e6rdGiDXl2SuB8SEksm1do/+n9pA
	 QfRBvZSpiRsGJ0ebvIZPqAskZdiQj/7Nqv30y/0WxhMt+sgZgoUXMl+7u4glPfST3u
	 N27CCsLX0t5a0z6LESTybssAHpokgE+NtGwIMo/TaVPRf6Q3QhX8PBt2yi04cIntLp
	 1kXXBU3l1PMOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949F0405E6;
	Tue, 18 Aug 2026 03:11:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FC27322
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 03:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4148081080
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 03:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0kPLXG2uHii for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 03:11:04 +0000 (UTC)
X-Greylist: delayed 84192 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 18 Aug 2026 03:11:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E424781069
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E424781069
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=GHC5hALg
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E424781069
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 03:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1787022658; bh=Zboeerii0GbN0TmlB6j6nAUqUT1vo9ES8ivDx5cmQV0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GHC5hALgVJdEWvmLNHzAd0YymBPyRdNg7qtTV2eRqpty1snx/JOGKrrhWTT3FcxZ5
 XIEKytF+vTAUfG0OoUgLlNZ+jNHo8Pf6/kuQ+1+DsqYucm//JZSAlR7XNCCz37PGFg
 0W4qcW21SkaHqb+/DsuqCBF4d+pk2asYB/AxdA1Q=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 2119CBDE0C49;
 Tue, 18 Aug 2026 05:10:58 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 18 Aug 2026 03:10:57 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <aoL6p57YFJpr0OO7@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-5-br025@umbiko.net> <aoDASYp4PBJt3wCJ@windsurf>
 <46e113718286cc5ee2fdac7ca8403087@umbiko.net> <aoKxCBccdMnLPUR_@windsurf>
 <5cefbba7714f52842a7b47d665394e61@umbiko.net> <aoL6p57YFJpr0OO7@windsurf>
Message-ID: <30f8274745a3e45eefcc8d069fe77613@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v2 04/11] support/testing: add test data for
 mpd (1/6)
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

Hi Thomas, Everyone,

On 2026-08-17 12:14, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, Aug 17, 2026 at 11:27:54AM +0000, Andreas Ziegler wrote:
> 
>> Because of legal issues I cannot use (copyrighted) existing music 
>> files. I
> 
> I'm sure you aware that there is music that you're allowed to
> download? Some music is in the public domain, and some music is
> distributed under Creative Commons or other "open-source" licenses.

Yes, some of them even conveniently in github archives. But all of them 
untagged. Mpd uses the tags to structure the music library it build and 
untagged files all end up in unknown artist/unknown album.

>> do not like online download sites, because it's difficult to predict 
>> what
>> you get. So I prepared some audio files, containing test signals, 
>> which are
>> tagged to resemble music files. The whole thing needs a structure (aka
>> directory tree), because it is also intended to validate correct 
>> indexing by
>> mpd.
> 
> Then those test signals can be generated as part of the runtime test
> itself, no?

Fiona had the same idea, but I refuse to add the extra complexity of 
adding ffmpeg and imagemagick to a test that was originally intended to 
test the correct function of mpd. This approximately triples the 
potential failure rate (complexity of added components is of the same 
magnitude as mpd).

I am tempted to just throw out the whole test case, and just check if 
the mpd process was started ... It is not very indicative for proper 
functionality; most issues I usually have with mpd (apart from failed 
builds) are related to refusing to play music, misplaced tags and not 
showing albumart.

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
