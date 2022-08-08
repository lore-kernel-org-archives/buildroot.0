Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEACC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FDF540207;
	Mon,  8 Aug 2022 21:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FDF540207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Yd76u2lh3rz; Mon,  8 Aug 2022 21:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83CAF40180;
	Mon,  8 Aug 2022 21:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83CAF40180
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD7A71BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D75640180
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D75640180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L74xEU3ju4TX for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:39:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564704015F
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 564704015F
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:39:59 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-329dc6cd13aso24908617b3.9
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 14:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mJbnPgG82VhC/x5jCWoiCmpq5x6JQC5LgciLS0czLgE=;
 b=fTCzZezohzB/ZtNV5nr9XySL9mOJ7Ebw/SHQg0mwnphWMOvTSv3S+1IEagMLkxWieY
 XkONpVge/mfkWeh4njRK78SGZKgqC3dfAETIe8xXVeu10ttAxCguP541Ak9l6CN8FPGU
 vWbix82vnUwV5g0UcndLKXA1cuL52bAYbGRJ+UlNztztTyqGvQos8t7e7Nl3j+sLu6v+
 KBjRlEB+PyvNBH3LK9JUaUO1LEDZHQtZTxzricTmDwHJ828gJOVfPDTJX9sYxRxIe6A7
 AYyTYmxkuikc5cq3TLGA2wbcAxwcfGLmfvbDMFpc4TP3mD5zH7tRF8JJ9DNUwZlfmY13
 Dceg==
X-Gm-Message-State: ACgBeo2ZqdI/jq15M8HVH5RqEcDD4XeN0zmM0s9zSq0J+/bwydLUdKET
 K0TIYbtNfDWH303H5aCHqQR4kz21IvF4rwHaSgk=
X-Google-Smtp-Source: AA6agR6f5oEasqQav6UKl74lLwYU5IFgypupxoPv8aXenjRyTuU+nsWQ+9Y+4vp4lutiyXt03LKM2LFvzIROijkotZo=
X-Received: by 2002:a0d:cb8d:0:b0:328:460f:67b6 with SMTP id
 n135-20020a0dcb8d000000b00328460f67b6mr20581367ywd.157.1659994798126; Mon, 08
 Aug 2022 14:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-6-emile.cormier.jr@gmail.com>
 <20220808224502.01c047b4@windsurf>
In-Reply-To: <20220808224502.01c047b4@windsurf>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Mon, 8 Aug 2022 18:39:47 -0300
Message-ID: <CAM70yxBN81aO8=QCGXv6BJwF7cD4EsFzaHTpXhKtnuEXbGHVCg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=mJbnPgG82VhC/x5jCWoiCmpq5x6JQC5LgciLS0czLgE=;
 b=Oev81joRJruH1l5xFcXzfcDNuypeqtnqd+Dyx0WkZTeAqbzgrxy4jmjOxyKNXFyA38
 jYZq8GcQ/j0pC1ofv/uSpXzAgYoVvy/wKKsPMkXBQpaqORVg0MtNW6qUAJqR+HiRSjgu
 u13MG/HkApU1OO8OStV7No05jeThGrDNjlvyBvqTUNZwgHay68x0zF52jPXngouPvd96
 QDNL68xvtScj98ogzuM6jNQR/jzHjT1S1qbIskCURb5vMT1ZQg8qg/hfwZum3dP1cwvV
 2W6mPtBs6EFqso614l5EIdujaUh57TQfrryySqt8BsI4XCWiA1a7fhDxaItpfhBLmWwV
 A+ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Oev81joR
Subject: Re: [Buildroot] [PATCH 6/6] package/python-crossbar: fix
 configuration
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6616295105699331521=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6616295105699331521==
Content-Type: multipart/alternative; boundary="000000000000457bd705e5c1a831"

--000000000000457bd705e5c1a831
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thank you for your efforts towards fixing Buildroot's Crossbar. Although I
am migrating away from Crossbar (will be writing my own embeddable C++
router), I'm sure it may be useful to others.

"crossbar status" is pretty much the only easy test I know off the top of
my head. There might be some stuff in Crossbar's test suite that could be
borrowed, but I don't have much time to check right now:
https://github.com/crossbario/crossbar/tree/master/test

My expertise is more in C++ and I am not fluent in Python (although I can
read the latter).

Cheers,
Emile Cormier

