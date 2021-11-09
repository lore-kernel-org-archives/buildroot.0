Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BABC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA048611CA
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA048611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD00460732;
	Tue,  9 Nov 2021 08:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6FN7ZFI9E06; Tue,  9 Nov 2021 08:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1500460621;
	Tue,  9 Nov 2021 08:39:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98AA61BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95006403A5
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H61YQcRudLjP for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:39:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FEDA40392
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:39:32 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id e9so14310765ljl.5
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 00:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjmW4I8K1MS9llt7fTNOyyaeKTJvQa+0KIL0e8qHbeo=;
 b=JQwys2aOjQ+4dr1njQ2B4zZ2OOD4O3U4cND58CPZCE6GSoETZqDXWGWUOb7VNxO7FZ
 +BrOrsTCI3GVK75oKzHsDSoRJO7Wx6m0eTp2fB79523qbqasrfIDwzqQOQl25IVBrnok
 rLJBdMRnfbOc5rubw2uzbAGWoT9AlqmM5mFSi/diXuN6RTfIYmE0D4y2MDX3oE0w/tUd
 rG2dXHrSaqIqy2mELwMNJXwRLYvAE3FBGgh8Uneg1gdZ0QaomwknCZkVPB/hg3ch78St
 L6kCjo2PlARrJ0jC8bYufvDD7ajWSpqnCUoCuuobzvIeF6xvjNAOwr4/G8PdBG8x6qlj
 EpDA==
X-Gm-Message-State: AOAM531jposkoKOBP+eDuGOR8N37L780GI2qe5mOdNWPrS1kaQP6C1dD
 4Jj4u8hDwK6gLqd19QyUx+mZ/rLzFg5SircQ7AaoUSJcsSjBLA==
X-Google-Smtp-Source: ABdhPJya6tii1eFAgbh5XfAUK0/Z+8pkptdUFoAMoZP033v810oEcjqMxAzPnt9Ra4EHy7eS3g3Xqj4BheMLSv3RWCc=
X-Received: by 2002:a2e:bc19:: with SMTP id b25mr5887548ljf.434.1636447170246; 
 Tue, 09 Nov 2021 00:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20211106190057.2487641-1-romain.naour@gmail.com>
 <CAB0FRsschq6bcfjimC1FCce+TrRx2_sJYBpwP+ZtgJNNWuFbfQ@mail.gmail.com>
 <89f9350d-63a6-4953-a212-3e2f17aa5a5f@gmail.com>
 <CAB0FRsuJ-37rquRvLsq+n5sg8gJo0PJU2-aRDqGn-kRkUju=Ug@mail.gmail.com>
 <4eb0d55eb4e537aaa4ce604127038b43212d8de2.camel@embedded.rocks>
 <5f72ced4-6f2a-9f24-6bac-c7fde6700e1e@gmail.com>
 <39214aefcc2ab923909f01873e41af39b8205c0b.camel@embedded.rocks>
 <cf0d9f73-0982-5782-7aa2-b2b0ee27639c@gmail.com>
In-Reply-To: <cf0d9f73-0982-5782-7aa2-b2b0ee27639c@gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 9 Nov 2021 09:39:19 +0100
Message-ID: <CAB0FRsvFUvQF1sxcqCiahd3oKjnAN7w3DwN9PJPiWAsh_Bdv2A@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] Revert "package/luajit: back to mainline
 and bump to 05f1984e"
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?SsO2cmcgS3JhdXNl?= <joerg.krause@embedded.rocks>
Content-Type: multipart/mixed; boundary="===============5376336714265601301=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5376336714265601301==
Content-Type: multipart/alternative; boundary="00000000000046ccd105d0570ceb"

--00000000000046ccd105d0570ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 7 nov. 2021 =C3=A0 23:27, Romain Naour <romain.naour@gmail.com> a =
=C3=A9crit :

