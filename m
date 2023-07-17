Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA851EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 19:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614B3401E4;
	Mon, 17 Jul 2023 19:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 614B3401E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2Fe6ejSrl7m; Mon, 17 Jul 2023 19:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF82F4020C;
	Mon, 17 Jul 2023 19:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF82F4020C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2BAB1BF36A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 19:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC29C60ABD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 19:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC29C60ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBoRiKsE32xN for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 19:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F1336060A
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F1336060A
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 19:33:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so7932471e87.2
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 12:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689622397; x=1692214397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iviAXFp/7KPuScCFxexAaxI4KOCKpiWrn8ZXwnAceo0=;
 b=Ei1ZJOZEsoiEaojbKWMgJw0DuEKFMrRLqnNNAAHLYzPPCHdH1D2SUqV8ourVwLjDPE
 r9IdefUIpz54AZdN41PhKBv8mOjea1irZZBEJYwkSrKccQFnVlW5mVVTO/O8k2Er8c0+
 Iz8h+TUDf3cvsSFxfER+wzxN6eSL2LXlVZecMA6kShDJXn+nFB8Ts3Slvt7DsRz61n4M
 xlNVA/Jkm5oax0QQ1q/a6DJdI1D7Xtclb8xm07kV8AejGHiXpL8KFVxUDdWIAoo/Wlyc
 CSuGuIQWx9NCon8i+df/3mgYcKs5/146CLeHc5+dJ35lEa2UBDF4SZDqi/PzfXiboCMD
 yBtQ==
X-Gm-Message-State: ABy/qLaBeV4q4sQ9Cbh6ZuK8iDjep9L+HLQjGYgUDcCRnebOWopWJHRj
 HrhgAnISD+ZWXFyiag/JWofaueb/SIEvkEn8S6c=
X-Google-Smtp-Source: APBJJlGW6b9prQD9Ti4fOnQHEo8GiOk8yP4UveiEbgHf0/jjGp78/O4sN20idNTHGAwsaAIPLgKdhodvu4WV9tbdJRo=
X-Received: by 2002:a19:c51a:0:b0:4f1:3d7d:409e with SMTP id
 w26-20020a19c51a000000b004f13d7d409emr224405lfe.0.1689622397010; Mon, 17 Jul
 2023 12:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 <20230717183817.GA1080294@scaer> <20230717191652.GB1080294@scaer>
In-Reply-To: <20230717191652.GB1080294@scaer>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 17 Jul 2023 12:33:05 -0700
Message-ID: <CAFSsvmoK-GD-Vn9f1D2ANKGnU=eVRbhCFygpszChyBVawXdQ-A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689622397; x=1692214397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iviAXFp/7KPuScCFxexAaxI4KOCKpiWrn8ZXwnAceo0=;
 b=aY0IwRwGSzsT8figITs4MqccZdOmAi4/h3xQYWuSb/4479HCFFn8jpQ/AxLu1htJXT
 IxxJqMZHCFU9lDxIdZAFdbmrTN0qQjURFLcr1trPB9c4cODmfvUVarRC5upq6+Y/iV4e
 O1l5ErwW3KZI3ScMxWqswnsSvLBq3IoQKfyJYX8BEEutYZZ6IbgDDZJTkfSc7wMdJuuf
 ZGYKSTecN51vnmVEF9c4OKmy5OGCnk6yROwceczv1k2dneVygqyD/cU5vJF8whtbKTxL
 YYGx6OD5tnC7Z6kDKLVdQtCeq7Jpc9hu92fdR/E8o/1bt4FCAhUWL1ecQf0DvZX8XtQZ
 gELA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aY0IwRwG
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
Content-Type: multipart/mixed; boundary="===============7010757064099823060=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7010757064099823060==
Content-Type: multipart/alternative; boundary="000000000000c749d00600b3de77"

--000000000000c749d00600b3de77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the reply! I am going through your notes on the repository now!

As for needing the .git dirs, indeed. I found someone who wants to make the
yocto tarball reproducible.
In the end he gave up:
https://github.com/meta-flutter/meta-flutter/issues/271


On Mon, Jul 17, 2023 at 12:16=E2=80=AFPM Yann E. MORIN <yann.morin.1998@fre=
e.fr>
wrote:

> Adam, All,
>
> Folloing our discussion on IRC, it turns out that I got it partly
> (mostly) wrong.
>
> On 2023-07-17 20:38 +0200, Yann E. MORIN spake thusly:
> > On 2023-07-14 20:02 -0700, Adam Duskett spake thusly:
>
> So, we do not need to download anything from the flutter repo; we just
> need a file, .gclient, that contains directives for gclient to perform
> the actual download.
>
> As an aside, gclient is like repo (another google tool, I guess), right?
>
> So, basically, what you did in your .mk looks like I would have done,
> except no using _DL_DIR as a scratch-dir to do the download, but in a
> sub-dir of the package dir (see my previous reply).
>
> Finally: gclient runs git-clone, we can't have stability in that, it's
> not reproducible.
>
> If the .git dirs really need to be present at configure/build time,
> we're borked, we can't hash the generated tarball.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--000000000000c749d00600b3de77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the reply! I am going through your notes o=
n the repository now!</div><div><br></div><div>As for needing the .git dirs=
, indeed. I found someone who wants to make the yocto tarball reproducible.=
</div><div>In the end he gave up:=C2=A0<a href=3D"https://github.com/meta-f=
lutter/meta-flutter/issues/271">https://github.com/meta-flutter/meta-flutte=
r/issues/271</a></div><div><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jul 17, 2023 at 12:16=E2=80=AFPM Yan=
n E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@f=
ree.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Adam, All,<br>
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

--000000000000c749d00600b3de77--

--===============7010757064099823060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7010757064099823060==--
