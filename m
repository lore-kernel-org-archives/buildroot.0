Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CED0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 07:58:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96ED560EE7
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96ED560EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389A240194;
	Tue, 21 Sep 2021 07:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSPybwNYxRlo; Tue, 21 Sep 2021 07:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6ED40168;
	Tue, 21 Sep 2021 07:58:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534A11BF2CB
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 07:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3103C40039
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 07:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSCELVTMQEey for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 07:58:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3419E4050B
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 07:58:26 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so5736803otb.5
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 00:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9XRu2iMkzc4t8wtMjo8ZVaNbbuT4N+czgi+hyDliW74=;
 b=l5QF7MmyW3JWvjz/wuajMYI0nFPud6Bz6R7bWsXBWr+Bydnx/m4ppJPh5voRPgnTRQ
 z03m+10abKvnDZqyg5zidBO387qAm/Xdw4v9X9rcTPHQQmfTpF50F3YvhH4qfqtM8SiT
 syEwtF2echeWGU1S5hMXbGkFzzFMAQrsRDr9h10Fy0XmJ15adDh9Hz3IiVvEYvYcxzkD
 WjL+rhlt0bBumqilUX+w4UboSdR89M3dYdwPobKVYZQZWqdtrFXonmqIqGcDXhmxqTyk
 +cLubURFtMx9Dc/VmtDD4mMMUIf45A0c2ZOuyVuSpdvfh9L+UifulLaRFCxveSgcsx/C
 zSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9XRu2iMkzc4t8wtMjo8ZVaNbbuT4N+czgi+hyDliW74=;
 b=JuzzvTusbth25afF0adaGe12T/+P/daohFMrSviV4Ob4imNQjlAq0xIkmqC9J+Cs2i
 8PGoxVVVzPYW4EmET4bLCerZ8pH5+P90XSCHRS5/D/dVTqlyqnTY5hE332KS30L8XL+x
 W7riWqn4s6/ZhqLsOmPs9e+oxJI0HPqRycYojSXmB3iknMGa4xZ7XmoUb8mYmxygtN/Y
 JM36LiJdS0tTm9tZe6AL9bDGi5lPhzkJhe6ROStGJULC1E4apllK3IvfpscEH99CaKFS
 h1WEXMq9+Sh/uycLjZhFVhrOMKWnWQTcyL3n0cZx10t+Uh0BIdUAWm9qpPbPWQpiRTfN
 X8Ug==
X-Gm-Message-State: AOAM533wPrXTXZcgTxv+x5iktYp56c8/apLr3tP7nLr0wjfhZxLP/OC6
 zUj9W70jUW8+ot8OjIBP+0HIq3BGH9p8uhk6Igw=
X-Google-Smtp-Source: ABdhPJx2QKOM8TYh6tgoBFiSRDK7bprYUNnQNX1T6T7AtqQo5ZzzrMeeqm8fBCzQy+ZFBUCFrE0eSgrbYjZVI/cGczs=
X-Received: by 2002:a05:6830:3115:: with SMTP id
 b21mr24979714ots.240.1632211105217; 
 Tue, 21 Sep 2021 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
 <20210824235300.628afdd5@windsurf>
In-Reply-To: <20210824235300.628afdd5@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 21 Sep 2021 09:58:14 +0200
Message-ID: <CAH+XeQao6Ea_p1Y20a7PqXBfhP+J1KGozTMLwQzuQieXvLwLVA@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/zfs: Fix cross-platform-compilations
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8682611694572291212=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============8682611694572291212==
Content-Type: multipart/alternative; boundary="00000000000020015005cc7cc3d5"

--00000000000020015005cc7cc3d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Romain, all

I sent today a Pull Request to OpenZFS:
https://github.com/openzfs/zfs/pull/12577

Greetings.

El mar, 24 ago 2021 a las 23:53, Thomas Petazzoni (<
thomas.petazzoni@bootlin.com>) escribi=C3=B3:

> On Sun, 22 Aug 2021 22:05:19 +0200
> Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.com> wrote:
>
> > This patch fixes the `make` executed from the `kernel.m4` in
> > cross-platform-compilations environments:
> > https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel.m4#L588
> >
> > Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.co=
m>
> > ---
> > Hello all.
>
> Thanks for your contribution. Based on the feedback from Romain, I have
> marked this patch as "Changes Requested".
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000020015005cc7cc3d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Romain, all<div><br></div><div>I sent today a Pull R=
equest to OpenZFS:</div><div><a href=3D"https://github.com/openzfs/zfs/pull=
/12577">https://github.com/openzfs/zfs/pull/12577</a><br></div><div><br></d=
iv><div>Greetings.</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">El mar, 24 ago 2021 a las 23:53, Thomas Petazzoni (=
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thoma=
s.petazzoni@bootlin.com</a>&gt;) escribi=C3=B3:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sun, 22 Aug 2021 22:05:19 +0200<br>
Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salvador.joseluis@gmail.=
com" target=3D"_blank">salvador.joseluis@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This patch fixes the `make` executed from the `kernel.m4` in<br>
&gt; cross-platform-compilations environments:<br>
&gt; <a href=3D"https://github.com/openzfs/zfs/blob/zfs-2.0.5/config/kernel=
.m4#L588" rel=3D"noreferrer" target=3D"_blank">https://github.com/openzfs/z=
fs/blob/zfs-2.0.5/config/kernel.m4#L588</a><br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salv=
ador.joseluis@gmail.com" target=3D"_blank">salvador.joseluis@gmail.com</a>&=
gt;<br>
&gt; ---<br>
&gt; Hello all.<br>
<br>
Thanks for your contribution. Based on the feedback from Romain, I have<br>
marked this patch as &quot;Changes Requested&quot;.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000020015005cc7cc3d5--

--===============8682611694572291212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8682611694572291212==--
