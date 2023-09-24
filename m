Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDE0CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1246760E50;
	Sun, 24 Sep 2023 20:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1246760E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dm181D-DOFFn; Sun, 24 Sep 2023 20:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E90A960ECD;
	Sun, 24 Sep 2023 20:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E90A960ECD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2831BF947
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2397060EC9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 20:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2397060EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RraFB6Sif79D for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 20:32:03 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE59360E50
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 20:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE59360E50
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3aca1543608so3505993b6e.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 13:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695587522; x=1696192322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uG9NhrRU2Rpf95dQm0lMTyNB864IEs/oRr3wRO1Z+Zc=;
 b=DiSX7rOCWn0EZlndyxW0X3mD3srjanyhkMUTeb/c9w7MJvuZPnbt1wu5CWAc4tBmfX
 0DMesqWexnRA7c7pV2XHRoL28joQfuPe1b6YQBLHZnHPkF1/Kx3CP8ECUv1aD7bnHZGy
 7WwSr3Bh52pTQiy4mXfHG3PvZax4cG7L3+Zg+LqqdJaqaqeGuJKvZyDpLXvwd+B7NndS
 zPrKDlm2okKtTFl0SxXNf3OguwmO8pFDc/tY/5tDdeFl7shUIzwNAc8jqE6cb+BOlUiC
 RGOLG9e7znLrgkBjuB1azn0OgNmwfiX2c6CKNA+IXTOAWzy0YUNMIHF+h7eyuW7OJf5h
 debw==
X-Gm-Message-State: AOJu0Yx1OfxTb5OHb6vQRZ1FYgoKaFFrqTS4nwLf2abR8vz1vy2KQYRk
 j47uLdVr9e9QJ+iOXiE5OI6z0A8AxIzg+p6FVaa1FqNsbhE=
X-Google-Smtp-Source: AGHT+IHndi3QGwuroIT1FYj7WoJZCYeNX3fzcVApZVN2aRFLTXS3HL8vs/6d1RCTkhOJ3t4x1BPapduKmLjhel+aAAg=
X-Received: by 2002:a05:6870:d784:b0:1cc:c744:d320 with SMTP id
 bd4-20020a056870d78400b001ccc744d320mr6711973oab.53.1695587521723; Sun, 24
 Sep 2023 13:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs6=UDJZ_6NHNFnKwagW01pcXAKSO8k-G1EUwsBjD2bpw@mail.gmail.com>
 <20230922160448.GR512384@scaer>
 <CADYjeSv4H7rqSaq5D7a9zHyZxSMp1vJv5sNs6Lj7RJLgmXEd3w@mail.gmail.com>
 <20230922170614.GS512384@scaer>
In-Reply-To: <20230922170614.GS512384@scaer>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sun, 24 Sep 2023 22:31:50 +0200
Message-ID: <CADYjeSvbksx2c3dFSUAKycThZVgi-JD2z68+uiQvGAj_4-ckqA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695587522; x=1696192322; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uG9NhrRU2Rpf95dQm0lMTyNB864IEs/oRr3wRO1Z+Zc=;
 b=TzGz6Oagww7Wdal+hZjBIZ8CFE4AWlimGmLaIGa7JsfYkGC13DrFn7zWa/Phebc4+J
 /eRbdVOO2thUOYPD12QlSJoD5dgqozxEeqJkGe2xJX/WWutXPpwlt3n2GfjnGGENCLEE
 Oqh3XlhlZf7m9hfLeZmTJ038klcYWhjpw/HwdNR1QOEEZeZRLjxBqheq0USb6nrN9//a
 rD8apWB2uiKuYQrgLhOdhXbmJUKFdK37XIL0qdA0vPfCVLlrR+vEnOP7B3PYVnh2jOBe
 eD9HkpBd/yU8vNKrtZo52P3fLfhmaOCcMEZJk8zaAdeL0PVWWT36RagypaYePjzYMZEQ
 x86w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TzGz6Oag
Subject: Re: [Buildroot] How to pass EXTRA_OECMAKE_BUILD in Buildroot
 package definition?
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
Content-Type: multipart/mixed; boundary="===============6417008947159563881=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6417008947159563881==
Content-Type: multipart/alternative; boundary="000000000000eb02b4060620bbcb"

--000000000000eb02b4060620bbcb
Content-Type: text/plain; charset="UTF-8"

Hello Yann,

Thanks for the update.

But by the name, and the value it is assigned, it looks like it
> is the list of cmake rules to build.
>
> We do have that in Buildroot: LIBFOO_MAKE_OPTS
>

Yes, I managed to build it.

 Now, if you are trying to use tensorflow-lite, there is a pending series

by James

Yes, I have tried this and reported one issue. But this version of
tensorflow is from NXP and they have added some additional configurations.
I wanted to test it.

