Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D20C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 06:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C8C080DB9;
	Tue,  4 Feb 2025 06:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofp_N5NMkPhY; Tue,  4 Feb 2025 06:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B7BE80D7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B7BE80D7E;
	Tue,  4 Feb 2025 06:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6401112A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48AE880D77
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNd9IrgWMOwL for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 06:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0537980D7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0537980D7A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0537980D7A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:10:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38da84c9e4bso193928f8f.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 22:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738649437; x=1739254237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWtO3LDl540B973WElj9afvIE36jb2HOHaOmMcrBkV0=;
 b=TuGncdr914UNT5lDDonTIheZdmgywb3cMkQkYLRc7vXfFt6g/HDS+NzvPMMbyjy4C+
 cbCK8SBn4NNRfgVMfkGoGIVAi9BosXq7y8Z49TrbTkuigaVtDWINii/NB4pWxjVB3cix
 HNmD7olNLFstqE0dn18W5kRdEiunge3m4WiryvcVYT1vSE1LDLe7i1kwGk+Cih5WD9DC
 9QexpNqSx6B71MkN4m6PellHN2IPQbbW2Jl1zL4oeJJpGr2JkzUnMR+JRsKnGjFsxydN
 chs7LfXTDAO4fP4cNkLcdGa7tJAeGSUzx4sjk9fBqK0/IY+UaN8bal09sYUZd2v2xy+O
 fEog==
X-Gm-Message-State: AOJu0YzNPemefiSySEX9jt4S4v2M8gAjul6i0M2w9rnONZp66PmJ1ZKJ
 HlYkEueVix9xbwJ1lUcT5IHJ3Ea26lrsvC/DvewfzAaF4iDb8VlbwIa+AIzow0N5S1YgAYxANUA
 P0yTGtAplbcG0z6+PMqf2pAikKcbBUA==
X-Gm-Gg: ASbGncveBXRJTLHQI3NNmlYrfQzYCAPvTpQVq7W8xk3tXRzMi3sO5R5fqHfQMEH/Y4R
 TpT7TCyWInPFuQkSx0tuorca2it44bB2+2wRIZahL6Xjg5lb38VJXkE9NdrFG4mooAw6/P+AzfJ
 /KShpAs8jZlRtU3MRHPTWGLrUa+DmuKA==
X-Google-Smtp-Source: AGHT+IFs0fxC/WEp94oYn1HHM5KA1TFhb/yrDpBaJ7AduSE2fYsdDGCPRe3qEq8FjBF43mN9P6pZP3t40CfnJgWsvXM=
X-Received: by 2002:a05:6000:dd2:b0:385:f0c9:4b66 with SMTP id
 ffacd0b85a97d-38c51969feemr17351827f8f.33.1738649436589; Mon, 03 Feb 2025
 22:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20250125215546.16759-1-peter.macleod.thompson@gmail.com>
 <2e99cdf9764af30637d8d385cb429065@free.fr>
In-Reply-To: <2e99cdf9764af30637d8d385cb429065@free.fr>
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Mon, 3 Feb 2025 23:10:25 -0700
X-Gm-Features: AWEUYZniF5HofJHKTS7dch-gktrjiNVdybOJZJ6MkIGyU_PM5sVRGaI2h57QKfk
Message-ID: <CAGrGpJA_2obgL5BYRAffUb7Qmiy4ZyHtaFpb0x5G_kCY41gjWw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738649437; x=1739254237; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dWtO3LDl540B973WElj9afvIE36jb2HOHaOmMcrBkV0=;
 b=TZkVZANCK6OHtJCJva5O+NC60ahbfkj1xxFJZSnYCWF9/f9YJtp42hd5IQRW1RyBPh
 d410CQvlE977glsCQhpGmzu24wjXIxgTc9MzsST7enUsPbawfDPhKjjLxKumbY6IM9ZV
 nynzdG4XvdFt5TfWts7oZJeRJrAx8LQLo1rvMwO4pk/z/0LXBGEWgsBbHtafQz2pmoGW
 kZZ28SYyD9O/eFimeG6cTu3+bEF7sbAHWdM5LVyzhN230Khtr0yE5UHPl/IF/T6LRVrZ
 S15XxCF6P/DnpVZYXLn+MFRQMwL29tvVq+ekYCwg+aymvAB3Gh/VPcA8LAh5R/QHIyEZ
 CA7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TZkVZANC
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
 2.8.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4464937523634373898=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4464937523634373898==
Content-Type: multipart/alternative; boundary="0000000000000e95f0062d4ade6e"

--0000000000000e95f0062d4ade6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,
Thanks for the note re my error.    I will fix and resubmit the patch.

Peter


On Sun, Jan 26, 2025 at 3:31=E2=80=AFAM Julien Olivain <ju.o@free.fr> wrote=
:

