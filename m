Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5888BC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 05:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A63AA8210E;
	Sat, 13 May 2023 05:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A63AA8210E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPkuCMTiahuC; Sat, 13 May 2023 05:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E86388207C;
	Sat, 13 May 2023 05:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E86388207C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D65DA1BF616
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 05:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9CA78205A
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 05:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9CA78205A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRMxjd01H2a4 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 05:49:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A83082015
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A83082015
 for <buildroot@buildroot.org>; Sat, 13 May 2023 05:49:41 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ac733b813fso115012661fa.1
 for <buildroot@buildroot.org>; Fri, 12 May 2023 22:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683956979; x=1686548979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iwu+QbCdxcz30b6OwA09C533N8vF1oazX3LWxGC6vKI=;
 b=VadILGSp1vKYGL7wiU6E76B1phohM2eA8uKk8BQszGwpBRbg3C+K3Bcd6xQ33KJDQW
 gxEkcUCDYrZJDn4PSqdwDMWJ2FHpqOTSHSe9KkSJirMbM/Hl45qZgjj3aUqz7A2EhL7+
 HrLFAzJftXxQOs2ltTGblRwTE2+4sCRKEWpvfUqSmxiLTT9dfWx0wRYx1wYvVG7nQzer
 uMUO2tjiuSjcDLhJod/QTzB7ihJHHU2BBDfsW/KXWfWu2VDkCUSbaEtqn6Fx/s5CNGoJ
 s9VV0NB52tKYXJJNED4tNb0ddBXnwwlgfs8n+HsqEwVSvUfzuTGNBHrSE9U/0xcmAQjr
 cu1Q==
X-Gm-Message-State: AC+VfDwZ448Hb4OUU9QoUYzqXsa9EYf0H12KdVrd3VOauKU9Bea9ShTT
 beYC/dxnDWP1uBvxBX4tCZRN7NGnpkECOA==
X-Google-Smtp-Source: ACHHUZ6Kk3c41UlZx7qm8CkZYVAHDuCwu95+LhDuD6fkaGX9GPLsZ1u5zVHlZ0s8RSmdl7CpBEzA6Q==
X-Received: by 2002:a2e:9192:0:b0:2ad:c074:7c1c with SMTP id
 f18-20020a2e9192000000b002adc0747c1cmr3003771ljg.46.1683956978593; 
 Fri, 12 May 2023 22:49:38 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 o9-20020ac24949000000b004f13c00dd9bsm1695119lfi.135.2023.05.12.22.49.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 22:49:38 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4f24ceae142so8709354e87.3
 for <buildroot@buildroot.org>; Fri, 12 May 2023 22:49:38 -0700 (PDT)
X-Received: by 2002:a05:6512:964:b0:4e8:5112:1ff2 with SMTP id
 v4-20020a056512096400b004e851121ff2mr3883375lft.27.1683956977914; Fri, 12 May
 2023 22:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
 <20230327141058.3669326-2-thomas.devoogdt@barco.com>
 <87cz352x7o.fsf@dell.be.48ers.dk>
In-Reply-To: <87cz352x7o.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 13 May 2023 07:49:26 +0200
X-Gmail-Original-Message-ID: <CACXRmJjE1ccPCMWAd=V_g3mjPYSXrS-vWhPkwGPY7o-2Tg4ccA@mail.gmail.com>
Message-ID: <CACXRmJjE1ccPCMWAd=V_g3mjPYSXrS-vWhPkwGPY7o-2Tg4ccA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 2/4] package/fluent-bit: fix luajit support
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, eduardo@calyptia.com,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1154581108161321627=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1154581108161321627==
Content-Type: multipart/alternative; boundary="0000000000007c59cb05fb8cc94d"

--0000000000007c59cb05fb8cc94d
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Yes, I have a patch for it which is pending:
https://github.com/fluent/fluent-bit/pull/7286
Will re-open this patch series soon.

Kr,

Thomas

Op vr 12 mei 2023 20:58 schreef Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > Fluent-bit doesn't link against any libraries,
>  > it just compiles everything as static sources,
>  > meaning that our buildroot BR2_PACKAGE_LUAJIT isn't
>  > the right check.
>
>  > The same -m32 fix as in the luajit package can't be done,
>  > since fluent-bit uses a custom cmake wrapper. So just check if the
>  > host and the target have the same number of bits.
>
>  > My intention here is to fix upstream build errors,
>  > not perse to have luajit support in fluent-bit.
>
>  > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> Hmm, would it instead be possible to use an external luajit so we
> wouldn't have this problem in the first place?
>
> --
> Bye, Peter Korsgaard
>
>

--0000000000007c59cb05fb8cc94d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Peter,<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Yes, I have a patch for it which is pending:</div><div dir=
=3D"auto"><a href=3D"https://github.com/fluent/fluent-bit/pull/7286" target=
=3D"_blank" rel=3D"noreferrer">https://github.com/fluent/fluent-bit/pull/72=
86</a><br></div><div dir=3D"auto">Will re-open this patch series soon.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thomas=C2=A0</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Op vr 12 mei 2023 20:58 schree=
f Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" target=3D"_bla=
nk" rel=3D"noreferrer">peter@korsgaard.com</a>&gt;:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Thomas&quot; =3D=3D Thomas Devo=
ogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" rel=3D"noreferrer noreferre=
r" target=3D"_blank">thomas@devoogdt.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Fluent-bit doesn&#39;t link against any libraries,<br>
=C2=A0&gt; it just compiles everything as static sources,<br>
=C2=A0&gt; meaning that our buildroot BR2_PACKAGE_LUAJIT isn&#39;t<br>
=C2=A0&gt; the right check.<br>
<br>
=C2=A0&gt; The same -m32 fix as in the luajit package can&#39;t be done,<br=
>
=C2=A0&gt; since fluent-bit uses a custom cmake wrapper. So just check if t=
he<br>
=C2=A0&gt; host and the target have the same number of bits.<br>
<br>
=C2=A0&gt; My intention here is to fix upstream build errors,<br>
=C2=A0&gt; not perse to have luajit support in fluent-bit.<br>
<br>
=C2=A0&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devo=
ogdt@barco.com" rel=3D"noreferrer noreferrer" target=3D"_blank">thomas.devo=
ogdt@barco.com</a>&gt;<br>
<br>
Hmm, would it instead be possible to use an external luajit so we<br>
wouldn&#39;t have this problem in the first place?<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
<br>
</blockquote></div></div>

--0000000000007c59cb05fb8cc94d--

--===============1154581108161321627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1154581108161321627==--
