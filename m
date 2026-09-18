Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D573C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC4660BF7;
	Fri, 18 Sep 2026 17:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqhJZCSUFhIM; Fri, 18 Sep 2026 17:45:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D959C60D56
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789753559;
	b=J9o599rDA5AaWIEYwuj09C5dGheWfqluPc9Va0s5br+mRhXYsNf7QTsbeBaFjVT4YdkG
	 ExfgtzgXOs8J8n8QVzKrYxUebbELu0w/1P7qULc20fYHVFqUC2LUkozkpaqKq+gz8WWef
	 /bWym5SvQL47wy7pv0mU+97XGORdoF4/41BDsz4SP7Qn4Sme+50i8b+hoRn65lniuAhY6
	 tud0KWo/O8qQJ4wbMsrlDbBhUTCY5YSLTOhGZmvysQKYobCwsH5eJ/DU1d12zsVwdQ/SU
	 qWbZ1lsC1/kIjAOKiNEX+FdYDYphye9Qb0fXOC80cytZITFvJiftE1IvebJramDlGUw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789753559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=MFyOu+TypIuLBbxJA03TS6EqKRnXPsKs6uTJgQxU9P0=;
	b=Nygvpe0xbkidL7E6YCr8yBydR9m4T9K8wxp4Gx31JXJpzXVAZeDbSBOsVkK8udUWbg8K
	 PTAhq7n2rTekmn4XMRFT1D7TkBdcxZIOsOa55aFh8URMZwRzvNT9pFsRLrxuBsTZa1pP/
	 /DopRG8qMmdqsIZzORzBNXhJpIJZuCZI3c4SnGOC2l7uxUtVGrBQcjyjZ2OSJQ98aTqaM
	 wO0pw+aP/x41uWSFfhQYwHZ3BamPE1WY4jxYZJzxQAuAO8/f0mBRxW3rzv+sAo9PY2AJZ
	 bOtj7whc3PesPX4mhB2KwjRdP0iMJpnKs6TMKWl6hcaOSpHyJNEP/xiUOrCXQP1WobQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuueCRix;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789753558;
	bh=MFyOu+TypIuLBbxJA03TS6EqKRnXPsKs6uTJgQxU9P0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5ibB5ybx90LoPSpfgScvMaS0rqOSmP9lOdgkLUuyz3okERZD7mImwg0egc27oK+N
	 3NcFLRcowDIs+k8rT3jOnIw4xcN1+zqskky8OvCpCqgXnU0xqx29SMH0sbie4hOFPI
	 bDBWHgz1cRETTMLXogzdn4oAnwpjJP/ft8E0k0l9dR4+nJmQ/y0uzq1BHB8X2gOKFo
	 k8WEp44iiIdzwdp7igXRfNUt/XvKwnsvWLxur8Hn4XDxi19e6BIN7z/6B0oukeYSVh
	 8Q5OboggTb8yhPZ6zP8yKKogv56Zsfp7j6wK2ODSkSbiar5obaI+Cbsq43mNCc83eS
	 K/OlOhtjKgDCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D959C60D56;
	Fri, 18 Sep 2026 17:45:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7071F237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5636B60D56
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYPxdIjmg7JY for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:45:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2E18E60BF7
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:41::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789753556;
 b=mMlUvlj26MVkynf0q7rV9lpXf4qUJVNjE60cPfvkRC99HAg7EZj2tjDHrD+mQatJ0rG/
 ytjiuBFNtDuREq7wWijZK8HORp80ZBSAGO5ucM/xqbsdEg9/tNQMMRbe+YyOqPN4+uVww
 IkH9nHLLNVv+GX52kYK4AvtvL6Vr8ZDc2MxCJ0bABVS92r/rCiUPTiIwf/XKmK7bAqzAO
 zjNyjKFxDf6AU/6tR1W7bjhEujYentITBisG0smmHOIudW/Gk3+KB9jiFV9ZXkLS7NX51
 v+IIGNh76tD0dIZSF5nzMNc2wY1nVQcct9Bj+v2LHQsExlkpVkHhqLtxfrFJJML2avg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789753556;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=qR8ttLWDItpGcW6wlpvyob8ScR7oaId+C0ZYP21Ez5Q=;
 b=Sg8Vl26ESSBA/gfzxCaaray9a+VaTbzfyB8HJpijRW9eITivGemuUq3LuJvMLV8EIE81
 3smdN5thZQJaiP/rYfHCq2RhdvXbRnSnUceU9s9MgnyKqgNhEdt0iZZbNPk6bnp44qiRv
 vORngrUsxYBGyUcQU4IAMvDDg56QL3NcR5ec0XykM65nSAYsmn0Jy5fAHQI/+Den7ew7Z
 Iw09PZRDcgnFSEkP6runlw0SOMbymj3WRjnZxWjRFg9gkCqgDfxyTwxA12MMDfAc/ezqS
 /tD++bYOgdt16HuuYtNu2aXjGysrqxP/RCpIyTFIZ5S+sR/UF0FWaOhsY3+0QHFVGFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZuueCRix; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:41::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:41::10; helo=mail-yx2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZuueCRix
Received: from mail-yx2-x10.google.com (mail-yx2-x10.google.com
 [IPv6:2607:f8b0:4864:41::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E18E60BF7
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:45:55 +0000 (UTC)
Received: by mail-yx2-x10.google.com with SMTP id
 00721157ae682-85d43ac6090so9814107b3.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 10:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789753554; cv=none;
 d=google.com; s=arc-20260327;
 b=EqI+2IZ83Rm3qriBGiBTWLmW793gry4pvPHLCqvRNHrKzX/X9a0ZB4cRBUR1n5Ot1N
 VJcMsCqKQ3Z+CI/OUv8TkW/gcp5wBLNxk86YyygiEgOBqFPFDrurdSqYg0Wls+I2KCNW
 CBD5TxRRZBHuY+cuXKIpMBkdmvFXQPYjabqREptHCwdItGHE2icWhyi/2Y0lQ8MnLD6G
 88+xpQcG4sjwao+tfs3T6Z6tj8c03ksqTADfi2Cvl6loNGHVVb9Vt1kLgjAb3Ilp+TTI
 3KHv2G72fxaz4FsgtvEouYXv57a9DiT3a67h9ihZeY1PLsWhKOpgfPb0DgxFIG1Zt8E/
 kzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qR8ttLWDItpGcW6wlpvyob8ScR7oaId+C0ZYP21Ez5Q=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=oSVn63Tq+TMIske72MzbTVEYUP8Q1gYuCQdPnhNe7w4/vvpNK99RU/CJaQJZq+DLr5
 X/pJVQc6Mbaag7YzfXwZ0bFAT16+3+9ptFsKHlvi5e0CIQN19qD5nRwE0ek1wCY2C10G
 XcTxSdMD2GeKmPF36g4TkzGgeYxe2HrDUotkIx83EFBckUZLzpCTfxYX9S1E+tcpMZqZ
 +RZxw3TyRFO6BL6L2LYdWA+NhvHtvnIviB7cSVWFl6eBY2TWwPGSKFJUJ+IkAqKLxKdM
 +r+5/YyUfxQSKxA5X/+W/So0ePuHuFMomrPnwFQIWtbMUGjXGJLQ8Ez6B923kbtGqSdp
 FSPQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789753554; x=1790358354; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qR8ttLWDItpGcW6wlpvyob8ScR7oaId+C0ZYP21Ez5Q=;
 b=ZuueCRixYg/CgAixtSw5yVnWv0LXkzoDkCal9jo0eb7Tys0iaHSt2t+EMwarC8abHo
 KYSnTK5K0r4s3acYErP3UbN9Tzrq/egsFPoTmIbypQ59KgEnYFyuZYdw4NBk9I1ShoLT
 zdp16c8QPm3D/R9awUC/aRmPHcwAPPRUZOoD+6KlALCcDW+2pEOy0OvQ/Q+p7Kq6K5UM
 UccFGBcLHBVDXXMDbWDVUK1c7j1q1eK3kOWHzbIn6uf8BbVKBQKSsVgBDZDID+Q2ILyh
 xJ/4wuFsTOnJbBYXSx0sXTMTWGBM7txswo/FjthpMFImNImyJQ6oJz/PExJY4dU5Zcac
 ho+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789753554; x=1790358354;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qR8ttLWDItpGcW6wlpvyob8ScR7oaId+C0ZYP21Ez5Q=;
 b=Nn3i+qCy08a8s0UPe8VRSDQ4x4qBWVjhYef4NgWQhdvUGbwVo0sPf2qIVdeksTTYGw
 ubOYBYU3fZjzKcOW6taw8P96j6g5xnO4lRYmfdAZ8MkZtzaNp1EahodoAffDNvsuE/Hs
 Zt/pshsoFNascnKRAQ0L1kFht0Wrvy60TXB/RvU6YTLLJxU74vCjDJIv4MpXfXyBkXUR
 AN/HkoCLl28z5i/0jPADAiF5pR7+lR1IykcYllchwwqtvKmi6t9fr60CfZ9QFZAP/eYD
 S4w9SRfNda/Xtjsp7ugIzYFjoui2ozopAAsweG7pUETjGkMO31Kamo32c1iev9TOA7q6
 J31A==
X-Gm-Message-State: AFuF++l5PNPV2v93kMKqivBfnuuTg2w5J/pWAkQ0hS4snFUepVCGSKeL
 PzYfA3NxQYcUlih3KcbG/1EenEnKIj3DTHTxI9og3okBO/PiSwqlxwASQeR3a3nunH3eVKnwrcx
 ziEoNwrcfcdWL15cJ91GbuNcp8MovgX0=
X-Gm-Gg: AYBFou0c8DuqKjumFlc6zEcPewts/1UZrGReme1hR2wmgaCbkdboutpsRRiqwAH+a3V
 b35bi738/tqfOLojv6uYoESM5I2iZB3KfKV6H38TI1SoKdqDPyOlY6DWeUcvmxYL8nl+DwvMmHI
 W/NFd4wIxDytrarFUYapKMtwazzAALRHe+IYbt9TFZkGXaLkshx4g7t/T+OiNxPryxacwAUG8jX
 ixP0MQbHCswFKp9JJj9naMe3p87kEezuBzuC6TZvFZCjpNoXiF8+9fFLPPosyGAm7SGuvJbz+xk
 cNuWnVXutuqcLxTeYfLnOw2DuP272KPHpPGyIOZ4S8QEhkWYuyyzgWA=
X-Received: by 2002:a05:690c:82:b0:873:5c7b:c0f8 with SMTP id
 00721157ae682-89735f6de27mr12115897b3.48.1789753554266; Fri, 18 Sep 2026
 10:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com> <aqznoUtW4EIcK_8m@windsurf>
 <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
 <aq0uT-ghEihRclnw@windsurf>
In-Reply-To: <aq0uT-ghEihRclnw@windsurf>
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Fri, 18 Sep 2026 19:45:43 +0200
X-Gm-Features: AcwNN1X86NIcSe7dtKlM1wjMRzqxmTl2YXHP_EFS3oQriuZeeNURzQKxqBP7CQk
Message-ID: <CAN7e4jotGmfe1y_8gR4imH1_YTKoEJJODPK6kfAtpL9hfLzcgQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============9040344990558815308=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9040344990558815308==
Content-Type: multipart/alternative; boundary="000000000000d66d50065bc578a1"

--000000000000d66d50065bc578a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Sep 18, 2026 at 2:29=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> Thanks for your feedback.
>
> On Fri, Sep 18, 2026 at 01:08:35PM +0200, Jean-Paul Etienne wrote:
> > Hi Thomas,
> > Before adding this package, I've checked linux-firmware and saw that it
> does
> > not support brcmfmac43456-sdio.bin firmware
> > required for the AP6256 chip.
> > However, while looking in the brcmfmac_sdio-firmware-rpi package on
> buildroot I
> > see it supports the firmware:
> >
> > ddf83f2100885b166be52d21c8966db164fdd4e1d816aca2acc67ee9cc28d726
> >  brcmfmac43456-sdio.bin
> > 44e0bb322dc1f39a4b0a89f30ffdd28bc93f7d7aaf534d06d229fe56f6198194
> >  brcmfmac43456-sdio.txt
> > 2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a
> >  brcmfmac43456-sdio.clm_blob (default_config)
> >
> > But brcmfmac_sdio-firmware package has specific firmware and config for
> the
> > rockpi4b board as follows:
> > 78085a816d23d9877e3ab872d8eb142646bfde18afd2c7a5b89885327a287d19
> >  brcmfmac43456-sdio.radxa,rockpi4b.bin
> > 343d1c79cfe0e10e1777e3de19a0302f748f69fa8356cab2c36ca0cf90bbcf0e
> >  brcmfmac43456-sdio.radxa,rockpi4b.txt
> >
> > And they are not just symlinks to the default brcmfmac43456-sdio.bin
> > or brcmfmac43456-sdio.txt
> > So I thought this package could be useful to the community especially
> since it
> > supports a lot of boards.
> >
> > I'll update the patch.
>
> In what direction will you update the patch? I guess the main issue is
> that your package was named just brcmfmac_sdio-firmware, while in fact
> it is specific to the rockpi4b board.
>
> But instead of doing this, why don't you send a patch to
> linux-firmware to add what's missing?
>

Yep, I'll check that, sorry I did not see your email early.

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Regards,
Jean-Paul

--000000000000d66d50065bc578a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Thomas,</div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Sep 18, 2026 at 2:29=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:=
thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Thanks for your feedback.<br>
<br>
On Fri, Sep 18, 2026 at 01:08:35PM +0200, Jean-Paul Etienne wrote:<br>
&gt; Hi=C2=A0Thomas,<br>
&gt; Before adding this package, I&#39;ve checked=C2=A0linux-firmware and s=
aw that it does<br>
&gt; not support=C2=A0brcmfmac43456-sdio.bin firmware<br>
&gt; required for the AP6256 chip.<br>
&gt; However, while looking in the=C2=A0brcmfmac_sdio-firmware-rpi package =
on buildroot I<br>
&gt; see it supports the firmware:<br>
&gt; <br>
&gt; ddf83f2100885b166be52d21c8966db164fdd4e1d816aca2acc67ee9cc28d726<br>
&gt; =C2=A0brcmfmac43456-sdio.bin<br>
&gt; 44e0bb322dc1f39a4b0a89f30ffdd28bc93f7d7aaf534d06d229fe56f6198194<br>
&gt; =C2=A0brcmfmac43456-sdio.txt<br>
&gt; 2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a<br>
&gt; =C2=A0brcmfmac43456-sdio.clm_blob (default_config)<br>
&gt; <br>
&gt; But brcmfmac_sdio-firmware package has specific firmware and config fo=
r the<br>
&gt; rockpi4b board as follows:<br>
&gt; 78085a816d23d9877e3ab872d8eb142646bfde18afd2c7a5b89885327a287d19<br>
&gt; =C2=A0brcmfmac43456-sdio.radxa,rockpi4b.bin<br>
&gt; 343d1c79cfe0e10e1777e3de19a0302f748f69fa8356cab2c36ca0cf90bbcf0e<br>
&gt; =C2=A0brcmfmac43456-sdio.radxa,rockpi4b.txt<br>
&gt; <br>
&gt; And they are not just symlinks to the default=C2=A0brcmfmac43456-sdio.=
bin<br>
&gt; or=C2=A0brcmfmac43456-sdio.txt<br>
&gt; So I thought this package could be useful to the community especially =
since it<br>
&gt; supports a lot of boards.<br>
&gt; <br>
&gt; I&#39;ll update the patch.<br>
<br>
In what direction will you update the patch? I guess the main issue is<br>
that your package was named just brcmfmac_sdio-firmware, while in fact<br>
it is specific to the rockpi4b board.<br>
<br>
But instead of doing this, why don&#39;t you send a patch to<br>
linux-firmware to add what&#39;s missing?<br></blockquote><div><br></div><d=
iv><span style=3D"background-color:transparent">Yep, I&#39;ll check that, s=
orry I did not see your email early.</span>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div>Regards,</div><div>Jean-Paul</div><div>=
=C2=A0</div></div></div>

--000000000000d66d50065bc578a1--

--===============9040344990558815308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9040344990558815308==--