Also, I have one more question: How can I pass the directory of a host
package in another package makefile? For example, in LIBFOO.mk file:
LIBFOO_CONF_OPTS = -DFOO_HOST_TOOLS_DIR = $(HOST_LIBX_HOST_DIR)/usr/

HOST_LIBX_HOST_DIR is the directory of host-libx.
But $(HOST_LIBX_HOST_DIR) is not being parsed.

Best Regards,
Sourabh

On Fri, 22 Sept 2023 at 19:06, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Sourabh, all,
>
> Please do not top-post, this is considered bad etiquette. Reply in-line
> as I do:
>
> On 2023-09-22 18:22 +0200, Sourabh Hegde spake thusly:
> > Yes, I checked in "Infrastructure for Cmake based packages" but couldn't
> find anything relevant.
> > There seems to be no direct way to do this in Buildroot. Please correct
> me if I'm wrong.
>
> So, you have to know what that OE variable does (I have no idea, I don't
> do OE). But by the name, and the value it is assigned, it looks like it
> is the list of cmake rules to build.
>
> We do have that in Buildroot: LIBFOO_MAKE_OPTS
>
> You could look at existign packages to see how it is used, e.g.:
>
>     $ grep _MAKE_OPTS $(git grep -l -E 'eval \$\(cmake-')
>
> Now, if you are trying to use tensorflow-lite, there is a pending series
> by James, and it would be nice if you could have a look at it, test it,
> and report, rather than try yet something else:
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=346546
>
> Regards,
> Yann E. MORIN.
>
> Regards,
> Yann E. MORIN.
>
> > On Fri, Sep 22, 2023, 18:04 Yann E. MORIN < [1]yann.morin.1998@free.fr>
> wrote:
> >
> >   Sourabh, All,
> >
> >   On 2023-09-22 17:33 +0200, Sourabh Hegde spake thusly:
> >   > Hi,
> >   > I am trying to add a Buildroot package where I need to
> specify EXTRA_OECMAKE_BUILD. But I couldn't find any relevant
> >   > variable in Buildroot for this.
> >
> >   This variable is specific to the OpenEmbedded world.
> >
> >   Look at the Buildroot manual to find the corresponding variable:
> >
> >       [2]https://buildroot.org/downloads/manual/manual.html
> >
> >   Hint: "Infrastructure for CMake-based packages"
> >
> >   Regards,
> >   Yann E. MORIN.
> >
> >   > Example will be from
> >   > [1]
> >   [3]
> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
> >   > Can anyone please let me know how to achieve this?
> >   > Thanks in advance.
> >   >
> >   > Links:
> >   > 1.
> >   [4]
> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
> >
> >   > _______________________________________________
> >   > buildroot mailing list
> >   > [5]buildroot@buildroot.org
> >   > [6]https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> >   --
> >
>  .-----------------.--------------------.------------------.--------------------.
> >   |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> >   | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>
> >      |
> >   | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/
> There is no  |
> >   | [7]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> >
>  '------------------------------^-------^------------------^--------------------'
> >
> > Links:
> > 1. mailto:yann.morin.1998@free.fr
> > 2. https://buildroot.org/downloads/manual/manual.html
> > 3.
> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
> > 4.
> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
> > 5. mailto:buildroot@buildroot.org
> > 6. https://lists.buildroot.org/mailman/listinfo/buildroot
> > 7. http://ymorin.is-a-geek.org/
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--000000000000eb02b4060620bbcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Yann,<div><br></div><div>Thanks for the update.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">But by th=
e name, and the value it is assigned, it looks like it<br>is the list of cm=
ake rules to build.<br><br>We do have that in Buildroot: LIBFOO_MAKE_OPTS<b=
r></blockquote><div><br></div><div>Yes, I managed to build it.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0Now, if you=
 are trying to use tensorflow-lite, there is a pending series</blockquote>b=
