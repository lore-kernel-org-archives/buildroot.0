Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A0BC021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 23:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4AF283AF8;
	Thu, 13 Feb 2025 23:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VWeqb91wI5i; Thu, 13 Feb 2025 23:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA75383C94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA75383C94;
	Thu, 13 Feb 2025 23:22:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC7CD199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0D5B83AF8
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRyxdXAXGMWf for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 23:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82B1883C94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B1883C94
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82B1883C94
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:22:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43967004304so1710725e9.2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 15:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739488925; x=1740093725;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eBbDv0/vSFLynY7EUKTEBn+lG4bOtGCuE9dlFtfNgLM=;
 b=GfYngyPwlWDdKe+0wZ6X1mQzxwIrRRVW/Mv+0XkWXUHDetZOdaFFlqy+yVpmVw1y6g
 a2pi5hQqgkgdTO4VwFTN9tlspxdYWNgR2z3QoDQWrXz2POs6sRdbNzOpzoiVCq1CA5qm
 35a02bdobKjUvCozrE5e3prYdmmpGown6+yHKgmr0N0o+5mheH3UIUfhU1Qz88LM/Eu8
 9rENRyVv+x1Qbts6ZCKnhvYyiJ5+u5a8zBBQhyxiJ/oGK0eeKq2LFc34+QLDndE6IgW6
 8UCLPOYELXqe/6TcLTGFYyarhZzqmA1vQb1LJtUr5QzBohu38FNV1gkJB1XAdilf+ruC
 3ngw==
X-Gm-Message-State: AOJu0Yxv/qFZnfxnzM9066Yy+0DvJCy5D3xmuaY1ejJd7rtaa3xnLqQE
 pdUeceDdHVGboakpLKfCTk3wIZr/Xv+jby2Vueb6lXvVyWnVcoTIIw1W3T+zs1FRpOfM/xwnsWH
 QAZtgNKVBr+CbVYGE5QrRwtrjqPg=
X-Gm-Gg: ASbGncuyd6KuojKtxRotuZn4lU+v5/z+7AQwxbD8n/KB7qeMKw0Ljbb/32MQWXJk9gM
 iGfcaccE+Y8vMPh795w9M6+vrshoqzgwiAEi7q6rdvBIKuRjHq37IsoiKB+MZt9n4M2rU6YnjPX
 R95LjpPIOrOFo1ojwe0NyxM8GJpTzyDg==
X-Google-Smtp-Source: AGHT+IEx6pAqpuRvQ/MLMGoA1opN2us3A/daz4ibLZyIf0IBeC644PGW+zOcoV5+cqrgJqjexmw/iPbxfgRRtmGmTm0=
X-Received: by 2002:adf:f348:0:b0:38d:dfdc:52a2 with SMTP id
 ffacd0b85a97d-38f24519d08mr6103221f8f.40.1739488925199; Thu, 13 Feb 2025
 15:22:05 -0800 (PST)
MIME-Version: 1.0
References: <CAGrGpJAvUU9u4zF7vzvu+upr2RQBLp37ESRdQfBVmrXbmv802Q@mail.gmail.com>
 <67507e1170f133fb149852539b3fcb59@free.fr>
In-Reply-To: <67507e1170f133fb149852539b3fcb59@free.fr>
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 13 Feb 2025 16:21:53 -0700
X-Gm-Features: AWEUYZmo-L8S021G1OUcDoTELwbI9zvJg8C5GOXagc2AB6N2-C5zBA9WRB_mZgk
Message-ID: <CAGrGpJDZdBg7VNhrr9-zh53ms2+5K1eGROydFxTG5qC1Zc7yvg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739488925; x=1740093725; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eBbDv0/vSFLynY7EUKTEBn+lG4bOtGCuE9dlFtfNgLM=;
 b=P6h6CoRSlZbwngEYm2KIE7yg9uPB0X7wXo7ThNEUy07OH78+lTkghMOk9Y6vcKmgRX
 9QT/X8HLqmJwWhjiH7wV2cMwKtF1Nemd+1kwZE1OKoCFHsC83rp/mbP5vv3SjnObJeNI
 hMgeLmzO8p5VG9m2h/CQBiAkj4tdg/J0w3mpb+MuwN/UKFYu9rxGTX1siChBMu5qSUi1
 CYt/qJ9pqjjQxWL9yRsDxnVo17m3o/Zi3uW51cTYeAF3vLBCsfS5ZazVURRM49YELvlU
 uRm+mo7ydHbbm0bXZrgxJzLK56xG1I4ppFrFrXpWecQoVH/WNPsoXKm8BD+rJf+LmMNC
 3y8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P6h6CoRS
Subject: Re: [Buildroot] previous sdl2_image and sdl2_ttf patches are wrong
 - please ignore
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
Content-Type: multipart/mixed; boundary="===============7628647125730988062=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7628647125730988062==
Content-Type: multipart/alternative; boundary="0000000000007a3675062e0e535c"

--0000000000007a3675062e0e535c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Julien.   Much appreciated.
Peter


On Thu, Feb 13, 2025 at 3:46=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrote=
:

> Hi Peter,
>
> On 13/02/2025 09:18, Peter Thompson wrote:
> > Hi Julien
> > I am having a brain freeze on this update to buildroot package
> > sdl2_image and sdl2_ttf.
> >
> > The previous 2 patches just sent are again wrong and I have
> > resubmitted 2 patches that are hopefully correct.    Third time lucky
> > (I hope).   My apologies!!
>
> No problem! I marked your old patches as "Superseded" in Patchwork:
> https://patchwork.ozlabs.org/project/buildroot/list/
> We should now see only the most recent version.
>
> If you set up your patchwork account, you could have done that yourself
> (you can manage all your submissions).
>
> >
> > Peter
>
> Best regards,
>
> Julien.
>

--0000000000007a3675062e0e535c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Julien.=C2=A0=C2=A0 Much appreciated.</div><di=
v>Peter</div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 13, 2025 at 3=
:46=E2=80=AFPM Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free=
.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Peter,<br>
<br>
On 13/02/2025 09:18, Peter Thompson wrote:<br>
&gt; Hi Julien<br>
&gt; I am having a brain freeze on this update to buildroot package<br>
&gt; sdl2_image and sdl2_ttf.<br>
&gt; <br>
&gt; The previous 2 patches just sent are again wrong and I have<br>
&gt; resubmitted 2 patches that are hopefully correct.=C2=A0 =C2=A0 Third t=
ime lucky<br>
&gt; (I hope).=C2=A0 =C2=A0My apologies!!<br>
<br>
No problem! I marked your old patches as &quot;Superseded&quot; in Patchwor=
k:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/" rel=3D"nor=
eferrer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/l=
ist/</a><br>
We should now see only the most recent version.<br>
<br>
If you set up your patchwork account, you could have done that yourself<br>
(you can manage all your submissions).<br>
<br>
&gt; <br>
&gt; Peter<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--0000000000007a3675062e0e535c--

--===============7628647125730988062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7628647125730988062==--
