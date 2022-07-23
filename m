Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FE6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 842B08489A;
	Sat, 23 Jul 2022 19:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 842B08489A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syjp6EizH5Gd; Sat, 23 Jul 2022 19:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 726718488C;
	Sat, 23 Jul 2022 19:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 726718488C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58E481BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 316594176E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316594176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xo5ioZP9smC4 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:44:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A1DB41769
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A1DB41769
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:44:14 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v12so9397786edc.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CFHqEuWfNo7lZzPrkE+DILEf6RP3KgmBEzv9BjxATEo=;
 b=W2kpWtAnq6xTsGEu6ZUu0LMJ2B6PWG4/pjRh+Eg60yQXOI4dUxvr1gmLW8yzQEhxpI
 fPQLUT4Am950O3qauIO6D+pdiPYhfsSfQcg410Y0gkWUJyK80yzVJQjUErYclA5hP4Uo
 zGKG3fjDG3e4R5mlABgZmB/UU0e9A8uJe7RBT/6fCS/g2HWvBf7OC346d61MurBV0Okl
 4fY7irD71WiurmmfWRP0yNpBHNz0MrIrYKVbtrQnogYtUr+k9GvsezczYDxPLvKm/6JG
 1vSK5UQ/BlvRcvQqZxEO00ppvmR04f0f4Uw3NTcY3+acw+creoEjR+66XGtXDUbAs3eW
 743w==
X-Gm-Message-State: AJIora8/S26sl8eYMXeUf3nmLYw5qygbv3OqVJoqnR6+uQUAGCoFrE+X
 8p3yOPOWqyFZW8gHml8MuR6Hdn7TUaEkeZb5
X-Google-Smtp-Source: AGRyM1v4PG0EC4FY03z6kTs1Oi1inEYqO9sQW220CYAqfB9YVOY3VP4FM7KPi0tt527crcK2KNpO4w==
X-Received: by 2002:a05:6402:1546:b0:43b:bc2a:36ad with SMTP id
 p6-20020a056402154600b0043bbc2a36admr5666959edx.330.1658605452485; 
 Sat, 23 Jul 2022 12:44:12 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 jz15-20020a170906bb0f00b0072637b9c8c0sm3426050ejb.219.2022.07.23.12.44.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:44:12 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id ez10so13813380ejc.13
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:44:11 -0700 (PDT)
X-Received: by 2002:a17:907:a049:b0:72b:1432:5c4 with SMTP id
 gz9-20020a170907a04900b0072b143205c4mr4511326ejc.263.1658605451501; Sat, 23
 Jul 2022 12:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220625224224.1446787-1-christian@paral.in>
 <20220723184104.0032a7dc@windsurf>
In-Reply-To: <20220723184104.0032a7dc@windsurf>
Date: Sat, 23 Jul 2022 12:44:01 -0700
X-Gmail-Original-Message-ID: <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
Message-ID: <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CFHqEuWfNo7lZzPrkE+DILEf6RP3KgmBEzv9BjxATEo=;
 b=CUuFekRowKtNROioc71QYtwuS7iDpsbHcmw7tohUv6uzOT8FwQG43LeN17EjcNx4Oq
 8sQyOWR+cBaDR+qHm0w96I/jFeA6JftIfKXU+7vhdugQknliCYnQwdpSboroPzXEStZI
 EHw3YWOOCQ3K81fsvoUUzdBO1H8c/jWntkIMLd3aodbB+D/UZoWtz/Lq0aUC7WIyNIzH
 fNMb12mm6uzMEimMp3RydriB6sZOt3+AiRWbI3CPMWhHluCnaHC+2lyVWxTnbzxHLCZk
 GgUAPXnbvMZDaHzUV5t+piO2PDw3f/9dYf7qesIEzlQillSZWeUn/n2UWMRcsXNaCCjW
 yY+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=CUuFekRo
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0686952871034044217=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0686952871034044217==
Content-Type: multipart/alternative; boundary="000000000000c2662105e47e2c7c"

--000000000000c2662105e47e2c7c
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,



On Sat, Jul 23, 2022, 9:41 AM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

>
> You're patching go.mod/go.sum, and this patching happens after we have
> done the vendoring of the dependencies in the download step (an issue
> you have reported already), so how can this patch work? I am missing
> something here?
>

The patch includes the changes to vendor/

