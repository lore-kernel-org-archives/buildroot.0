Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A056AEB64DC
	for <buildroot@archiver.kernel.org>; Wed, 19 Jul 2023 02:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAD4540550;
	Wed, 19 Jul 2023 02:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD4540550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNcVzWfAGL5R; Wed, 19 Jul 2023 02:04:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E281140121;
	Wed, 19 Jul 2023 02:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E281140121
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 095601BF303
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 02:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D511C40342
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 02:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D511C40342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-xbIJYts1KJ for <buildroot@lists.busybox.net>;
 Wed, 19 Jul 2023 02:04:21 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4A0340339
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 02:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A0340339
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fbf1f6c771so10588098e87.1
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 19:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689732259; x=1692324259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DotcZcxz00mPgIQB052jmUg5mQKWhjVhc6YvJTw61Xw=;
 b=Q7kub1ZU1ddCFx06P0BwwozhY8r22Ht/ftfGusGtjpS/27Zrdbf1GMeUh1uFRSsZrS
 8Ghn2bIUZoyzObS1262vaDQHFne8yEAxGFQcafnPydLyWW7SQXhBmC6MXQ+w3vy6PvAP
 p2P42gV7XUbfE20rQCQL3WJzEm32yUjrvV9zsY1BjAQyGW1j/227ST/orG+15Fe39bmc
 tK9fxsVY8SBhNik647nliiTeWamOO9N6+FuVJhaE6OiLbOVRbGP3gfCQCHPGt23qQNSg
 RIolKW8IUpPQNUDzzxZGxmI1/G6Wo67C8blGFHXhOv+u6X3uj6EVbwvIRF0mmLgDcsSz
 Rl6g==
X-Gm-Message-State: ABy/qLZGtWASDtdD7J1UqemBDC2rWdxT2SSlz5FFbF8LdDWJmVqVAkIj
 YhEmI336gtzDb/OfhA7sJtLbhv4dxs1Ym50mdd0=
X-Google-Smtp-Source: APBJJlEiBr8hNfsWhpS+fQp6BmTcQe9RistFuC/4iHJdmdT6K0mUPVzoi0dq5BuZG6onEwo5Q0C+jRH2+VRXLCluG9Y=
X-Received: by 2002:a2e:968c:0:b0:2b5:8f85:bf67 with SMTP id
 q12-20020a2e968c000000b002b58f85bf67mr697531lji.53.1689732258281; Tue, 18 Jul
 2023 19:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 <20230717183817.GA1080294@scaer> <20230717191652.GB1080294@scaer>
 <CAFSsvmoK-GD-Vn9f1D2ANKGnU=eVRbhCFygpszChyBVawXdQ-A@mail.gmail.com>
In-Reply-To: <CAFSsvmoK-GD-Vn9f1D2ANKGnU=eVRbhCFygpszChyBVawXdQ-A@mail.gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 18 Jul 2023 19:04:06 -0700
Message-ID: <CAFSsvmrujPQneF4QLQXBYP12HAER=9BLzQmUeDLCvi-L97=3Kw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689732259; x=1692324259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DotcZcxz00mPgIQB052jmUg5mQKWhjVhc6YvJTw61Xw=;
 b=ADkdOoCq8ujuRTcNio8lqOM09HBo1oJ9ZCtp0kIRBIpIOehBczRwxwzW8fJOVNNCXD
 jRlGb3/jmZQ+NULh/i1un2fdOMBWVpPke7NBN9upYPIYn6hT5KcvNhG8+WLDQpr5SKUq
 g053vzw9xXOqgYciB3AXDURZgEsQd/kYW5XgSD+URiI539OpX06n2aBuhMWzDGrCQF4U
 hH+777MhJ901GmKzSSgIfX8jLz2wK0ErjCB9TU6dQ9kcwFEZt/F6AqpTjA73t8HsEO+8
 7CJBnX2aUTjG8aZbS/k5uDXnzr+vFJHJ6j9fzgGD5QQqRTXXIs9a8K+8rox6MohrXoyl
 tDAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ADkdOoCq
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
Content-Type: multipart/mixed; boundary="===============6106914481858674076=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6106914481858674076==
Content-Type: multipart/alternative; boundary="0000000000000543aa0600cd73fa"

--0000000000000543aa0600cd73fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All;