> Hi J=C3=B6rg;
>
> Le 07/11/2021 =C3=A0 21:08, J=C3=B6rg Krause a =C3=A9crit :
> > Hello,
> >
> > just noticed I missed the second patch [2] of the series. I will re-run
> > the test with the patch applied.
>
> git bisect says that luvi doesn't work with luajit since this commit [1].
>
> Adding -DLUAJIT_DISABLE_GC64 to luajit.mk allow to use luvi -v on the
> target but
> I get a strange behavior. The list returned by luvi -v is not always in
> the same
> order:
>
> # luvi -v
>
>                             luvi v2.12.0
>
>                                                         rex: 8.45
> 2021-06-15
>
>
>    libuv: 1.42.0
>
>                                zlib: 1.2.11
>
>                                                            ssl: OpenSSL
> 1.1.1l
> 24 Aug 2021, lua-openssl 0.7.8
>
> # luvi -v
>
>                             luvi v2.12.0
>
>                                                         libuv: 1.42.0
>
>
>    ssl: OpenSSL 1.1.1l  24 Aug 2021, lua-openssl 0.7.8
>
>                                rex: 8.45 2021-06-15
>
>                                                            zlib: 1.2.11
>
> The current test is expecting having a reproducible result.
>
> With moonjit we get the same result each time.
>
> I'm not sure if using luajit is really safe for the upcoming Buildroot
> release.
>
> [1]
> https://github.com/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32aad79b7ea8ea6=
b78ed25
>
>
thanks Romain,

your bisect gives the fix,
see
https://patchwork.ozlabs.org/project/buildroot/patch/20211108201054.225256-=
1-francois.perrad@gadz.org/

Fran=C3=A7ois

Best regards,
> Romain
>
>
>
>
>

--00000000000046ccd105d0570ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 7 nov. 2021 =C3=A0=C2=A0=
23:27, Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com">romain.na=
our@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi J=C3=B6rg;<br>
<br>
Le 07/11/2021 =C3=A0 21:08, J=C3=B6rg Krause a =C3=A9crit=C2=A0:<br>
&gt; Hello,<br>
&gt; <br>
&gt; just noticed I missed the second patch [2] of the series. I will re-ru=
n<br>
&gt; the test with the patch applied.<br>
<br>
git bisect says that luvi doesn&#39;t work with luajit since this commit [1=
].<br>
<br>
Adding -DLUAJIT_DISABLE_GC64 to <a href=3D"http://luajit.mk" rel=3D"norefer=
rer" target=3D"_blank">luajit.mk</a> allow to use luvi -v on the target but=
<br>
I get a strange behavior. The list returned by luvi -v is not always in the=
 same<br>
order:<br>
<br>
# luvi -v<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 luvi v2.12.0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rex: 8.45 2021-06-15<br>
<br>
<br>
=C2=A0 =C2=A0libuv: 1.42.0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zlib: 1.2.11<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssl: OpenSSL =
1.1.1l<br>
24 Aug 2021, lua-openssl 0.7.8<br>
<br>
# luvi -v<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 luvi v2.12.0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libuv: 1.42.0<br>
<br>
<br>
=C2=A0 =C2=A0ssl: OpenSSL 1.1.1l=C2=A0 24 Aug 2021, lua-openssl 0.7.8<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rex: 8.45 2021-06-15<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zlib: 1.2.11<=
br>
<br>
The current test is expecting having a reproducible result.<br>
<br>
With moonjit we get the same result each time.<br>
<br>
I&#39;m not sure if using luajit is really safe for the upcoming Buildroot =
release.<br>
<br>
[1] <a href=3D"https://github.com/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32=
aad79b7ea8ea6b78ed25" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32aad79b7ea8ea6b78ed25</a><br>
<br></blockquote><div><br></div><div>thanks Romain,<br><br>your bisect give=
s the fix,<br>see <a href=3D"https://patchwork.ozlabs.org/project/buildroot=
/patch/20211108201054.225256-1-francois.perrad@gadz.org/">https://patchwork=
.ozlabs.org/project/buildroot/patch/20211108201054.225256-1-francois.perrad=
@gadz.org/</a></div><div><br></div><div>Fran=C3=A7ois<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Romain<br>
<br>
<br>
<br><br>
</blockquote></div></div>

--00000000000046ccd105d0570ceb--

--===============5376336714265601301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5376336714265601301==--
