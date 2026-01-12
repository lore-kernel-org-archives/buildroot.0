Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA2ACF45C8
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6244161129;
	Mon, 12 Jan 2026 21:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rNMb8uDGm8N; Mon, 12 Jan 2026 21:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6698361108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768251793;
	bh=jkd8wPRT949PoEvbnpiJTSExGLqhaKmG3FT4xx9qM3M=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Zexrn3wpMJYHnlCRMIiE1p26pc+qen22O7XHmN8MH6UiuD08qEOZU5P7wJkd/W8Ge
	 gnP0+9zBfSq+eVs/i9RjW4kW1pq1TMuIP8g5T3meXY3M8byFYNx0d4K6V6Ke4JMSXY
	 tf+u7rDB3ripUlWmYJCzUXrA0huclEWkFnkSMibsqkHjSmj3EuYgo4SRbmsEbfKtfC
	 JI0PGg68ogafKGnLz088sAcNGWu0h9H4SzuMiCWcZnIbwXG0zHwAvEtgVoc66JhplL
	 fCVcPsnt+my1O2FfjHIUDs4LWgaMMUQ0QFUkZHVb5oo74+MvQgxeKD7Xic3oEtpQuq
	 SmHn4Lwt2R81g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6698361108;
	Mon, 12 Jan 2026 21:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4DA18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E432784293
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaVUG-yXgtrv for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 21:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63852842A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63852842A3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63852842A3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:03:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.98.173]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1wBi5j0Kxb-00kQRC; Mon, 12
 Jan 2026 22:03:00 +0100
Message-ID: <d6445e62-1270-405e-b88a-8dca26a88536@gmx.de>
Date: Mon, 12 Jan 2026 22:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250929092431.8974-1-fiona.klute@gmx.de>
 <20260101181830.35ccf7c3@windsurf> <87wm1xn0sp.fsf@dell.be.48ers.dk>
 <20260104113924.204d1799@windsurf> <87seclmrhw.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <87seclmrhw.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:S11JHlSTu6bOhAod/crO2Gzn3DRKnvX/32QJ5c+MnkDxrWzVRxr
 WHumwwCuN15lKRhOPQTTogQ/vWcKpoU5nwK0WYtbv3CQ1AYe+YFBZgZ3LNiOjWEQfoa2+sa
 Ml87I33b04FpxuojGEeFSdvkLLiBDs15x32WCXtOt8+/i6IEoysZq3Qg8n7jOyDio0Y4BFa
 odh8idDs9LYVwsddFoiGQ==
UI-OutboundReport: notjunk:1;M01:P0:lhUuTRfM6xc=;V/G1mQoNk6sFLmjGPuXi4y17OXH
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1768251780; x=1768856580; i=fiona.klute@gmx.de;
 bh=Hwm4brXkg4t3VMJ0UuL0Es/jmw1JN5cPdLfWxydsr9Y=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=D9AMe6Y19VOthgn8ZGJ48Q6yqhq35i3QLzsZrg6yUc/kOWrQs+xCrrYwCB3TG4B+
 AaHmrlpEZHji+2CaI8XLVc49oAJ1pJ55guIBnOI3s1gKGQuMwc7o2fkt8x4kQ2DYw
 DpCNL4t8WiQFlkfdmP/oLXQ4rXpoTY/DMVyjYu/925x3VpHusAMKhvKH8kvZJE35f
 5Wk4hE17PzBKN1CtcVXPlUguosm/2gz4YHyjt8UMNpGx1z3TlOJF+lcybSArQTHVV
 axHRgEFYc3ezzp6FKsKAmR0CloAB627DWlYOdyb+Db6Xhc8JiU/1rSS9pbg0J0T4e
 5KEo7Mu5haiXnXEQ3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=D9AMe6Y1
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: add check-package-external
 target
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.01.26 um 14:34 schrieb Peter Korsgaard:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
> Hi,
> 
>   > Still maybe we should consider ensuring that check-package validates
>   > BR2_EXTERNAL, and somehow address these concerns?
> 
>   > I think (1) is pretty moot, if you're not concerned about check-package
>   > warnings, don't run it at all.
> 
> Or run make BR2_EXTERNAL= check-package

Good point. I usually use different output dirs for my targets, so I 
could just run directly in the Buildroot repo to run without any 
external trees.

>   > Regarding (2): probably a matter of merging BR2_EXTERNAL support for
>   > docker-run.

Definitely wouldn't complain about that, after almost a year and half I 
was wondering if it's ever going to happen. ;-)

>   > Regarding (3): we could also update our Docker container.
> 
> Yes, agreed. I think it makes sense to move to Debian 13 now.
No complaints here either, but as updates come in there may be new 
differences.

My main concern here is that make will fail after the first failed 
command, so if there are check-package issues in Buildroot (for example 
because using a different version than in the container) checks for 
external trees won't run (already an issue with multiple external trees 
with my original patch). I'm not aware of a built-in tool in make to 
handle that (i.e., record non-zero status codes, return an error if 
there are any).

Would it be acceptable to record error codes to a file instead, vaguely 
similar to how legal-info does it (but probably simpler), possibly to do 
a non-zero exit if there are any?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
