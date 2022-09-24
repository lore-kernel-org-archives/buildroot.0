Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CBAC07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 16:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D1C41C1E;
	Sat, 24 Sep 2022 16:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D1C41C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYJtg7tb1GZ3; Sat, 24 Sep 2022 16:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E565B41B7E;
	Sat, 24 Sep 2022 16:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E565B41B7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 349EC1BF83E
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 16:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D75560B55
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 16:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D75560B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFiJJQlEJh9M for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 16:19:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AFD760671
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AFD760671
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 16:19:12 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id m66so2716055vsm.12
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 09:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e8mkMUMW6vaO2DtaiefPgjjuh72vTMfBPzja9dej1Rs=;
 b=Q4kFx3SdysGgWc01oZ360vf8OJuwPCy84kPwZeikrZO13rOoM2nSxLwtCQseZzz2So
 isPoJP+eiiL5H2FqXDPdm7WrrCZu7XFGLxJRtNlZIcBcUiWfuG5DnpL82/EkQC//ZGQi
 WlBNX/LnQ37LMX5rEu592v8H+crXTPSV4BeP3to6Jjrrd20ImlLdUg8wKyGKm2RBpDrA
 rPho++S9E5yjNbwYVSVz9D7vBIjX1M/Je8AwM7s/vKxCKKlY3pUQ/2+OJcjGbe1xuYDf
 OLk2oc9+RosviDS16mlwuCKl+YXRF4YCzyYZ+f2WQTBbcKeW9lXy9ooF9BdbxcMVQ4rU
 ZnQA==
X-Gm-Message-State: ACrzQf3Wuit84EHT/Jsg/jsNsh6c4GDtpG9ZSSwBlfxqmAIohi8oqdE2
 Ro8rquoKWSJ5sI5SIuIyom/r+W2+pNcibxKpSQ23CEa0
X-Google-Smtp-Source: AMsMyM47YIV1pxJSgaxEJ/GN5dJa+wXO4CzxsvFkoLtuOnsH6Hi6cPuT3W16VMPLQFCgZhjcvW1Zh47jUxsF6zgkXx0=
X-Received: by 2002:a67:d61d:0:b0:398:305c:8b39 with SMTP id
 n29-20020a67d61d000000b00398305c8b39mr5670056vsj.23.1664036351196; Sat, 24
 Sep 2022 09:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
 <87v8pebk2s.fsf@dell.be.48ers.dk>
 <CABRndgxFQLVvusnFHXyMuByfXhg+rR0Q2-X+osOz+V+MJaqXtQ@mail.gmail.com>
 <87r101as98.fsf@dell.be.48ers.dk>
 <CABRndgw8bBeQBkyhUJonHkr-QFkENmRU7BS2jQxRg+v_Nqaeyg@mail.gmail.com>
 <87mtaobvm1.fsf@dell.be.48ers.dk>
In-Reply-To: <87mtaobvm1.fsf@dell.be.48ers.dk>
From: Zvi Vered <veredz72@gmail.com>
Date: Sat, 24 Sep 2022 19:19:02 +0300
Message-ID: <CABRndgyh9JBGEvjvkZhynfB-daO-NEJMuHvj_5+EjYE=JyW4Mw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=e8mkMUMW6vaO2DtaiefPgjjuh72vTMfBPzja9dej1Rs=;
 b=QfC4KzHikXqvyBuQcT2hC0bKMPZTtee+UhbZkpGN4S0tL/UamXGWxVHnPOH/GI7Mp8
 gsEQi5VYos1BQcNTVivjjaRRJkHlFGJUaQJj3/196Q8ghHTVbeMwkvcvuvFcjgCXhcFw
 KzeADik57Flmr9zTWYx4tNjLAducMxXXTXKBSmmnjrlKFYhtSvJdHfJYfM0D3N3Ayh65
 OYBUo+4VjweypOywzI0Pgqlbt44Tm8HKJt58oyFd6K/tljFn8naaNXLCvAfuM/zx95/K
 ogJjdqETrgNPBSw88n3fTLWE1hMEKuqOwRe+UjXLstRdVAQCK1ST8y8hd+l9lPW5bd8c
 QFSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QfC4KzHi
Subject: Re: [Buildroot] buildroot 2022.02.1: apache (httpd) - libgcc_s.so.1
 must be installed for pthread_cancel to work
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5512876680902199702=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5512876680902199702==
Content-Type: multipart/alternative; boundary="0000000000009b422705e96ea7f3"

--0000000000009b422705e96ea7f3
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

I'm out of the office till 28/9.
I will check and get back to you.

Thank you very much,
Zvika

On Sat, Sep 24, 2022 at 7:11 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:
>
>  > Hi Peter,
>  > There is no real technical reason.
>  > I thought it would be right to use gcc I got from the vendor (Xilinx)
>  > Also, buildroot supports using external toolchain.
>  > All gcc libs are copied (by buildroot) to /lib64.
>  > Should I try using gcc built by buildroot ?
>
> Yes please, if nothing else then to verify that the issue is specific to
> your toolchain. We do not have access to that petalinux toolchain, so it is
> hard to help debugging.
>
> --
> Bye, Peter Korsgaard
>

--0000000000009b422705e96ea7f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div>I&#39;m out of the office til=
l 28/9.</div><div>I will check and=C2=A0get back to you.=C2=A0</div><div><b=
r></div><div>Thank you very much,</div><div>Zvika=C2=A0</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 24=
, 2022 at 7:11 PM Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com=
">peter@korsgaard.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Zvi&quot; =3D=3D Zvi Vered =
&lt;<a href=3D"mailto:veredz72@gmail.com" target=3D"_blank">veredz72@gmail.=
com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Hi Peter,<br>
=C2=A0&gt; There is no real technical reason.<br>
=C2=A0&gt; I thought it would be right to use gcc I got from the vendor (Xi=
linx)<br>
=C2=A0&gt; Also, buildroot supports using external toolchain.<br>
=C2=A0&gt; All gcc libs are copied (by buildroot) to /lib64.<br>
=C2=A0&gt; Should I try using gcc built by buildroot ?<br>
<br>
Yes please, if nothing else then to verify that the issue is specific to<br=
>
your toolchain. We do not have access to that petalinux toolchain, so it is=
<br>
hard to help debugging.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div>

--0000000000009b422705e96ea7f3--

--===============5512876680902199702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5512876680902199702==--