y James<div><br></div><div>Yes, I have tried this and reported one issue. B=
ut this version of tensorflow is from NXP and they have added some addition=
al configurations. I wanted to test it.</div><div><br></div><div>Also, I ha=
ve one more question: How can I pass the directory of a host package in ano=
ther package makefile? For example, in LIBFOO.mk file:<br>LIBFOO_CONF_OPTS =
=3D -DFOO_HOST_TOOLS_DIR =3D $(HOST_LIBX_HOST_DIR)/usr/</div><div><br></div=
><div>HOST_LIBX_HOST_DIR is the directory of host-libx.<br></div><div>But $=
(HOST_LIBX_HOST_DIR) is not being parsed.</div><div><br></div><div>Best Reg=
ards,</div><div>Sourabh</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 22 Sept 2023 at 19:06, Yann E. MORIN =
&lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Soura=
bh, all,<br>
<br>
Please do not top-post, this is considered bad etiquette. Reply in-line<br>
as I do:<br>
<br>
On 2023-09-22 18:22 +0200, Sourabh Hegde spake thusly:<br>
&gt; Yes, I checked in &quot;Infrastructure for Cmake based packages&quot; =
but couldn&#39;t find anything relevant.<br>
&gt; There seems to be no direct way to do this in Buildroot. Please correc=
t me if I&#39;m wrong.<br>
<br>
So, you have to know what that OE variable does (I have no idea, I don&#39;=
t<br>
do OE). But by the name, and the value it is assigned, it looks like it<br>
is the list of cmake rules to build.<br>
<br>
We do have that in Buildroot: LIBFOO_MAKE_OPTS<br>
<br>
You could look at existign packages to see how it is used, e.g.:<br>
<br>
=C2=A0 =C2=A0 $ grep _MAKE_OPTS $(git grep -l -E &#39;eval \$\(cmake-&#39;)=
<br>
<br>
Now, if you are trying to use tensorflow-lite, there is a pending series<br=
>
by James, and it would be nice if you could have a look at it, test it,<br>
and report, rather than try yet something else:<br>
=C2=A0 =C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/lis=
t/?series=3D346546" rel=3D"noreferrer" target=3D"_blank">https://patchwork.=
ozlabs.org/project/buildroot/list/?series=3D346546</a><br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; On Fri, Sep 22, 2023, 18:04 Yann E. MORIN &lt; [1]<a href=3D"mailto:ya=
nn.morin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt; wr=
ote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Sourabh, All,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0On 2023-09-22 17:33 +0200, Sourabh Hegde spake thusly:<br>
&gt;=C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0&gt; I am trying to add a Buildroot package where I need t=
o specify=C2=A0EXTRA_OECMAKE_BUILD. But I couldn&#39;t=C2=A0find any releva=
nt<br>
&gt;=C2=A0 =C2=A0&gt; variable in Buildroot for this.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0This variable is specific to the OpenEmbedded world.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Look at the Buildroot manual to find the corresponding var=
iable:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 [2]<a href=3D"https://buildroot.org/download=
s/manual/manual.html" rel=3D"noreferrer" target=3D"_blank">https://buildroo=
t.org/downloads/manual/manual.html</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0Hint: &quot;Infrastructure for CMake-based packages&quot;<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0Yann E. MORIN.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0&gt; Example will be from=C2=A0<br>
&gt;=C2=A0 =C2=A0&gt; [1]<br>
&gt;=C2=A0 =C2=A0[3]<a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a=
864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-=
lite/tensorflow-lite_2.10.0.bb#L41" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e=
6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L4=
1</a><br>
&gt;=C2=A0 =C2=A0&gt; Can anyone please let me know how to achieve this?<br=
>
&gt;=C2=A0 =C2=A0&gt; Thanks in advance.<br>
&gt;=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0&gt; Links:<br>
&gt;=C2=A0 =C2=A0&gt; 1.<br>
&gt;=C2=A0 =C2=A0[4]<a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a=
864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-=
lite/tensorflow-lite_2.10.0.bb#L41" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e=
6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L4=
1</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0&gt; _______________________________________________<br>
&gt;=C2=A0 =C2=A0&gt; buildroot mailing list<br>
&gt;=C2=A0 =C2=A0&gt; [5]<a href=3D"mailto:buildroot@buildroot.org" target=
=3D"_blank">buildroot@buildroot.org</a><br>
&gt;=C2=A0 =C2=A0&gt; [6]<a href=3D"https://lists.buildroot.org/mailman/lis=
tinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buildro=
ot.org/mailman/listinfo/buildroot</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0.-----------------.--------------------.------------------=
.--------------------.<br>
&gt;=C2=A0 =C2=A0|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;=
\ ASCII RIBBON | Erics&#39; conspiracy: |<br>
&gt;=C2=A0 =C2=A0| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br=
>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGA=
INST=C2=A0 =C2=A0 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
&gt;=C2=A0 =C2=A0| [7]<a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noref=
errer" target=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTM=
L MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&gt;=C2=A0 =C2=A0&#39;------------------------------^-------^--------------=
----^--------------------&#39;<br>
&gt; <br>
&gt; Links:<br>
&gt; 1. mailto:<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank"=
>yann.morin.1998@free.fr</a><br>
&gt; 2. <a href=3D"https://buildroot.org/downloads/manual/manual.html" rel=
=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads/manual/ma=
nual.html</a><br>
&gt; 3. <a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a=
557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorf=
low-lite_2.10.0.bb#L41" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml=
/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41</a><br>
&gt; 4. <a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a=
557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorf=
low-lite_2.10.0.bb#L41" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml=
/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41</a><br>
&gt; 5. mailto:<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank"=
>buildroot@buildroot.org</a><br>
&gt; 6. <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" =
rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/li=
stinfo/buildroot</a><br>
&gt; 7. <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=
=3D"_blank">http://ymorin.is-a-geek.org/</a><br>
<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000eb02b4060620bbcb--

--===============6417008947159563881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6417008947159563881==--
