Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A0FC52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 17:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD44340021;
	Thu,  8 Aug 2024 17:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMxE32wM6OVh; Thu,  8 Aug 2024 17:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8C4B40104
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8C4B40104;
	Thu,  8 Aug 2024 17:39:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF5F01BF28C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 17:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDAB180AD9
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 17:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZwOj3EHI2IN for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 17:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95C57808B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C57808B0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95C57808B0
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 17:39:38 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ff1cd07f56so10935675ad.2
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 10:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723138778; x=1723743578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FibnF8eHU4Y37TYbOWCbCiJKbhHcg28Gt6jjqc+0FLs=;
 b=B3OcSHNUcff4TOjwL04KXS63T79vUll/CVjsHId8QI4FGe2qR4N44J2r/zFZhtgQOv
 AbF5RkmMbWH3sSACmmVuwMRYaQ3OqnRmm+ruwYzUuCHImdKVDWWa+UWhEcseglXAklCS
 VnxiedOzrreF+O0tTh51Jb7GhzX8Y5pl1UGyHQDi+br/MGt8w+lqLE1A5/Zse/3/EB6y
 Z6etQcqIIXXR4Xhp1fl/ggdvo46LbuiAOQYhR/kYFs+NDrtKsgFm2pEU5+6vNa2iy9+o
 AC/TdY/tzN6hT5XQQyFXIGaQhDmgrjBQ14IVFtQqHGLDqurl2sEMY6m7Bq29hNS0UoUb
 60lQ==
X-Gm-Message-State: AOJu0YzIWHP/+WnlG5UM5w222oAN1jv0Ipav+LVWOzx+Ii3g31ZrObke
 tbLqkxeWmxhp4dBywmI1qiPXl+cbRLGmH1/mK8kPZX7de4iPPKo9V1q9AQ6Mx+H3tNjqdQBPKGk
 DrXYVvl86pW5nJnU9t6U3Ln9sHzk=
X-Google-Smtp-Source: AGHT+IH1G5fzzA5yKg0VvPd0SBu+Zqfxc8beuTKT/8pzaGGQ3kJBPB1WHd3uuvMKryWJIhWTzESkrSz0YzIfzeRvD/g=
X-Received: by 2002:a17:902:e546:b0:1fd:a0e9:910 with SMTP id
 d9443c01a7336-200952e2ae4mr29573725ad.62.1723138777396; Thu, 08 Aug 2024
 10:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240807140441.3795948-1-lazzer@gmail.com>
 <20240807213952.67a49e15@windsurf>
In-Reply-To: <20240807213952.67a49e15@windsurf>
From: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Thu, 8 Aug 2024 19:39:25 +0200
Message-ID: <CALgpyNxStF14tyFOA=AZ4n=4FoKJp4CYFnF=WteRAZSmvrTvYA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723138778; x=1723743578; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FibnF8eHU4Y37TYbOWCbCiJKbhHcg28Gt6jjqc+0FLs=;
 b=HNT2od40mUATVQHeNpGydiXq9Jnhnx/sQ+sv2PpAmwC5bzfWAJXPfH9IBtyH39Ubwr
 fK0x3Xz6ODkGeJmRPe/e1OpKM+6uA7cwEDKEkJhl05wxCEGnxa+DcLEIpjcRubg/pmb9
 LWN75qC9QfPxYO1v1noLJMFiXX64DAQ5g9aucjj22J+C77bCmG9BmNPL8msuoMuqIIvV
 foS8eLCNrSw8LuHSS0N5N45mSicuW+4yelCuv0zLuQefBCpuMN8RX7Njf9meLl+xtbgT
 DGD3/tGKepp//193GtaKPhy54Y1AtpVhkF2V/RtabK2l5wgVO7nDgaxTeuVZ2m6SvFaZ
 FNLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HNT2od40
Subject: Re: [Buildroot] [PATCH 1/2] package/uboot-tools: Bump to version
 2024.04
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7303421703007789368=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7303421703007789368==
Content-Type: multipart/alternative; boundary="000000000000b9c292061f2f8200"

