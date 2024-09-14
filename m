Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1404C02185
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2D02841A6;
	Sat, 14 Sep 2024 09:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WftVJFvqDd16; Sat, 14 Sep 2024 09:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB62842FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB62842FC;
	Sat, 14 Sep 2024 09:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAE6C1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7EB24022B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qN6hKufygpjV for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 232D040179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 232D040179
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 232D040179
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:00:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D8D6FF808;
 Sat, 14 Sep 2024 09:00:38 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:00:36 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240914110036.13d08b21@windsurf>
In-Reply-To: <CAEpB38MKaFVyTLAwjsT6uGEU+w7L9MpUg31Oftqb9oaP2DNPiA@mail.gmail.com>
References: <CAEpB38MKaFVyTLAwjsT6uGEU+w7L9MpUg31Oftqb9oaP2DNPiA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726304438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaqlGeX8xnupkjEOJbe52uSdxxV3m9e5Ed+qrp9lLQ4=;
 b=fJySR61Nezya0Fo0aIfff4k9R7zUWUjRhba8EWp39OBy3RfeuAWZl2SNimIb0QGaX/Hjwm
 RrJmv+J0TJLcp8bkonD+QZ5N6tMoCZiBZajyIMxlcdSt/xju+aR648nZfBhrD+5MFbLxIA
 DKUI69xDts2pQfS/EPyfPKZrEhr8znDHdw82XliijevV90diYbSgQQk3tkvRrzBiMT60HS
 qqhQLRYeLkUybNpPSNBjcUSlTvqidBzeGLGBXx2Y1c/tyQ1qipnB807N5P87JYS8D7Lmee
 VtzHY3wcD+eocJBkVeeJ7p+D88rH9DiQcDjCayo+Lxpdn/LMd2o3u+Od07q3ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fJySR61N
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 go1.22.7
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 11 Sep 2024 21:18:58 +0000
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Fixes the following CVEs:
> 
> CVE-2024-34155: go/parser: stack exhaustion in all Parse* functions
> CVE-2024-34156: encoding/gob: stack exhaustion in Decoder.Decode
> CVE-2024-34158: go/build/constraint: stack exhaustion in Parse
> 
> https://go.dev/doc/devel/release#go1.22.7
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go-src/go-src.hash | 2 +-
>  package/go/go.mk              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I've applied, but your patch was badly line-wrapped. Could you make
sure to use "git send-email", or adjust your tooling?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