> ++// Fixes build against risc-v
> > ++// See: https://github.com/jacobsa/crypto/issues/13
> > ++replace github.com/jacobsa/crypto =>
> github.com/aperturerobotics/jacobsa-crypto
> v0.0.0-20220403053904-77863254e607 // xorblock-generic-1
>
> This I understand of course.
>
> > ++
> > + require (
> > +     github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae
> > +     github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
> > +-    github.com/jacobsa/oglematchers
> v0.0.0-20150720000706-141901ea67cd // indirect
> > +-    github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff //
> indirect
> > +-    github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11 //
> indirect
> > +-    github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb //
> indirect
>
> But this?
>

Go uses minimum version selection and indirect dependencies. If you change
the version of a dependency, it will also update any dependencies to be at
least the version selected by the updated dependency

That said if you check the patch to vendor/ these are really just
additional lines that explicitly say which version is imported, same
versions as before, there were no changes to vendor/ outside the one crypto
package.

Best,
Christian Stewart

--000000000000c2662105e47e2c7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<div dir=3D"auto"><br></div><br><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 23, =
2022, 9:41 AM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootl=
in.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
You&#39;re patching go.mod/go.sum, and this patching happens after we have<=
br>
done the vendoring of the dependencies in the download step (an issue<br>
you have reported already), so how can this patch work? I am missing<br>
something here?<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">The patch includes the changes to vendor/</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
&gt; ++// Fixes build against risc-v<br>
&gt; ++// See: <a href=3D"https://github.com/jacobsa/crypto/issues/13" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/jacobsa/cry=
pto/issues/13</a><br>
&gt; ++replace <a href=3D"http://github.com/jacobsa/crypto" rel=3D"noreferr=
er noreferrer" target=3D"_blank">github.com/jacobsa/crypto</a> =3D&gt; <a h=
ref=3D"http://github.com/aperturerobotics/jacobsa-crypto" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">github.com/aperturerobotics/jacobsa-crypto</=
a> v0.0.0-20220403053904-77863254e607 // xorblock-generic-1<br>
<br>
This I understand of course.<br>
<br>
&gt; ++<br>
&gt; + require (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hanwen/go-fuse/v2" r=
el=3D"noreferrer noreferrer" target=3D"_blank">github.com/hanwen/go-fuse/v2=
</a> v2.1.1-0.20210825171523-3ab5d95a30ae<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/jacobsa/crypto" rel=
=3D"noreferrer noreferrer" target=3D"_blank">github.com/jacobsa/crypto</a> =
v0.0.0-20190317225127-9f44e2d11115<br>
&gt; +-=C2=A0 =C2=A0 <a href=3D"http://github.com/jacobsa/oglematchers" rel=
=3D"noreferrer noreferrer" target=3D"_blank">github.com/jacobsa/oglematcher=
s</a> v0.0.0-20150720000706-141901ea67cd // indirect<br>
&gt; +-=C2=A0 =C2=A0 <a href=3D"http://github.com/jacobsa/oglemock" rel=3D"=
noreferrer noreferrer" target=3D"_blank">github.com/jacobsa/oglemock</a> v0=
.0.0-20150831005832-e94d794d06ff // indirect<br>
&gt; +-=C2=A0 =C2=A0 <a href=3D"http://github.com/jacobsa/ogletest" rel=3D"=
noreferrer noreferrer" target=3D"_blank">github.com/jacobsa/ogletest</a> v0=
.0.0-20170503003838-80d50a735a11 // indirect<br>
&gt; +-=C2=A0 =C2=A0 <a href=3D"http://github.com/jacobsa/reqtrace" rel=3D"=
noreferrer noreferrer" target=3D"_blank">github.com/jacobsa/reqtrace</a> v0=
.0.0-20150505043853-245c9e0234cb // indirect<br>
<br>
But this?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Go uses minimum version selection and indirect dependencies. If y=
ou change the version of a dependency, it will also update any dependencies=
 to be at least the version selected by the updated dependency</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">That said if you check the patch to =
vendor/ these are really just additional lines that explicitly say which ve=
rsion is imported, same versions as before, there were no changes to vendor=
/ outside the one crypto package.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Best,</div><div dir=3D"auto">Christian Stewart=C2=A0</div></div>

--000000000000c2662105e47e2c7c--

--===============0686952871034044217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0686952871034044217==--
