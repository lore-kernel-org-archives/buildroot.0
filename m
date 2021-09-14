Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D205C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 11:35:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1151060FC1
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 11:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1151060FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65F780E29;
	Tue, 14 Sep 2021 11:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYw7C9lmjlbl; Tue, 14 Sep 2021 11:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC4AE80E27;
	Tue, 14 Sep 2021 11:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27F411BF5AA
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 11:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16AE840291
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 11:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hg99pwUl3CJZ for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 11:35:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 583B34008D
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 11:35:18 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id e21so28095647ejz.12
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 04:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YykDb+b9YaDR4S+wzwg/wfNY1xr1Wj3OLuI9Ragqi+A=;
 b=F6BzVnlDgHzOW9JKsmm0TUOuUKclrTi9A+Qr15AGcnSK8ECi5iAXLMR2dCgTLJ7bJH
 Y7wgoFnRng9uz7t35nbDmlpEmwBXx8b6uCzv6Nr3zGvFkZU5eAfdXQgUkV22I6C+m3SR
 u4+rMPz+7LFKqOUX9IEZI1jl0P9OsGYSjxJKJuBGA5CTPG0blqzqEe3ioEoXkh4QmcS+
 JuqtX2uVHs0cHgmiP+YzmIjZf94fDg9yrGV4EmziX6alDml5mX58TDOI4uPKydJwLRhx
 GpMkqvZZNjG7IJCqIsuQkVYD6OoDjuj7PGDvzpqV66pneTU6eYowBX0cVXK3EQ+ERvnR
 2ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YykDb+b9YaDR4S+wzwg/wfNY1xr1Wj3OLuI9Ragqi+A=;
 b=7E/uFmV9nj5GFFo9MlomDnpA3koq4f/OjtWwceqrBJanzU6pP+ACgAyU6OIpuSJEZQ
 b/kCJRO7Pp89xYL9ACOtNU2oX+hSGDYLI2sgBJdgDfYF6gppXyGjSTwwhDih5AXvMkVx
 oe8dc+8cB82IZqHKRasrbUV+ezjlJjcvAoq8xSsyiYpZ+2qD50whAnS9oI7tGsuIENwj
 jJj3g/VY0NXZZic7L2HTQB1FhBXC70ea6WUyMfr085TYvRTAaehixd1rRkduLPD5ujCN
 v4NvDg4nm4fPoK2DMQ/pxcunCz1NqVo3tF5+8aVTSfSYFB8kJ/TIzoKOQpvSmYRN3WIm
 ihPw==
X-Gm-Message-State: AOAM530lr+LD7k3hfDrRCMNuaVsJM5UTuPG0tPc6gZki/65aoRMMuBYT
 XlKMcq8GFtpRO2H1uNVcQLOfdOWJCQdqZAKah76ZHBaJb7JaBg==
X-Google-Smtp-Source: ABdhPJwMw6hQOIrFAov+nI/74ustWva2x2FzY402NF4rgOYsOq95TYzZU8YF/vb73RAU9PbbYK0bvehdlyRp2Go/RdE=
X-Received: by 2002:a17:906:4c8c:: with SMTP id
 q12mr18468125eju.254.1631619317063; 
 Tue, 14 Sep 2021 04:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210914094611.1782735-1-jose.pekkarinen@unikie.com>
 <d73d972b-aa6b-fdce-ca2b-2c2f2a68b53f@green-communications.fr>
In-Reply-To: <d73d972b-aa6b-fdce-ca2b-2c2f2a68b53f@green-communications.fr>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 14 Sep 2021 14:35:06 +0300
Message-ID: <CAJPV9Mp9zg=gCRwUd42k92xszS6nqt-y_SSLMZeRi7L_kDt4hQ@mail.gmail.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH] package/iptables: add init script
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
Content-Type: multipart/mixed; boundary="===============5514035379951372499=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============5514035379951372499==
Content-Type: multipart/alternative; boundary="000000000000cd785305cbf2f9ca"

