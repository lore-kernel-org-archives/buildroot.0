Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86359C982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 11:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BA580D36;
	Mon, 21 Sep 2026 11:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4r4BONqzd9e; Mon, 21 Sep 2026 11:29:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4A5C080D1A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789990190;
	b=h0e6tkDukFBaizZFxaGn+6PgRwe7d+qD9t/vb9KZS1H6YADPZgV7k64fWO8gbIitW3rU
	 JGWJWAczdWIxz12JqlOp81ShAPWmSsv1JdKL8xa8JAZtDxFootfTjiJt6CprBXt2cl09N
	 Y9e+kxfVZP5w7v2Tuqy1KD2lfl/tgShKSzH1QzuoE3uYuzy1zDbrLFZpoEhzTUfFqS2P+
	 Otu2xjmVmLH37WzXeROUShDtvZWi99BZNVFDcHwlAdCyRpJgksJjxr7xlsJULdsYI50X2
	 /kZ8fPm859oxFjoMYg8RuVu3tKOOksk7qT9/1aIUWGcYje3/PFFD/r+2OfrUzF1VwwQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789990190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=A/87RvNV8Udm0IIQkuOJxpXqYpy492g1DDxGy5g09Bs=;
	b=sNO+mVBxSzOvU/ap0LMv2jo5hiYUrNxdULO+ZTBWzpLVU/aXyVQagFo2bmo3CtoOjUCe
	 wZ71OvdFKBKLFKLIWbfmG10ikoc9SzNk3/jnduXInVkLkuxLDus+e8k/gSlEKI/BJP14W
	 8NYRQSd8/4lTIPX1L/EGeFajxBErEu/N0VmHergqanV4NkLVkFq0pQ5XeHqd5+m92leMX
	 aTZmZGUFPFSSZ0NTbZmN7sSA0EDFhfF0rFOyP9/476zpU9f0f3gKlhKPNaS2H8G+oc+Y5
	 WZYB4a9CyVIALKXL5TMN98sdZ4t2uYw0p3ASBjSuc7LvQDgdjgqHRNieUl1pjA+6wfg==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ibm3SCo0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789990190;
	bh=A/87RvNV8Udm0IIQkuOJxpXqYpy492g1DDxGy5g09Bs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXEXCFPyL2/LJY2bER582uwevZMdZb8tN5DdZ9pMXwN09lFPMI6R3XIzGp1bPCPoh
	 1hSucNTnN8mtdQiaNEb/69NhoJlDOtgilyDfRcEH2AX/vGpxrFKGbCLRX4ig6JVPNv
	 KtKnrup6lPJxqwDJk/nzX5N/gMB4rFaqYyqSVthnMFGrRvEzPJtw65ShD4Y38J3Y3/
	 j6jzWVdHAH4QHjBeHGBkeeR0HG9ERzOhIIJKZBKNX1uLHSNkR8WJl13CIzRN2mzAIy
	 ZWIFZL6ewkJvf5dhJOaSvNC4IFAYpG2nLycHL+Cnvk9YMKFkCreqPheL9OgsiHA/WU
	 mkUmguWgSfbXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5C080D1A;
	Mon, 21 Sep 2026 11:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16CFB237
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F01C080D1A
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spyetdiNOICO for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 11:29:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E569B80D18
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:41::f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789990188;
 b=ebfqwdfBaGCTODFXYUNrwDI5Xd+s1E2OQG+EroIyf0MGA5cd/HN04d6osuvcGVo+QN7K
 k/H2dAnqhxzPyfxPux88L7j1upByQwteNhMkFCNh1YHCfi17WbWrwp/NRbKOqLzLc5nWu
 XZhGS7xm+0tVTwjetw/1fGNnNWsVOkYc/0r9DD/G+CiXkasd7YVLdpPRzwsaeQjcsQDE4
 WFs3VLeiX8avp04aGQAlghwncoIqaSxG2D1YTmWtF5Hz+F+CgVlLhoyNsoaM9CBrB87Q2
 vNkcynuil6d2wtLcfm2kcU8zmYDfWbwfKHzukv59qNg76m/uc7pPd+U+L06Hk1u1oIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789990188;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=roCs9sSvRBf5dupuqp8qc8qpKXwIIG42sQ9jaVjd1mk=;
 b=o23aklWhZnR8Fgo4iWqecm9ah88eK8SywQ2bn0dHts+QIsBcsqnGEwtRS+c1q399qvr7
 f99NzpuILuxW8+C/FG3cvY0oogz2yllw6O4rmnHuZe89DJ6HkoL/bELUNvk4Py0hVBz1a
 4VLjGmlFpWGVw7AWKuRIMopHGDsoPeWtB5W7wDBXSRqLUIWE2j6oMiARPTiVXUvpgFVUk
 hFacUYxxjw+QFLZfjQsy+D2f7aEvJcPYgXwXeBoOLEtp60EDPKW7GDAiR4NX/sUbTpCU3
 Bkr0cVXCEltRSDPBqKKvoK9m9JW3FdgGYO8bc+V3YCBKngBDT70eWmkmfgGP4gII31A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ibm3SCo0; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:41::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:41::f;
 helo=mail-yx2-x0f.google.com; envelope-from=fractalclone@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ibm3SCo0
