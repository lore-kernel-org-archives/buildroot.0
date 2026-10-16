Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C67CCA464
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 09:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D21881186;
	Fri, 16 Oct 2026 09:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsijHq2tKt9W; Fri, 16 Oct 2026 09:01:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 64203813F2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792141261;
	b=ZcUeEfNQS5N4gqOGeKgTOU+QNf5hqintTWNy0YRkqtdvf0CMoYMLnXOvpDmlDmZJE258
	 Haexv5YTwRA9t278QA/4DN9x8CRP+jS6zS4AbjjD6jJQDt+3qw932YuvRm+hUPKyNZHMh
	 wvFpxRxm0DCw1RM2GhFO5yPUMsqU7DQVfW54fbGlwcL3krFAe1AU8gGAQ+IhXi0TL0ntE
	 OzD/XuZ5qEYXOPj1gpx7ZmbP5xyHFiZp/zNE8TW/26b0kUv9/+PGOoLL/qrQUCSj4WfSS
	 BmRYJbkXDUollMSXNvlnZD2PHgqKmfVIOWDbh8IrrTm9ZZJvIy2cRbAGTKFhBhzfc2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792141261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Received:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Errors-To:Sender;
	bh=EZKrV/Sak0WvuWgJTwn7zP/2YSXZvt1KuwcHAKjbExA=;
	b=CuP+Sg83RpObrEduPtE6s9zdS2jVEErgg9LVQB7GCzj9iRdxLytgh8F+u54plANsT8b6
	 zkBzlVB9iqE9BBLE4NoV+q0Nldi351pHgLkgtm5A4XvgAd7nSu0YDYwvpdfQza9DI9rpC
	 JSWB4N5+x1Dq3tRt0WsuP7BceO68ZFfmeIHqkbPF3BvwQQmWHAZTzt0Itr+jJeL4/sII3
	 he5l+tVlI+cqE74nPm/x5G5L695UEaGwMmruDnkzww6bqWSY9iZKW1AsbfeL/FVPSYCKY
	 j0+BwmbjehyTV0fhqXwEgUyXDEqXCpFFRaT8xvEo6MxQz5AlHPvFTCsSQFHxFkzKM3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792141261;
	bh=EZKrV/Sak0WvuWgJTwn7zP/2YSXZvt1KuwcHAKjbExA=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPxdLAiXehU1wGEl43Fdn7EvutbONpi+Lye+mLJzN42do1WoR1B4ASPYsqKL2Q5P9
	 D3uRxCNZa3Ep+gl2wkK4jdsYQSNsZ+HI2XlK0+xu7AaCeVhbO5UrWt7YQGyf4lfOzR
	 tX9r1AQufQF504VS9MAVQDFZo/6h4vW4GcF6A0xhnN7KktftSIPeOBfbaml4s1i9ab
	 xRgWh/fmXbOaZ/EBg6SU+A8qMCo/h+ALpOMqKLKJ7MBhGOQgAHsQglNqY2TYC1epg3
	 dsanL/I59SYd/Opa7ZJ+NKt+m3tgECmlYRiADB7r7wnbiGAC02qKqLVpd2U5YNjwd4
	 7Riy5TrjN6xRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64203813F2;
	Fri, 16 Oct 2026 09:01:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3681C769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33E29409E5
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I__Kt6KNS01F for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 09:00:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E1143409E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792141259;
 b=IM8Q7/0Q2tp8JSl3pFC3GklVAydPP7UEl/XUHhf/UYQ6Vuo5r65kpemrMJkrjQ4JpbCZ
 B6NxmqRS3+vZHm4jVZn41Qg7CoBEickM8WsQraAjop6r07mOT2I1qGJnHKyG3taE70r6J
 E/ZtFbhfMJltn5LZKxoe6me9qWEJvHB/WrK1+YWaRudUs/YklanYb9dF2C1p/RhKdRg64
 e/CZ9AHtiee1B9EpSutMDRDlffnQNsXjkPCMreM7XTomRaehBxNdKl9sD16y8mWQZB7WV
 sd/rUDmuRfaF4KLS3C6kVefMn7H7xqgL7XUjn9QOh/GYO5TT8gi/Gki9pciH0l7W3YA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792141259;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:
 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=utCz8y7JQtdEuvolcWeNd4CCixS7aOiurywSi4rxGSE=;
 b=ZhfUmE34muQzIIc0TOZHz3LS9EdmW1ayy5QTTgtFvnpvd/BLyybJvlhEKwjRlfCLxB95
 4RD2LB/IN8OHAxxek0cxDsZ369bcRg11d80Ap445Nfyq1cJQR6qTW3qil1raKzERbRd0D
 dC/zV54QRq/cuBWUlOIEDi4gBjZ6DTFokRwY2O5hnFzpFYqdNrLZHyU5tOHWh4xlJItzW
 3W0GyQSDk2zdVpOQ1sI77tCrrF/1p433nYqJ0hmRpGV/pNwOyPghXKa7dC1w8YqpDKY3n
 Yjn/R/Vu3iqA5yf+kZzTxpa7qro4C8ihVxTTfaNciEofqoPfmysF2TCNCKwOIjVv9ZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=aperture.us;
 dkim=pass header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=y2bsjWXK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::131"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1143409E3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:00:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5bccecba199so2155877e87.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 02:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792141255; x=1792746055;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=utCz8y7JQtdEuvolcWeNd4CCixS7aOiurywSi4rxGSE=;
 b=QwXPAWrpbaLz19DO83nThzWXMVzzZWDqZHWzGRVmQsUuXDjsezAy1ALmhRb6mdHzo7
 y1maFAkjltStrf1iZRiVk8tMtInM4eWAxXMzNHmqRXykdZ3mZZOUAL5TaAgz3jypJxC4
 5/JYScUYl7sc0gxymJhT795fYo1zxv7UB600+41vffsGFM+Qp5cynYCMdyjws331GC4u
 mgFbHhpCmS6ilK/KmwgkB28sIxATD+gCzuL5T5Kjgb4I7jweyPuHfVmYog3PCgb/MVF2
 jwInqyxQgqC8a8G10MpmqO36ml3QEwqbJAoyHYsbnMD5Mf5x31OwybhSEMGP0LKqdauf
 QA1A==
