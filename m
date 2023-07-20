Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE2C001E0
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 02:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47504405BF;
	Thu, 20 Jul 2023 02:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47504405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmCknCVXR_wx; Thu, 20 Jul 2023 02:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34A2E400D2;
	Thu, 20 Jul 2023 02:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A2E400D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 579751BF296
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 02:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 364F64049F
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 02:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364F64049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cq0hS6OR8b9k for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 02:13:06 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C12D41B3E
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 02:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C12D41B3E
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fdd7d09576so423699e87.0
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 19:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689819184; x=1692411184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7Ug25qkndWKoe8EwApZEpNH4lfwmkLXRfnX/kRZT50=;
 b=GXKQrSfRIIkN03h30jH//bdwDVZGefDyHRp7OZ58srCKtUGL33Fza9JzszQN1X163m
 VO9Kqn9xOTRdzMLrRiiygKw+QYrIMYH9SypolIxgP4XjKiC3+LqpzG8QDyABt0QZisuK
 g8arx+aWfTdmZE3V4/Ee5FUrnHysKlZ2XfS3Pnv3fpeLYe57TyvEvMGM4wRwNe4gKsuW
 Jx5Z/5vvC37Gb1o/XjzG17lApey3uA+WkXQa44T/JZEPPVqeikW3c8gMNadKh2W/DGJC
 +mryi4YS8gZYH6xfvyHyW97StugQXZ9qGtP0SUqivJIi9QWPAFm/UjfFKABVwi2Ns8Zc
 bVHQ==
X-Gm-Message-State: ABy/qLay1qCb5Pz+7U9bI8sneLezdpptUgKbw2aj1OeWCLcKhDCnA44U
 643R9wYnEknLICb0/JVYuwj+f1cN6ZcP9ciENro=
X-Google-Smtp-Source: APBJJlGFuf5vWwWZaYu4tXrahoqA1qsj3QmljescxUYpf6s03zQEC3rtdtRW2JMoEzVW3a8YrVPvoZi7fHEcqypLneA=
X-Received: by 2002:a19:4341:0:b0:4ef:ed49:fcc2 with SMTP id
 m1-20020a194341000000b004efed49fcc2mr1055737lfj.26.1689819183263; Wed, 19 Jul
 2023 19:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 <20230717183817.GA1080294@scaer> <20230717191652.GB1080294@scaer>
 <CAFSsvmoK-GD-Vn9f1D2ANKGnU=eVRbhCFygpszChyBVawXdQ-A@mail.gmail.com>
 <CAFSsvmrujPQneF4QLQXBYP12HAER=9BLzQmUeDLCvi-L97=3Kw@mail.gmail.com>
In-Reply-To: <CAFSsvmrujPQneF4QLQXBYP12HAER=9BLzQmUeDLCvi-L97=3Kw@mail.gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 19 Jul 2023 19:12:52 -0700
Message-ID: <CAFSsvmpqsgr3gczTX1S7TgJzjYGHtRysLaw-CjjTKLG21S2xHg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689819184; x=1692411184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n7Ug25qkndWKoe8EwApZEpNH4lfwmkLXRfnX/kRZT50=;
 b=WDf8L7o+mY4OFuQgpVAOmRY/i5RYQoLW+suAOrB0ckgg8lcm5NRfwN/0GlThQyN9u/
 FXAENVYezOj1nU/ZbeACNibn88H1oClKaYdWvHX/RRjuwEea5s6mQ0m0bttfqBM75C7O
 zJjPxFsHmbs18zsJfBx5d0qnYNATaNpCDgH79ea1mhTWsIz74f3M75OvcsAVw2lk6c/6
 luASXbvNwrmbDjPVPQe2Yjbwzr3UPj37fPf5Je9ZQyFLFgdYxKofc2as9veMKUtmA1f0
 On0m+KiHU2mLYTHGtFCtxvm9eE5Dn4rPlBFcCBEEK9yhYHzS+myvLVcQcDYu8UOLNY1U
 Uibg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WDf8L7o+
