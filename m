Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0B7E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 23:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A9940555;
	Tue, 31 Dec 2024 23:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBMJH71rNV5K; Tue, 31 Dec 2024 23:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEC24055C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DEC24055C;
	Tue, 31 Dec 2024 23:01:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56C18972
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 23:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3737060613
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 23:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGmCzeebkOnb for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 23:01:56 +0000 (UTC)
Received-SPF: Neutral (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=drew@beagleboard.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB81B6060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB81B6060A
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB81B6060A
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 23:01:55 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso134202525ad.3
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735686115; x=1736290915;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvIsw99R4npZlCbUhXTK9pPWbOppXAA9IZRYcqS6SpE=;
 b=ArDP7vrswHF8dMJZE68JrwWMEAjcaEh//kRbA6oy1s5BDAVfVyk0dLG7SydxOX470z
 4p/Ug1+MhR44C4X63np3CJQUCyXW0ZTHRqgFbBYKROnXJDT0z+eGaLgcVaUcREgw8hjm
 2kHPjc8u+aa/N6yuPmEEYMctvuxH6zEofzm5VkZypS/9SMFYjj7WuUg7KcNpDu9HsZjc
 uyldsf0Hve3AVKqxWt5EeDt1QJL6yzT3UfvrBVfZjAwlJeYf+WwNSTJVQ5ECqTQAWEBs
 7bZJQZAb9ARPW0E0qhiidEt7dL8QtQVDc3hOlqysCpc0WbjY1GPUqmxcEcfVGRfVgF7L
 vEzQ==
X-Gm-Message-State: AOJu0YxjeR0ebzTwMh6C/mLIRPlLysIZmb6Br3piw4X6NQ3E5W/s7Z+c
 bfXedoD8RfVplMPy5nd1XZcKEtNX8bLDmxYz9RJDuHjr1Wy9HaRAaABi4pA90qYsl5Q6BRAhjVI
 =
X-Gm-Gg: ASbGncu2CB6VatQmyjcdJrdOCK0nrHjq61J8TKVVsbl3aBngoy8XO57HfSOG8bYzdNY
 we3SXuLbBZZH6Ub7HGlnO0+Ateju0scs5K5p+mV11cGZ8oVwOQCUofUHjLSc/yg7y2XlQ2lPK16
 rNLXpLS7FuNbHgpqCcIFO3YU/DFe15nIIL7JX6dBjBnkW/LmfONuPgHzUzZfJIOeRmXWklVNohY
 O5c3vh+Ba+DZuZth0HRmWNrOATFmBu3HYXWXnsw933yDNYuIlJjUu64t07s1eXIEMGWzdvY6Bc=
X-Google-Smtp-Source: AGHT+IEsO66SzSGRg5apTomJCNxPXBwedvLX52mM/XirjVzjYz+odpCBC821bFQG2qSDet9Z/p5BoA==
X-Received: by 2002:a05:6a20:841d:b0:1e1:b19a:fb58 with SMTP id
 adf61e73a8af0-1e5e0480dc7mr68629393637.13.1735686115069; 
 Tue, 31 Dec 2024 15:01:55 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad816284sm21447037b3a.11.2024.12.31.15.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 15:01:54 -0800 (PST)
Date: Tue, 31 Dec 2024 15:01:53 -0800
From: Drew Fustini <drew@beagleboard.org>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <Z3R34e8Z22ujM2mG@x1>
References: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
 <3603154.iIbC2pHGDl@kilian-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3603154.iIbC2pHGDl@kilian-laptop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1735686115;
 x=1736290915; darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uvIsw99R4npZlCbUhXTK9pPWbOppXAA9IZRYcqS6SpE=;
 b=0ydep/nt1NTlvcheLFvHNMR/c3QCYlTYod6Hw4T050vtGpBycExYH4t+A79PAZ7LlQ
 N8MCeU9Y6/nfjoJLRfnG708nceBaSWZCmXlGFH2XkNpXMyIGOll6b9Akv7ZiOQxHeNPr
 DogeD+wIk3mj3ONfxQ6PIRZYPDWmJy8NSwMK+vTRDVaXCHNz0sPdazaJMPhsr2pZ4BHJ
 J0pbHDtDpijeqtR+VJejp2Mfr4FwQnTPntxNNSuPyUsFAevovaHd7L3Vbbq+6ueENnor
 2pjcig9hQCoIally4u+oX1L2lWRA7Y5YYaXwgE2PnKckufymcEkko2VbVJ+ZJ18RyyUX
 0wRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=beagleboard.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=beagleboard-org.20230601.gappssmtp.com
 header.i=@beagleboard-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0ydep/nt
Subject: Re: [Buildroot] [PATCH v5 0/2] Add board support for the
 BeagleV-Ahead
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[resending from an address that is subscribed to the buidroot list]

On Mon, Dec 30, 2024 at 11:53:43PM +0100, Kilian Zinnecker via buildroot wrote:
> Hello all,
> 
> please feel free to give feedback once more if you like, but please don't 
> apply this series of the patches yet, since there are still some open issues:
> 
> 1) Still there is no LICENSE file in the xuantie-bins repository - hopefully I 
> can get someone to add the proper license eventually.
> 
> 2) The uboot is still the custom one. In the past I was not able to get the 
> official uboot running, which features the Lichee Pi 4A - another board with the 
> same SoC. I don't know, whether I can get it running though. So far I was not 
> successfull.
> 
> 3) Currently it seems that only one of the SoC's 4 cores gets activated. I see 
> the following in my bootlog:
> 
> [    0.111209] smp: Bringing up secondary CPUs ...
> [    1.132870] CPU1: failed to come online
> [    2.161923] CPU2: failed to come online
> [    3.190788] CPU3: failed to come online
> [    3.194847] smp: Brought up 1 node, 1 CPU
> 
> I didn't look into it yet. If anyone has a suggestion, what could be going 
> wrong, please tell me.

