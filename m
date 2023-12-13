Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27B4C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 20:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E53240399;
	Wed, 13 Dec 2023 20:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E53240399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKjrdcqXicc1; Wed, 13 Dec 2023 20:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86954419BA;
	Wed, 13 Dec 2023 20:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86954419BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5649D1BF475
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A43A419BA
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A43A419BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWxtC-4EHB-4 for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 20:17:49 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DF1940399
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 20:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF1940399
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1ca24776c3so1676709366b.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 12:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702498667; x=1703103467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=giDcS9Q/ttk7PjE3d4b8GR9k+CBOLBTzFujis/6OAZE=;
 b=FT4/7Fpz5hwYjjDugQpg1yk+K0zL9tbdNsB7k+MWrtM46cOVEiQf76szKsmv4r7/mB
 FnFV1O0w+Mobrg0/sQ+Puaf6/PmYBM0Ww5fXULLXsr6QsFlObLiGKrNthYneFtueaQ4y
 lZXco5AL8L4/TD8NeYZF/veFMN9tuOHtWDK6rdM3OCtVJo4aQqsIcEVZBqmm9eTfPyMu
 kseQ5/1a48v56lcQSQZvCjlre+PbKOZsPqacR0jDH3mC9uQmdeBbUw4YHi5bB5hy80SY
 rEZhRy9XM2FuA0nBJwiymLZikzuTak6y1lV/HtMgwYMz9+DqRYFfYBbIyeBZ5Ws+tYob
 ZWKw==
X-Gm-Message-State: AOJu0YxArJVS84q9M+ru+QJ4JQG1/8ZuE8GhNPI78rOz0CmKTBSUC6ky
 A13OIjf3ksAdBkN24VUJX0pl39+qPXoOFc4iCBC6f/evmctuYIq4QDQ=
X-Google-Smtp-Source: AGHT+IHloidJDsW0xdVm9cQAtpsT7dLlVbm43ANp9+NSoSv3nny6gIpGXZApKrnqzgTWmmL+YrsiY/5/+847thNUHGY=
X-Received: by 2002:a17:906:24d:b0:a22:e7d2:5a52 with SMTP id
 13-20020a170906024d00b00a22e7d25a52mr3337406ejl.71.1702498667398; Wed, 13 Dec
 2023 12:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20231209214918.2071047-1-michael@amarulasolutions.com>
 <20231213210804.39fe194f@windsurf>
In-Reply-To: <20231213210804.39fe194f@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 13 Dec 2023 21:17:34 +0100
Message-ID: <CAOf5uw=zfi=zOPh=K-kaT5MmScBxqod3okjxtnK600qn4_sZpA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702498667; x=1703103467;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=giDcS9Q/ttk7PjE3d4b8GR9k+CBOLBTzFujis/6OAZE=;
 b=oPcx2x87LqcSGDuSdICWVVq2hGcaRLZ73JeiMpEfW8xreca4EU3hDUnKR0VwHaVlgZ
 MuXmZYSLz1kD7rhgdIo66kTNzD4+LYuxpo4M0OZKkzgesHLC0PxpCtUKazhX0oY/na9w
 qEXb37/reeaYI6yCJwkcact9+Wte1/r1L/VEA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oPcx2x87
Subject: Re: [Buildroot] [PATCH V2] package: gdb: Add helping kernel gdb
 functions compilation
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3430806949710845551=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3430806949710845551==
Content-Type: multipart/alternative; boundary="0000000000004d1962060c69dcc5"

--0000000000004d1962060c69dcc5
Content-Type: text/plain; charset="UTF-8"

Hi Thomas

Il mer 13 dic 2023, 21:08 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
ha scritto:

