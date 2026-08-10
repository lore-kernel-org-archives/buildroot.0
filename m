Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDE1C5AC82
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 08:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC104052C;
	Mon, 10 Aug 2026 08:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA2lz5o4GlRA; Mon, 10 Aug 2026 08:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BCCD40520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786348938;
	bh=dYHoI5Zk5feJARNYTRB9ZTinXqJjPDY7pKin8Asr5As=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKYR68s7X6C+x28FfW28lBLMXSh2Q3/QBa7BZzaujfZtZE68sbyfkaYYW6Tq/bA8G
	 A6lTql3h+UWn3uVJF+le+kvKEsE+sgRleoSP0kpGO/R2nYKnK69v+m9bap8ixj2WeN
	 E5tyvpsmzb0AoKRhcF8bIFFLNeSXX8mrab9Pysec32+VdDuJC/HxXPED0b04+2VsXa
	 WP72ijoMvaIXje6h/5LMVfhB8CaVeeFSgJ+lajUgMjEjt0EhIB/oklYy2WmAjeRLLj
	 CRD9Fd7pZsI97bt1qqgggaxomiJlp2fzHa0pgCCzUzIDNrEJIwHPZ+z+XcaBB24jii
	 PUAS+A/hXqUQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BCCD40520;
	Mon, 10 Aug 2026 08:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 120272F5
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F83980C7A
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnCXNj3rLrZm for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 08:02:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9925880C74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9925880C74
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9925880C74
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:02:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6a09571dd5cso187446a12.2
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 01:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786348932; cv=none;
 d=google.com; s=arc-20260327;
 b=OU2rmDLOzsH38Z34adpTbM3riLhEPuVshVNmLkQZhqsczL0YIBgyuAUGQG0ghn0JQe
 SP5/44HnH3q8vjt3eIBNjVD90dIng7R+jRe8EHjXYPs1O21uz1PGlMqBeFhg+typNU4p
 aL6Fon6Of/q163SHQ/qsDHTTfC4SbBPovyJUi+k2sAzjjs8gX5FWlNI1eutj5OBuIG27
 3qWcbpjeTv53vLFvTjQQ3UHHfM4mj9h0dPk+rSHqdE2RbYmV08U1RQGTrQZQytcCUHNE
 BsoP5ppKMi80npqqKO4x9CXhn+DN7iGoTI+enuPKV9wcVG1u2HPKzsPKK3D0mINJVBC9
 D6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yHtJp2knDeU3jKJ/DJgLKVG/PU6J5k4k52++i/Tcl+4=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=CCruPW4UHS1+35PgNW5Oab2drAzc09RZ9RO/RVXhrg+oNm1R2sN3gT9C/b+PQwJr1l
 /p0Jkd47RLOqiHm6fdPDFaXdPqd0m4E4hpNi6ageuQjHiw5131ogfEt+mNYMlV2fnFP1
 DaSYqo/OnMEnNBrTPJopAawuef9a+8/OhiXsBSCETVOnPflu1iKLGerRnB1TwkW9e6Nh
 vKoegASpCyzmpstj5bSuohaE5YryCbIudvxT4CTvaMIpUUhHWBRu3UxF8jR2wmRwq7J+
 DH/qhy84ZZDptJBv1bHS0OPYhs7QIPtsaO2Uom4PXbrVFU/XIrRdL8STSba0k6FjBcWj
 Prow==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786348932; x=1786953732;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yHtJp2knDeU3jKJ/DJgLKVG/PU6J5k4k52++i/Tcl+4=;
 b=A7wOQdVeSfrEET7ZLl680EFzY52znJevuYs8HqoH8Y5AlllnoIyMK4KeIFZ/pilSie
 D11VWICAp03hgsWSIRAJuJOtSPuraXTQDDp3MOlpxPcDy+4qnD07AfEpfpFE1hk/XF+3
 iJKe8aDcNhCvW2wCkOrunXQm+Tb7KjMDQcl7ELut+gHNAcp060jytdkdS3B8xBbAXC05
 UF6cslc22TbYDut5XxzNPrBd/R56lo6ucUrzHn7KZuH1ztfEelHLA0MhUHgSkkyIn7/G
 nvELe4Q5RdorKpUjiCaCckPS+imE0h2mRjKLIrE0f4EBtsGKz7XyLI8dYIkkvir5ATab
 eprw==