> Hi Peter,
>
> Thank you for the patch.
>
> On 25/01/2025 22:55, Peter Thompson wrote:
> > From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> >
> > Signed-off-by: Peter Macleod Thompson
> > <peter.macleod.thompson@gmail.com>
> > ---
> >  package/sdl2_image/sdl2_image.hash | 4 ++--
> >  package/sdl2_image/sdl2_image.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/sdl2_image/sdl2_image.hash
> > b/package/sdl2_image/sdl2_image.hash
> > index 53a887c6f9..c34e4c1829 100644
> > --- a/package/sdl2_image/sdl2_image.hash
> > +++ b/package/sdl2_image/sdl2_image.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> > 8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc
> > SDL2_image-2.8.2.tar.gz
> > -sha256
> > a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139
> > LICENSE.txt
> > +f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f
> > SDL2_image-2.8.4.tar.gz
> > +a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139
> > SDL2_image-2.8.4/LICENSE.txt
>
> The "sha256" hash type is missing here. This is detected by running the
> commands
> "utils/docker-run make check-package" which output:
>
>      package/sdl2_image/sdl2_image.hash:2: expected three fields
> (https://nightly.buildroot.org/#adding-packages-hash)
>      package/sdl2_image/sdl2_image.hash:2: unexpected type of hash
> (https://nightly.buildroot.org/#adding-packages-hash)
>      package/sdl2_image/sdl2_image.hash:3: expected three fields
> (https://nightly.buildroot.org/#adding-packages-hash)
>      package/sdl2_image/sdl2_image.hash:3: unexpected type of hash
> (https://nightly.buildroot.org/#adding-packages-hash)
>
> Can you send an updated patch please?
>
> Best regards,
>
> Julien.
>

--0000000000000e95f0062d4ade6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien, <br></div><div>Thanks for the note re my e=
rror.=C2=A0=C2=A0=C2=A0 I will fix and resubmit the patch. <br></div><div><=
br></div><div>Peter</div><div><br></div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 2=
6, 2025 at 3:31=E2=80=AFAM Julien Olivain &lt;<a href=3D"mailto:ju.o@free.f=
r">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Peter,<br>
<br>
Thank you for the patch.<br>
<br>
On 25/01/2025 22:55, Peter Thompson wrote:<br>
&gt; From: Peter Macleod Thompson &lt;<a href=3D"mailto:peter.macleod.thomp=
son@gmail.com" target=3D"_blank">peter.macleod.thompson@gmail.com</a>&gt;<b=
r>
&gt; <br>
&gt; Signed-off-by: Peter Macleod Thompson <br>
&gt; &lt;<a href=3D"mailto:peter.macleod.thompson@gmail.com" target=3D"_bla=
nk">peter.macleod.thompson@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/sdl2_image/sdl2_image.hash | 4 ++--<br>
&gt;=C2=A0 package/sdl2_image/<a href=3D"http://sdl2_image.mk" rel=3D"noref=
errer" target=3D"_blank">sdl2_image.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/sdl2_image/sdl2_image.hash <br>
&gt; b/package/sdl2_image/sdl2_image.hash<br>
&gt; index 53a887c6f9..c34e4c1829 100644<br>
&gt; --- a/package/sdl2_image/sdl2_image.hash<br>
&gt; +++ b/package/sdl2_image/sdl2_image.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # Locally calculated<br>
&gt; -sha256=C2=A0 <br>
&gt; 8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc=C2=A0=
 <br>
&gt; SDL2_image-2.8.2.tar.gz<br>
&gt; -sha256=C2=A0 <br>
&gt; a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139=C2=A0=
 <br>
&gt; LICENSE.txt<br>
&gt; +f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f=C2=
=A0 <br>
&gt; SDL2_image-2.8.4.tar.gz<br>
&gt; +a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139=C2=
=A0 <br>
&gt; SDL2_image-2.8.4/LICENSE.txt<br>
<br>
The &quot;sha256&quot; hash type is missing here. This is detected by runni=
ng the <br>
commands<br>
&quot;utils/docker-run make check-package&quot; which output:<br>
<br>
=C2=A0 =C2=A0 =C2=A0package/sdl2_image/sdl2_image.hash:2: expected three fi=
elds <br>
(<a href=3D"https://nightly.buildroot.org/#adding-packages-hash" rel=3D"nor=
eferrer" target=3D"_blank">https://nightly.buildroot.org/#adding-packages-h=
ash</a>)<br>
=C2=A0 =C2=A0 =C2=A0package/sdl2_image/sdl2_image.hash:2: unexpected type o=
f hash <br>
(<a href=3D"https://nightly.buildroot.org/#adding-packages-hash" rel=3D"nor=
eferrer" target=3D"_blank">https://nightly.buildroot.org/#adding-packages-h=
ash</a>)<br>
=C2=A0 =C2=A0 =C2=A0package/sdl2_image/sdl2_image.hash:3: expected three fi=
elds <br>
(<a href=3D"https://nightly.buildroot.org/#adding-packages-hash" rel=3D"nor=
eferrer" target=3D"_blank">https://nightly.buildroot.org/#adding-packages-h=
ash</a>)<br>
=C2=A0 =C2=A0 =C2=A0package/sdl2_image/sdl2_image.hash:3: unexpected type o=
f hash <br>
(<a href=3D"https://nightly.buildroot.org/#adding-packages-hash" rel=3D"nor=
eferrer" target=3D"_blank">https://nightly.buildroot.org/#adding-packages-h=
ash</a>)<br>
<br>
Can you send an updated patch please?<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--0000000000000e95f0062d4ade6e--

--===============4464937523634373898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4464937523634373898==--
