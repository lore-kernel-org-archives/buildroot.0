Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3184C35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 448C940012;
	Sun, 15 Sep 2024 14:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbrofqvNLo-N; Sun, 15 Sep 2024 14:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5A82402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5A82402BC;
	Sun, 15 Sep 2024 14:22:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59A4E1BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 482CF402BC
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HU13uUlSnyaV for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3309240012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3309240012
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3309240012
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:22:30 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5e1b55346c0so805613eaf.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726410149; x=1727014949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vfN/2Z7PHOUuxgEfNMTzY13siHzNVA9YqQvdJfCAtLA=;
 b=l+x6PxU5f27/ad5MzeOfqR1WJyT78GabIu9gKO8wctJ1SJP23SnQdScZ04jaYZaq3y
 eD2ceiefK2TlOaXfz6UTEgpvQooGzmmyq4uYbrr681Ake1rC+iDvRO+pquQ0r6bI7z0d
 Q/nNJ6b187qLu/F5xdfWBSe0PRcU5tcnRN2cDhErstFoGlTV672jDlRW9CxFKaesPISi
 XDzJqwsTK2k8GTjVoiVHfGBW5H2YtGNAUgsCmbV1VnrLL3eFYJahrbaw27s9vRLXDdIX
 3glQAx5IakkQP45h/6tD8/HX+6QU7SfwBKnS02zHpQGL5GN+5g4rGZFDKO7M/a9Gt/BZ
 FDhA==
X-Gm-Message-State: AOJu0Yw7pkgLaUkOGl5JNOamEhcEVgJKBOf47ll2Tt8CpOLNxUddBQQx
 MWKXFNp7QhzK8vOi905iqO0EX3GPuJfmMbwATLK+rMiWt83dlTapI/RMBSIJ1ZyqzAzOE7ftXFj
 58ak=
X-Google-Smtp-Source: AGHT+IEUVpzLVY9zE68hwqKYb1jooo8L05d2/MBku7/0sNOiBJXvvcthKdLzYAQAMggQJeVm4kCMOQ==
X-Received: by 2002:a05:6820:50b:b0:5e1:efda:3991 with SMTP id
 006d021491bc7-5e20bfd4706mr3834167eaf.0.1726410149106; 
 Sun, 15 Sep 2024 07:22:29 -0700 (PDT)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com.
 [209.85.160.45]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5e3b0d7d28asm576770eaf.15.2024.09.15.07.22.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 07:22:28 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-277c28fac92so1508042fac.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:22:28 -0700 (PDT)
X-Received: by 2002:a05:6870:5490:b0:27c:4f04:a1e8 with SMTP id
 586e51a60fabf-27c680fc8e7mr5054680fac.0.1726410147813; Sun, 15 Sep 2024
 07:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAEpB38MKaFVyTLAwjsT6uGEU+w7L9MpUg31Oftqb9oaP2DNPiA@mail.gmail.com>
 <20240914110036.13d08b21@windsurf>
 <CA+h8R2ouJqmjxHv_DswDwOMuJO1Pv9=_3p4uxdNYGR3H=GFbFw@mail.gmail.com>
 <20240915093127.76eea2a8@windsurf>
In-Reply-To: <20240915093127.76eea2a8@windsurf>
Date: Sun, 15 Sep 2024 07:22:18 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pFLG2q2q-eX2hHhFc9i03fYUF7D+QXMq5WmF3iN2CySw@mail.gmail.com>
Message-ID: <CA+h8R2pFLG2q2q-eX2hHhFc9i03fYUF7D+QXMq5WmF3iN2CySw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1726410149; x=1727014949; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vfN/2Z7PHOUuxgEfNMTzY13siHzNVA9YqQvdJfCAtLA=;
 b=VTYSLond/HCmnHnmZtEwE/54x1kDQwJvmLS5THHS1xNs+c5LkfmyAAjEeoNbCiGId4
 EPJglTwJtk+zuyGl8M2uQfZqDHdndao3QvJErEhfkT34Bx2pKeZ6km/9UmwTJ+/IxdWX
 mJMEJCcnDoOphcqlhbDaWjSnP9EcHnkvbkYqu0C6ThlXWUey0FexmPnkUEaR8QjqNGg4
 FIp6qusrFARJQsP6ObwnufMzwoeP6ddOX5LM+Iix6wb/YXmEAyv+aJf9QxUHq0dqQBBm
 2RZR3m06k31yDXOtF/9TcWHr6plM3bCpSbGdrQu6lwIAvCkk5jHGWPFAblU9kq27stu7
 VqEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=VTYSLond
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3794998782912340059=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3794998782912340059==
Content-Type: multipart/alternative; boundary="00000000000098eb6a0622292fdc"

--00000000000098eb6a0622292fdc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sun, Sep 15, 2024, 12:31=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Sat, 14 Sep 2024 20:07:37 -0700
> Christian Stewart <christian@aperture.us> wrote:
>
> > Gmail just destroys the line length it seems. It's hard to send
> > patches or plaintext emails via gmail as it wraps at 78chars
>
> A number of other people use gmail and git send-email and don't have
> this issue, so I'm not sure what's going on in your case?
>

They are probably using the insecure app password method. This method
requires setting an "app password" in the google settings, a plaintext
password which bypasses 2fa and other security options.

This is not good for security as the app password has no access limits and
anyone that can read your home dir and read the password from .gitconfig
can then log into and access the Google account without limits.

Best regards,
Christian

--00000000000098eb6a0622292fdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sun, Sep 15, 2024, 12:31=E2=80=AFAM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Sat, 14 Sep 2024 20:07:37 -0700<br>
Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us" target=3D"_b=
lank" rel=3D"noreferrer">christian@aperture.us</a>&gt; wrote:<br>
<br>
&gt; Gmail just destroys the line length it seems. It&#39;s hard to send<br=
>
&gt; patches or plaintext emails via gmail as it wraps at 78chars<br>
<br>
A number of other people use gmail and git send-email and don&#39;t have<br=
>
this issue, so I&#39;m not sure what&#39;s going on in your case?<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">They are p=
robably using the insecure app password method. This method requires settin=
g an &quot;app password&quot; in the google settings, a plaintext password =
which bypasses 2fa and other security options.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">This is not good for security as the app password ha=
s no access limits and anyone that can read your home dir and read the pass=
word from .gitconfig can then log into and access the Google account withou=
t limits.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,<=
/div><div dir=3D"auto">Christian=C2=A0</div></div>

--00000000000098eb6a0622292fdc--

--===============3794998782912340059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3794998782912340059==--
