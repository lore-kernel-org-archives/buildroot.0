Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA72BC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 22:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B8681F4A;
	Mon, 19 Feb 2024 22:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igdrp_mifdnu; Mon, 19 Feb 2024 22:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A3D81F84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A3D81F84;
	Mon, 19 Feb 2024 22:42:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 838E91BF417
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 22:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7122A407C8
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 22:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0dozDcn1s0K for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 22:42:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com;
 envelope-from=patrick.oppenlander@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F45D407D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F45D407D2
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F45D407D2
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 22:42:20 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-68f54a65ae2so9543176d6.0
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 14:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708382539; x=1708987339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BrotUQJLQUNL4hejRCjJqTnEZ8KoxRo6xPFGvItoQ8A=;
 b=UTlFm9hbSbe9LmBI+zrvAHc8KH/622uhfu91btrKwGX4z8n8xuzP8CFLeuDyPwK/CA
 X55Sfbrcw2Gkemn1FV7/FFKuVuHpiPgWXLtXPsTIbXSpQjYwMgWOhIYyLdmWRIZdcFN4
 yZ6DgrB+KQshg6Ya6dMs+1W/Y6fIIbuN38x1LRSwf1q6Ltxl7sb16oSseoz2/MVB5guF
 5/7JZd9ljUbn7AmZVKIXrXeO8BSDB4gHpsdLUh2HAWq6q4bYDb7RKqStSujLKuLJ+ZfE
 ImQjKK2eft9clrodFPZQYYfpByFCMeAGrWu4GjLJaLWQDdvOG68Bp4SxtsJzOUhnBCHV
 a/OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWafeuhUXioGblftkki92AW573kmUbDXvDsdeydSsXTdrBN8tHKZT4FueEzLJqW0y8ELL6NU2hTvcnQkIH59s9uGFnAQxgv2Q==
X-Gm-Message-State: AOJu0YxwKe7qcQjZyxWqoa7uqcA/SCefrC90ifje3/9qiWfdc+t6efZq
 vTWVwzj4XLcB3stCHpyWT7ctfd/P/xSoHAbviJPkTClSiyyud5OmJ0LNJZz3sUa69/nEZIW7Kr5
 5UkUk2gDviJ03r92BJ18oY0gW14E=
X-Google-Smtp-Source: AGHT+IFCO0A9zQEU3pTL+TeLoDzUdzmz+uDkdESTENgmdumoBZD2R3ViRN4NyMtgdasCRv3juNgFbyQY1RVLwAVW9mY=
X-Received: by 2002:a0c:f3cd:0:b0:68f:4202:19d6 with SMTP id
 f13-20020a0cf3cd000000b0068f420219d6mr8965222qvm.38.1708382539200; Mon, 19
 Feb 2024 14:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <4a8d7f2252b46118554a9e22c49901822e461f2f.camel@gmail.com>
In-Reply-To: <4a8d7f2252b46118554a9e22c49901822e461f2f.camel@gmail.com>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Tue, 20 Feb 2024 09:42:07 +1100
Message-ID: <CAEg67G=H7smzSZ65BcZT4qxE6kwUEb8d=xBROXHz76mXaLKXVA@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708382539; x=1708987339; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BrotUQJLQUNL4hejRCjJqTnEZ8KoxRo6xPFGvItoQ8A=;
 b=ZtAVTzWQJA7ADfBPDLv9LbQrrrziUpSNUCk4q3+ViP5DSLOlH2UV7FW3L+jDOMmCif
 U9ZDCJJrZwcqGNBOJ9m9rCTFLaDTxRCwqQCdL0ZQvHNXlZxyqMObcZ5f9ZmuOl7cxpxj
 9Fm2piQv8pe0OzPeYsa+bp6PprKQssTCWu/E0lX8nHfjbDTzIAtOudfbUHT+w1ZVunpF
 kTkfNANgvSJBIc0W5jb1JAg+lb4oByr3grJCK4fvU3CyUeycaBTgZmekOiyr6fsjIOK1
 WPpIN0mlg5jzRT4DzPG4ilZ5/HI/Jt/6RnfRkem59RSLPc9sTlcp0K6oSpzW2Rc0EFH6
 U/vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZtAVTzWQ
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
Cc: michael@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Feb 2024 at 04:40, Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
>
> Hi Dario!
>
> On Sat, 2024-02-17 at 17:02 +0100, Dario Binacchi wrote:
> > This series, which in my humble opinion, should have been immediately
> > considered to correct the compilation errors in case of HS-FS devcies, has
> > seen an increase in patches in version 4 to remove the ti-k3-image-gen
>
> I wasn't aware of the preceeding versions, but...
>
> > package thanks to Binman. Additionally, it shares some modifications and
> > views on how to implement certain changes with the series
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=394840.
> > Therefore, I think it is necessary not to run them in parallel but to decide
> > whether to merge one before the other or to consider a single series where
> > the patches can be coherent with each other. I am available for both solutions.
> > Let me know.
>
> ... as the broken HS-FS went unnoticed, seems there is no rush to fix the
> build now?

I noticed, and hacked in some am64x specific fixes here:
https://github.com/relectrify/buildroot/commits/2023.11.1_relectrify.

I was going to submit a cleaned up version of the patches, but I got
distracted by fixing encrypted boot (see below) and never got back to
cleaning them up. Sorry about that.

Apparently TI don't support encrypted boot in their Linux SDK (yet?),
only in the MCU SDK. There's a python script in the MCU SDK
(rom_image_gen.py) which kinda works once you teach it how to read
ascii keys as generated by the keywriter package. Except, it changes
the size of the plaintext because it aligns it to 16-bytes and appends
32 random bytes, which causes a boot failure somewhere early on in
U-Boot. I hacked around that by sticking the original binary size into
some of those random bytes (it's not part of the X509 cert..) and
teaching U-Boot to detect the encrypted image
(https://github.com/relectrify/u-boot/commit/d16b4705ffebb0881633dfd5300bf4ac8490e75c)
and doing a fixup. Once you do that, and change all the right places
to run rom_image_gen.py it works, but it's pretty painful to get
there.

Hopefully this situation is a bit better in the binman version.

Patrick
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
