Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5529BCD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 09:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F7DD61550;
	Fri,  8 May 2026 09:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuAVc8TDhNAj; Fri,  8 May 2026 09:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 188656155C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778233600;
	bh=qcCgOZQb7H4iMS3tHVGj5vtsrE20MPrH6Sw6eL2031o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=km0Ox5eujzPfXAeGTLjhFCb9/E7uHuVZbKnbIorQxByfCW9AXIka7Va/pEDmzULPl
	 A1ffGcJvrJ1vdHtSibDwTS6cn9ekevvC4Z0u9h1b3CA93OBRxASJvZLz/X1CtzCS++
	 D49anHl9+0I27AVBs0wm9puW0ImXHl1JC+oDzqLh7BcXezI4tbErUSV9ROdmDI50Gs
	 BU7T7hfs3IrgLnj8IlGAIfFXlKIkfFD5/OgYnw+tSp/LKESrhXMTzo+a0BfQaQK4ho
	 YZaK/Keqf9UKfScT1FtOY6b7BePAyvCfYs38EHzsnaY/zbRaoMaKRVDGA73A10kSmx
	 cqVGKW47uBl7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188656155C;
	Fri,  8 May 2026 09:46:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C54F6358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB6A184202
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtbs7B1nqeFk for <buildroot@buildroot.org>;
 Fri,  8 May 2026 09:46:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2B43841FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2B43841FD
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2B43841FD
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:46:36 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-67179ed133dso2161267a12.2
 for <buildroot@buildroot.org>; Fri, 08 May 2026 02:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778233595; cv=none;
 d=google.com; s=arc-20240605;
 b=XmX6x5AbhSFRM5UsfwaDn0hxOUyO/YiQ4wg1q5UbWMhOLI9F13TJnlhqcyREyHZ5j0
 8VyagjfjCNIxGh7rqRGiy0uInk4bij+HYEaDUiKopae4FfM1+u58UUZZCEkPLk7nxqDa
 wg9eyUq4Y1o1pprefskwQlgtOqwKdod8yepsGLyFrwD689P0nQ1sMNSGK4YNDupwHYro
 6zLSwwrDLMBnJoGn7V9flEgmZU4sNI9VEMJUdehWpzY+wP1AffCK1D+Je7z+gyLu8aoS
 NGRLRRoD6mqe79469lYWcUg1rXA89ytdquHO7vch5Nrt0xFXmhZnJJZDQ2kDiJEOlT3/
 lzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=C4DCf3a1XXfiJaNxOOUYHaKtwnKwlP4YmuIMD+L0mxM=;
 fh=MxYKY3/PK0hPFBKBQ41TkJmgH3foJW/bclTr9JgX30I=;
 b=Wv5rAOr97FBhCFCQQvQrWH1AuH0njlRDO+D17PVhbrfFBuoAJg48Mgrsy6nGm9G8j3
 L3EsqJjn9ECy5SohYw2jpzivfq8bPZoaOwiLWdDN0ccbRR0U3d0b1MRqu91dVbyvv0UE
 BAb2vwvtSiMT4167fOkWBmuptiSBNitUMa9xjEsU2CY47cU/LDSts+ZeTRyetHdFxbyG
 WIiU0yv+CooW42BwNWxSfos0/WpYST/gocceJlL1Pwf6BDzo+wtrwxBzthv4wFu8RKmJ
 aosPUKKNSAdgwPGaGJAlQmJoxuYFdOrdCGXFxABx81/hRb4y2unC7T0qJfqSxCh5HF45
 x7RQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778233595; x=1778838395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4DCf3a1XXfiJaNxOOUYHaKtwnKwlP4YmuIMD+L0mxM=;
 b=TuVswcsXV2AITTOcQkmVpFAlKcvBy5E8NECHrwqoFjuYl8RgSTRCZmydrt/X2QvVI3
 IuVSs+9KzV+ob1NGbcFEr4D5d1dHTnsDxf/YZSk3N+Q54go9Io6J7vEE/UeOrHAjqbSK
 VNSR+OFsNLAFJ+tE1ScjHE48f+EpT3wLZ559ltbZL59DqohMd2cdfEIMUSyg+EDn2UJ3
 NIm6rksoOdouF/h1+MSKf2OF3whaKiqRIwRXy4CPBq2Qx3SdPSDzW7FahGG32fl0sAHO
 cxZs9hSBgXcPRpuu7EVYFC3mvCxS0m11+uDDwcy0V2yxcck8h6SpV7HzrxI9e82OfGDm
 e1JA==
