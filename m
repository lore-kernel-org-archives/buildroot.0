Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB12C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 19:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE5C83925;
	Wed, 19 Feb 2025 19:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X06AdeKgL454; Wed, 19 Feb 2025 19:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6DF837D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A6DF837D2;
	Wed, 19 Feb 2025 19:51:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3687ECF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 19:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A745610F9
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 19:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBTip9A9gTfc for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 19:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9952610DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9952610DB
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9952610DB
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 19:51:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abb7f539c35so45227966b.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 11:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739994675; x=1740599475;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UzH9T+r+sO1pKtPCd+aDfPz2VoGwfWpADwvwnI9tL1Q=;
 b=dn+dICeQB5bceE7yb/+MVZRiXhW4cCrPz1ffVqAZr7uGr6YEdx9E7pctdDOWFC/83a
 QHuMy1zB5Sjl+OE29QVw8fRLfUhgAvraHxa3K0r0ezfSFog8jKRKCsQ7qVGmLTarwdaj
 gfFE/nOXBcHoXiWbm76+8maMAQf3Av1p6FJnjPQpj/IQv0vXfVpJCHqFZvE5CnIcVhh2
 1WvgNPQir5v8SRcVC5sIpObBwcRIMQU4Gj9S52M9EHPfJH/jGym0cvG9LH69iGwyHg9d
 /7YkDJxZ1kIhSUGwagJeHlH9utaFCAQponvpzWIEneVyZsTdGtrjl/NlgBbCpYRz+bNN
 NiaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeD06Y/qaKQUL4fINNISDdUIWmiHiehomRfrQPBZHNOSnUufvnNO4B0+HQ7ZY4WcSHvCvQk24NgJY=@buildroot.org
X-Gm-Message-State: AOJu0Yx1d7dYIfojpHRwGg9zfxi0xTRo2bTMSVCHtzWLoeWXvctchKG0
 OOU4ILAyh69bpQv/l3u1mFnjOEjdKAQFIpAlcquNwPs+XxPPCZau
X-Gm-Gg: ASbGncstet408WuoeyYNQi0nvLBPZdtoZcbWt3LhWyaAU837gnmhFTSEKGNAFzybhTD
 ELlZhhaDg/rJfuma2zlO1RqUX4J8brEOM992Z/VsC6zh8eTsUtOyxitGFZUTpiN2D1RISqZJX70
 F+H79rZCNAjX4IFXhL4t31lwAQYYcBZsxlyFXWoPCOqpuy3y7wEK/lripP1b50AOqHA7o/U1JVL
 6h8q+CkxiNLOVZ+9MAgXenBsuN3s9PDlmaWElOBDxcSclItiHDKgxP6f0yWvaYJViAgVBlZOH2b
 NUbV8yUcvVXx90SmsYUY
X-Google-Smtp-Source: AGHT+IEuOoTQwP6F7N5H1P15n0M+pWP0e1XGTH+V1BX+/W/MdblB7Itbs78woj1OFZAhjIA5H+VY2g==
X-Received: by 2002:a17:906:2709:b0:abb:b245:a548 with SMTP id
 a640c23a62f3a-abbb245a714mr805234766b.18.1739994674701; 
 Wed, 19 Feb 2025 11:51:14 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbbe74100asm373165366b.95.2025.02.19.11.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 11:51:14 -0800 (PST)
Date: Wed, 19 Feb 2025 20:51:12 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Message-ID: <20250219195112.GA2631528@pevik>
References: <20241211210934.179268-1-giulio.benetti@benettiengineering.com>
 <20241229222118.052d8d19@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241229222118.052d8d19@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739994675; x=1740599475; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UzH9T+r+sO1pKtPCd+aDfPz2VoGwfWpADwvwnI9tL1Q=;
 b=AFkdXgoFh1tkIduauRXSOsqRpFy1KwlIF2SoGbElLr6FTulYXouSXDAiGGTPEdwSVm
 ANDJG+VUWxHGXf6oroniPLLGjfsz3ld/vzRTcGY0B++9P8qsNw63/rXaFRiMEA7GwWpt
 j1k1Qx1uRstVIcUCQIbFVMMWlsAmr3O2HgzSr2JemiAPYcP/dkAtqHd/DNvMi4QaBJ81
 JATDS7S5Xz9svbSNNOxJTvd9J8pFjlCARTp5enAbfeo9TZ3G01WAiqwSS0hgmpkXQH1k
 sQcW99bY4l+JKEPItB9nTrPhnQoKubawBrM6qFbV021vDYBlFosrMf4QbmYCoZ6BeTfo
 CCJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AFkdXgoF
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.2
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> On Wed, 11 Dec 2024 22:09:34 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >  package/nfs-utils/nfs-utils.hash | 4 ++--
> >  package/nfs-utils/nfs-utils.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)

> Applied to master, thanks. However, this was extremely confusing as
> this patch was not based on master, but on your previous bump, which
> hadn't been merged yet. Please try to avoid this: if a previous patch
> has not been merged, the new patch should replace the previous one, not
> come on top of it.

We got an errors:

*** ERROR: package host-nfs-utils installs executables without proper RPATH [1]:
***   /home/autobuild/autobuild/instance-3/output-1/per-package/host-nfs-utils/host/bin/sqlite3
make: *** [package/pkg-generic.mk:301: /home/autobuild/autobuild/instance-3/output-1/build/host-nfs-utils-2.8.2/.stamp_host_installed] Error 1

Please, any hint how to fix it?

To be honest I don't even know if this is purely Buildroot setup issue (I
suppose) or upstream issue.

Kind regards,
Petr

[1] https://autobuild.buildroot.org/results/1a81cb7c88a41a03767a1a201ee0628468f60766/build-end.log

> Thanks a lot!

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