X-Gm-Message-State: AOJu0YxHQ5Bb31qsACC5i52q6QR0tcaoOl/qd+DxOzYImahjT9VcWec3
 mgL0Pf1lc/YB7N8vRiFs26mZ1DPIyw/ZjgxbEGDvoP5ai9jpcnCNJ+jYf1UPJLZteNMjIYmz0Zd
 I0rQAI4zr+9/4qOLzbeSmF9TP9TdA6RJjgxFzknUqYHsJMQSdkcPsxM0=
X-Gm-Gg: AR+sD10byUUwDOq0j/giWrtgr/fe81ob7K8ZJG0YvjK8xTuzK3X37BtENPOlttNiOER
 c695wOn7ILkjdloJREhVbWF/0t7yL1sDIiKmLbnRalfPYgH/gyDap9GvGuHGY+CCar1h8yjB6fx
 0xlc8RlJT/8mshjLS9w+PlNfFzqlIwyp0YdEtyecv4mX6ktqt/aMzvTeZGecXEarRiaMAX9Rmgi
 eQHNcf9tw86czJTFZy8czKXOxtbRos37+vDq/3hUHO/gTmEHi9HnVS6MqHijRFSIRAm4x1WF1UI
 zkR9/JQmzAup/nxkL3Y3kFybQXCCyzrImiht2ury0VU4DtBWVaTn2B7UZUMciowpNYaZU34Rvri
 ur4mBIGxssSPiQKgBcNdvKw==
X-Received: by 2002:a05:6402:3215:b0:6a1:3351:a7b1 with SMTP id
 4fb4d7f45d1cf-6a14efff9cemr10275619a12.0.1786348931996; Mon, 10 Aug 2026
 01:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
 <20260807125510.1285300-2-adam.duskett@amarulasolutions.com>
 <anjm8rL5fUlUSu00@windsurf>
In-Reply-To: <anjm8rL5fUlUSu00@windsurf>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 10 Aug 2026 10:02:00 +0200
X-Gm-Features: AUfX_mwlE9n0KvZNZ2pPknNoVRUhqpAhGbEJWnyJZWhXa_221c5n-BPoI3YZxl4
Message-ID: <CAHDQB6O6pvN8ujmQxuhHi1d2C6ffvjNLUUsqXg0DBk3dqBjOVw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786348932; x=1786953732;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yHtJp2knDeU3jKJ/DJgLKVG/PU6J5k4k52++i/Tcl+4=;
 b=hjgfOjyrVdDZrQMs0X5J1kzpPdYpJoR7RZA208MfbfgbeLfLvRmmNoBBpMyGBVWXEg
 6wbhL9F//eEQIL28Zhc6HMMlUOjlT31lyTleToKVsO0PRPjtNCblQovoSt4qCEgbKIO6
 4whmZlvV/4u8XvtwJhZuUIC+S0Cg+8sBKphTE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hjgfOjyr
Subject: Re: [Buildroot] [PATCH 02/11] package/mender-update-modules: fix
 license hash
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
Content-Type: multipart/mixed; boundary="===============8038591733627516969=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8038591733627516969==
Content-Type: multipart/alternative; boundary="000000000000896b670658acc5bb"

--000000000000896b670658acc5bb
Content-Type: text/plain; charset="UTF-8"

Hi Thomas;

Probably the initial commit? I'm not sure how it was missed and I can only
find one instance
of it failing on the autobuilders

On Sun, 9 Aug 2026 at 22:46, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Adam,
>
> On Fri, Aug 07, 2026 at 02:55:01PM +0200, Adam Duskett wrote:
> > Fixes:
> >
> https://autobuild.buildroot.net/results/5afb0ab3362cb67014f470dd976449b756224566/
> >
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>
> Thanks for the patch. Which commit/version bump introduced this issue?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000896b670658acc5bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas;</div><div><br></div><div>Probably the init=
ial commit? I&#39;m not sure how it was missed and I can only find one inst=
ance</div><div>of it failing on the autobuilders</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, 9 Aug 2026 at 22:46, Thomas Petazzoni &lt;<a href=3D"mailto:thoma=
s.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Adam,<br>
<br>
On Fri, Aug 07, 2026 at 02:55:01PM +0200, Adam Duskett wrote:<br>
&gt; Fixes:<br>
&gt; <a href=3D"https://autobuild.buildroot.net/results/5afb0ab3362cb67014f=
470dd976449b756224566/" rel=3D"noreferrer" target=3D"_blank">https://autobu=
ild.buildroot.net/results/5afb0ab3362cb67014f470dd976449b756224566/</a><br>
&gt; <br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
<br>
Thanks for the patch. Which commit/version bump introduced this issue?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000896b670658acc5bb--

--===============8038591733627516969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8038591733627516969==--