X-Gm-Message-State: AOJu0YzlcN/FARcY13RQX62eSQdrM9ASPjUCFzPGx1Gy9JnaOWpIc4FA
 IqbdRFG/Wpmm/z4UzdNKti/0wQGm2YPRB6jVXztSJUlJ913mZzUx6YPjwRtJvuJEGxJYq5lEJYq
 RsKjyuXmSgTMYPvUeIbxEMJC5jmIc7sdAW0s/
X-Gm-Gg: Acq92OEPqewjTEzUcMyhhCo23Ok5XhNxoIsDiR+rkA4j8QcoZK/CZ1aNaye4jgaIQGk
 zQLTIWt/sCt4PdEFmOeQiz8lyrTuvigAnPx+u7oMnAFZXKMy+ruBNCD3icrGQTtiX5+wA6T655U
 esx5MansXtDbiQi6b4R4rs5yCUsfvC5XGslD3/Qz8VDJoAu8b6AM1b6N2rP3C1tM+4H9bWc6tNF
 kQMTMn2ii48VX8uCAN/CjZ5l2Rhb6gXRPGHtf7ivfwmBSyy8mQRmuXzRpNkS1NDUndIdqrAtfEy
 0ID4Od8eKtUKexGL2u6MrnySw+5C9YKn/e0Lk3I1n6PiN/SPaJg=
X-Received: by 2002:a05:6402:440f:b0:67d:5c3d:8633 with SMTP id
 4fb4d7f45d1cf-67d648b8179mr5831531a12.26.1778233594097; Fri, 08 May 2026
 02:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
 <1da2125b-1f2a-4832-aa27-b76596789f08@bubu1.eu>
In-Reply-To: <1da2125b-1f2a-4832-aa27-b76596789f08@bubu1.eu>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 8 May 2026 15:16:20 +0530
X-Gm-Features: AVHnY4L35RMaQkEFisgyHgLcusAYErWUs-WWq2Gfk4w4F8RNcrMZVWlGykTGrTs
Message-ID: <CABvxkszb_HLv=Yz5A6bUG+XKkU2a65TLuW4qCey6ZaRiqetUkw@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Buildroot List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778233595; x=1778838395; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C4DCf3a1XXfiJaNxOOUYHaKtwnKwlP4YmuIMD+L0mxM=;
 b=Sn3dR92F6B/uFIHopMTidBRWZNsAOQeyqACNQOKZgoeXFuqC0NtCbkFE2E4/54brmp
 FpskzdF2uz9wE+J8fr1Vmgkjqjkc5nPOLZ0MfjTZBO2PNEheQIOCdBBNsMlkEKPniaXy
 vFh73v9FiEA49G7nAi14f6T6zFi6mX8b5MVNbCuSRiT2q7c67Qi02cgEp55pCXve4ZMv
 5p0bhOySOlOsYHqEGTNuj0IY2CtzkK19TwacZxE1/4u/kCl+/UgHJAIvSwggw90sdMJ2
 PICHQ1MYE25JjiqqTha8HLsO+dIsURUcGQQ5TaTgQitj8o+g64gpgVYCLUaTc46w1/wk
 L/WQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Sn3dR92F
Subject: Re: [Buildroot] [PATCH 1/2] package/htop: bump to version 3.5.1
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
Content-Type: multipart/mixed; boundary="===============7690902387460906062=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7690902387460906062==
Content-Type: multipart/alternative; boundary="000000000000b4355c06514b4520"

