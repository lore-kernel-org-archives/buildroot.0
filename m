Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76800C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 16:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 117EC81331;
	Mon, 12 Dec 2022 16:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 117EC81331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQmmUJnh56M8; Mon, 12 Dec 2022 16:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52DDA8132C;
	Mon, 12 Dec 2022 16:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52DDA8132C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C81071BF386
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F0318132C
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F0318132C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_8EYC3qA43w for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 16:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 284C48132E
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 284C48132E
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 16:29:55 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m18so29422133eji.5
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 08:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v1cErVP3tjRU6FrEmfP8UG/Q5CiGDjti+iNohodEWqc=;
 b=dkQZ8xAagnYPgTA6iSeVTPpaGpyAg9aYVBw2q5WSRqGyhwGPP4tNum9yZQu6xuibjO
 /diAfw0LOb8MOJHKYUkgNv4YIL9eLtvDhdEY/riq1uScWCK1a8qbemJ8vB62FAHWLd3n
 VVvXdMNZEgLhDAmEi6YvQuV++3LbZcDgMi6AycvQaQtnVG3gBWDIWEd8vxaRVno7jgDa
 c+c1hfDfYEjqdYXhjMwh16lhvuagyPAoSlQjFkQwvbFiYoMBHnpZbffpkfxK9jw8n4fj
 CjwK0h1WbKtlWP8u2qKuaaBInJVv1tAuZZUS5jfad+/Mqnael4rjstIX/+AGvApne5tx
 4hEg==
X-Gm-Message-State: ANoB5pmGrBpvXOj8LBR7HGfG3sGZUGDuxASYHVauIDrIGP9/UoiClMUx
 KEEFINX05SRX9oz0BlUcIW+PUUU7QpYilW7WbMHEYgdI
X-Google-Smtp-Source: AA0mqf5CQ44MPYDV0cPWxTE6C6A3786yxpmOkl55cGuwkpFP9M76KxaKfwuW29/TG/l1BI+T0Z3a/K2dMSZJQeOzUd4=
X-Received: by 2002:a17:906:bce9:b0:7ad:960d:3a4d with SMTP id
 op9-20020a170906bce900b007ad960d3a4dmr61726557ejb.522.1670862593279; Mon, 12
 Dec 2022 08:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <20221211201704.25858-3-indrek.kruusa@gmail.com>
 <87tu21xen0.fsf@dell.be.48ers.dk>
In-Reply-To: <87tu21xen0.fsf@dell.be.48ers.dk>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Mon, 12 Dec 2022 18:29:44 +0200
Message-ID: <CA+fTLhjea3nZmYBy1j2FY2tQZbX5wbXJt-PPyRF7cGyNnGtRuA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v1cErVP3tjRU6FrEmfP8UG/Q5CiGDjti+iNohodEWqc=;
 b=W4DtavrhMgVEdhlhCB5SySfO72nBMIzf37WdHXBNIrgrddenWWSE0s45PUSQPE239K
 MQxLYxfwuJPM07pYHchENJnPPP0bq2tvcUdQemEyFwH5YN1dUTv1ieJegddTL3SGM8Hx
 Xm5+r45ant5OWrFxqWtYMceKGNQwPzc0MHpncBUZ2DIg5KT4cZRzdbxz32+H6FdzVBuo
 pxqu1S7ZiOHzRCHFAr7YMOhtI6ibBf+bTaSMft3d6SJMK056TftM6dIKFI6OAlkq21/l
 rUzFVb+wIIHVtbGN34ysV+Dcn8gxN0gUJKq/3pnnF1AOrTIz/yMHrHtbglD4MgGxbTY8
 +ueQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W4Dtavrh
Subject: Re: [Buildroot] [PATCH 3/5]
 board/nezha/overlay/boot/extlinux/extlinux.conf: activate framebuffer
 console on HDMI
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
Content-Type: multipart/mixed; boundary="===============9129765892120685610=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9129765892120685610==
Content-Type: multipart/alternative; boundary="0000000000005749b605efa4038c"

