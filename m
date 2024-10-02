Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E8ECF3196
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 06:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0043880C55;
	Wed,  2 Oct 2024 06:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAlRXDIZADri; Wed,  2 Oct 2024 06:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064C480C5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064C480C5C;
	Wed,  2 Oct 2024 06:12:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 635EC1BF847
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 06:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17D5460A59
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 06:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ix7590T_FvMp for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 06:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B9B460A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B9B460A58
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B9B460A58
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 06:12:04 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-84eaa16442aso1682048241.2
 for <buildroot@buildroot.org>; Tue, 01 Oct 2024 23:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727849523; x=1728454323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vJD6HNG46A8fycm9PW/U8PonBnxL/lAoZRHNWwdpaKQ=;
 b=QiVTRa1bs20NL3D9SUZ7tvgjoDxHVYMq7JhpJ/HxpR8nd6JV59O6q6gYQK+EIn6G1K
 jpn1NDmxPm72D6gpuR6n2mWFJT9MKl7WQilTUfbsOJhLpS4/8LYceoqw5tD1+IkzKU93
 jQhihCtObzYeSHYcEPzhdmjzelXGtq1ll2A5PSaNn0zB8YPJn8F3OfZuM6G7DXzVqxMe
 JQ8CMWyr8TxC9OwoWCWDvN0tDkKq+1rwurfrWHfOZihvqmp58SH98W3oj90rZ8+1O88V
 XJWIddzycbkhpgIleb+z1rZ33aqIDJEgAIJZamIyfZstZ3oufOaOdrMetMd9Y8u3icOo
 uY1A==
X-Gm-Message-State: AOJu0YxMeTp/Uf1W82P76QZXdHhpxSzBJA/ur/eb0Ou/LjUpHNE3Fs+f
 CkWFfmg5fIMVGY9j9gmvbLreiCzS8FMCF9mLpv91g8xcZhjFCqct/6NratrxoDwlvbtZVGxHbIk
 1T0yYaAgsqMggidPwNTKdXcQfSVna+Q==
X-Google-Smtp-Source: AGHT+IHALsrFNDzALo9sNcxYnTt8Thuh3mZegx9RmepU0OrHnK0e/Yiqt9Iw6mlE+iG3SjkEP0MZCN9pfZ04068zPr8=
X-Received: by 2002:a05:6102:e0c:b0:4a1:5415:19e4 with SMTP id
 ada2fe7eead31-4a3e691ae3bmr1382500137.25.1727849523494; Tue, 01 Oct 2024
 23:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
 <20240930223133.1202389-2-james.hilliard1@gmail.com>
 <87plojfujn.fsf@dell.be.48ers.dk>
 <CADvTj4rw8hWgkVtz_QafMWcLGrxYi=Mitjm606L57AtXBoAXfA@mail.gmail.com>
 <87h69vf36q.fsf@dell.be.48ers.dk>
In-Reply-To: <87h69vf36q.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 2 Oct 2024 00:11:52 -0600
Message-ID: <CADvTj4qkPwGHRKzmu7ns6VZY4VDukOYvNK2chV_gU9OUyy+Ovg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727849523; x=1728454323; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vJD6HNG46A8fycm9PW/U8PonBnxL/lAoZRHNWwdpaKQ=;
 b=OVnrEOTqnZ1nWwid7Eki3jT2z/VZXI0akQoik4UAA+17D+11ugo96LxMQbQhhj3BRN
 bgc1cu+MmiIi+O59e1n0BlMsXNQzdJl71Tq57S1MDutBUG8JSgfuzoeouDKXGgBBU2xx
 cV/cH57IBiNT6wewtpnKdv6kJXVsQvflEKH2xCzTzxYcOfkM8utdd8xsgckkTs6I4fqZ
 qZeiFEnzrZskugFjkgCf2Ry62sZjzYEhWtGzeQspbHc9RlytZ2FT06pOZdHxYLpgfOHy
 xxAAHIcQLRiGwcQFVMLN138Lwi/YDv/3/T4mmqK3sIoYvN/kqAejTNgyJ/9ucKbZPlvw
 PYaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OVnrEOTq
Subject: Re: [Buildroot] [PATCH 2/4] package/libcupsfilters: new package
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7573414542271333920=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7573414542271333920==
Content-Type: multipart/alternative; boundary="00000000000012c7390623785100"

--00000000000012c7390623785100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 12:07=E2=80=AFAM Peter Korsgaard <peter@korsgaard.co=
m> wrote:

> >>>>> "James" =3D=3D James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > On Tue, Oct 1, 2024, 2:16 PM Peter Korsgaard <peter@korsgaard.com>
> wrote:
>  >> >>>>> "James" =3D=3D James Hilliard <james.hilliard1@gmail.com> write=
s:
>  >>
>  >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  >>
>  >> We should probably use version 2.1b1 instead (or backport the fix)
> given
>  >> the vulnerability:
>  >>
>  >>
>  >>
> https://github.com/OpenPrinting/libcupsfilters/security/advisories/GHSA-w=
63j-6g73-wmg5
>
>
>  > Maybe best to merge for now and backport if a final release doesn't
> show up
>  > soon?
>
> Is that backport something you would be interested in doing? I would
> mainly do the cups-filters bump to fix the security vulnerability, so it
> is not great to add two other vulnerabilities while we do that.
>

Yeah, I could do that or bump it once merged, I was just trying to keep thi=
s
series as small as possible since I'm not great at managing larger patch
series,
I try to keep patches separate when possible so I started with a minimal
version
bump.


>
> --
> Bye, Peter Korsgaard
>

--00000000000012c7390623785100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 2, 2024 at 12:07=E2=80=AFAM P=
eter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.c=
om</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;James&quot; =3D=3D Jame=
s Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blan=
k">james.hilliard1@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; On Tue, Oct 1, 2024, 2:16 PM Peter Korsgaard &lt;<a href=3D"mail=
to:peter@korsgaard.com" target=3D"_blank">peter@korsgaard.com</a>&gt; wrote=
:<br>
=C2=A0&gt;&gt; &gt;&gt;&gt;&gt;&gt; &quot;James&quot; =3D=3D James Hilliard=
 &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank">james.h=
illiard1@gmail.com</a>&gt; writes:<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; &gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:jam=
es.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;=
<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; We should probably use version 2.1b1 instead (or backport th=
e fix) given<br>
=C2=A0&gt;&gt; the vulnerability:<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; <a href=3D"https://github.com/OpenPrinting/libcupsfilters/se=
curity/advisories/GHSA-w63j-6g73-wmg5" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/OpenPrinting/libcupsfilters/security/advisories/GHSA-w6=
3j-6g73-wmg5</a><br>
<br>
<br>
=C2=A0&gt; Maybe best to merge for now and backport if a final release does=
n&#39;t show up<br>
=C2=A0&gt; soon?<br>
<br>
Is that backport something you would be interested in doing? I would<br>
mainly do the cups-filters bump to fix the security vulnerability, so it<br=
>
is not great to add two other vulnerabilities while we do that.<br></blockq=
uote><div><br></div><div>Yeah, I could do that or bump it once merged, I wa=
s just trying to keep this</div><div>series as small as possible since I&#3=
9;m not great at managing larger patch series,</div><div>I try to keep patc=
hes separate when possible so I started with a minimal version</div><div>bu=
mp.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--00000000000012c7390623785100--

--===============7573414542271333920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7573414542271333920==--
