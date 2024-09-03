Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F25CD3420
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402CC80D0E;
	Tue,  3 Sep 2024 08:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgZiFOW5GgT8; Tue,  3 Sep 2024 08:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B5980D1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25B5980D1F;
	Tue,  3 Sep 2024 08:39:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD451BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885A24028F
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZYlXlZYQ4sG for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 08:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DEE514028D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE514028D
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEE514028D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 08:39:27 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4fd142a798eso1413418e0c.3
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 01:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725352766; x=1725957566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QnsOwRSEo4it5fjpjfTRlQTdkJzGZAuRDHm+L/jk//I=;
 b=Ni1F0EGpL4au4PkeKyuLKAHOOS4qfeXXogjFmwQ0jpuFwVBJj+R+l1SCqTRNtSQO0q
 9zYuDVROPO9jZfBJtcErMG6xXyS8h+RVUDgfrQSZzF5B8DTr/nEPFd8IOp8d76qP2KkK
 qsccS/T2ZeG9M/LPIoJ/DXL65mr478krs6sb6+sGzjUkj02wMKp3jUXhaJNxLAgohPEY
 xH7gNuBMUxpMvRUYXk74K3h6XCbZQUAoGW6oZSbE5Yeb5XmWqbyrxHruwtTs4O314c2n
 +JTwGLkP3knWcIPgEoXnBM1MFID6j5RJnpYikQWW5vQ/HXr23UMUV3YaSQKMI8S6DBEa
 Cylw==
X-Gm-Message-State: AOJu0YxXnUbcpsVte5qCF2fU+k3FutaVExuaIFunAOlTdOAwBU/HbLdm
 zPklWoxa5ceh6VWd4ZR4ay1Rp6BPke5ySyRAZA/wTcZPdeZ7HtpeIY95rdOHBdTj9IBJDliIndY
 d8nXRYcVEEEsHIr6edd6vr595shVh+J5Z0v2gDQ==
X-Google-Smtp-Source: AGHT+IHLH+l5K2JpPTrCgYLw+3P0wE2XorGcqCeto7C1XZ2C51vZLiGfd1saSNBm99wGWtg6rrG73OVP38nhsjWRTk4=
X-Received: by 2002:a05:6122:2218:b0:4fd:762:8649 with SMTP id
 71dfb90a1353d-500de453969mr1395076e0c.12.1725352766398; Tue, 03 Sep 2024
 01:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240903073929.3717568-1-lars@underjord.io>
 <871q21i38z.fsf@tarshish>
 <CADqW+qn3TnF3LyUaYs3jfMSDT3wMC57q+r3gV0+UoOsxSVKYOA@mail.gmail.com>
 <87wmjtgnny.fsf@tarshish>
In-Reply-To: <87wmjtgnny.fsf@tarshish>
From: Lars Wikman <lars@underjord.io>
Date: Tue, 3 Sep 2024 10:39:15 +0200
Message-ID: <CADqW+qm-jkPWT29uFgMqEpur4Y5WpJZhrGUzjL5s==Nu6sySEw@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725352766; x=1725957566; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QnsOwRSEo4it5fjpjfTRlQTdkJzGZAuRDHm+L/jk//I=;
 b=dYOmILVxS4VpuAX3jyvzM2RPkSEoDtGb4hkRySL+ibLBRcI531HFnoNy7ORBIyWcck
 AdYFHgU5IGOvx68QvTcNe7SvgbZdPm5cy+kCbMrWfrxPugpIUx5cQ9rUg4+28QI9sRrR
 WRTQsE3rrYzHdlddmQorNJMcIltQcmF6wyau7dbuT5GfR/U5V/UXYpo/gReawvW6d2++
 r8hse1gyjs3HSQs/nStlxUjIzEi/ZVkOaLCZRwdiHXMqiZXdJI91L8c2ri1qaunM7CI3
 DrOT5T7NEjyjn7tDtjNAXNMoqnN8TQI/S7a9L0894KsxBtpMc+Va58Yz9bqYmrkw75gV
 ttoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=dYOmILVx
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: add Smart card
 option
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3830728669589183780=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3830728669589183780==
Content-Type: multipart/alternative; boundary="000000000000c0fc51062132fe6a"

--000000000000c0fc51062132fe6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

This was the only initial assignment for DISABLE being made. And now it is
conditional on the new option. What would be the preferred way to do it?

Can DISABLE be left blank? Or left out until it is conditionally set?

Happy to do it either way, it was not obvious to me how it should be
handled so I did this.

-Lars

On Tue, 3 Sep 2024 at 10:13, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Lars,
>
> On Tue, Sep 03 2024, Lars Wikman wrote:
> > The existing line was =3D as it was the first reference to
> WPA_SUPPLICANT_CONFIG_DISABLE.
> > So I kept it that way.
>
> The existing line is first assignment that initializes
> WPA_SUPPLICANT_CONFIG_DISABLE. All initial assignments use =3D in this
> file and others.
>
> Following conditional assignments should only add to existing value, not
> overwrite it.
>
> baruch
>
> > Happy to change it if I should still. I'm not particularly used to
> > these files or conventions.
> >
> > - Lars
> >
> > On Tue, Sep 3, 2024 at 9:51=E2=80=AFAM Baruch Siach <baruch@tkos.co.il>=
 wrote:
