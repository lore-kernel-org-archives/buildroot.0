Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29742C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 00:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A43642743;
	Fri, 27 May 2022 00:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aoxeEu-QmBJ; Fri, 27 May 2022 00:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7260E42748;
	Fri, 27 May 2022 00:30:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A18CF1BF9D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 00:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FDF561562
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 00:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plt9jeNg5UFE for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 00:30:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF42961267
 for <buildroot@buildroot.org>; Fri, 27 May 2022 00:30:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id m20so5808477ejj.10
 for <buildroot@buildroot.org>; Thu, 26 May 2022 17:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etZn9iuTYHtm+2fFUI9sbwS9APK1j/leZ/+tttcWYWs=;
 b=Y/zPWQpIDfjdRJjnIL3e70bfWrGZxgDl6EV9jUWmkGNzLWQkcpuODR8H1yag+J0XfI
 vSKBMMXhqNelurUvA61UZfYehAs657b+8Sa/SCbYASK3TEW+smsy0Kdj2KoIRmWbz7Xc
 XfD9D0mHs+EHveSWIqsNpZr1kXlticW/obXFCogq95nWaVDczt95x3bulGmtwIc8EAb8
 V5VloQP04k2N2zUEMxx+uxj+dFIZQkpDpwyliBSRky1bp1tnzDJFPHcsmE4GyiXXw0O1
 uTxvABqJFzidfP2AzwrqmNpQHzOLgLFu+wo3Jepu40qk8wuQ2dyaKuPX/wT8YqwXsHMF
 kTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etZn9iuTYHtm+2fFUI9sbwS9APK1j/leZ/+tttcWYWs=;
 b=JVd/wMb8VeWcCrwx4PCHptZduRI/QId7oWN/VctOdMwS+CUEgmU/5PwddxwLox+NU1
 l9HkM8USyha5NSvX8UKHO+run1PFJ57Kh4t+S6EBVtsiOIbHRYJ89Miti+SoYGbP356K
 R87SnDa+S85TxskDVNQcgS/yjOv+3HfOSbAEaLfu8JM11VV3ujjnPJL5iuzFvccJPMhE
 Rs6pEK53joDzJu3ZTHHUthcUNnyvdALu0A4xD03T3RODjAAadwZZxc8uta1JK9IAdeVg
 FW2a1T/cQSvr1zsEfUMuqybaIUzvo1f6foJcIDBOzGBYiuuX0pDVTfZmhBxITN1tjp8K
 Z7uw==
X-Gm-Message-State: AOAM530lDmrq8SVZhVy4PeM7BTpl3ynI81VneSSm0IyVYcSyV7+c2Ikn
 bkb4JjmRTOM34oJwbv1vkbszMk3jG0678svZ
X-Google-Smtp-Source: ABdhPJwfd8KyWPECVqStS3j8y3J/GdWTRLoNYRDiPPS9MtmsQPVZDZIXP2/EwIga5oxWLCXNyF3HFA==
X-Received: by 2002:a17:907:9809:b0:6f5:1be8:5b13 with SMTP id
 ji9-20020a170907980900b006f51be85b13mr34746591ejc.412.1653611426821; 
 Thu, 26 May 2022 17:30:26 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 r20-20020a170906365400b006f3ef214e16sm944367ejb.124.2022.05.26.17.30.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 17:30:25 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id n22so682766eda.5
 for <buildroot@buildroot.org>; Thu, 26 May 2022 17:30:24 -0700 (PDT)
X-Received: by 2002:a05:6402:845:b0:42b:303f:1ef8 with SMTP id
 b5-20020a056402084500b0042b303f1ef8mr34187109edz.49.1653611424207; Thu, 26
 May 2022 17:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
 <20220525234312.643dfc03@windsurf>
 <CACPK8Xe2LB_LNd0zVneLKd+eNmZBqvKX4cuZgqgTpkQPBmyR=g@mail.gmail.com>
 <20220526154652.030eeb4f@windsurf>
In-Reply-To: <20220526154652.030eeb4f@windsurf>
Date: Thu, 26 May 2022 17:30:12 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qyeUxPdEGpdjT=P3ww7RX9faBpux171R+XWhuCj6o55A@mail.gmail.com>
Message-ID: <CA+h8R2qyeUxPdEGpdjT=P3ww7RX9faBpux171R+XWhuCj6o55A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [RFC] package/go: switch to gcc go instead of
 go-bootstrap
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
Cc: Christian Stewart <christian@paral.in>, Joel Stanley <joel@jms.id.au>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

On Thu, May 26, 2022 at 6:46 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Thu, 26 May 2022 02:17:19 +0000
> Joel Stanley <joel@jms.id.au> wrote:
> > I use arm64 and ppc64le hosts for my buildrooting as they are the
> > fastest machines I have access to. Neither are supported by
> > go-bootstrap, so moving to gcc-go looks like a win for me.

> As Yann Morin suggested in another e-mail, maybe we need to support
> both situations:
>
>  * Building Go in 3 stages when using an external toolchain that
>    doesn't have Go support. This would mean building Go 1.4 with the C
>    compiler, then building Go 1.16 with Go 1.4, and finally building Go
>    latest with Go 1.16.
>
>  * Building Go in 2 stages with gcc-go when using an internal toolchain
>    (in which we can enable Go support) or an external toolchain that
>    has Go support.
>

As I also build on arm64 systems, I have a patch in my tree which
implements this:

https://github.com/skiffos/buildroot/commit/2df564c82081661f4a599998a276477929dd2a61

Previously submitted here (With your comments):

https://patchwork.ozlabs.org/project/buildroot/patch/20210622024337.3009417-1-christian@paral.in/

This implements using a host "/usr/bin/go" to bootstrap if
go-bootstrap cannot be built.

So there are actually three cases (in this priority order):

 - Build gccgo with buildroot toolchain -> golatest
 - Build go-bootstrap (C) with GCC -> go1.16 -> golatest
 - Build golatest relying on host /usr/bin/go installation.

Note that you can get the path to GOROOT with "$(go env GOROOT)"

So, we don't have to hardcode /usr/bin/go, but rather use whichever
"go" is in the PATH.

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
