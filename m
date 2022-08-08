Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B44C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 08:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 120694056B;
	Mon,  8 Aug 2022 08:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 120694056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDQn7nhzFP0o; Mon,  8 Aug 2022 08:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5066540329;
	Mon,  8 Aug 2022 08:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5066540329
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC3F91BF591
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C53B440329
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C53B440329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6Dq-4TFa45L for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 08:15:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F59400C5
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21F59400C5
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 08:15:01 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id k26so15185266ejx.5
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 01:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=qFPGfdgnLS10Vi0kcJyMtBmf7s4qgrciZjeUIv83K64=;
 b=wlvkR/QQwHBdR8u5bgWtvobB11LDurfZQvG/fEFiy+z+BZEtwKQbBXps3K3261E+X6
 8u58DmiIlY7iOmcwYhsDU2vNLX5F8KzHFsGU1GGW8FdNIzExz6otVCSc/3x1znaIVyOm
 NfBBKzylaHfTB2wxCb3iPPlQoW5jNlnuw8qXxf9xI65gAqai4kNkRuqOR74/+HUrDCuz
 ItahvQFFvSi7otDu/Im8JuL5HxRpFZhh7UexXJoYQphQDJ8HGFHR3F4w4P7vDpeE+nPG
 dG4vwthW+lnVdeqsRWsKeR5teH9xToVYXN/SH4oN/FcESbEGULF4sfhCvdOHXtPt8kYT
 ZGdQ==
X-Gm-Message-State: ACgBeo3GLrJfoUYTBGe4CHp3wgmUbLZ2oS1Vol9uh+eTmLNUMLvZ37Bd
 bx3HwNIZeuHiLH+QWgaXdtY=
X-Google-Smtp-Source: AA6agR6QNDKQX4+xim/c6vU4XC+DQCDujXM9diEVPAKEZwXAQ5OMim1Z0BVliW/sdpvDGWRnhuOspg==
X-Received: by 2002:a17:907:9620:b0:730:d5f4:d448 with SMTP id
 gb32-20020a170907962000b00730d5f4d448mr12824729ejc.45.1659946499230; 
 Mon, 08 Aug 2022 01:14:59 -0700 (PDT)
Received: from localhost (ip-109-42-113-71.web.vodafone.de. [109.42.113.71])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906684100b0072fb3704e49sm4739179ejs.46.2022.08.08.01.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 01:14:58 -0700 (PDT)
Date: Mon, 8 Aug 2022 10:14:52 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220808101452.566fd732@tuxfamily.org>
In-Reply-To: <20220806224338.0159e15c@windsurf>
References: <20220806224338.0159e15c@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Davide Viti <zinosat@gmail.com>,
 Mike Harmony <mike.harmony@snapav.com>, Peter Seiderer <ps.report@gmx.net>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sat, 6 Aug 2022 22:43:38 +0200
schrieb Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
> 
> This is another reminder about the below defconfigs, which are failing
> to build in Buildroot. If they are not fixed soon, they will be removed
> before the 2022.08 release, expected to be released at the end of
> August.
> 
> Please let us know if you are no longer interested in maintaining some
> of those defconfigs.
[...]
> qemu_xtensa_lx60_nommu_defconfig -> elf2flt segfaults
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053940
> 
> qemu_m68k_mcf5208_defconfig -> elf2flt segfaults
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053827

I'm interested in keeping the qemu defconfigs alive, please don't remove
them yet. I'll try to figure out what's going wrong here.

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