X-Gm-Message-State: AFq9FYL0LqZMSJzXRP3PqMGiQdUhZuJFdhZUKXMsOZ1eeF1KT6CjD0Dl
 27GmTPog7KuMGmlK7flPpSpRzXzkt6ohMLMJ3vnZ6Zw4GqG1nHSxp0MTkxPyFR5tEcEQUBrR3+Y
 GlTD4WdT9KQ==
X-Gm-Gg: AYBFou1TFUCPQP4s1MJfGZMIMR1+HesFlB38XRbucdM3Umcd7c2kJKfPInM4Uxv/Jm4
 5JqsuQSrAL4wjzgpGOMA0vMc4oW5xewD+SaNd4JbyXY8hMV5IihJOS/4z7q+HC5YtPURTS8/6bm
 kvWdmRRcOlFvmy3KbwAIadogWnBx8X8JxTkGnjkZePNvWvRZvEgSfAhOJIF2KXapfeLgdCOMiBo
 v+wyMb24AIok4ZaacbzvTOIaJ1y8NJLeQOFlDBAgZbuaAadXQfSzrAh5Qto29vobCq6luL+19tN
 Qdr5HbH3Qm0cE20ZkiZ5MEtGWNcqNj27BrtI5zQn2eDx43/vmZxIMLVwC3JJZeDiaW2L/MOEpfA
 FigDIDAfXOr+fcASmSeLyHqGIp9d+CYK+nQfLum9obHzEENgPVih1MWLYJ2N95hAvMqCg7IMkz6
 ULJuYZLPxcMI9ndJTyxUcxDItZxwT+1AxFMvyEvJwgUJNI+K1QiG7XDpEs+T51UKO9WWl/YPdOs
 Hf2iaGNu2cPlb+/p+vFRpXRzftuQthwxHuTuM+2Nw==
X-Received: by 2002:a05:6512:3053:b0:5bc:d9d6:6aa8 with SMTP id
 2adb3069b0e04-5bcde6bd2d9mr7750565e87.23.1792141254023; 
 Fri, 16 Oct 2026 02:00:54 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5be4a63403dsm280058e87.58.2026.10.16.02.00.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 02:00:53 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3a98f260f85so21813951fa.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 02:00:52 -0700 (PDT)
X-Received: by 2002:a05:651c:2221:b0:3a9:9a2e:27fd with SMTP id
 38308e7fff4ca-3a9c484ed2emr52773441fa.0.1792141252571; Fri, 16 Oct 2026
 02:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <6ad19e7e.2bb6edcb.6bbd4.5ca9@mx.google.com>
 <atGwjPFYcThe92U7@yd-6wlzhs3>
