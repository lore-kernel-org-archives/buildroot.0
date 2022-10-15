Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A184C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 08:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53E30404BA;
	Sat, 15 Oct 2022 08:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E30404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yul1MV0_oxx5; Sat, 15 Oct 2022 08:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48E9440494;
	Sat, 15 Oct 2022 08:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E9440494
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82CC91BF383
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 08:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59177410E0
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 08:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59177410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WP4tLrX6qyU for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 08:11:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFF0410A7
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EFF0410A7
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 08:11:35 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id i6so6664636pli.12
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 01:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t2jzxOkYGHZAk7sdUE5CJzsj0rELy8NESEBFY3XCWcM=;
 b=3oMBGqJyyil5Q2jTtYDnQ23fyYmPchaptmaYYUVT1AerBZRkCGmstlenH7QoIqljhs
 UN4cpILqaC4nrbIgyElil6sdF+34epswL2ROkLif7YvaC0BO3GYpxVgYhc9XjxvSAy5w
 7IjsUhCDyNMnjBpSCJ1cry7OkBJUw2gaG305G6qMgmhZ75khnrzsc7xIt0hcIPd7TBHo
 wKQcghuezlNAkh24U74oZvIDlhxqGp3LsURnEoPi6DOPDfNxz2VZF4qFpZck2UEJZ1Uu
 CymCxsDKQbLol+K8QFsDNgr1eIIDp0qtos/zyZjgwjaLNSUHdX8Eiv0znETeGCerd5cM
 ibaQ==
X-Gm-Message-State: ACrzQf3agK1LUq8XGLcudQ+7xwWO9U99GDWeYONu9IWKNLYlSMTS97DR
 xbDj65+KcpkJlIr72CjbB0ODHc8Y6ijG+lmlMg3wIyJ6veg=
X-Google-Smtp-Source: AMsMyM5v9R8mukK/YOoFqciVFlHvzbq0agmeaEoOrmVOWdZuw2lpaqsOFnqzMkOhpJwaKadbFvTLakvg3kYjKYeKk/s=
X-Received: by 2002:a17:902:7598:b0:178:3f96:4ffc with SMTP id
 j24-20020a170902759800b001783f964ffcmr1864373pll.53.1665821494702; Sat, 15
 Oct 2022 01:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdwsN--va3eFthe39JypnPWJtkXKJdN_HdMChHS8d=RoneJbQ@mail.gmail.com>
 <ede6e1e7-000e-da1a-e7af-39cc4a0a9e42@theobroma-systems.com>
In-Reply-To: <ede6e1e7-000e-da1a-e7af-39cc4a0a9e42@theobroma-systems.com>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Sat, 15 Oct 2022 10:11:22 +0200
Message-ID: <CAMdwsN--yUCczL6LavYzTDMKk_wtY4QA8femjOUX6tQdU2vF1w@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t2jzxOkYGHZAk7sdUE5CJzsj0rELy8NESEBFY3XCWcM=;
 b=QDjt/HTR+dCilD+w5GJ6MFVawi9UY0AKX5+J8nOuSw1lJfwbNuBhHm7o56LUW1qBtj
 L0yYj6DsMwDKmQfcleFb/R5+h1y5B84WsWXRaYClz2Np9Mctr8Y3rIofqWNFf4kyCZOc
 su/K4PPJq38FtmBLqOS8YMaMnZ4/CKfQh9a3e+wiPLhPK3cDp8sQbclcv04JTmiKWH05
 30wfj6uwO6bTxfIaMXofx68YFv0PvVqgbrPIdmggW28h+IrALD5FO1im2crCquxMNYpw
 REGJEa9hneDHThLCbdR9mkrjDdUyAEaD8LX8CQrLTnbHIJ4M8rX4dVtumZVeC3xHCWOO
 /gQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QDjt/HTR
Subject: Re: [Buildroot] Changing configuration options of package in
 another one
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
Content-Type: multipart/mixed; boundary="===============4700654141487025225=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4700654141487025225==
Content-Type: multipart/alternative; boundary="00000000000073776b05eb0e4ae8"

--00000000000073776b05eb0e4ae8
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022, 14:48 Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Jesse,
>
> On 10/13/22 15:06, Jesse Van Gavere wrote:
> > Hello,
> >
> > I'm in a bit of a peculiar situation for which I'm not sure what the
> > correct solution is.
> > I'm trying to implement the qt6 remote objects package, this has a
> > dependency on host-qt6remoteobjects because it needs a host tool from
> > it to build the target package, however, to build the host package it
> > needs qt6base network enabled in the host qt6 build, this is by
> > default turned off as it's not a necessity for the host tools needed
> > to build the target package.
> >
> > So to make it work I've added an enable for the network module to
> > HOST_QT6BASE_CONF_OPTS but this seems like a bit of a dirty solution,
> > what should I do here? Manipulate the qt6 host build it in the remote
> > objects package? Or maybe turn on the network module for the qt6 host
> > build whenever the target qt6 network module gets enabled?
> >
>
> Not sure I have entirely understood the issue but here's a try anyways :)
>
> I would add a build option to the host qt6 for network support in
> Kconfig, then have your remote objects package depends on this option
> being selected. If it's not selected, your package won't be selected
> either, which is what is desired I think?
>
> Cheers,
> Quentin


Hello Quentin,

Thank you, that might work yes, I think I could make it a "hidden" kconfig
option in the qt6 package which is then selected by the remote objects
package, I'll implement it that way and see how the reception to it is.
Thanks!


Regards,
Jesse

--00000000000073776b05eb0e4ae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 14, 2022, 14:48 Quentin Schulz &lt;<a href=
=3D"mailto:quentin.schulz@theobroma-systems.com">quentin.schulz@theobroma-s=
ystems.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Jesse=
,<br>
<br>
On 10/13/22 15:06, Jesse Van Gavere wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I&#39;m in a bit of a peculiar situation for which I&#39;m not sure wh=
at the<br>
&gt; correct solution is.<br>
&gt; I&#39;m trying to implement the qt6 remote objects package, this has a=
<br>
&gt; dependency on host-qt6remoteobjects because it needs a host tool from<=
br>
&gt; it to build the target package, however, to build the host package it<=
br>
&gt; needs qt6base network enabled in the host qt6 build, this is by<br>
&gt; default turned off as it&#39;s not a necessity for the host tools need=
ed<br>
&gt; to build the target package.<br>
&gt; <br>
&gt; So to make it work I&#39;ve added an enable for the network module to<=
br>
&gt; HOST_QT6BASE_CONF_OPTS but this seems like a bit of a dirty solution,<=
br>
&gt; what should I do here? Manipulate the qt6 host build it in the remote<=
br>
&gt; objects package? Or maybe turn on the network module for the qt6 host<=
br>
&gt; build whenever the target qt6 network module gets enabled?<br>
&gt; <br>
<br>
Not sure I have entirely understood the issue but here&#39;s a try anyways =
:)<br>
<br>
I would add a build option to the host qt6 for network support in <br>
Kconfig, then have your remote objects package depends on this option <br>
being selected. If it&#39;s not selected, your package won&#39;t be selecte=
d <br>
either, which is what is desired I think?<br>
<br>
Cheers,<br>
Quentin</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Hello Quentin,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank =
you, that might work yes, I think I could make it a &quot;hidden&quot; kcon=
fig option in the qt6 package which is then selected by the remote objects =
package, I&#39;ll implement it that way and see how the reception to it is.=
</div><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto">Jesse=
</div><div dir=3D"auto"></div></div>

--00000000000073776b05eb0e4ae8--

--===============4700654141487025225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4700654141487025225==--