--000000000000b9c292061f2f8200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 9:39=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Mattias,
>
> Thanks for this contribution!
>
> On Wed,  7 Aug 2024 16:04:40 +0200
> Mattias Walstr=C3=B6m <lazzer@gmail.com> wrote:
>
> > Signed-off-by: Mattias Walstr=C3=B6m <lazzer@gmail.com>
> > ---
> >  .../0001-drop-configh-from-tools.patch        | 20 ++++++++++++++++
> >  ...-tools-only-in-no-dot-config-targets.patch | 11 ++++-----
> >  package/uboot-tools/Config.in                 |  1 +
> >  package/uboot-tools/uboot-tools.hash          |  2 +-
> >  package/uboot-tools/uboot-tools.mk            | 23 +++++++++++++------
> >  5 files changed, 42 insertions(+), 15 deletions(-)
>
> I think I'd like to merge this update, but I would like first to
> understand what's going on with:
>
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20240303171937.49055=
3-1-fontaine.fabrice@gmail.com/
>
> I haven't been able to reproduce the issue on my side with simple
> builds, so I couldn't investigate. But this issue continues to occur in
> the autobuilders:
>
>   http://autobuild.buildroot.net/?reason=3Duboot-tools%
>
> I'd like to understand the issue before applying the bump, because the
> issue exists in our 2024.02.x maintenance branch, so we want to
> understand if it can be fixed on this branch, independently or not from
> the version bump.

Ok, sounds reasonable.

>
>
Regarding your patch: can we make MKEFICAPSULE configurable in
> host-uboot-tools, just like it is for target uboot-tools? This would
> allow to not have host-gnutls as a mandatory dependency.
>
> I totally agree with you here. I will fix it.

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000b9c292061f2f8200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2024 at 9:39=E2=80=AFP=
M Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thom=
as.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hello Mattias,<br>
<br>
Thanks for this contribution!<br>
<br>
On Wed,=C2=A0 7 Aug 2024 16:04:40 +0200<br>
Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmail.com" target=3D"_bl=
ank">lazzer@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Mattias Walstr=C3=B6m &lt;<a href=3D"mailto:lazzer@gmai=
l.com" target=3D"_blank">lazzer@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-drop-configh-from-tools.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 20 ++++++++++++++++<br>
&gt;=C2=A0 ...-tools-only-in-no-dot-config-targets.patch | 11 ++++-----<br>
&gt;=C2=A0 package/uboot-tools/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/uboot-tools/uboot-tools.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 package/uboot-tools/<a href=3D"http://uboot-tools.mk" rel=3D"nor=
eferrer" target=3D"_blank">uboot-tools.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 23 +++++++++++++------<br>
&gt;=C2=A0 5 files changed, 42 insertions(+), 15 deletions(-)<br>
<br>
I think I&#39;d like to merge this update, but I would like first to<br>
understand what&#39;s going on with:<br>
<br>
=C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2024=
0303171937.490553-1-fontaine.fabrice@gmail.com/" rel=3D"noreferrer" target=
=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/2024030317=
1937.490553-1-fontaine.fabrice@gmail.com/</a><br>
<br>
I haven&#39;t been able to reproduce the issue on my side with simple<br>
builds, so I couldn&#39;t investigate. But this issue continues to occur in=
<br>
the autobuilders:<br>
<br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/?reason=3Duboot-tools%" re=
l=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/?reason=
=3Duboot-tools%</a><br>
<br>
I&#39;d like to understand the issue before applying the bump, because the<=
br>
issue exists in our 2024.02.x maintenance branch, so we want to<br>
understand if it can be fixed on this branch, independently or not from<br>
the version bump.=C2=A0</blockquote><div>Ok, sounds reasonable.</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br></blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Regarding your patch: can we make MKEFICAPSULE configurable in<br>
host-uboot-tools, just like it is for target uboot-tools? This would<br>
allow to not have host-gnutls as a mandatory dependency.<br>
<br></blockquote><div>I totally agree with you here. I will fix it.<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000b9c292061f2f8200--

--===============7303421703007789368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7303421703007789368==--
