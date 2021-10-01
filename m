Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF69BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:54:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D631061246
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D631061246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749B284336;
	Fri,  1 Oct 2021 22:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9DJOmf6PngN; Fri,  1 Oct 2021 22:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2871D84447;
	Fri,  1 Oct 2021 22:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11EFE1BF3EF
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01194607AA
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGANS7g4MJ7x for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 22:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1EFA6071B
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 22:53:59 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id w68so5095778vkd.7
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 15:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iiGlbBiL5V4A2+DXS0gLlsLhGcfu2PNNG7NgP/6RXSY=;
 b=XdIxMvD8A+QNMCYkxXsP7pz3p78tAY82th2QUDguYkdR8lzVLpZh0Ucyin2DzKeKP9
 Pb76wcvkKuiEvtz3636HbRqoYzNX6L1vjYl8I5MiMDTecH57r/m+xeIX2JE8fG7FPO2B
 9N8WtxBUoXu/qxlG5DFs5DGbvfz3eAPBxWHj611moh5CxA7Co7P4h4WoZRVpMpZM2cUP
 E34TQR3IEZGv872lVrqjzuTihZgTwgJccCupf6JUU+vmomLdkbw7bjfHyYGoM3wQ0lIZ
 O4PVenpKNez9KaKq6GiYRrzl9DsEgmEhKLeClo6j+LWSri4voOfIRoyP2noKyr2hPDLN
 YKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iiGlbBiL5V4A2+DXS0gLlsLhGcfu2PNNG7NgP/6RXSY=;
 b=c6cycrNSi2vQGHtkdTxwWf3GO2xZUJb1zgQnjWrZrsvErutSmjiz54a82p2dyw66ID
 reia2eIyLcOyr5ZjlVJu5qSsFADAb2OO6txc+vo2XbBUPCE5GVJxuf1AJ+mHoQsy6PVx
 z34vH/MRwFA+/7EX1hmRW6tGiqBNtaRdCc5Jls+mR5Gts79qjKQtZDVAiQpoSXeK6T2N
 yxCTgLCzkhvPNKF5P0ksexVd+93CJrv+W/6MF0Du9P1vPSml8w37HvJtfJdxgTk0zaIm
 wplrwgqq3zsLjIrTKCjhrdaBJSgWMcp5SjvIaImrmaUiRD1aO/vw+IgRHQce+IwPhsXe
 n+ZA==
X-Gm-Message-State: AOAM530ESsk9BQjJGEPCIWj2vm7f4XG6Dl1fD8SUIGdF+G4S26jwWfzv
 wM1xsoayjQU3Gy++t7oZ8cdE9eWBbqbWOg==
X-Google-Smtp-Source: ABdhPJzU3zXRbiUDVNtzh+716mRGmep18zkDPwqyBpbtCOyxWURjsT/piO+LbG8juEpu+fZS2CC09g==
X-Received: by 2002:a1f:abc9:: with SMTP id u192mr11238450vke.17.1633128838074; 
 Fri, 01 Oct 2021 15:53:58 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id q12sm4424154uae.15.2021.10.01.15.53.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:53:57 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id 188so13192750vsv.0
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 15:53:57 -0700 (PDT)
X-Received: by 2002:a67:ef96:: with SMTP id r22mr7135629vsp.17.1633128836846; 
 Fri, 01 Oct 2021 15:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210919071016.3339939-1-christian@paral.in>
 <20210919093709.GO1053080@scaer>
 <103e4d1a-46d8-0639-6f81-d1dc96c6dbdb@mind.be>
In-Reply-To: <103e4d1a-46d8-0639-6f81-d1dc96c6dbdb@mind.be>
Date: Fri, 1 Oct 2021 15:53:45 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oqn7wBuX5t1bnMv6VZy8F2yuuvgEiqOi=GTUqCCKCV_Q@mail.gmail.com>
Message-ID: <CA+h8R2oqn7wBuX5t1bnMv6VZy8F2yuuvgEiqOi=GTUqCCKCV_Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH-NEXT v2 1/5] support/download/dl-wrapper:
 add concept of download post-processing
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On Sun, Sep 19, 2021 at 4:55 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> On 19/09/2021 11:37, Yann E. MORIN wrote:
> >
> > Downloading vendored sources from primary or mirror also means that no
> > vendoring should be applied afterward, i.e. vendoring should only occur
> > on sources downloaded from the main site.
> >
> > Did you try that? Can you report on how that eventually played out?
>
>   I guess that's what this piece of code in go-post-process is about:
>
> # Already vendored tarball, nothing to do
> if tar tf ${output} | grep -q "^[^/]*/vendor" ; then
>         exit 0
> fi

Indeed; that line of code will catch the case where "vendor" already
exists, and no extra vendoring will be performed.

This seems to work fine in all the cases I've tested.

Is this OK to respin as-is?

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
