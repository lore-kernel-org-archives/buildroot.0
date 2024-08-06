Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86888C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 18:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC88404BF;
	Tue,  6 Aug 2024 18:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dh6Eye09x2hN; Tue,  6 Aug 2024 18:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63D3404C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63D3404C5;
	Tue,  6 Aug 2024 18:53:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF7591BF388
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 18:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C806404C5
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 18:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B12SRFlg1gk5 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 18:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A5B5404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A5B5404BF
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A5B5404BF
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 18:53:49 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7a94478a4eso19297666b.1
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 11:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722970427; x=1723575227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JjlG/nmDdji0TP8e/gDecjoeKdLA+A9/j8IvhLqwTrY=;
 b=moRHRlb6BqPsAU5rxvj+5ooBxoEf0JolIyWf+BCJTGBvnfwG9b1mcGz5tgg/hqotmT
 ximxXGBI/brRgZMpBP9D9ZyhaOJSN4gRoimYTnaDVkG1E9InPyP/9CUh/e3afamXVVKX
 aDKfM4fFfyQ1ArTxTYj5CotjfPXw1wr+k0Hi3yWU1HIIEyTkbbFBmk+P0uJWUps88f/E
 nqGMzvW8zStxpaXNhPwq0qg74vnSfrDn5xt+xf0HVMdiQVBpTWhPaS7VBri0TX9MGTLJ
 9KEpsjYW69DgHuiRxIbp30GiWXcux4MgpF9LcboKikerHi00UjAKwCuoNAQWGNt8K8eq
 Sswg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhxMLfn1ZLreG0H4ozKIlhIFQbmgX7TN6Wh5HiY+4r/IroOznajKAYlg5qPBrxN1zFKcdBn+t206K+XtmpzdolEMZv9ONqUg==
X-Gm-Message-State: AOJu0YzAElV9Z/zdPvLEw6K2dDLZp3W2b43sF7QFD7kEyYrO0r2q/uIu
 NAu+XciaPquyHYJmAfJeglckzkQOqv97z2Yy9rROdo+L6myiaP6eeICkL4ZfhKoarF8ulWYtggO
 D9GSUKg==
X-Google-Smtp-Source: AGHT+IEZiAiI8JbmtwSI3WndcLpL9yaD24ZMhIFgtgzV2YrzlOwwXIaLg5sBBHWGbSNCIWaZkbr1zA==
X-Received: by 2002:a17:906:6a24:b0:a7a:afe8:1013 with SMTP id
 a640c23a62f3a-a7dc5f65b17mr1200524766b.1.1722970426876; 
 Tue, 06 Aug 2024 11:53:46 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0c0casm565469366b.47.2024.08.06.11.53.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 11:53:46 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso28893766b.0
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 11:53:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSDpu/YD3l025M0UK+idczSegnzcWEyDSbe/Zpa4zmBr7b4t2KuftlpIUGpnu4bTQ0wvxVA0D/IuY1oHBCUhoALW6pwJcgBw==
X-Received: by 2002:a17:906:6a24:b0:a7a:afe8:1013 with SMTP id
 a640c23a62f3a-a7dc5f65b17mr1200522266b.1.1722970425550; Tue, 06 Aug 2024
 11:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <20240806185731.372f8f3e@windsurf>
In-Reply-To: <20240806185731.372f8f3e@windsurf>
Date: Tue, 6 Aug 2024 11:53:35 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
Message-ID: <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1722970427; x=1723575227; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JjlG/nmDdji0TP8e/gDecjoeKdLA+A9/j8IvhLqwTrY=;
 b=FXEEIFW7gv3a/e0E6B2xvay3BAek4zAzjvlwEntDcGvvbo8apSuPtpifk7rLYEUKmk
 xtZMqRJTb+uRaP87Ov+hA1WCExgpezBo5uWLExV+TPxpgTdfhPx08dCYcMHCmF2lup3v
 ZwS6cIcIimq2DCzGNqOhJsr2aRY/KXvK9VqiQOX6GoHtqMgzzUATyBOgjq1stWrOjI6p
 q2dIv114LW2AsvvMAIbr5/FHz5sv+EXl1nhR9ZKIaJdGLBSjXfjIdYC9Ite/6GH6bPMb
 99g+uz6bdjSC01a8BaRGfGhunTQ4xyzkEPPj9chG87XkIfyrBF6ChD9j/1y+1ZotPljF
 RrYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=FXEEIFW7
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2588195380375233902=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2588195380375233902==
Content-Type: multipart/alternative; boundary="0000000000002c7a12061f085016"

--0000000000002c7a12061f085016
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

On Tue, Aug 6, 2024, 9:57=E2=80=AFAM Thomas Petazzoni <thomas.petazzoni@boo=
tlin.com>
wrote:

> > For now we can just include the latest commit hash of tailscale until
> they
> > make a new release and nothing else needs to be changed.
>
> Don't understand this last part. What is your proposal to fix the
> tailscale situation?
>

They fixed the issue upstream and now the main branch of tailscale works
fine with GOPROXY=3Ddirect. See:

https://github.com/tailscale/tailscale/issues/12859#issuecomment-2239157563

It is fine to use the main branch of tailscale here even if it's an
external service as tailscale keeps compatibility between releases - I even
have many machines running quite out of date tailscale clients which still
connect and run perfectly. The same can be said for forwards compatibility.

All that I ask with regards to GOPROXY is that:

- we do not override it per package,
- if we do decide to change the default to use Google, please make it a
configurable option (like BR2_MIRROR) so that I (and other users) can
override it back to be direct.

Best regards,
Christian Stewart

--0000000000002c7a12061f085016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thomas,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 6, 2024, 9:57=E2=80=AFAM Thomas P=
etazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzo=
ni@bootlin.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; For now we can just include the latest commit hash of tailscale until =
they<br>
&gt; make a new release and nothing else needs to be changed.<br>
<br>
Don&#39;t understand this last part. What is your proposal to fix the<br>
tailscale situation?<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">They fixed the issue upstream and now the main branch o=
f tailscale works fine with GOPROXY=3Ddirect. See:</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><a href=3D"https://github.com/tailscale/tailscal=
e/issues/12859#issuecomment-2239157563">https://github.com/tailscale/tailsc=
ale/issues/12859#issuecomment-2239157563</a></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">It is fine to use the main branch of tailscale here ev=
en if it&#39;s an external service as tailscale keeps compatibility between=
 releases - I even have many machines running quite out of date tailscale c=
lients which still connect and run perfectly. The same can be said for forw=
ards compatibility.</div><div dir=3D"auto"><br></div><div dir=3D"auto">All =
that I ask with regards to GOPROXY is that:</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">- we do not override it per package,</div><div dir=3D"a=
uto">- if we do decide to change the default to use Google, please make it =
a configurable option (like BR2_MIRROR) so that I (and other users) can ove=
rride it back to be direct.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Best regards,</div><div dir=3D"auto">Christian Stewart</div></div>

--0000000000002c7a12061f085016--

--===============2588195380375233902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2588195380375233902==--