Subject: Re: [Buildroot] Flutter-engine package help wanted.
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3804255476930399971=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3804255476930399971==
Content-Type: multipart/alternative; boundary="0000000000002737d50600e1b053"

--0000000000002737d50600e1b053
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All;

The https://gitlab.com/aduskett/buildroot-flutter.git  project is now
updated a nearly completed
flutter-engine package. I do have one concern found in the .mk file
(
https://gitlab.com/aduskett/buildroot-flutter/-/tree/flutter-dev/package/fl=
utter-engine
)

Any help on
https://gitlab.com/aduskett/buildroot-flutter/-/blob/flutter-dev/package/fl=
utter-engine/flutter-engine.mk#L216
would be much appreciated!

Adam


On Tue, Jul 18, 2023 at 7:04=E2=80=AFPM Adam Duskett <aduskett@gmail.com> w=
rote:

> All;
>
> I updated the above buildroot repository on the flutter-dev branch, and n=
ow
> compiling flutter works with one manual step that I need to resolve.
>
> While compiling, it seems like the LDPATHS for one third-party module can=
't
> find libgcc.a, crtbeginS.o, and crtendS.o. These libraries, of course, ar=
e
> found in the toolchains directory. If I manually create symlinks to those
> files in the staging/lib directory, flutter-engine compiles successfully
> without warning.
>
> Feel free to review the flutter-engine package and give compiling a try:
> ```
> git clone https://gitlab.com/aduskett/buildroot-flutter.git -b flutter-de=
v
> cd buildroot-flutter
> make flutter_defconfig
> make flutter-engine
> ```
>
> Any thoughts on the LDPATH issue?
>
> Thanks!
>
> Adam
>
>
> On Mon, Jul 17, 2023 at 12:33=E2=80=AFPM Adam Duskett <aduskett@gmail.com=
> wrote:
>
>> Thanks for the reply! I am going through your notes on the repository no=
w!
>>
>> As for needing the .git dirs, indeed. I found someone who wants to make
>> the yocto tarball reproducible.
>> In the end he gave up:
>> https://github.com/meta-flutter/meta-flutter/issues/271
>>
>>
>> On Mon, Jul 17, 2023 at 12:16=E2=80=AFPM Yann E. MORIN <yann.morin.1998@=
free.fr>
>> wrote:
>>
>>> Adam, All,
>>>
>>> Folloing our discussion on IRC, it turns out that I got it partly
>>> (mostly) wrong.
>>>
>>> On 2023-07-17 20:38 +0200, Yann E. MORIN spake thusly:
>>> > On 2023-07-14 20:02 -0700, Adam Duskett spake thusly:
>>>
>>> So, we do not need to download anything from the flutter repo; we just
>>> need a file, .gclient, that contains directives for gclient to perform
>>> the actual download.
>>>
>>> As an aside, gclient is like repo (another google tool, I guess), right=
?
>>>
>>> So, basically, what you did in your .mk looks like I would have done,
>>> except no using _DL_DIR as a scratch-dir to do the download, but in a
>>> sub-dir of the package dir (see my previous reply).
>>>
>>> Finally: gclient runs git-clone, we can't have stability in that, it's
>>> not reproducible.
>>>
>>> If the .git dirs really need to be present at configure/build time,
>>> we're borked, we can't hash the generated tarball.
>>>
>>> Regards,
>>> Yann E. MORIN.
>>>
>>> --
>>>
>>> .-----------------.--------------------.------------------.------------=
--------.
>>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>>> conspiracy: |
>>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>>>        |
>>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
>>> is no  |
>>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>>>  conspiracy.  |
>>>
>>> '------------------------------^-------^------------------^------------=
--------'
>>>
>>