I updated the above buildroot repository on the flutter-dev branch, and now
compiling flutter works with one manual step that I need to resolve.

While compiling, it seems like the LDPATHS for one third-party module can't
find libgcc.a, crtbeginS.o, and crtendS.o. These libraries, of course, are
found in the toolchains directory. If I manually create symlinks to those
files in the staging/lib directory, flutter-engine compiles successfully
without warning.

Feel free to review the flutter-engine package and give compiling a try:
```
git clone https://gitlab.com/aduskett/buildroot-flutter.git -b flutter-dev
cd buildroot-flutter
make flutter_defconfig
make flutter-engine
```

Any thoughts on the LDPATH issue?

Thanks!

Adam


On Mon, Jul 17, 2023 at 12:33=E2=80=AFPM Adam Duskett <aduskett@gmail.com> =
wrote:

> Thanks for the reply! I am going through your notes on the repository now=
!
>
> As for needing the .git dirs, indeed. I found someone who wants to make
> the yocto tarball reproducible.
> In the end he gave up:
> https://github.com/meta-flutter/meta-flutter/issues/271
>
>
> On Mon, Jul 17, 2023 at 12:16=E2=80=AFPM Yann E. MORIN <yann.morin.1998@f=
ree.fr>
> wrote:
>
>> Adam, All,
>>
>> Folloing our discussion on IRC, it turns out that I got it partly
>> (mostly) wrong.
>>
>> On 2023-07-17 20:38 +0200, Yann E. MORIN spake thusly:
>> > On 2023-07-14 20:02 -0700, Adam Duskett spake thusly:
>>
>> So, we do not need to download anything from the flutter repo; we just
>> need a file, .gclient, that contains directives for gclient to perform
>> the actual download.
>>
>> As an aside, gclient is like repo (another google tool, I guess), right?
>>
>> So, basically, what you did in your .mk looks like I would have done,
>> except no using _DL_DIR as a scratch-dir to do the download, but in a
>> sub-dir of the package dir (see my previous reply).
>>
>> Finally: gclient runs git-clone, we can't have stability in that, it's
>> not reproducible.
>>
>> If the .git dirs really need to be present at configure/build time,
>> we're borked, we can't hash the generated tarball.
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>>
>> .-----------------.--------------------.------------------.-------------=
-------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>>      |
>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
>> is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>>  conspiracy.  |
>>
>> '------------------------------^-------^------------------^-------------=
-------'
>>
>

--0000000000000543aa0600cd73fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All;</div><div><br></div><div>I updated the above bui=
ldroot repository on the flutter-dev branch, and now<br>compiling flutter w=
orks with one manual step that I need to resolve.<br><br>While compiling, i=
t seems like the LDPATHS for one third-party module can&#39;t<br>find libgc=
c.a, crtbeginS.o, and crtendS.o. These libraries, of course, are<br>found i=
n the toolchains directory. If I manually create symlinks to those<br>files=
 in the staging/lib directory, flutter-engine compiles successfully<br>with=
out warning.<br></div><div><br></div><div>Feel free to review the flutter-e=
ngine package and give compiling a try:</div><div>```<br></div><div>git clo=
ne <a href=3D"https://gitlab.com/aduskett/buildroot-flutter.git">https://gi=
tlab.com/aduskett/buildroot-flutter.git</a> -b flutter-dev</div><div>cd bui=
ldroot-flutter</div><div>make flutter_defconfig</div><div>make flutter-engi=
ne</div><div>``` <br></div><div><br>Any thoughts on the LDPATH issue?<br><b=
r>Thanks!<br><br>Adam</div><div><br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 17, 2023 at 12:33=E2=80=AFP=
M Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com">aduskett@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div>Thanks for the reply! I am going through your notes o=
n the repository now!</div><div><br></div><div>As for needing the .git dirs=
, indeed. I found someone who wants to make the yocto tarball reproducible.=
</div><div>In the end he gave up:=C2=A0<a href=3D"https://github.com/meta-f=
lutter/meta-flutter/issues/271" target=3D"_blank">https://github.com/meta-f=
lutter/meta-flutter/issues/271</a></div><div><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 17, 2023 at 12=
:16=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Adam, All,<br>
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

--0000000000000543aa0600cd73fa--

--===============6106914481858674076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6106914481858674076==--
