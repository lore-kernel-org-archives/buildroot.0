Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F66C77B7A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 12:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93BFE415DC;
	Wed,  7 Jun 2023 12:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93BFE415DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSZ07CpYZHb6; Wed,  7 Jun 2023 12:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF9C64117C;
	Wed,  7 Jun 2023 12:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF9C64117C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C39F1BF3DB
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 12:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F59781769
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 12:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F59781769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TY9vPYMd0PdT for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 12:43:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 963FE81443
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 963FE81443
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 12:43:58 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso9004471e87.2
 for <buildroot@buildroot.org>; Wed, 07 Jun 2023 05:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686141836; x=1688733836;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IG6TU+j4uGpvxb8wa5b6AEZFO4HRjUsvIT+iKel1T64=;
 b=keOAbJKdRSRrvF8fpXudoDEkppPGAeA5t0+nrJPj3jh8Q+Gjq0h/jPlS9h5TQ8NIhp
 xHAGRJTgJ8JOzdDchLYccl3OHGi+9ofH3tUFR7GkQOdLOuJ4p5MAA/6IfzmnM3MIq4Q9
 LmhEKIvF7TJbcuQreF8Fqifq/tTDxa5Xs0fV7GznsKMhl5yLloar8l3gTmKS+ClV/fRD
 iYGIqGR2BvQBMTdFMw3GirGsKQyS4JsdrSQStD/HrhllfoTWygMfzma6wuRdmUxPxbbA
 RwtU7m0txU6x/pkCGfnczVJKdsmguXyvNUojgEyS3FTvax4sE1sY+HqbuJJQ5rYLs+Cu
 QRpw==
X-Gm-Message-State: AC+VfDzzQf9/HK+dCQ4cb+WefrQGDkGyUKV8JHVlnvKYyE9NVbn5+C3w
 gyLouWdOpQmEltn8Kp554BqU0kS3tXc=
X-Google-Smtp-Source: ACHHUZ7FfyEs2T9fusIu3lKayTm/NXaX+inJcmX7Wj1T9NSVH9bpbFt+bdaLyBV51LW/ZDrtkeF5sA==
X-Received: by 2002:ac2:4824:0:b0:4f3:82a8:dcfc with SMTP id
 4-20020ac24824000000b004f382a8dcfcmr1885162lft.55.1686141836052; 
 Wed, 07 Jun 2023 05:43:56 -0700 (PDT)
Received: from hs ([213.87.138.84]) by smtp.gmail.com with ESMTPSA id
 a22-20020ac25216000000b004f42718cbb1sm1782570lfl.292.2023.06.07.05.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 05:43:55 -0700 (PDT)
Date: Wed, 7 Jun 2023 15:43:53 +0300
From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZIB7iXiZ-9GS4AU4@hs>
References: <20220720152440.1568667-1-sigmaepsilon92@gmail.com>
 <2569cf83-d180-41ea-ad10-d053528d462d@mind.be>
 <2b27ec0b-ef6d-9540-062c-04d6f75c2cd3@mind.be>
 <20220724143533.GV2641@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724143533.GV2641@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686141836; x=1688733836;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IG6TU+j4uGpvxb8wa5b6AEZFO4HRjUsvIT+iKel1T64=;
 b=bjjebDNyrLiHSSrvUtfOmw+5y+N/Ycji9NpY8aocnbI6LIeEC/UBMRsGRdlXpzppE5
 WmLBw2Fvz77anp5ZevM7uGq94celY8mcb4auLIVp465gpaLLVvjUcpJrR1Ws7/amHfzV
 cMSIPrArbDqT53237d5u1KsEzrlHs/Xg9BhFIePnp4auUMbDlF2DZzY4UMXP2Xu+rhA3
 6YpgmG12gMOdgEwK/yb0qul4rIFj894mb/UbQSSDvZNsWo0MjruH48jVqBEAPBTH92jr
 5WJC/N1PitEo9YlYkHKm8OCZFnKWQB4DHqRQSX2GL2qnHUswUdm2nq/VniEVC9A/LR01
 J12Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bjjebDNy
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: fix cross-compilation
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
Cc: =?iso-8859-1?Q?Jos=E9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

Noticed the same issue on x86-64 without cross-compiling. Here again the ho=
st
compiler was used instead of toolchain. The build failed because the host
compiler was older and did not support some fancy flags.

Host: Debian 11.7 x86_64
Host gcc: 10.2.1
Toolchain: x86-64--glibc--bleeding-edge-2022.08-1
Toolchain gcc: 12.2.0

The patch proposed by Michael Zimmermann fixed the issue.

-- =

Alexander.

On Sun, Jul 24, 2022 at 04:35:33PM +0200, Yann E. MORIN wrote:
> Michael, All,
> =

> On 2022-07-23 15:41 +0200, Arnout Vandecappelle spake thusly:
> > On 23/07/2022 14:42, Arnout Vandecappelle wrote:
> > >On 20/07/2022 17:24, Michael Zimmermann wrote:
> > >>Currently, the kernel module gets built using the host-compiler(from =
the
> > >>user distro, not from buildroot).
> > =A0It's actually easy to reproduce, just change the architecture to any=
thing
> > other than x86.
> > =

> > =A0I've looked around a bit and it seems to me that zfs already builds =
the
> > kernel module from the autotools infrastructure, so we're actually buil=
ding
> > it twice.
> =

> I checked, and it is not possible to tell the zfs buildsystem to not
> build it.
> =

> > I think we should therefore remove the kernel-module infra for
> > this package, and instead add a dependency on linux and copy this part:
> > =

> > # If the package is enabled, ensure the kernel will support modules
> > ifeq ($$(BR2_PACKAGE_$(2)),y)
> > LINUX_NEEDS_MODULES =3D y
> > endif
> =

> ... and add linux to ZFS_DEPDENDENCIES
> =

> So, I've marked the patch as changes requested in patchwork.
> =

> Regards,
> Yann E. MORIN.
> =

> -- =

> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspi=
racy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___         =
      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspir=
acy.  |
> '------------------------------^-------^------------------^--------------=
------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
