Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E974C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47AC680BB7;
	Sun, 13 Sep 2026 09:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9dThDEf5is7; Sun, 13 Sep 2026 09:31:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4D51780E3F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789291863;
	b=Nq/QXLoB0T1Ok2VYvqIe9hdb4D3u+QTDmh6jxMIL/xsm2QfgDh+L7DeslATGXQt0M1A5
	 blO3hp17QQAYL6dDfdKaU1YCb67Nrap5mW94cTwMRDNMmdd+ns3ozCd0Gc6C9FGbdHKov
	 Eq7ysQokc2S5J983fWxTJ18bKZv1BUrqNw3GrNJ6ikutIB7lXiOiK0sar3oFe4wmU4kuu
	 FbkPZoJE1+684ieSU6TBzwzI2wrMlIYlNbk/Wb7PCbNy5qkoYcNLqDmTMch/el0M1qyUH
	 pXsAzRohB0qwImKsNfBss+XWf4ye44IwcoOqxNO6/RItgpdHDHrl3dyBOjcmjYehfUQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789291863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=47bnYNG6j3jvZCy5V8RvXYxEKQNU/V8S8/F95lQNzM0=;
	b=IgmQeLTXDa/Z+dAStWPD/qDLZIMSqzIKbu7tp545PjPNKV+boOL2Kxw7GASYIjWJRyoK
	 WMIpGAqIizGUjR7R6AMCrF5vhjQwiKE1Sz8g2Fntf5afeFZTQqu/ZbmUoiz9MnkxXf2W4
	 gl8crOM0yPX3wocrGCMjjk8HKXjomzNsN6vBkxfdBYCPtGQxwAj+cXxm/ay0HojL23k9B
	 hq+bejrTrt5Ypmypk7nELsiF574htgn8uE6V5nYNRTGCe8irsUHUw7PUKtz2bRgfNcwbt
	 ojMkp+4lJwYdC5ImBBGS1/rbvrpq0Ry35lbJnsTJxt9O55G7TgIQ0+OI2gxlQzUTDcQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MDFLcpaW;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789291863;
	bh=47bnYNG6j3jvZCy5V8RvXYxEKQNU/V8S8/F95lQNzM0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBuyt9O0Qxoxm/hteOdQ3h5Wr83XB9Oc442YqQKPM9WT5YP7FGhnpLB5qp7x0cAKI
	 wvhvM4Rd5k3XmpBsvN6kW82UW/YfPFdNH4orKuk0qzafb4T5oQRn5WOqvsYBZKqVhG
	 oqAoIBaqS3F1O24vJgYlQQdSI8tDDgOLGTF0/NdVit9hA3d6tn5UqDDnWkfEFL5t56
	 eGMvNjZWkOdPXHXvJkz70ymnouHogzmf3iEQy5j/ltJswzB75uRdIRenYb5mVLMXBy
	 ynvurvh6KUvOf2UDJI4YK9sdl3zHmKxBhlluOSE3mL2p/BjYCLCNn7VZnOJ48AvE5l
	 sUprbf12codSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D51780E3F;
	Sun, 13 Sep 2026 09:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5315224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EBD780E3F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J58dkhhZI9U5 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:31:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0203080BB7
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:3a::f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789291860;
 b=ocjrmTWe6DeH9BwNd4W+mAXX9qkvGs4MFN2Srzjjf2VJRJDYESsE3BdtpB1G6OQBaJqh
 TikVZ+MBnPAjyNpqI2XVrJ7Yu8E1TBj2DMDSXxY2DelGty5PXmX1exsNljw0hh4Wz/b+t
 CRjATYkDYA8enYi3qO/APdlO2DvdBLziHrlIcnu3sVSWiZnbFv6w18mwbnEW6TO55NmXY
 tacq9Qs4M+ncOaAE24Jfjm1jNQXxrS0xstody9uJsDD+Yv6DOf4jX5EVgzt4A/nOkSeQ1
 m/qsr8vnRSAvY/HKj9PW5trb7auQcjWxajPZ8W76S7dc+FG4noF3HIP22rb9geYH7MQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789291860;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=KfSuP2KgreTLajJhPkmal0q4FQP3o21vZnv5S9RHgN8=;
 b=W62P+clSZKy6qxN0NPWEVksyPHkRh+ZCxhhgTP0R8czhixUqSAYXQpNNsG4Ad0uGeBrH
 ma9JmI5JZR1+CnNiuxEIcpkWgCskAWOAPRpS/Xbb7ivswkVduDtxcnQrAlNvAyvB/5D9E
 OmI7E2oy+9daKfDOVMbmxLy2tWDQgqG/FQcBFOVy5ArpSmyuBJ24P/Jx7rrnN12PKmj3I
 wpvhD2GUTVuA75FH32ZnO1edCEKKOfeYBrIrEa9Vv6gOcQOCztj9UcxsoD6TAe7NXeK78
 EqVPtEtW/b5xLCwYl3FYTPkVYu4IaFaqID+fSuKPGXw+DzMJkm9gK4ygv5m+ByKJMVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MDFLcpaW; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:3a::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:3a::f;
 helo=mail-vs2-x0f.google.com; envelope-from=francois.perrad.86@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MDFLcpaW
