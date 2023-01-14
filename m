Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BAEC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 08:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E94AF60BFE;
	Sat, 14 Jan 2023 08:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E94AF60BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBf5B73DgaKa; Sat, 14 Jan 2023 08:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B9CC60A92;
	Sat, 14 Jan 2023 08:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B9CC60A92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCDEB1BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B133B60A92
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B133B60A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12TPoFeoHsjF for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 08:41:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E49D60A87
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E49D60A87
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 08:41:27 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-4d4303c9de6so164931657b3.2
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R6nVLo1KlLUKzrByugcWTe9Jl8EjvUKBoqdbhb+4AEY=;
 b=gkp39xxgxtNtndVJDwPaEyGV861PMlVtFKxuoSC5/SySPoZRnI8BdYDZ6wVZO9tvvA
 zBj1P+zTU+xRPbBSrQkCwahHTn7io/zGf5E25tW5qHQF7qlmBarvy5fjhDzTSdGnquIF
 i1tOrdaPCb3DWjqG88r7YTVZU7lIWphXZEfWU27yHcpBEOimNL0d4YneFBRMOrQ8xDXU
 BKlIzc5oHWVcOe4zu2T4G0cG9HhTJkBKUpDDHV45IYsks80IGfJnIsPo5XpKU/pqEBhl
 YDiURgEAVR0aBwD8b92Jow5GoagYe1ellbJNfEVPpKlFWmjdC3CqIHbX3aphnfgf90tw
 007g==
X-Gm-Message-State: AFqh2kplkiSGq7PiMqRSny5Y/iYoKjkZbpdyzCRt8bRWo21HO9OfQpjm
 2vZzCJ22p/wstrRrT5bSoAMlexl0wUKyPOx20LVeTcnDGxM=
X-Google-Smtp-Source: AMrXdXtvo/LExo9+fq/eUSn8qbmyqNmfq8FUcViP+M+UXpknwyHKnZup/UvuaEiAUAjJ9D8wPRwHSUl1haThp452gGc=
X-Received: by 2002:a0d:dfca:0:b0:4dd:c62f:d65a with SMTP id
 i193-20020a0ddfca000000b004ddc62fd65amr443066ywe.427.1673685686292; Sat, 14
 Jan 2023 00:41:26 -0800 (PST)
MIME-Version: 1.0
References: <CAHdaamN7mawJYf6LAVJXTtptm08u79TucxEbbSoMYHduhUdL3A@mail.gmail.com>
 <20230114080317.GW151997@scaer>
In-Reply-To: <20230114080317.GW151997@scaer>
From: Ernie Carp <erniecarp2018@gmail.com>
Date: Sat, 14 Jan 2023 00:41:14 -0800
Message-ID: <CAHdaamOc_WvirYtobkqqPwqCCM_KaaUWjLgevRGyYJ=ygfxKvg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R6nVLo1KlLUKzrByugcWTe9Jl8EjvUKBoqdbhb+4AEY=;
 b=csH383XTfTdOR8kWUWkaywD9NMCI4jAxUFxgTXsgjdVHMa7Z16Czl2UfTTrWBT8Uji
 G6lLJCc1eYg0sFgYU4x8U9YmEHhIKSarbrn7gk/e9sCg9cBUCkm/kvIXVfz/LeOz8Qzk
 WW1C9bK7H5cb8WgKTbwxs7lduduyPtEd9+zG9M9ylYxqvFiBNnKQSoOxHqO5JvC47LAz
 xprE8qHOHyfjhUtvtzYui0e1ODu/GfwDopPQHcOJ8Fse8gHY6rGzWTBTGIYI3K2ErTIv
 AJAGku5lZLyHiXeci+Yj9P5PJ1TT4WdND5os+/ZeXcTv7SEL/dSgh+JNUV2hTrVO8d74
 nliA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=csH383XT
Subject: Re: [Buildroot] Python 3 bcrypt error
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
Content-Type: multipart/mixed; boundary="===============9222167596411083940=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9222167596411083940==
Content-Type: multipart/alternative; boundary="000000000000cc16df05f235502b"