> Hello Michael,
>
> I think the commit title is not very good/clear, and could be improved.
> However, I have some more fundamental concern. See below.
>
> On Sat,  9 Dec 2023 22:49:18 +0100
> Michael Trimarchi <michael@amarulasolutions.com> wrote:
>
> > diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> > index 070598b385..0ebeb08dad 100644
> > --- a/package/gdb/gdb.mk
> > +++ b/package/gdb/gdb.mk
> > @@ -304,5 +304,9 @@ HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_ADD_SYMLINK
> >
> >  HOST_GDB_POST_INSTALL_HOOKS += gen_gdbinit_file
> >
> > +define HOST_GDB_LINUX_CONFIG_FIXUPS
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_GDB_SCRIPTS)
> > +endef
>
> I'm not sure I like this. <pkg>_LINUX_CONFIG_FIXUPS is really meant to
> be used to enable kernel options that are really/absolutely needed for
> the package to work. I understand that CONFIG_GDB_SCRIPTS is not really
> adding anything to the kernel image itself, but rather just to the
> kernel build process, but still I believe it falls outside of the goal
> of <pkg>_LINUX_CONFIG_FIXUPS.
>
> In addition:
>
> - Many people will want to use gdb and build a Linux kernel, but not
>   necessarily want to debug the kernel. So "enabling gdb" does not
>   imply "I want to debug the kernel"
>
> - This patch does not account for the fairly common case of host gdb
>   being provided by an external toolchain. In this situation, the user
>   still has to enable CONFIG_GDB_SCRIPTS=y "manually" in his kernel
>   configuration.
>
> For all those reasons, and even though the change is simple and does no
> harm, I believe it's not really useful and aligned with the intention
> of <pkg>_LINUX_CONFIG_FIXUPS.
>
> So I would personally be in favor of not accepting this patch.
>
> Best regards,
>


My V1 was addressing your concern?

Michael

>
> Thomas Petazzoni
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000004d1962060c69dcc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas=C2=A0<br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Il mer 13 dic 2023, 21:08 Thomas Petazz=
oni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bo=
otlin.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello=
 Michael,<br>
<br>
I think the commit title is not very good/clear, and could be improved.<br>
However, I have some more fundamental concern. See below.<br>
<br>
On Sat,=C2=A0 9 Dec 2023 22:49:18 +0100<br>
Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com" targe=
t=3D"_blank" rel=3D"noreferrer">michael@amarulasolutions.com</a>&gt; wrote:=
<br>
<br>
&gt; diff --git a/package/gdb/<a href=3D"http://gdb.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">gdb.mk</a> b/package/gdb/<a href=3D"http://gdb=
.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">gdb.mk</a><br>
&gt; index 070598b385..0ebeb08dad 100644<br>
&gt; --- a/package/gdb/<a href=3D"http://gdb.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">gdb.mk</a><br>
&gt; +++ b/package/gdb/<a href=3D"http://gdb.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">gdb.mk</a><br>
&gt; @@ -304,5 +304,9 @@ HOST_GDB_POST_INSTALL_HOOKS +=3D HOST_GDB_ADD_SYML=
INK<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 HOST_GDB_POST_INSTALL_HOOKS +=3D gen_gdbinit_file<br>
&gt;=C2=A0 <br>
&gt; +define HOST_GDB_LINUX_CONFIG_FIXUPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_GDB_SCRIPTS)<br>
&gt; +endef<br>
<br>
I&#39;m not sure I like this. &lt;pkg&gt;_LINUX_CONFIG_FIXUPS is really mea=
nt to<br>
be used to enable kernel options that are really/absolutely needed for<br>
the package to work. I understand that CONFIG_GDB_SCRIPTS is not really<br>
adding anything to the kernel image itself, but rather just to the<br>
kernel build process, but still I believe it falls outside of the goal<br>
of &lt;pkg&gt;_LINUX_CONFIG_FIXUPS.<br>
<br>
In addition:<br>
<br>
- Many people will want to use gdb and build a Linux kernel, but not<br>
=C2=A0 necessarily want to debug the kernel. So &quot;enabling gdb&quot; do=
es not<br>
=C2=A0 imply &quot;I want to debug the kernel&quot;<br>
<br>
- This patch does not account for the fairly common case of host gdb<br>
=C2=A0 being provided by an external toolchain. In this situation, the user=
<br>
=C2=A0 still has to enable CONFIG_GDB_SCRIPTS=3Dy &quot;manually&quot; in h=
is kernel<br>
=C2=A0 configuration.<br>
<br>
For all those reasons, and even though the change is simple and does no<br>
harm, I believe it&#39;s not really useful and aligned with the intention<b=
r>
of &lt;pkg&gt;_LINUX_CONFIG_FIXUPS.<br>
<br>
So I would personally be in favor of not accepting this patch.<br><br>
Best regards,<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">My V1 was addressing your concern?=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Michael=C2=A0</div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thomas Petazzoni<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--0000000000004d1962060c69dcc5--

--===============3430806949710845551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3430806949710845551==--