--0000000000005749b605efa4038c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Peter Korsgaard (<peter@korsgaard.com>) kirjutas kuup=C3=A4eval E, =
12.
detsember 2022 kell 09:30:

> >>>>> "Indrek" =3D=3D Indrek Kruusa <indrek.kruusa@gmail.com> writes:
>
>  > Replace serial console with the framebuffer console on HDMI.
>  > Limit resolution to 1280x800 as the framebuffer is really slow.
>
>  > Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
>  > ---
>  >  board/nezha/overlay/boot/extlinux/extlinux.conf | 3 +--
>  >  1 file changed, 1 insertion(+), 2 deletions(-)
>
>  > diff --git a/board/nezha/overlay/boot/extlinux/extlinux.conf
> b/board/nezha/overlay/boot/extlinux/extlinux.conf
>  > index 91b2298628..4bf66ee8c4 100644
>  > --- a/board/nezha/overlay/boot/extlinux/extlinux.conf
>  > +++ b/board/nezha/overlay/boot/extlinux/extlinux.conf
>  > @@ -1,4 +1,3 @@
>  >  label linux
>  >    kernel /boot/Image
>  > -  # use devicetree from u-boot
>  > -  append console=3DttyS0,115200 root=3D/dev/mmcblk0p1 ro rootwait
>  > +  append console=3Dtty0 video=3DHDMI-A-1:1280x800 root=3D/dev/mmcblk0=
p1 ro
> rootwait
>
> Why? We generally use serial console in the defconfigs, or at least run
> the console and a getty on both the serial port and the video output
> like on raspberrypi.
>

Well, I was thinking that a working HDMI console fits for a wider audience.
But this is subjective indeed. Will take that into account in the future.


>
> --
> Bye, Peter Korsgaard
>

--0000000000005749b605efa4038c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Peter Korsgaard (&lt;<a href=3D"m=
ailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt;) kirjutas kuup=C3=A4=
eval E, 12. detsember 2022 kell 09:30:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quo=
t;Indrek&quot; =3D=3D Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gma=
il.com" target=3D"_blank">indrek.kruusa@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Replace serial console with the framebuffer console on HDMI.<br>
=C2=A0&gt; Limit resolution to 1280x800 as the framebuffer is really slow.<=
br>
<br>
=C2=A0&gt; Signed-off-by: Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa=
@gmail.com" target=3D"_blank">indrek.kruusa@gmail.com</a>&gt;<br>
=C2=A0&gt; ---<br>
=C2=A0&gt;=C2=A0 board/nezha/overlay/boot/extlinux/extlinux.conf | 3 +--<br=
>
=C2=A0&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
=C2=A0&gt; diff --git a/board/nezha/overlay/boot/extlinux/extlinux.conf b/b=
oard/nezha/overlay/boot/extlinux/extlinux.conf<br>
=C2=A0&gt; index 91b2298628..4bf66ee8c4 100644<br>
=C2=A0&gt; --- a/board/nezha/overlay/boot/extlinux/extlinux.conf<br>
=C2=A0&gt; +++ b/board/nezha/overlay/boot/extlinux/extlinux.conf<br>
=C2=A0&gt; @@ -1,4 +1,3 @@<br>
=C2=A0&gt;=C2=A0 label linux<br>
=C2=A0&gt;=C2=A0 =C2=A0 kernel /boot/Image<br>
=C2=A0&gt; -=C2=A0 # use devicetree from u-boot<br>
=C2=A0&gt; -=C2=A0 append console=3DttyS0,115200 root=3D/dev/mmcblk0p1 ro r=
ootwait<br>
=C2=A0&gt; +=C2=A0 append console=3Dtty0 video=3DHDMI-A-1:1280x800 root=3D/=
dev/mmcblk0p1 ro rootwait<br>
<br>
Why? We generally use serial console in the defconfigs, or at least run<br>
the console and a getty on both the serial port and the video output<br>
like on raspberrypi.<br></blockquote><div><br></div><div>Well, I was thinki=
ng that a working HDMI console fits for a wider audience. But this is subje=
ctive indeed. Will take that into account in the future.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--0000000000005749b605efa4038c--

--===============9129765892120685610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9129765892120685610==--
