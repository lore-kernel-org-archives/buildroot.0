Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865FDC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 16:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248E9818B5;
	Mon, 17 Oct 2022 16:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 248E9818B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5oBKBKHtILFs; Mon, 17 Oct 2022 16:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D8A81403;
	Mon, 17 Oct 2022 16:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D8A81403
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0917A1BF331
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5BE14056B
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BE14056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PUN6PPAgpqh for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 16:10:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A4C7404E5
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A4C7404E5
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 16:10:36 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id q9so26166685ejd.0
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mcHZLIT/akIQBD0IV1GVOGym0KzAZgGwf6shtXQjU6U=;
 b=ps9ZpUqc9/1sJYeg/SdthMHfWL1FriP4Rho+SrnyUNNvCjknJbZj7eRwhJdLFPRyjW
 uJwMmr6HBS1YSF8W4CrgmQfqb52zWv56qb5dlecb4y6ZHDpunkpTbKkdoyjTE6JLJZTZ
 8tir0Kze91LGJ2+PATrf7UWUSjJ8sNJYi/L+XgRLxOKZwQx4a6Tr9tnqiZOWMRajfBZb
 SsqWDAkmvhgzv7B2tDjZ2g9HaofRmVigQvLmAn3nbZS/LIl5c6o7+melmHKIDLZmXn1E
 Vlm6rNNZLRky698yD7DUsF3EGGxXPUovPaXzT4lr0MfMap8QNiU7ZIqEtjcK2TOPz6EK
 RDPQ==
X-Gm-Message-State: ACrzQf2zCmKJXX8m7kmFpsWDmyYhVvH36zfVdbsC3cXOpRU1ky6GHFFv
 QWCmE81Dm08tPksyHbGnDFbQjVXlusJyKRY0lUA=
X-Google-Smtp-Source: AMsMyM5CEaZ7ILF30dkNKMA0Hdps6CLKJLb8cNxaAOc1LVPalPQ/67ETJp1cjS7Z5a7mZ7sywbSSBw==
X-Received: by 2002:a17:906:fe44:b0:77c:e313:a8e8 with SMTP id
 wz4-20020a170906fe4400b0077ce313a8e8mr9441679ejb.700.1666023034672; 
 Mon, 17 Oct 2022 09:10:34 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b0077b2b0563f4sm6405821ejd.173.2022.10.17.09.10.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 09:10:33 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id z97so16758386ede.8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:10:33 -0700 (PDT)
X-Received: by 2002:a05:6402:440d:b0:450:de54:3fcf with SMTP id
 y13-20020a056402440d00b00450de543fcfmr10622110eda.312.1666023033122; Mon, 17
 Oct 2022 09:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221017143125.41622-1-thomas.perale@mind.be>
 <20221017143125.41622-3-thomas.perale@mind.be>
In-Reply-To: <20221017143125.41622-3-thomas.perale@mind.be>
Date: Mon, 17 Oct 2022 09:10:22 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rek7jiAqg6BLVuDLWRggSJE5tdW_B0LvXVmnbzJcRt1g@mail.gmail.com>
Message-ID: <CA+h8R2rek7jiAqg6BLVuDLWRggSJE5tdW_B0LvXVmnbzJcRt1g@mail.gmail.com>
To: Thomas Perale <thomas.perale@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mcHZLIT/akIQBD0IV1GVOGym0KzAZgGwf6shtXQjU6U=;
 b=Y3kn+RqBL+Nep/onxqTaipUBHRrqV1dR+SB3vteh1ancPVd44OOP7KfgDf1hw5IZLJ
 EiXz+SfDzbDumb4E35p6BuKdzzakwfEptqFUXReLd4BVs6SFBOWSOFPkbiJMtFe9cdel
 dWeMmFEzgs5F5hAp5iqlGrhpEZUwYNe4UIRTOepEBtWdDmCeHVXXPwY9+LCjnC1vr/go
 etJi6dphZbkR2K2Lwn/vrm46kKcV5GTY+ZnfPyqP3FnRVHQi4r/ZJtg/CoIzlZFU2dO/
 5yma5gTe2c8MFobInFhmD+RbeBnH372pMRYTpbMbilD3vqHtZ+B0oVRbAKMCT9NwAOLe
 GPBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Y3kn+RqB
Subject: Re: [Buildroot] [PATCH 2/4] package/pkg-golang: set dependencies to
 host-goc
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Geoff Levand <geoff@infradead.org>,
 Anisse Astier <anisse@astier.eu>, Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============8141108839784598063=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8141108839784598063==
Content-Type: multipart/alternative; boundary="00000000000013b8dd05eb3d370e"

--00000000000013b8dd05eb3d370e
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, Oct 17, 2022, 7:31 AM Thomas Perale <thomas.perale@essensium.com>
wrote:

> Use 'host-goc' instead of 'host-go' to build one of the implementation
> of the 'goc' package instead of building the 'go' package by default.
>


> Also select 'goc' in every package that are built by the go compiler
> to keep the dependencies in the 'menuconfig' corrects.
>

Similar to my other email about this - why can't we keep using host-go and
avoid changing everything across the tree? It should be possible to instead
have a parameter for host go which changes the current default of compile
from source to downloading the prebuilt.

Also, nowhere in the Go ecosystem is it called 'goc' - this would add
significant confusion, in my opinion.

Thanks,
Christian Stewart

--00000000000013b8dd05eb3d370e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022, 7:31 AM Thomas Perale =
&lt;<a href=3D"mailto:thomas.perale@essensium.com">thomas.perale@essensium.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Use &#39;host-go=
c&#39; instead of &#39;host-go&#39; to build one of the implementation<br>
of the &#39;goc&#39; package instead of building the &#39;go&#39; package b=
y default.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Also select &#39;goc&#39; in every package that are built by the go compile=
r<br>
to keep the dependencies in the &#39;menuconfig&#39; corrects.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Similar to my=
 other email about this - why can&#39;t we keep using host-go and avoid cha=
nging everything across the tree? It should be possible to instead have a p=
arameter for host go which changes the current default of compile from sour=
ce to downloading the prebuilt.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Also, nowhere in the Go ecosystem is it called &#39;goc&#39; - th=
is would add significant confusion, in my opinion.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Christian Stewart=
</div><div dir=3D"auto"><br></div></div>

--00000000000013b8dd05eb3d370e--

--===============8141108839784598063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8141108839784598063==--