--000000000000cd785305cbf2f9ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 2:05 PM Nicolas Cavallari <
nicolas.cavallari@green-communications.fr> wrote:

> On 14/09/2021 11:46, Jos=C3=A9 Pekkarinen wrote:
> > This patch will add an init script that allows
> > to set a ruleset in /etc/iptables.conf to be loaded
> > on boot, or flushed on stop, as well as a saving
> > command to generate a new file.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > ---
> >   package/iptables/S41iptables | 58 +++++++++++++++++++++++++++++++++++=
+
> >   package/iptables/iptables.mk |  6 ++++
> >   2 files changed, 64 insertions(+)
> >   create mode 100644 package/iptables/S41iptables
> >
> > diff --git a/package/iptables/S41iptables b/package/iptables/S41iptable=
s
> > new file mode 100644
> > index 0000000000..93998b78de
> > --- /dev/null
> > +++ b/package/iptables/S41iptables
>
> Regardless of whether the maintainers want this in buildroot or not, it
> does not make sense to start this after S40network;
> Ideally, the firewall should be enabled before even enabling any network
> interface.
>
> It is even debatable if the firewall should be disabled when shutting
> down, or just left enabled.
>
> (also, iptables is deprecated in favor of nftables)
>

Hi,

Thanks for the very valid points, I don't have any problem

in moving the name to any other number before 40 on demand. Re
the deprecation, I'm not sure if the tools are going away since I believe
there is backward compatibility layer in place, but certainly, if it is
requested, I can bake something similar for nftables and be done.

Best regards.

Jos=C3=A9.

--000000000000cd785305cbf2f9ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 14, 2021 at 2:05 PM Nicol=
as Cavallari &lt;<a href=3D"mailto:nicolas.cavallari@green-communications.f=
r">nicolas.cavallari@green-communications.fr</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 14/09/2021 11:46, Jos=C3=A9 =
Pekkarinen wrote:<br>
&gt; This patch will add an init script that allows<br>
&gt; to set a ruleset in /etc/iptables.conf to be loaded<br>
&gt; on boot, or flushed on stop, as well as a saving<br>
&gt; command to generate a new file.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/iptables/S41iptables | 58 ++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0package/iptables/<a href=3D"http://iptables.mk" rel=3D"nor=
eferrer" target=3D"_blank">iptables.mk</a> |=C2=A0 6 ++++<br>
&gt;=C2=A0 =C2=A02 files changed, 64 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/iptables/S41iptables<br>
&gt; <br>
&gt; diff --git a/package/iptables/S41iptables b/package/iptables/S41iptabl=
es<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..93998b78de<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/iptables/S41iptables<br>
<br>
Regardless of whether the maintainers want this in buildroot or not, it <br=
>
does not make sense to start this after S40network;<br>
Ideally, the firewall should be enabled before even enabling any network <b=
r>
interface.<br>
<br>
It is even debatable if the firewall should be disabled when shutting <br>
down, or just left enabled.<br>
<br>
(also, iptables is deprecated in favor of nftables)<br>
</blockquote></div><br clear=3D"all"><div><blockquote style=3D"margin:0 0 0=
 40px;border:none;padding:0px"><div>Hi,</div><div><br></div></blockquote><b=
lockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Thanks f=
or the very valid points, I don&#39;t have any problem</div></blockquote><d=
iv>in moving the name to any other number before 40 on demand. Re</div></di=
v><div>the deprecation, I&#39;m not sure if the tools are going away since =
I believe</div><div>there is backward compatibility layer in place, but cer=
tainly, if it is</div><div>requested, I can bake something similar for nfta=
bles and be done.</div> <div><br></div><blockquote style=3D"margin:0 0 0 40=
px;border:none;padding:0px">Best regards.<br><br></blockquote><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:=
0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></di=
v></div>

--000000000000cd785305cbf2f9ca--

--===============5514035379951372499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5514035379951372499==--
