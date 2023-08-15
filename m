Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC9DC001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 22:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05EF5611D9;
	Tue, 15 Aug 2023 22:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EF5611D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCxJ_j9nEu70; Tue, 15 Aug 2023 22:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C93611D6;
	Tue, 15 Aug 2023 22:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C93611D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D3221BF47F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D83B4094B
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D83B4094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AI6ksxm890Mo for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 22:54:45 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 304EA4093F
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 22:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304EA4093F
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so832948466b.0
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692140083; x=1692744883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e6FGHR7yFZ593WNUxc0PoJ60ZSO2CRRoWOCqPAHMWLc=;
 b=H9+QxPSCWkmDot6XXNiH7VML92CfgGD8BFkXCcSp/eCH3uxThpBexgl5NqldW9YJKt
 h2DeqsP80T0LxoOyxX9+P1hdbHDL4tn8oKNPf2Zb4y4D60YJrtckAPtVvI21kyLN+HNz
 pxwfyqsWwsCnl4nY45iP8kk7/dXZY/3ZFjI4fVbW0IdNw+Q/VKm1J2vrt+Vmtj0VYVdI
 o/shB7dIWvxfv311O+C8wUZBBzhDHVbYdHDcUDb47ATbXVjn7XCPDTEeZX88iD68FX5N
 ZECli/7py+lPqPi0rss87HtKRt7YPyCq5t1u693AatUtA6pMpcmvNqSrd6H47eERi0NR
 5aOg==
X-Gm-Message-State: AOJu0YxoTBhzuTtfjqni1miEvYtMH0Uy1xgR9JQOelIYoORdLMkNExlX
 7Dwkf8q5YBn51EsXydl75p7Sa6MZ2byY2Q==
X-Google-Smtp-Source: AGHT+IEJxwPlACzVqIoH8epI7eqvgYEpvECynytDuja2kwFdCUJLQ3qTmgGXLfufFaEJIJz/uG9AIQ==
X-Received: by 2002:a17:906:2092:b0:99c:6671:66d7 with SMTP id
 18-20020a170906209200b0099c667166d7mr50041ejq.39.1692140082560; 
 Tue, 15 Aug 2023 15:54:42 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906670b00b0099315454e76sm7636458ejp.211.2023.08.15.15.54.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 15:54:41 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-52557cc5e7bso3895830a12.0
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:54:41 -0700 (PDT)
X-Received: by 2002:a05:6402:883:b0:522:2f8c:8953 with SMTP id
 e3-20020a056402088300b005222f8c8953mr128379edy.39.1692140081598; Tue, 15 Aug
 2023 15:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-3-dannenberg@ti.com>
 <CADXxVSKn3-kg_-CEJaDPhvAA4vB8n22M+88m+eUO4ruOo32r1A@mail.gmail.com>
 <20230815071500.4lzfocp6p5clfnos@dasso>
In-Reply-To: <20230815071500.4lzfocp6p5clfnos@dasso>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Tue, 15 Aug 2023 16:54:30 -0600
X-Gmail-Original-Message-ID: <CADXxVSK7Khawb1j-JC3x54KSpBiMy2iF7=6wRB1+2zUAD6rvrg@mail.gmail.com>
Message-ID: <CADXxVSK7Khawb1j-JC3x54KSpBiMy2iF7=6wRB1+2zUAD6rvrg@mail.gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Buildroot] [PATCH v9 02/11] boot/ti-k3-image-gen: new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Julien Olivain <ju.o@free.fr>, Xuanhao Shi <x-shi@ti.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,

> Hi Bryce, All,
> first I wanted to say my apologies from the lack of progress on updating
> this series, the v9 rework got caught up in my summer break, and then TI
> has since released new U-Boot 2023.04 and Kernel 6.1-based SDKs for the
> AM62x/AM64 devices which should now be the updated goal for this
> upstream effort. In addition to newer components this should actually
> help/simplify some of the boot image creation and secure boot related
> "TI quirks", for example we'll no longer need the ti-k3-image-gen and
> ti-core-secdev-k3 packages (yeey!) as those items will be taken care of
> by U-Boot (via binman). I'm planning on making time to pick this back up
> over the next few weeks and work on a v10 series with those changes plus
> applicable feedback that was provided on v9.
>

Thanks, that sounds good.  I was able to get V9 building with the host
openssl change.  Didn't realize I had the older GP version of the
sk-am62, but after I got the recommended changeset reverted,  I was
able to flash and got it booted up.

Added
BR2_PACKAGE_READLINE=y
BR2_PACKAGE_IWD=y
and was able to get the onboard wl18xx to enable and connect to my
wifi.  We are targeting using a CC3301 for our custom board, but it is
nice to see the wl18xx come up and work.

Bryce
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
