Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533CBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:34:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFAD161131
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFAD161131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 576C94054E;
	Tue, 21 Sep 2021 13:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvt0TLVCGhHP; Tue, 21 Sep 2021 13:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 244014054F;
	Tue, 21 Sep 2021 13:34:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDEBF1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DABA14036B
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cT4R6R1w3wNi for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:34:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBACC4035D
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:34:09 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eg28so51800877edb.1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qZEXL7AakEOo/jLgb4s8DRVllD8u69W4HhUbEslOvz8=;
 b=XSb2dSSEh1LGLPKjVJ0qDJKAUjNlZ4oguq5LMht0op1YD0t/UQTT2LD3Q9ZWbAmDL4
 WfPYAENN6KYRGyEkGmKZB/wUkL896V2Rd1mkLweqDXtY9C7niNpJ2TJYPEwcTLjgKgdv
 0duZK7W0qs7m29Wireb6NBB5e86y456CkfEZqueweyWTJ5D9yDehDsYwzYJ3ry3mdw0b
 fCa4v5dpYzSQ4X1GAnTAw1wCB+Bs7YYFRZcBe99XbhUZfdnUyI1Uyp5T7gP4FWnkIVFP
 /muozj5UQDM5TcmMSxoRAWQv6H8FB+nrDxc0H6WPPPsKeY9ehmVWcj80jqaSASEGQsKk
 uqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qZEXL7AakEOo/jLgb4s8DRVllD8u69W4HhUbEslOvz8=;
 b=ux3g7QvSCXpZuPvGRAv/a+BUrIZBxB7BFE/BjwDCVtO0qRQzIKNN/umLCt9SvDtUEb
 6ZbXAI+udlWrwESU4H2DWMgA4PKL5DENuiap373vQvJiD8JdgfOyO62/juHXC1AzgJ59
 Vh4GymUrqMl6msk7tksvSU8qm32NCfM3le1+FXnz20NUn1HZW5bv8CregdYfFGhTJKsi
 m+bML+ULjqBoopqcpiDIi6SJCUeEyo4nEhDlQSYV+4YBdDjQI4iGPwBShKgHmKxCW/F4
 JUprMFP9XORY1jxF3WA0ryzbA9H+gAe4iGsJVQuAAe24qZTFxH/u/Ty7YjhyUgqrxaiA
 aLDQ==
X-Gm-Message-State: AOAM530D7FSydG5fOCfWgXkGZKt4w5W9CZQfIF91ar29HtKfzmaidHvo
 ugW9RwuIvub1+qJknv4kJ6QIxTUULK/HMHMhBb1yxI/IQBR8tg==
X-Google-Smtp-Source: ABdhPJz7GeUiluaXWDF6HXZyN9Njpq0RTBuaJPAUQF16dJOXUcGMvW/gl5PdkP4FkQ01mDSvUsBT5lBWGPw29EUbLeo=
X-Received: by 2002:a05:6402:1a53:: with SMTP id
 bf19mr35756429edb.235.1632231163549; 
 Tue, 21 Sep 2021 06:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
In-Reply-To: <163220836697.4283.6363157164675068449@kwain>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 21 Sep 2021 16:32:32 +0300
Message-ID: <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3292950109599964833=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============3292950109599964833==
Content-Type: multipart/alternative; boundary="000000000000b1eed705cc816eb7"

--000000000000b1eed705cc816eb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 10:12 AM Antoine Tenart <atenart@kernel.org> wrote:

