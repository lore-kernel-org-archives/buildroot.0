Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6001C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B6D1403A7;
	Wed, 23 Nov 2022 10:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B6D1403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CK5jcA2X71tn; Wed, 23 Nov 2022 10:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64FA7402E8;
	Wed, 23 Nov 2022 10:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64FA7402E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D66FF1BF85D
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE8CD4017C
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE8CD4017C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4hdw-2jiyVd for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:51:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 831F3401A2
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 831F3401A2
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:51:21 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-141ca09c2fbso20353541fac.6
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 02:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JCE72XXJW/6wWa0vjBORgiInWHbsfYcrtod7mhE/TUI=;
 b=huDxbM375ys9a5Zcn47l9yFXQY+cOm8RViN3ZT8/hFv5WqliM3UNDryNAFrlhlZZZ5
 aDWWoJaH4eqdALoyDEE1xopMLy6Qxmdh2Gni73wKpLmbUTjqrBrEqUiixVbXU8coMDaY
 4XSaFQqP3XdL8gWrSSOTYtq7O0BvZLJ9Bv4zjabhLaykQ5Bchq2zp4Lim6CZ5tdzaUqG
 RTZMMVlo9H4ni3PuUqj0LH0ofOoHFD/tHHbxY+wKzik8IjHkju21E/8PPwd+jKcN7lY6
 xZL563G4wvlz6350xtN/KYAHtVYV7GPjj/PPjxXL6r3a4HjeHLNXpnWKzZK4tBV8J4ev
 TfJg==
X-Gm-Message-State: ANoB5pl3v/KODqgUIlKJpOcWMnNiQfXRcDJ1+LWAetwn9vP4+ijKRnTJ
 zmQZhyoZ2MfanPE3IvE0INiaUGgK19a2ytcdHqQpxQ==
X-Google-Smtp-Source: AA0mqf7zjYtM1fuw4XflANdT9nz14csu17jvRoeRajGVNv6XsiAIFwp7WKNAJrceIv9HoJfvi2DL/Myox8dCrlbipeo=
X-Received: by 2002:a05:6870:3e03:b0:142:fd0e:4c61 with SMTP id
 lk3-20020a0568703e0300b00142fd0e4c61mr5778922oab.289.1669200680305; Wed, 23
 Nov 2022 02:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20221031150235.12074-1-tim.gover@raspberrypi.com>
 <20221122233350.6b00aa83@windsurf>
In-Reply-To: <20221122233350.6b00aa83@windsurf>
From: Tim Gover <tim.gover@raspberrypi.com>
Date: Wed, 23 Nov 2022 10:51:08 +0000
Message-ID: <CAAvKZ67w5UuracsKmawh5GW01K4S2pe5WvRn5-_jYWLLNjVBRQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JCE72XXJW/6wWa0vjBORgiInWHbsfYcrtod7mhE/TUI=;
 b=e568LjRGBcYN7KR7fCR12W3xPlm3n3enq0meglN7BrJmqKvmYEkToVUNqEd8EuWlZF
 nXM3Sur11Ti5ATTypqVuX0B3GK3O8fXCzV4JH7S/1MF8bA9RTMmPYzHT0JWCHylo6ezW
 z1+wB8Usx8UDs1W3Vz/RNz1Nt1anVtpBmI+GZ/ZLTCMqxohwghJFd+u2KFj/rMbIIBfs
 8T4Z80EGehzOJR1BbdrCh92odBAGZ02l4HROFYh/o+58n4FgL+S9YCUdnOEvNHPa0+Ty
 f4v0Qtv5ZTD6d8XxaN/UF6X7ps8v3kjDyNnm9Fh2EyTC7pDBrvudtOw4ZJuvpNn7rV/J
 bS4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=e568LjRG
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add
 overlays/README
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Nov 2022 at 22:33, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Tim,
>
> On Mon, 31 Oct 2022 15:02:35 +0000
> Tim Gover <tim.gover@raspberrypi.com> wrote:
>
> > If a custom os_prefix directory is specified then the Raspberry Pi
> > firmware probes for the README file in overlays directory. If
> > this is not found then firmware will use the top-level overlays
> > directory which can be confusing if os_prefix is used in conjunction
> > with other filters to implement alternate boot behaviour.
> >
> > In Raspberry Pi OS the README file is always included to ensure
> > that the relevant documenation is in sync with the overlays. Rather
> > that including the entire file let's just include an emtpy file so
> > that overlays directory is consistent with the Raspberry Pi OS
> > APT package.
> >
> > From
> > https://www.raspberrypi.com/documentation/computers/config_txt.html#overlay_prefix
> >
> > Unless ${os_prefix}${overlay_prefix}README exists, overlays are shared
> > with the main OS (i.e. os_prefix is ignored).
> >
> > Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
> > ---
> >  package/rpi-firmware/rpi-firmware.mk | 1 +
> >  1 file changed, 1 insertion(+)
>
> I am not entirely sure how useful ${os_prefix} is in the context of a
> Buildroot generated system, but I guess having this empty README file
> doesn't hurt much, so I've applied to next. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks Thomas!

I appreciate that it's a bit of a corner case :) There's some work
going into making things like A/B booting a bit simpler (either
multiple boot partitions + swupdate/others or simple
directory/os_prefix based) but it's early days. Hopefully, if there is
common functionality that's useful for the wider audience that could
be upstreamed.

Tim





Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