--000000000000b4355c06514b4520
Content-Type: text/plain; charset="UTF-8"

Hi Marcus,

Thanks for the review and the feedback.


I will be more diligent with the submissions and I'll pay closer attention
to these details going forward.

I'll send a v2 shortly with the commit message cleaned up and the changelog
reference fixed.

Best regards,
Shubham

On Fri, 8 May, 2026, 2:52 pm Marcus Hoffmann, <buildroot@bubu1.eu> wrote:

> Hi Shubham,
>
> On 5/8/26 10:10, Shubham Chakraborty wrote:
> > This patch updates htop from version 3.5.0 to 3.5.1, a minor bugfix
> > release.
> >
> > Key changes in this update:
> >
> > - Bumped version from 3.5.0 to 3.5.1
> > - Updated hash from upstream source
>
> This is not that useful to add, as that's what happens with every
> package bump and it's trivially visible in diff. No need to state the
> obvious here.
>
> >
> > Changelog:
> > https://github.com/htop-dev/htop/releases/tag/3.5.1
>
> There is no actual changelog here. The changelog lives at:
> https://github.com/htop-dev/htop/blob/main/ChangeLog (best to link to
> that file from the release tag though)
>
> >
> > Builds Tested Using:
> > - utils/test-pkg -a -p htop
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> I'll mark this as changes-requested. But more importantly:
>
> Can I ask you to be a bit more diligent with the patches you send
> please? Your help in keeping packages in buildroot up-to-date is
> appreciated, but I'd like to not have to point out trivial things in
> most of your submissions at some point.
>
> Best,
> Marcus
>

--000000000000b4355c06514b4520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Marcus,<div dir=3D"auto"><br></div><div dir=3D"auto">T=
hanks for the review and the feedback.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I will be more diligent with the=
 submissions and I&#39;ll pay closer attention to these details going forwa=
rd.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll send a v2 s=
hortly with the commit message cleaned up and the changelog reference fixed=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><di=
v dir=3D"auto">Shubham</div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 8 May, 2026, 2:52=
 pm Marcus Hoffmann, &lt;<a href=3D"mailto:buildroot@bubu1.eu">buildroot@bu=
bu1.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Shubham,<b=
r>
<br>
On 5/8/26 10:10, Shubham Chakraborty wrote:<br>
&gt; This patch updates htop from version 3.5.0 to 3.5.1, a minor bugfix<br=
>
&gt; release.<br>
&gt; <br>
&gt; Key changes in this update:<br>
&gt; <br>
&gt; - Bumped version from 3.5.0 to 3.5.1<br>
&gt; - Updated hash from upstream source<br>
<br>
This is not that useful to add, as that&#39;s what happens with every <br>
package bump and it&#39;s trivially visible in diff. No need to state the <=
br>
obvious here.<br>
<br>
&gt; <br>
&gt; Changelog:<br>
&gt; <a href=3D"https://github.com/htop-dev/htop/releases/tag/3.5.1" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/htop-dev/htop/=
releases/tag/3.5.1</a><br>
<br>
There is no actual changelog here. The changelog lives at: <br>
<a href=3D"https://github.com/htop-dev/htop/blob/main/ChangeLog" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://github.com/htop-dev/htop/blob=
/main/ChangeLog</a> (best to link to <br>
that file from the release tag though)<br>
<br>
&gt; <br>
&gt; Builds Tested Using:<br>
&gt; - utils/test-pkg -a -p htop<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham6=
6@gmail.com</a>&gt;<br>
&gt; ---<br>
I&#39;ll mark this as changes-requested. But more importantly:<br>
<br>
Can I ask you to be a bit more diligent with the patches you send <br>
please? Your help in keeping packages in buildroot up-to-date is <br>
appreciated, but I&#39;d like to not have to point out trivial things in <b=
r>
most of your submissions at some point.<br>
<br>
Best,<br>
Marcus<br>
</blockquote></div>

--000000000000b4355c06514b4520--

--===============7690902387460906062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7690902387460906062==--