--000000000000cc16df05f235502b
Content-Type: text/plain; charset="UTF-8"

Hello Yann, All,

A few days ago I ran:  git clone git://git.buildroot.net/buildroot
It grabbed Buildroot 2022.11-822-ga0a428f135-dirty
Not sure what's up with -dirty. I will try the buildroot-2022.11.tar.gz
archive instead.

Thank you,
Ernie.

On Sat, Jan 14, 2023 at 12:03 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Ernie, All,
>
> On 2023-01-13 22:31 -0800, Ernie Carp spake thusly:
> > Hello,
> > When compiling python3 on buildroot version 2022-11 I get an error
> message about bcrypt.
>
> In Buildroot 2022.11, as well as in the 2022.11.x maintenance branch,
> we only have pythonbcrypt 3.2.0, but the traces below refer to 4.0.1,
> which is only in master.
>
> So, are you sure you are using buildroot 2022.11? If so, how can you be
> using python-bcrypt 4.0.1?
>
> > The PyPi.org lists the sha256 hash as
> 27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd
> > Need a little help to fix it.
> > [source.vendored-sources]
> > directory = "VENDOR"
> > ERROR: bcrypt-4.0.1.tar.gz has wrong sha256 hash:
> > ERROR: expected:
> d64daee0af1afe137718674e67a49b8bb791842aab265b588a6d68d44a449c70
> > ERROR: got     :
> 108aaa38326360d716f4a6e2e98bfe84969542e559bd8bfe3b09ccc93e6c2944
> > ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> This has now supposedly been fixed in master with commit ac2b26fba2ad
> (support/download: fix cargo vendoring).
>
> Regards,
> Yann E. MORIN.
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

--000000000000cc16df05f235502b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello Yann, All,<div><br=
></div><div>A few days ago I ran:=C2=A0=C2=A0git clone git://<a href=3D"htt=
p://git.buildroot.net/buildroot">git.buildroot.net/buildroot</a></div><div>=
It grabbed=C2=A0Buildroot 2022.11-822-ga0a428f135-dirty</div><div>Not sure =
what&#39;s up with -dirty. I will try the buildroot-2022.11.tar.gz archive =
instead.</div><div><br></div><div>Thank you,</div><div>Ernie.</div></div></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sat, Jan 14, 2023 at 12:03 AM Yann E. MORIN &lt;<a href=3D"mailto:ya=
nn.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Ernie, All,<br>
<br>
On 2023-01-13 22:31 -0800, Ernie Carp spake thusly:<br>
&gt; Hello,<br>
&gt; When compiling python3 on buildroot version 2022-11 I get an error mes=
sage about bcrypt.<br>
<br>
In Buildroot 2022.11, as well as in the 2022.11.x maintenance branch,<br>
we only have pythonbcrypt 3.2.0, but the traces below refer to 4.0.1,<br>
which is only in master.<br>
<br>
So, are you sure you are using buildroot 2022.11? If so, how can you be<br>
using python-bcrypt 4.0.1?<br>
<br>
&gt; The PyPi.org lists the sha256 hash as 27d375903ac8261cfe4047f6709d16f7=
d18d39b1ec92aaf72af989552a650ebd<br>
&gt; Need a little help to fix it.<br>
&gt; [source.vendored-sources]<br>
&gt; directory =3D &quot;VENDOR&quot;<br>
&gt; ERROR: bcrypt-4.0.1.tar.gz has wrong sha256 hash:<br>
&gt; ERROR: expected: d64daee0af1afe137718674e67a49b8bb791842aab265b588a6d6=
8d44a449c70<br>
&gt; ERROR: got=C2=A0 =C2=A0 =C2=A0: 108aaa38326360d716f4a6e2e98bfe84969542=
e559bd8bfe3b09ccc93e6c2944<br>
&gt; ERROR: Incomplete download, or man-in-the-middle (MITM) attack<br>
<br>
This has now supposedly been fixed in master with commit ac2b26fba2ad<br>
(support/download: fix cargo vendoring).<br>
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
</blockquote></div>

--000000000000cc16df05f235502b--

--===============9222167596411083940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9222167596411083940==--