Received: from mail-vs2-x0f.google.com (mail-vs2-x0f.google.com
 [IPv6:2a00:1450:4864:3a::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0203080BB7
 for <buildroot@busybox.net>; Sun, 13 Sep 2026 09:30:57 +0000 (UTC)
Received: by mail-vs2-x0f.google.com with SMTP id
 ada2fe7eead31-79022baa364so294184137.1
 for <buildroot@busybox.net>; Sun, 13 Sep 2026 02:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789291856; cv=none;
 d=google.com; s=arc-20260327;
 b=H/c0jPrYwZs/4TjM1H22zUCrrsCFEeFV0Ux/7WBEbnMTdHAhFaFAaC3qze990scICE
 /a2BPMDyiDa/EXJghPvaSIoaOI6MN5E7m8n9wwazOfatWiz/v00ddfzsRn/pTTp13IVg
 PBC3miSvijwmCco2v/5WYAxDKR7CN380964x+ODSXYngWHcw3G81j1cNKGbikj7uArUz
 OyzUw6vPCt+gR+TimMUeZEJYg7lgVb7O/6JoMelk+3zIYgAAt8adv9/SYMK6uWlfZtKo
 DbWtqNBxDAqByCMWAYUeV5F5AFhGOI23Jr7NJYwIWqlUeaYyNK+IyxZpupBgVTeEbaXn
 akOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KfSuP2KgreTLajJhPkmal0q4FQP3o21vZnv5S9RHgN8=;
 fh=J6ywOFdhM/uDHB/p6B23q5fRdRpCJ7kirBPCytknF+s=;
 b=fe5y72ykCdmW1EINbjJgJgOedvwT6pnLdESdGQ3N00ctFWs76i/PJdAfVItdLGZ8Ll
 MhAkADUT8sItsHEZU9sbFUbChLZrRm8Vy0pwZdCq4zOJAL8oRTP4DmQ3hSfmIZ7IQzcL
 FdSJpFKpKkT8rUvb9Tr3cMBeWyGwC0mmBKWDrCdi+PN+0/A7B0RKTMEEURZvqyTW6rt2
 y0oAHsZus6Bgs/jhLFMrmOHAGEYrCeJEg907qehGtzeJtS96/u85o25E8dvHsRh0YTRe
 cN+VWECdnsr0RtSY7yhLUjhgrCABniz+RdTq8x/+PQ5DqNP5G7EjWQoWVb0Dp0xMDsoA
 fDWw==; darn=busybox.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789291856; x=1789896656; darn=busybox.net;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KfSuP2KgreTLajJhPkmal0q4FQP3o21vZnv5S9RHgN8=;
 b=MDFLcpaW60dfqzFPyzaS8id4RtO4hNHoYR88Hyy/Yw0wcJKZZ8mwUzyJV5AnBZw8Gl
 oR5M6flhO/2MOTI7U+PzL91mIaKCTI2o56A2oVY37fdTYX331m6NG4WKQWiNLVbaUqlm
 HneH2xbTdWtPdQXG/DLrU/nWduER9fvHvQ48abAyHPY92XqitJrzP2CFlGXLWaJ28uzq
 2i8ZZIIQ4kTjC1ivaYu3HJHBDFzG+a8EBgRHR5sR1pl0iTWIfJJbk+ekkV9ufQB33iVy
 +NpuDZOY4l8xyJQ+MdD2S5BeMWZ/wR4kzZ9oX7zZZ3oSireewyTC7I77ES8VeUQiDG2c
 puCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789291856; x=1789896656;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KfSuP2KgreTLajJhPkmal0q4FQP3o21vZnv5S9RHgN8=;
 b=p2EE5JPUgnLTAlm2s+TAiZ6eMDdPDH28SE01jZLYAuarkJHJbVcdGxYt4lKgt8n7l3
 kdRofJNqKjq7lV7UiMw+Xp/YpDNNktZn1vkecKwDaBdXl8R50FaEfBN2RDHpERhxwziL
 XbO+s7PrfV0FQODecOX1VluKYtVNl18JtNcVppxy2eyRJlWjpk4fO0u8bfrHl8Ew7+VS
 1INmdYftqIMRTM+vH98R3G6dI5d8Umr/7CAyfGk89DDVm38oCzTQfkt3FwBaOLL28X9m
 0yx7mGE4Wans+avSy9rWMUbRloiIS/UoG5XNU/sUL4qyqK7oMjlIqzI9g2Yd76j4EZ/X
 Vq9Q==
X-Gm-Message-State: AFuF++lWd+fPYh11M83L+mqjEhazN/q+HyFF7BKFvRQXSlygKC7JGJN1
 D8WhbsuSkkK29IGyTtYCMzAIXuAWoXDnpHbAhRY5a9Wk+69DlDBpNtxtu5VJD/vbcZsM1+5Ms4e
 uW6YHbbWfUqqzbIFpowiW8OLSZmwUCjE=
X-Gm-Gg: AYBFou19DcWb71kXUisZmTeMc2ZlaHQzlU0t+xOZXvUbC+25TS7h8K/WxaKsygwVRA/
 OaFgus9RNT8i7+/eNQf7zKR9rzaGom9mD+W9MKKwrNQAwajFdXlByZePUAb9DQ8XOxkysym7Qa1
 z9XpFiXV/PVZBZs86rVCB6FMsl7fWir4Zu132FtRgHMYiPCB54FxQslQhQuSpHj+Poj/ew6FEHf
 /URDogmxNxHt1ZhCNeRCeIeXb87kWPF2Dc3zfsqUyAUiNaNhV41TJ82+nh3Pd12z7mMPIR3IbxI
 pRivdVGEyjvmvCbqjrqfS1lvMTQ+QcbMin5HsWzCJN8WpPm5K/BvHjfAIH3YZqo+X2yzfJlU+q0
 LKLfoTJBXvdztOA0lharGfwgh
X-Received: by 2002:a05:6102:3353:b0:786:56ab:910b with SMTP id
 ada2fe7eead31-79890b0c815mr356407137.3.1789291856420; Sun, 13 Sep 2026
 02:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
 <20260911080611.55857-3-francois.perrad.86@gmail.com>
 <aqZSBEd2SO0aHS6V@windsurf>
In-Reply-To: <aqZSBEd2SO0aHS6V@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Sun, 13 Sep 2026 11:30:45 +0200
X-Gm-Features: AcwNN1UpfV1f6ykJ55ST2045Yk2HQeFO-PJPemIo6t0IhcqV83LbAsDyTiMs7CU
Message-ID: <CAMTop881hu=pLy=3N+rPNtorZFawAC54-xfvWbfAaPz7UrE+Bg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] [PATCH 3/3] package/lua-lunix: fix incompatible
 pointer types
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
Content-Type: multipart/mixed; boundary="===============4464351928139718430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4464351928139718430==
Content-Type: multipart/alternative; boundary="0000000000008063b1065b59f9bb"

--0000000000008063b1065b59f9bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 13 sept. 2026 =C3=A0 09:35, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello,
>
> On Fri, Sep 11, 2026 at 10:06:10AM +0200, Francois Perrad wrote:
> > see
> https://autobuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e8=
72a00ac
> >
> > Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
>
> Thanks for the patch. However, as you know, we need some indication on
> what created this problem: which version bump, or which change in the
> package. Otherwise, the maintainers of our LTS branches will not be
> able to figure out whether this fix needs to be backported or not.
>
>
the version (=3D date) of this package is quite old : 20220331
on autobuild, there are failures, only since 2026 (see
https://autobuild.buildroot.org/?reason=3Dlua-lunix-20220331-1&step=3D100)
so, I think that the issue is appeared with gcc 15.

Fran=C3=A7ois


> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000008063b1065b59f9bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 13=
 sept. 2026 =C3=A0=C2=A009:35, Thomas Petazzoni &lt;<a href=3D"mailto:thoma=
s.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<b=
r>
<br>
On Fri, Sep 11, 2026 at 10:06:10AM +0200, Francois Perrad wrote:<br>
&gt; see <a href=3D"https://autobuild.buildroot.org/results/7fba1da21af93a7=
a0431fb9431dc3c8e872a00ac" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e872a00ac</a><b=
r>
&gt; <br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad.8=
6@gmail.com" target=3D"_blank">francois.perrad.86@gmail.com</a>&gt;<br>
<br>
Thanks for the patch. However, as you know, we need some indication on<br>
what created this problem: which version bump, or which change in the<br>
package. Otherwise, the maintainers of our LTS branches will not be<br>
able to figure out whether this fix needs to be backported or not.<br>
<br></blockquote><div><br></div><div>the version (=3D date) of this package=
 is quite old : 20220331<br>on autobuild, there are failures, only since 20=
26 (see <a href=3D"https://autobuild.buildroot.org/?reason=3Dlua-lunix-2022=
0331-1&amp;step=3D100">https://autobuild.buildroot.org/?reason=3Dlua-lunix-=
20220331-1&amp;step=3D100</a>)<br>so, I think that the issue is appeared wi=
th gcc 15.</div><div><br></div><div>Fran=C3=A7ois</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000008063b1065b59f9bb--

--===============4464351928139718430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4464351928139718430==--