> >  On Tue, Sep 03 2024, Lars Wikman wrote:
> >  > diff --git a/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=
=8F
> b/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F
> >  > index 984959f679..a7b7800c99 100644
> >  > --- a/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F
> >  > +++ b/package/wpa_supplicant/wpa_supplicant.mk=E2=9A=A0=EF=B8=8F
> >  > @@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \
> >  >       CONFIG_INTERNAL_LIBTOMMATH \
> >  >       CONFIG_MATCH_IFACE
> >  >
> >  > -WPA_SUPPLICANT_CONFIG_DISABLE =3D \
> >  > -     CONFIG_SMARTCARD
> >  > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
> >  > +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD
> >  > +else
> >  > +WPA_SUPPLICANT_CONFIG_DISABLE =3D CONFIG_SMARTCARD
> >
> >  Should be +=3D here. Otherwise WPA_SUPPLICANT_CONFIG_DISABLE is
> >  overwritten.
> >
> >  baruch
> >
> >  > +endif
> >  >
> >  >  # libnl-3 needs -lm (for rint) and -lpthread if linking statically
> >  >  # And library order matters hence stick -lnl-3 first since it's
> appended
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--000000000000c0fc51062132fe6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thi=
s was the only initial assignment for DISABLE being made. And now it is con=
ditional on the new option. What would be the preferred way to do it?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Can DISABLE be left blank? Or=
 left out until it is conditionally set?</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Happy to do it either way, it was not obvious to me how it=
 should be handled so I did this.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">-Lars</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, 3 Sep 2024 at 10:13, Baruch Siach &lt;<a href=
=3D"mailto:baruch@tkos.co.il">baruch@tkos.co.il</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">Hi Lars,<br>
<br>
On Tue, Sep 03 2024, Lars Wikman wrote:<br>
&gt; The existing line was =3D as it was the first reference to WPA_SUPPLIC=
ANT_CONFIG_DISABLE.<br>
&gt; So I kept it that way.<br>
<br>
The existing line is first assignment that initializes<br>
WPA_SUPPLICANT_CONFIG_DISABLE. All initial assignments use =3D in this<br>
file and others.<br>
<br>
Following conditional assignments should only add to existing value, not<br=
>
overwrite it.<br>
<br>
baruch<br>
<br>
&gt; Happy to change it if I should still. I&#39;m not particularly used to=
<br>
&gt; these files or conventions.<br>
&gt;<br>
&gt; - Lars<br>
&gt;<br>
&gt; On Tue, Sep 3, 2024 at 9:51=E2=80=AFAM Baruch Siach &lt;<a href=3D"mai=
lto:baruch@tkos.co.il" target=3D"_blank">baruch@tkos.co.il</a>&gt; wrote:<b=
r>
&gt;=C2=A0 On Tue, Sep 03 2024, Lars Wikman wrote:<br>
&gt;=C2=A0 &gt; diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_s=
upplicant.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=
=9A=A0=EF=B8=8F b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.m=
k" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=A0=EF=
=B8=8F<br>
&gt;=C2=A0 &gt; index 984959f679..a7b7800c99 100644<br>
&gt;=C2=A0 &gt; --- a/package/wpa_supplicant/<a href=3D"http://wpa_supplica=
nt.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=A0=
=EF=B8=8F<br>
&gt;=C2=A0 &gt; +++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplica=
nt.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a>=E2=9A=A0=
=EF=B8=8F<br>
&gt;=C2=A0 &gt; @@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_INTERNAL_LIBTOMMATH \<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_MATCH_IFACE<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt; -WPA_SUPPLICANT_CONFIG_DISABLE =3D \<br>
&gt;=C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0CONFIG_SMARTCARD<br>
&gt;=C2=A0 &gt; +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)<br>
&gt;=C2=A0 &gt; +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD<br>
&gt;=C2=A0 &gt; +else<br>
&gt;=C2=A0 &gt; +WPA_SUPPLICANT_CONFIG_DISABLE =3D CONFIG_SMARTCARD<br>
&gt;<br>
&gt;=C2=A0 Should be +=3D here. Otherwise WPA_SUPPLICANT_CONFIG_DISABLE is<=
br>
&gt;=C2=A0 overwritten.<br>
&gt;<br>
&gt;=C2=A0 baruch<br>
&gt;<br>
&gt;=C2=A0 &gt; +endif<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 # libnl-3 needs -lm (for rint) and -lpthread if linki=
ng statically<br>
&gt;=C2=A0 &gt;=C2=A0 # And library order matters hence stick -lnl-3 first =
since it&#39;s appended<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div></div>

--000000000000c0fc51062132fe6a--

--===============3830728669589183780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3830728669589183780==--