On Mon, Aug 8, 2022 at 5:45 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Emile,
>
> On Sun,  3 Apr 2022 19:19:53 -0300
> Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>
> > From: ecorm <ecorm@users.noreply.github.com>
> >
> > Fixes configuration and patches setup requirements so that
> > python-crossbar can build and run.
> > See https://github.com/crossbario/crossbar/issues/1936 for discussion
> > with Crossbar author.
> > Fixes: #14556
> > Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> > ---
> >  .../0002-Remove-idna-requirement.patch        | 29 ----------
> >  ...002-Resolve-conflicting-requirements.patch | 57 +++++++++++++++++++
> >  package/python-crossbar/Config.in             | 21 +++----
> >  3 files changed, 68 insertions(+), 39 deletions(-)
> >  delete mode 100644
> package/python-crossbar/0002-Remove-idna-requirement.patch
> >  create mode 100644
> package/python-crossbar/0002-Resolve-conflicting-requirements.patch
>
> I have applied, with a number of changes:
>
>  - The patch 0002-Resolve-conflicting-requirements.patch is replaced by
>    a more general patch that removes indirect dependencies from
>    requirements-min.txt.
>
>  - The test case for crossbar is changed to no longer force autobahn to
>    use umsgpack, as we now use msgpack, expected by default by autobahn.
>
> The minimal Crossbar test case we have in
>
> https://git.buildroot.org/buildroot/tree/support/testing/tests/package/sample_python_crossbar.py
> runs correctly.
>
> If you have some suggestions of other things to test (simple tests) to
> better validate the Crossbar installation, it would be useful.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000457bd705e5c1a831
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>Thank you for you=
r efforts towards fixing Buildroot&#39;s Crossbar. Although I am migrating =
away from Crossbar (will be writing my own embeddable C++ router), I&#39;m =
sure it may be useful to others.</div><div><br></div><div>&quot;crossbar st=
atus&quot; is pretty much the only easy test I know off the top of my head.=
 There might be some stuff in Crossbar&#39;s test suite that could be borro=
wed, but I don&#39;t have much time to check right now: <a href=3D"https://=
github.com/crossbario/crossbar/tree/master/test">https://github.com/crossba=
rio/crossbar/tree/master/test</a></div><div><br></div><div>My expertise is =
more in C++ and I am not fluent in Python (although I can read the latter).=
<br></div><div><br></div><div>Cheers,</div><div>Emile Cormier<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Aug 8, 2022 at 5:45 PM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.pe=
tazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hello Emile,<br>
<br>
On Sun,=C2=A0 3 Apr 2022 19:19:53 -0300<br>
Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gmail.com" target=3D"_=
blank">emile.cormier.jr@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: ecorm &lt;<a href=3D"mailto:ecorm@users.noreply.github.com" targ=
et=3D"_blank">ecorm@users.noreply.github.com</a>&gt;<br>
&gt; <br>
&gt; Fixes configuration and patches setup requirements so that<br>
&gt; python-crossbar can build and run.<br>
&gt; See <a href=3D"https://github.com/crossbario/crossbar/issues/1936" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/crossbario/crossbar/is=
sues/1936</a> for discussion<br>
&gt; with Crossbar author.<br>
&gt; Fixes: #14556<br>
&gt; Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gm=
ail.com" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0002-Remove-idna-requirement.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 29 ----------<br>
&gt;=C2=A0 ...002-Resolve-conflicting-requirements.patch | 57 +++++++++++++=
++++++<br>
&gt;=C2=A0 package/python-crossbar/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 21 +++----<br>
&gt;=C2=A0 3 files changed, 68 insertions(+), 39 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/python-crossbar/0002-Remove-idna-requ=
irement.patch<br>
&gt;=C2=A0 create mode 100644 package/python-crossbar/0002-Resolve-conflict=
ing-requirements.patch<br>
<br>
I have applied, with a number of changes:<br>
<br>
=C2=A0- The patch 0002-Resolve-conflicting-requirements.patch is replaced b=
y<br>
=C2=A0 =C2=A0a more general patch that removes indirect dependencies from<b=
r>
=C2=A0 =C2=A0requirements-min.txt.<br>
<br>
=C2=A0- The test case for crossbar is changed to no longer force autobahn t=
o<br>
=C2=A0 =C2=A0use umsgpack, as we now use msgpack, expected by default by au=
tobahn.<br>
<br>
The minimal Crossbar test case we have in<br>
<a href=3D"https://git.buildroot.org/buildroot/tree/support/testing/tests/p=
ackage/sample_python_crossbar.py" rel=3D"noreferrer" target=3D"_blank">http=
s://git.buildroot.org/buildroot/tree/support/testing/tests/package/sample_p=
ython_crossbar.py</a><br>
runs correctly.<br>
<br>
If you have some suggestions of other things to test (simple tests) to<br>
better validate the Crossbar installation, it would be useful.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000457bd705e5c1a831--

--===============6616295105699331521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6616295105699331521==--
