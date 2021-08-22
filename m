Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25450C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 03:49:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9858B6126A
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 03:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9858B6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADD160625;
	Sun, 22 Aug 2021 03:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yegjThOA1dqv; Sun, 22 Aug 2021 03:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17736065F;
	Sun, 22 Aug 2021 03:49:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62F791BF95F
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 03:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C7C080E53
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 03:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XgdrdnPoRO6 for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 03:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B54A80E4E
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 03:49:08 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id e9so8858072vst.6
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 20:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R4URk1QU2aXaqz2QV/EQCm7EQfWTwl0lvjWOfCfAKw4=;
 b=UCPi4gOhcM88PaC5YDPYAuPj62o07E0+8cJlNQ6YXx9UGUqxHYnxF//ek7e9HLBMdr
 FJDaP7jXXTPj4rKhMg0ureXdemiYSNo75ZZ/i6v9tSwludGUdZdJO95tMSV5dmW9j9I4
 K7jjLSTGlOoCJkvegDBznsFS9QkCG6po7bKgZjuyHgXrgAnr1bqZY5XGjgehfaJnhYLW
 xeJGlUATFPo++c+CDoozDdXXBOxn0NH38VBbx6Hp/jQ75ymoWA8OGf1d8xSvYBeo8+Zq
 00Q8BNQWwEdJPTuKF371yuuEr2sfUpNNMv31tKoMH+C9/DHljhMWphJpWsvS7/Y+5xoc
 PFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4URk1QU2aXaqz2QV/EQCm7EQfWTwl0lvjWOfCfAKw4=;
 b=opletPBt95l3vCx9YNpkYJh0BdJJs06b0FvesMjaEupuYrsWx5GfLTftpob5eDkGuZ
 pldXHcITf6A1L3XyEU9+JMxklzxki5cfsnWRegSrrl95OjrzKLJuXadPXS0oiN3KN3Xc
 eFTFfEeCveSYROKntDsSwoFFki12Yzmv40pldLnDneBvFmUbf6sTIZ2tfs8/OvY2Ozgr
 zORqsKOdFznSOglImlE+pRH2L8fO59/YWe4WBjQYocCJlokAGM7awJIDBIaHROuwqtnr
 7teWpgBdpdgU4IA7X/lUsFTkJETww/npziq9XcHPC4bHPKeTkjMfALAHGgiQypnNHXSS
 c2Sw==
X-Gm-Message-State: AOAM532WkpfVnPaqQ/6W4RN2Fg1nwsulvp0yuCDXgJvw5TuVOl2xtf11
 gCKLlanBopYvGJ/9/zIs8e7WZER1zcGTmAtumUI=
X-Google-Smtp-Source: ABdhPJzFoWHGINvYmAg3Nqyc86T+Te39xtweU94dW7KrNbDoJynjmYOr+eMV1K/1C1jAkmXcEY7uv/Nxjv9LsILj6HQ=
X-Received: by 2002:a05:6102:22d5:: with SMTP id
 a21mr20716009vsh.32.1629604147369; 
 Sat, 21 Aug 2021 20:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210821210035.69230-1-bensuperpc@gmail.com>
 <20210821232744.381cd7b9@windsurf>
In-Reply-To: <20210821232744.381cd7b9@windsurf>
From: Bensuperpc <bensuperpc@gmail.com>
Date: Sun, 22 Aug 2021 05:48:31 +0200
Message-ID: <CAAV5jBd7jxVtct0b_aYG=-SN6iOnwkWnLFLqOJSTsWETzO4QJA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/2] Update boost to 1.77.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0143506100290826373=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0143506100290826373==
Content-Type: multipart/alternative; boundary="000000000000541d0105ca1dc89d"

--000000000000541d0105ca1dc89d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great,

Best regards,

Bensuperpc

Le sam. 21 ao=C3=BBt 2021 =C3=A0 23:27, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> Hello,
>
> On Sat, 21 Aug 2021 23:00:35 +0200
> Bensuperpc <bensuperpc@gmail.com> wrote:
>
> > Update boost to 1.77.0
> >
> > Signed-off-by: Bensuperpc <bensuperpc@gmail.com>
>
> Thanks, but we already have a patch lined up doing this, and it does
> require much more changes:
>
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20210819131246.38791=
-1-buildroot@heine.tech/
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000541d0105ca1dc89d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great,<div><br></div><div>Best regards,<br><div><br></div>=
<div>Bensuperpc</div></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le=C2=A0sam. 21 ao=C3=BBt 2021 =C3=A0=C2=A023:27=
, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thom=
as.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Sat, 21 Aug 2021 23:00:35 +0200<br>
Bensuperpc &lt;<a href=3D"mailto:bensuperpc@gmail.com" target=3D"_blank">be=
nsuperpc@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Update boost to 1.77.0<br>
&gt; <br>
&gt; Signed-off-by: Bensuperpc &lt;<a href=3D"mailto:bensuperpc@gmail.com" =
target=3D"_blank">bensuperpc@gmail.com</a>&gt;<br>
<br>
Thanks, but we already have a patch lined up doing this, and it does<br>
require much more changes:<br>
<br>
=C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2021=
0819131246.38791-1-buildroot@heine.tech/" rel=3D"noreferrer" target=3D"_bla=
nk">https://patchwork.ozlabs.org/project/buildroot/patch/20210819131246.387=
91-1-buildroot@heine.tech/</a><br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000541d0105ca1dc89d--

--===============0143506100290826373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0143506100290826373==--