When the TH1520-based Ahead and LPi4a boards launched, there was a
device tree node that was parsed by OpenSBI to start up the other harts:

https://openbeagle.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/arch/riscv/boot/dts/thead/light.dtsi#L380

                reset: reset-sample {
                        compatible = "thead,reset-sample";
                        plic-delegate = <0xff 0xd81ffffc>;
                        entry-reg = <0xff 0xff019050>;
                        entry-cnt = <4>;
                        control-reg = <0xff 0xff015004>;
                        control-val = <0x1c>;
                        csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
                };

The node was handled by OpenSBI in lib/utils/reset/fdt_reset_thead.c.
The problem was that the design of this device tree node had flaws from
the viewpoint of the device tree maintainers. Therefore, the upstream
th1520.dtsi doesn't have the reset-sample node. One would need to keep a
downstream version of th1520.dtsi that adds that reset-sample node.

However, this functionality was removed last year from OpenSBI, I think
the change made it in the OpensBI v1.4 release:

https://github.com/riscv-software-src/opensbi/commit/d1e0f7f25b2f1527425942dfc327f1d4a61bbff4

> In the past, we used fdt_reset_thead to help customers with prototype
> verification. However, with the emergence of the Big-little SoC system,
> it can no longer meet the demand. Therefore, we use zero_stage_boot
> instead of fdt_reset_thead. It cleans up the opensbi code and ends the
> disputation of reset_sample's dts.

Thus for OpenSBI v1.4+, one must have an updated U-Boot SPL build that
performs this reset functionality that OpenSBI used to. SPL is the early
portion of U-Boot that does early setup like DDR training. There is a
build of U-Boot SPL for the LPi4a from RevyOS that does this. However,
I'm not sure about the status for the Ahead so I'll have to followup on
that.

Cheers,
Drew
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