--0000000000002737d50600e1b053
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All;=C2=A0</div><div><br></div>The=C2=A0<a href=3D"ht=
tps://gitlab.com/aduskett/buildroot-flutter.git" target=3D"_blank">https://=
gitlab.com/aduskett/buildroot-flutter.git</a>=C2=A0 project is now updated =
a nearly completed<div>flutter-engine package. I do have one concern found =
in the .mk file</div><div>(<a href=3D"https://gitlab.com/aduskett/buildroot=
-flutter/-/tree/flutter-dev/package/flutter-engine">https://gitlab.com/adus=
kett/buildroot-flutter/-/tree/flutter-dev/package/flutter-engine</a>)</div>=
<div><br></div><div>Any help on=C2=A0<a href=3D"https://gitlab.com/aduskett=
/buildroot-flutter/-/blob/flutter-dev/package/flutter-engine/flutter-engine=
.mk#L216">https://gitlab.com/aduskett/buildroot-flutter/-/blob/flutter-dev/=
package/flutter-engine/flutter-engine.mk#L216</a></div><div>would be much a=
ppreciated!</div><div><br></div><div>Adam</div><div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 1=
8, 2023 at 7:04=E2=80=AFPM Adam Duskett &lt;<a href=3D"mailto:aduskett@gmai=
l.com">aduskett@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div>All;</div><div><br></div><di=
v>I updated the above buildroot repository on the flutter-dev branch, and n=
ow<br>compiling flutter works with one manual step that I need to resolve.<=
br><br>While compiling, it seems like the LDPATHS for one third-party modul=
e can&#39;t<br>find libgcc.a, crtbeginS.o, and crtendS.o. These libraries, =
of course, are<br>found in the toolchains directory. If I manually create s=
ymlinks to those<br>files in the staging/lib directory, flutter-engine comp=
iles successfully<br>without warning.<br></div><div><br></div><div>Feel fre=
e to review the flutter-engine package and give compiling a try:</div><div>=
```<br></div><div>git clone <a href=3D"https://gitlab.com/aduskett/buildroo=
t-flutter.git" target=3D"_blank">https://gitlab.com/aduskett/buildroot-flut=
ter.git</a> -b flutter-dev</div><div>cd buildroot-flutter</div><div>make fl=
utter_defconfig</div><div>make flutter-engine</div><div>``` <br></div><div>=
<br>Any thoughts on the LDPATH issue?<br><br>Thanks!<br><br>Adam</div><div>=
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Jul 17, 2023 at 12:33=E2=80=AFPM Adam Duskett &lt;<a href=3D"ma=
ilto:aduskett@gmail.com" target=3D"_blank">aduskett@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div>Thanks for the reply! I am going through your notes on the reposito=
ry now!</div><div><br></div><div>As for needing the .git dirs, indeed. I fo=
und someone who wants to make the yocto tarball reproducible.</div><div>In =
the end he gave up:=C2=A0<a href=3D"https://github.com/meta-flutter/meta-fl=
utter/issues/271" target=3D"_blank">https://github.com/meta-flutter/meta-fl=
utter/issues/271</a></div><div><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 17, 2023 at 12:16=E2=80=AFPM=
 Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_bl=
ank">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Adam, All,<br>
<br>
Folloing our discussion on IRC, it turns out that I got it partly<br>
(mostly) wrong.<br>
<br>
On 2023-07-17 20:38 +0200, Yann E. MORIN spake thusly:<br>
&gt; On 2023-07-14 20:02 -0700, Adam Duskett spake thusly:<br>
<br>
So, we do not need to download anything from the flutter repo; we just<br>
need a file, .gclient, that contains directives for gclient to perform<br>
the actual download.<br>
<br>
As an aside, gclient is like repo (another google tool, I guess), right?<br=
>
<br>
So, basically, what you did in your .mk looks like I would have done,<br>
except no using _DL_DIR as a scratch-dir to do the download, but in a<br>
sub-dir of the package dir (see my previous reply).<br>
<br>
Finally: gclient runs git-clone, we can&#39;t have stability in that, it&#3=
9;s<br>
not reproducible.<br>
<br>
If the .git dirs really need to be present at configure/build time,<br>
we&#39;re borked, we can&#39;t hash the generated tarball.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
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
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div>

--0000000000002737d50600e1b053--

--===============3804255476930399971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3804255476930399971==--