In-Reply-To: <atGwjPFYcThe92U7@yd-6wlzhs3>
Date: Fri, 16 Oct 2026 02:00:43 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qpHY0fAfMCC2Xib_cNyJ4voq5YPHepChsCCW4uc_BBEg@mail.gmail.com>
X-Gm-Features: AclHuK9zGvm6sjIjDLEvYdjz85oDxnFzl1E1SksXvzDF1iRJLpCN7NX8fH32yx4
Message-ID: <CA+h8R2qpHY0fAfMCC2Xib_cNyJ4voq5YPHepChsCCW4uc_BBEg@mail.gmail.com>
To: yann.morin@orange.com
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2026-10-15
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============4399375273370959117=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4399375273370959117==
Content-Type: multipart/alternative; boundary="000000000000bf38df065df16640"

--000000000000bf38df065df16640
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann,

On Thu, Oct 15, 2026, 10:05=E2=80=AFPM <yann.morin@orange.com> wrote:

> Christian, All,
>
> Christian, as our go expert-in-residence, can you help with the
> following build issue reported by the autobuilders, please?
>
> On 2026-10-16 03:48 -0000, Buildroot Notifications spake thusly:
> >     arm      |  distribution-registry-v3.1.1  |
> https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8=
a417baa
>
> The error in that build is the following:
>
>     [...]/output-1/host/lib/go/pkg/tool/linux_amd64/link: R_ARM_THM_CALL,
> are you using -marm?
>
> The configuration if for Arm v5 Thumb:
>
>         Target Architecture (ARM (little endian))  --->
>         Target Architecture Variant (arm926t)  --->
>     [ ] Enable VFP extension support
>         Target ABI (EABI)  --->
>         Floating point strategy (Soft float)  --->
>         ARM instruction set (Thumb)  --->
>         Target Binary Format (ELF)  --->
>
> Notice the discrepancy in the link command: it calls for the amd64
> go linker for an Arm v5 target.
>
> I have no clue as to how to further investigate this issue... :-/
>

I would assume it's using the wrong GOARM but I will look into it further!
Thanks for the ping.

Best regards,
Christian Stewart

--000000000000bf38df065df16640
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yann,<br><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 15, 2026, 10:05=
=E2=80=AFPM  &lt;<a href=3D"mailto:yann.morin@orange.com">yann.morin@orange=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Christian, All,=
<br>
<br>
Christian, as our go expert-in-residence, can you help with the<br>
following build issue reported by the autobuilders, please?<br>
<br>
On 2026-10-16 03:48 -0000, Buildroot Notifications spake thusly:<br>
&gt;=C2=A0 =C2=A0 =C2=A0arm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 distribution-regist=
ry-v3.1.1=C2=A0 | <a href=3D"https://autobuild.buildroot.org/results/753421=
1959577546c3777939d11e411d8a417baa" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://autobuild.buildroot.org/results/7534211959577546c3777939d1=
1e411d8a417baa</a><br>
<br>
The error in that build is the following:<br>
<br>
=C2=A0 =C2=A0 [...]/output-1/host/lib/go/pkg/tool/linux_amd64/link: R_ARM_T=
HM_CALL, are you using -marm?<br>
<br>
The configuration if for Arm v5 Thumb:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Target Architecture (ARM (little endian))=C2=A0=
 ---&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Target Architecture Variant (arm926t)=C2=A0 ---=
&gt;<br>
=C2=A0 =C2=A0 [ ] Enable VFP extension support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Target ABI (EABI)=C2=A0 ---&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Floating point strategy (Soft float)=C2=A0 ---&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARM instruction set (Thumb)=C2=A0 ---&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Target Binary Format (ELF)=C2=A0 ---&gt;<br>
<br>
Notice the discrepancy in the link command: it calls for the amd64<br>
go linker for an Arm v5 target.<br>
<br>
I have no clue as to how to further investigate this issue... :-/<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I would as=
sume it&#39;s using the wrong GOARM but I will look into it further! Thanks=
 for the ping.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Bes=
t regards,</div><div dir=3D"auto">Christian Stewart</div></div>

--000000000000bf38df065df16640--

--===============4399375273370959117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4399375273370959117==--