> Quoting Jos=C3=A9 Pekkarinen (2021-09-21 08:29:38)
> >    On Mon, Sep 20, 2021 at 4:52 PM Antoine Tenart <[1]atenart@kernel.or=
g
> >
> >    wrote:
> >
> >      Reproducing locally the modules were correctly listed and enabled.
> >      However looking at the modules.conf generated on your machine, you=
r
> >      modules' documentation is included but the modules aren't enabled
> (as
> >      modules) by default. There might be some rules in the refpolicy
> build
> >      system that can explain such a difference.
> >
> >      I think the issue comes down to understanding how modules are
> selected
> >      to be enabled by default (or not enabled), and why your modules ar=
e
> >      impacted. (Then there might be something to improve in Buildroot).
> >
> >    Can this be that I'm working with an out of date version of buildroo=
t?
> >
> >    My project was started with 2021.02 and I observe the refpolicy date=
s
> from
> >    August last year. I plan to start the works on fixing this, since it
> >    impacts any sort of upstreaming.
>
> You can try with a newer version of refpolicy, in case they did fix a
> bug related to this; it's a good first test to make. But there are
> chances this is due to how modules are selected by default, there might
> be some extra logic we don't know about.
>

Hi,

I tested today to build the system with buildroot 2021.05.2(without the

patch) and it reproduces exactly the same behaviour, policy/modules.conf
doesn't
receive the line to activate the secure module, and if I search in
policy.conf or
policy.32 through sesearch I find no sign of the policies defined in the
module.
I'll attempt the upgrade to 2021.08, but that will require a bit more time.

Best regards.


Jos=C3=A9.

--000000000000b1eed705cc816eb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 21, 2021 at 10:12 AM Anto=
ine Tenart &lt;<a href=3D"mailto:atenart@kernel.org">atenart@kernel.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Quot=
ing Jos=C3=A9 Pekkarinen (2021-09-21 08:29:38)<br>
&gt;=C2=A0 =C2=A0 On Mon, Sep 20, 2021 at 4:52 PM Antoine Tenart &lt;[1]<a =
href=3D"mailto:atenart@kernel.org" target=3D"_blank">atenart@kernel.org</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Reproducing locally the modules were correctly lis=
ted and enabled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 However looking at the modules.conf generated on y=
our machine, your<br>
&gt;=C2=A0 =C2=A0 =C2=A0 modules&#39; documentation is included but the mod=
ules aren&#39;t enabled (as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 modules) by default. There might be some rules in =
the refpolicy build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 system that can explain such a difference.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 I think the issue comes down to understanding how =
modules are selected<br>
&gt;=C2=A0 =C2=A0 =C2=A0 to be enabled by default (or not enabled), and why=
 your modules are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 impacted. (Then there might be something to improv=
e in Buildroot).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Can this be that I&#39;m working with an out of date vers=
ion of buildroot?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 My project was started with 2021.02 and I observe the ref=
policy dates from<br>
&gt;=C2=A0 =C2=A0 August last year. I plan to start the works on fixing thi=
s, since it<br>
&gt;=C2=A0 =C2=A0 impacts any sort of upstreaming.<br>
<br>
You can try with a newer version of refpolicy, in case they did fix a<br>
bug related to this; it&#39;s a good first test to make. But there are<br>
chances this is due to how modules are selected by default, there might<br>
be some extra logic we don&#39;t know about.<br></blockquote><div><br></div=
></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div=
 class=3D"gmail_quote"><div>Hi,</div><div><br></div></div></blockquote><blo=
ckquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"g=
mail_quote"><div>I tested today to build the system with buildroot 2021.05.=
2(without the</div></div></blockquote>patch) and it reproduces exactly the =
same behaviour, policy/modules.conf doesn&#39;t<div>receive the line to act=
ivate the secure module, and if I search in policy.conf or</div><div>policy=
.32 through sesearch I find no sign of the policies defined in the module.<=
/div><div>I&#39;ll attempt the upgrade to 2021.08, but that will require a =
bit more time.<br> <br><blockquote style=3D"margin:0 0 0 40px;border:none;p=
adding:0px">Best regards.</blockquote><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;bor=
der:none;padding:0px">Jos=C3=A9.</blockquote></div></div></div></div>

--000000000000b1eed705cc816eb7--

--===============3292950109599964833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3292950109599964833==--