Received: from mail-yx2-x0f.google.com (mail-yx2-x0f.google.com
 [IPv6:2607:f8b0:4864:41::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E569B80D18
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:29:47 +0000 (UTC)
Received: by mail-yx2-x0f.google.com with SMTP id
 00721157ae682-85d4ddd179eso21300497b3.3
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 04:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789990186; cv=none;
 d=google.com; s=arc-20260327;
 b=qJFrcZmGBa+gSavws8THIIRXqv8MZG/6YuWluqOYedaaBeEGtKnt4m0Yj2c53ZdL69
 C1zmQHmUyEIPS46tuVSpHnHYGQxtpDEnHD/vhqygO7lLhTATdzZIldv5uMPc5tA6qXEK
 Lla5R7ltkyYa3PzpzUlP1n1h4I9vzxCJ9qT/YKdGZuSotHMwbxovDWmVwjhfvoxNIJfo
 9pc1DyGgFmHlsWbnrFnkr46YcdMpllX2NUvI0lfKsENKe03ztUV2p0iLteNdNxCdngAC
 /GntpKpp9rQfO5Dd8QmdtvyD18OyPviJsYDQck2WxOoz9SUjHOojS14b+2SvpEkWsMTc
 EPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=roCs9sSvRBf5dupuqp8qc8qpKXwIIG42sQ9jaVjd1mk=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=hz/AVDsyZ6Bn0YuYujWw2qT+Isgp+6V78LxjZvOucZ96MFLljW2+cc6uiEwqUWXRM0
 8QwXIsq2zoycVSZqgIhghmIxULqL2is7L844C9JctzC8iV/fHCZb4FdZK7WT6y9+C5dG
 weqwdY8x4GZCGft798hj2fJSwCdQFopoolCZY59pkB5J8BUrIjX80SV3ckxwsfe6vmh6
 4a9CpVtKU6XnBY9ZoDiyNb8bnLGQr3dgovTpdHOd+A8rbOQVbMYRUVOg6jxD4wJawU+5
 qLK8jAIvK++sBe7u0cMgpaBgVsJ0VOzUD6UJJaOhlEBEOsj8jiKnh46b6NakCtJJEZIz
 pJ7A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789990186; x=1790594986; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=roCs9sSvRBf5dupuqp8qc8qpKXwIIG42sQ9jaVjd1mk=;
 b=ibm3SCo0LAyPYTwvfRfNkwSWTEtbznf4nIqmmXAyYHWjzHxlrO4KguCrUQaoxzTXhW
 CUMpUUBBhB1MDWFmmckq3Zbs+djJst+u7LgFqnocSaT3v4X02EpqvZg2HyPf/MMYUbfr
 zwDT1SSfDxybOcs3JIblipS0yU/qLn6Fluf0Q515Rj3GbXWtO3SZU8ckFg7FaDYs3BZP
 peILN62tBOUy9D3Dm2Kgwd8QwUrLQ/iMCVf2j5cCH02OfngV8an4Tu+SlGW22LDHc2LS
 lqcugSuIv3IYiJAxEwbEjVwdqKe+0u4tB0Vvl7lVa6BXJwAR+1iBSSgN27bRtcVYNwIL
 4pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789990186; x=1790594986;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=roCs9sSvRBf5dupuqp8qc8qpKXwIIG42sQ9jaVjd1mk=;
 b=ZPXqHcvyPlFsNGhJ7SvVH+qhYAzIOBg1dGL/OD6/HyRkpZ3pL5IYIJgkkxi7RmYc6q
 L172g5X6uHiILfB8AYjTtLtzEQzNl7X4x7VjVppFVxA9uqWGhcOfkamTMHLg4hrQtKIR
 V72v1yorIV3BMqAo9jqSYf9MXGiZRtaAprnrSTYmLT1IAlm7BSWpotA8ffRcKGE7VBtd
 aMquaFefYWZz4ZKyIRFxtfU/3M7ZYc65DR6lm5n3C2Ubm5erFSOMmY+VD3L8v8XJAgHM
 w2krM68F16mQWU+AYi0bSv2L/Un/RpiPymZ8s416PlX6XS/s0vU//xtFhEtdVCEAtfz2
 v0zg==
X-Gm-Message-State: AFuF++kk2nIfkD+cVeBnDP87BqB28xUJ3QsjNtA5OWHq87l9cfHna3oV
 NAzivx6TYm0BWRxGimicm3v6vKmVM1gPHYte5QW0HLUHKdT0LsMag++tKBwxwStJ5qlLyPM6NAk
 PrYZd5O3h9FMzwAAuoIEK7LbDy+A09N5XsPZH
X-Gm-Gg: AYBFou2/zniF2AOOV9OseNL3YQUSs8g32IpFu7VFl/4djtMJOFvxHyPewZWDH/f6NuA
 M0fpPFmoAvLyW578761SVBglKszpxUU3mqaqMJWZI3xIVF7tfmPU42JrDsRpuMk2ModYuv0aFmW
 Pxpj3WnaQ21aeJDGLf9EcTld11fp+o7FJiNukFT6ezmms3f28TAFxXFMiqLYJJXPSd2wzqLIokh
 vV6slKqnfpVpYjt0JKznHbrbglHtSVCrvEA3LDZcrgHsMGB/AEIOQUAmZhVjFWW2iaftz+QTo33
 GH4UpTZ7c0PDN5Jm9MO7ytkezLsRNGQQPPgHK/ACR2v/Vj/skom9zpfxTwhYpuOpHg==
X-Received: by 2002:a05:690c:89:b0:89a:63da:cbe1 with SMTP id
 00721157ae682-89a63dacc8fmr26205847b3.39.1789990186324; Mon, 21 Sep 2026
 04:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com> <aqznoUtW4EIcK_8m@windsurf>
 <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
 <aq0uT-ghEihRclnw@windsurf>
 <CAN7e4jotGmfe1y_8gR4imH1_YTKoEJJODPK6kfAtpL9hfLzcgQ@mail.gmail.com>
 <CAN7e4jpdCKT=e8SY75Cb7o4qiC5Jr0w8oj-OaMmAPCDGpW5Fyw@mail.gmail.com>
 <aq-ghf1VzxlgtHpn@windsurf>
In-Reply-To: <aq-ghf1VzxlgtHpn@windsurf>
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Mon, 21 Sep 2026 13:29:35 +0200
X-Gm-Features: AcwNN1VhPTTjIaFjwXo6PfCBCI0CH9doW05OxwjmC0JkVVj2p38b6qQbGDpi0Mo
Message-ID: <CAN7e4jrtoeqcmEPECsEX9GWmxe-B-8khQYXOPqm9UBAZOEUpCQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 2/3] package/brcmfmac_sdio-firmware: new
 package
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
Content-Type: multipart/mixed; boundary="===============4921492935324353478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4921492935324353478==
Content-Type: multipart/alternative; boundary="0000000000003517f6065bfc918e"

--0000000000003517f6065bfc918e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sun, Sep 20, 2026 at 11:01=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Sat, Sep 19, 2026 at 09:20:36PM +0200, Jean-Paul Etienne wrote:
>
> > I've made an MR to linux-firmware and they've refused it because the
> > vendor was not agreeable to distribute their firmware via
> > linux-firmware. Their response in quote below.
> >
> >     We can't accept BCM43456 firmware, the vendor is Synaptics and
> >     they have not agreed (and in fact a conversation I had with a VP
> >     of Wireless at the vendor refused), to redistribute their
> >     firmware through linux-firmware.
>
> Meh, vendors. OK. But then maybe we need to find a better package name
> that clarifies how this package is different from the other brcmfmac
> firmware packages? I guess everybody is forking this everywhere to add
> its own variant that contains board-specific tweaks?
>


The other package name is brcmfmac_sdio-firmware-rpi, which contains
WiFi and Bluetooth firmware binaries only for raspberry PI boards.
The brcmfmac_sdio-firmware contains firmware binaries for other boards.
I've named it to package brcmfmac_sdio-firmware so that it matches the repo
name
in github. The repo is maintained by LibreELEC, same as
brcmfmac_sdio-firmware-rpi.

Regards,
Jean-Paul



Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000003517f6065bfc918e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, S=
ep 20, 2026 at 11:01=E2=80=AFAM Thomas Petazzoni &lt;<a href=3D"mailto:thom=
as.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Sat, Sep 19, 2026 at 09:20:36PM +0200, Jean-Paul Etienne wrote:<br>
<br>
&gt; I&#39;ve made an MR to linux-firmware and they&#39;ve refused it becau=
se the<br>
&gt; vendor was not agreeable to distribute their firmware via<br>
&gt; linux-firmware. Their response in quote below.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0We can&#39;t accept BCM43456 firmware, the vendor i=
s Synaptics and<br>
&gt;=C2=A0 =C2=A0 =C2=A0they have not agreed (and in fact a conversation I =
had with a VP<br>
&gt;=C2=A0 =C2=A0 =C2=A0of Wireless at the vendor refused), to redistribute=
 their<br>
&gt;=C2=A0 =C2=A0 =C2=A0firmware through linux-firmware.<br>
<br>
Meh, vendors. OK. But then maybe we need to find a better package name<br>
that clarifies how this package is different from the other brcmfmac<br>
firmware packages? I guess everybody is forking this everywhere to add<br>
its own variant that contains board-specific tweaks?<br></blockquote><div><=
br></div><div><br></div><div>The other package name is brcmfmac_sdio-firmwa=
re-rpi, which contains</div><div>WiFi and Bluetooth firmware binaries only =
for raspberry PI boards.</div><div>The=C2=A0brcmfmac_sdio-firmware contains=
 firmware binaries for other boards.</div><div><span style=3D"background-co=
lor:transparent">I&#39;ve named it to package=C2=A0brcmfmac_sdio-firmware s=
o that it matches the repo name</span></div><div><span style=3D"background-=
color:transparent">in github. The repo is maintained by LibreELEC, same as=
=C2=A0</span>brcmfmac_sdio-firmware-rpi.</div><div><span style=3D"backgroun=
d-color:transparent"><br></span></div><div><span style=3D"background-color:=
transparent">Regards,</span></div><div><span style=3D"background-color:tran=
sparent">Jean-Paul</span></div><div><span style=3D"background-color:transpa=
rent"><br><br></span></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000003517f6065bfc918e--

--===============4921492935324353478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4921492935324353478==--
