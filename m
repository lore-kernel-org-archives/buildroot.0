Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606A1C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E91AC415EA;
	Fri, 14 Oct 2022 21:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E91AC415EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiYwhG4PAqag; Fri, 14 Oct 2022 21:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E24FC415E6;
	Fri, 14 Oct 2022 21:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E24FC415E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C90191BF300
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5241813B4
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5241813B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mx0E6BXoCT9v for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 21:18:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C77813A7
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5C77813A7
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 21:18:39 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id m81so6383977oia.1
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 14:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uck7MJ7eE0znj+hAGzY9ken/AoklZSB2m5m6sFID17U=;
 b=qhF+UcH5HwZRsGc/tnsBhmPHetKGu/fJr76U28OjRC9ItNXLiMBPtJ2KX7s2lFcThn
 m3NzSj3dsBFIbPbEO6XwcVhN47hzUv5lXHkiqTqeFlSCcM6J7Bssrt0ex+OZ73Y+Kezb
 pFMIlDkcZXp/2ZdohT6jMZNt3YcO7L2DgE/ZEAgder+D4RunTtsIGXtqWNW2MSiX1OHO
 fIftN3ipOQ1zExvfZNGAgwpGTMG6TUYYUGtAEDGrxgTnOC2vq44bF1dbt95RNWqzksg6
 Cebv6kYowmdvZLQ/grbKJObhmubdsWAEC7zCqCExaxYhl+bixtvLTmLAWEueJs+L1NAX
 4eVQ==
X-Gm-Message-State: ACrzQf2RZjsZehtEcW1F72LsWJxk0G1e6J3uf1GpqHXPUmzffzRfHU+m
 jrNixtZhTlZuvoquWiMmmbDd+f/tMnpx+uhcpqEP7HMHaLs=
X-Google-Smtp-Source: AMsMyM7XZYX5scO6tekX4oNMcJr1bmckEgnmYGgeoc8cpSD+rXT+tmkfksa93WkKjYOhTzMfcM8fk//RTv40hJTIa7Q=
X-Received: by 2002:aca:a892:0:b0:355:1c35:82a7 with SMTP id
 r140-20020acaa892000000b003551c3582a7mr2291129oie.37.1665782318706; Fri, 14
 Oct 2022 14:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221002004931.1805825-1-judge.packham@gmail.com>
 <20221002004931.1805825-2-judge.packham@gmail.com>
 <871qralciz.fsf@dell.be.48ers.dk>
In-Reply-To: <871qralciz.fsf@dell.be.48ers.dk>
From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 15 Oct 2022 10:18:29 +1300
Message-ID: <CAFOYHZBgVuO_iQU0NsZR-HXAh0rQE+p=h8cQ250F-7LNdF5EZA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uck7MJ7eE0znj+hAGzY9ken/AoklZSB2m5m6sFID17U=;
 b=EWtFKstSEBVHVlW25eSdR7BAoC5yZ2wb5aYGJM2YXMcd2jfDiDWDFEzB7dCp1IwfYK
 m+B5lYRgf+jlfYdlhtqZ3UUJEcj5JuBmpoX05KDi+A2xUhsYw6Mtti/MuyIm55oCvib2
 fr4zu58qMptsNtcsp7MULylzW7R/zPV6l0LEFGl4XFQ9aKdfpwnj75c+8QcFr1Ijr+az
 dqi4vh6enc8wdxPAGyQW8nlEQagunmEfpdovaXaL8e6L76EohQSnYPxMwWzVUZLvVqMV
 z3tIR9vcW5ZvlvlVJM+wPTwoCWwTkZ5C21lISiQ65f3L+Ico34XBepTDnSC4LAJ2yep6
 yvyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EWtFKstS
Subject: Re: [Buildroot] [PATCH 2/2] package/syslog-ng: Bump version to
 3.38.1
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6705350635324149311=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6705350635324149311==
Content-Type: multipart/alternative; boundary="0000000000006134e005eb052b0f"

--0000000000006134e005eb052b0f
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Oct 2022, 3:12 AM Peter Korsgaard, <peter@korsgaard.com> wrote:

> >>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:
>
>  > Add new version. Remove patch that has been applied upstream. Update
>  > hash for COPYING as it's text has changed to clarify some details but
>  > the license remains LGP-2.0+L/GPL-2.0+.
>
>  > Signed-off-by: Chris Packham <judge.packham@gmail.com>
>  > ---
>  >  ...-lib-tlscontext.c-fix-libressl-build.patch | 85 -------------------
>  >  package/syslog-ng/syslog-ng.hash              |  4 +-
>  >  package/syslog-ng/syslog-ng.mk                |  2 +-
>
> Don't you need to update the version in syslog-ng.conf as well?
>

Oh yes of course. I'll submit a v2 soon.

>

--0000000000006134e005eb052b0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, 15 Oct 2022, 3:12 AM Peter Korsgaard, &lt;<a h=
ref=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Chris&quot; =
=3D=3D Chris Packham &lt;<a href=3D"mailto:judge.packham@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">judge.packham@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Add new version. Remove patch that has been applied upstream. Up=
date<br>
=C2=A0&gt; hash for COPYING as it&#39;s text has changed to clarify some de=
tails but<br>
=C2=A0&gt; the license remains LGP-2.0+L/GPL-2.0+.<br>
<br>
=C2=A0&gt; Signed-off-by: Chris Packham &lt;<a href=3D"mailto:judge.packham=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">judge.packham@gmail.com</a=
>&gt;<br>
=C2=A0&gt; ---<br>
=C2=A0&gt;=C2=A0 ...-lib-tlscontext.c-fix-libressl-build.patch | 85 -------=
------------<br>
=C2=A0&gt;=C2=A0 package/syslog-ng/syslog-ng.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0&gt;=C2=A0 package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">syslog-ng.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
<br>
Don&#39;t you need to update the version in syslog-ng.conf as well?<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div>=
<div dir=3D"auto">Oh yes of course. I&#39;ll submit a v2 soon.</div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></bloc=
kquote></div></div></div>

--0000000000006134e005eb052b0f--

--===============6705350635324149311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6705350635324149311==--
