Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED4DC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 02:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2203E60AC7;
	Sun, 12 Jul 2026 02:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pe9InbepgzSf; Sun, 12 Jul 2026 02:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3275A6083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783824883;
	bh=fPiFT0MjvxsEdmvLqmTxAXu78Owk1b7kTm3WZ2TPlmo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rk5FHFvhItQhsOhEIwEhiORHdN4N2tdNO1+vvepFls81+Y6vUIZnXqA/z/JRdvgHK
	 rN7NVOmcky8XJQjWVI3Odj2kzBdg8kF+DjLqCTKjvpE+4vo3kh7NvW2gHFqqtDe2dv
	 e4giwL+edWm2xd8OB8WQM1Qfsbn1ggkbugwhuJe8e5fw0WPd5ptoMVuj4p5UlDZO7v
	 JQo8CTZe/YKPsOOeV+L2GnTIv4V/zE1A8qhgkVCHtXOhAoBkZjnqOm/jl8giYlxY21
	 Ugoh8S2aF4pX9fzY0RIYBz/VIbYBPHVAbtZCPDgNLjMhW8gkkkH6nye25uINPuKyDy
	 fPeFnZcZvkrbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3275A6083C;
	Sun, 12 Jul 2026 02:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 641A62EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 02:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5567E813ED
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 02:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QksesTBxcPVK for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 02:54:39 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25D02813A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25D02813A6
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25D02813A6
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 02:54:37 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id E7B94BDE0BAF;
 Sun, 12 Jul 2026 04:54:33 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 02:54:33 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <c06472fc-be68-49ce-9a8f-a8411be6d520@gmx.de>
References: <20260709110822.305873-1-br025@umbiko.net>
 <c06472fc-be68-49ce-9a8f-a8411be6d520@gmx.de>
Message-ID: <6bcdaf687d3e8f1ad510222635953536@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783824874; bh=WYhHCbw30riOptquAfW60cM+GXZK3z7Wv+X4QUh3vjQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=zjpl9hTWVk6jER5OBDLCTaJh3msPdoZyXp+GJD3qk5iTTn8rAyxSnI14o7OVycK7w
 trGeJkIspmiBtMURG6mjYq2GEjYXZLGBH5GzmBXiJ9DYTrcQrZtzbR54eJpGgsqv4N
 LhawlNZ+HapDH0uAJip+JM30bqWBJcy3MOH+IOBs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=zjpl9hTW
Subject: Re: [Buildroot] [PATCH v2 00/11] add runtime test for mpd
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

Hi Fiona,

On 2026-07-11 10:24, Fiona Klute wrote:
> Hi Andreas,
> 
> thank you for working on these tests!
> 
> Am 09.07.26 um 13:08 schrieb Andreas Ziegler:
>> Testing MPD in a real world situation is fairly straightforward: 
>> build,
>> deploy, play some music. Representing this simple test within a test
>> framework is quite complex.
>> 
>> I tried to break down my simple test case into a few atomic steps that
>> interact with MPD via the built-in protocol. The necessary test data 
>> was
>> generated with ffmpeg and imagemagick and is royalty-free :-D
>> 
>> In good old usenet tradition, test data had to be split in archive
>> chunks, to overcome the limitations of the mailing list. The data will
>> be re-combined in a post-build script.
> 
> I don't like the idea of adding a bunch of binary test data to the 
> repository. Why not generate it as part of the test or build? Sure, 
> adding ffmpeg/imagemagick to the config would make the build heavier, 
> but having a clearly visible generation command and no binary data in 
> the repository seems more important to me.

No, I do not recommend to add test data generation to the test.

Both ffmpeg and imagemagick are highly complex applications, in at least 
the same order of complexity as MPD. Adding them to the test would 
introduce additional points of failure, which are not relevant to the 
actual test objective. Test data should be invariant; if it changes with 
every test, results might not be comparable.

Buildroot has a mirror somewhere for supplying source packages. Could 
the test data be put there? If all else fails, I might put the data in 
some repository, and download it during build.

Kind regards,
Andreas

> Best regards,
> Fiona
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
