Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06720C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 08:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50951405A0;
	Tue, 22 Feb 2022 08:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXKtG7yoxBBG; Tue, 22 Feb 2022 08:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF914019F;
	Tue, 22 Feb 2022 08:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC3201BF28D
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 08:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCEFB80C15
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 08:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRCNYf3tA-VN for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 08:48:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEC3F80BE2
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 08:48:39 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id g21so20332881vsp.6
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=74bO9jaHRCrn0P2rJI9G58TXyN6gt570K6WdqKEBmv0=;
 b=ZZowKe3lOSuiq/poTTFWpgtA6WVALSEHkBCZagznq8zVVg23UEg6DXR6NeAcg2vg87
 AGLOga9oMwzvZGFahjyPYLzSQ9H7b6fiCXNcvpVx9iY2T6ZjDZsMkwqnMV4V2no6Pv8C
 XHhIQPD/cmD8KtHYFVX36YZ6Z4ZNmIkCAkIEctq0BJkh4h8Jn2OgxeT2Hrxoy0QoACkj
 A9mc5omYdqn1C3sf4pZsC6uUbfuXv7HdutqLZiBiCI7/HDtsSJ1lYt0XzcNcTnjDEUy6
 LMDrEQ6OlU7Z7RYnwi/+xurHh9jcg31eU7atA9trRUMj9YNSJARn3/rrh2uN+BVr7GQR
 VVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=74bO9jaHRCrn0P2rJI9G58TXyN6gt570K6WdqKEBmv0=;
 b=bhUe+6g02a+bz/tM+qRqGXMXYUVl9RKouTWlXtHsWM3pqDi2VeTJJGiA6yv5yskKez
 jmgX0aZkJ5aR6/uxcEwbvwhDiFaXUHvLypYKZR5Kgg+sNRLCYqwCaeBLe5ySW+0F7qhj
 m3BDvi28NvuzoiCw8GtZ+oqeb77tukJA3aQex9c5ceTUcKLWWixABns/FYxxSBlLdF1D
 Gdq7BWip/eIkph00JMmIWfp0AC/t2BZOCCDHIoOneCQRlUsC98Z2KJd7D9kzEHVNWKoN
 /XRFGqkNjvG5qCev+0zoKcrhUrgbC7ET4lzHPw6hTJ1tRWF+dmYRFNivIJaffyWSNsJC
 Li6w==
X-Gm-Message-State: AOAM531XG8wmZpFaDfIrNDsM2jWkzF5y5/2TCFtCnY1xAF/ELytHmeFD
 ld2W0wpDqhTq3YvHZZu6V7YKxQvlQvOr0Q==
X-Google-Smtp-Source: ABdhPJwXKPO5wWxc+CBhNdRUlpKSfLC1SjKvuUVryVQ/hnDGNECiG3+FWzFW43rSFUdoatWU6KROng==
X-Received: by 2002:a67:d317:0:b0:31b:9b12:dd6b with SMTP id
 a23-20020a67d317000000b0031b9b12dd6bmr8619657vsj.27.1645519718347; 
 Tue, 22 Feb 2022 00:48:38 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id y22sm2989723vsk.6.2022.02.22.00.48.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:48:37 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id d11so16298993vsm.5
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 00:48:37 -0800 (PST)
X-Received: by 2002:a67:e087:0:b0:31b:57fe:7ac1 with SMTP id
 f7-20020a67e087000000b0031b57fe7ac1mr9338403vsl.81.1645519717223; Tue, 22 Feb
 2022 00:48:37 -0800 (PST)
MIME-Version: 1.0
References: <CA+h8R2pwkhPn5SS-jPmXjS_gb07EsshRA5HMJewVRcY32RL6=g@mail.gmail.com>
 <20220222093246.57ab1b0d@windsurf>
In-Reply-To: <20220222093246.57ab1b0d@windsurf>
Date: Tue, 22 Feb 2022 00:48:26 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rs2Gv4__duMkeduq0AU_P2K7toHVVa5tREaaD6nOBOig@mail.gmail.com>
Message-ID: <CA+h8R2rs2Gv4__duMkeduq0AU_P2K7toHVVa5tREaaD6nOBOig@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] package/expat: please backport to 2021.11.x
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
Cc: Christian Stewart <christian@paral.in>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,



On Tue, Feb 22, 2022 at 12:33 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Mon, 21 Feb 2022 21:21:16 -0800
> Christian Stewart <christian@paral.in> wrote:
>
> > Expat v2.4.4 (vulnerable) download has been removed from sourceforge.
> >
> > So 2021.11.x build is broken with the older expat.
>
> This is strange: if the expat tarball is no longer available from
> sourceforge, Buildroot should fallback to sources.buildroot.net, which
> contains the expat-2.4.4.tar.xz tarball, at
> http://sources.buildroot.net/expat/.

It does, my mistake, I had an alternate mirror configured.

> Of course, it is better to update since there is a security issue in
> 2.4.4,

Best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
