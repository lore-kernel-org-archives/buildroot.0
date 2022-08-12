Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB52C25B06
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 00:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F69F40578;
	Fri, 12 Aug 2022 00:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F69F40578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shhT0gtcIbPF; Fri, 12 Aug 2022 00:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7138E402E2;
	Fri, 12 Aug 2022 00:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7138E402E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0941C116E
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 00:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08BBC830C0
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 00:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BBC830C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2DoQ_b_je7B for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 00:02:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61AB830A7
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C61AB830A7
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 00:02:21 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id c19so7527880uat.6
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=oroYfeO88tEKZAwkVzdkWqNEYB5EsTMw2AQlzQEf0v4=;
 b=v2duKRA9V/1kwLShui2785M5TrFo8ksYUSXwBLRQ4yyRid3jUn1kP5UDlRgg2LwjgT
 +R7Jz61Fb2QUVVw42JLY+yf+HAOJWDI3naTwM/skf/BdDO9ALTTbvnZxzJZb76nS6lKN
 bAc5e1O1vhqZrsE/ReNEIAqKBNZcg3TtA3QVGheRd5tuOcmlvf9hnkqWBSfDXaFSCP/b
 T3j4Cm8I8/ycD+PgQWAIj7w2eQ7GqEgajui7qDEgUB8oI2UwuZ9H8CFUBThX055ERDOv
 tQXOYbUAVrRB7mPX+flgWvXmRiwxIChneQOA1TChOGi1AcFYwf5u6XvESkV4wxnp7G53
 aXZg==
X-Gm-Message-State: ACgBeo0RQGyZwvvSAMaW3f8ARcddL+YOm8FgiBRhtEIIFEKC326a8sil
 TxMPWjOhX/WIAmPyqXuic7mOGuzXliuccnof/gA=
X-Google-Smtp-Source: AA6agR6MrAsNQK1oQc3CLHa7oe1Hn+WQvclOS46lq2V4UxM+N37SWnRZf+PmiAP2+XhzFkavrtQa1dPEJuZgGH5wzeM=
X-Received: by 2002:ab0:36e3:0:b0:38c:4baa:f775 with SMTP id
 x3-20020ab036e3000000b0038c4baaf775mr823536uau.114.1660262540172; Thu, 11 Aug
 2022 17:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
 <20220811094049.798010-3-niklas.cassel@wdc.com>
 <20220811223009.6243f04a@windsurf>
In-Reply-To: <20220811223009.6243f04a@windsurf>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 11 Aug 2022 17:02:29 -0700
Message-ID: <CAMo8BfKnu_9=i8KtnyXHZRhypqdMSoRH89qZsA3NxeJVQSjkBA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=oroYfeO88tEKZAwkVzdkWqNEYB5EsTMw2AQlzQEf0v4=;
 b=WW+6dwCnjn5ol2Ffpn6I5GDsA57kBv/7UC0wXvmXKlregfDkJkFz/O2SrvmnesCRlp
 AK58XXnT4G/ZD53RZvwe9qcbpMJ/Pdk7SDpe26T7NLtPPCu/VxXInmn8Erfjvm+BEbzT
 rTkt9+/Kiz6oZXOlkdyx4st77nRlzzg+sPzRy8+Ee1OS/C44tgeZNBnyMQ4KCXkphzMC
 aaSuqBjBvjD+u+UlH0gKvtzo7eQZcI42Onfh95sFKRP1IK+m1w8Cd7qVrhusU2YO9JDg
 7dAlD7Yy7QOqjjOz3yTvI9Y7+e4ecVrSx0jkYHbQRei702tnkf612afceigy0WuqJY4t
 fqKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WW+6dwCn
Subject: Re: [Buildroot] [PATCH v2 2/2] package/elf2flt: fix fatal error
 regression on m68k, xtensa, riscv64
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, damien.lemoal@opensource.wdc.com,
 alistair@alistair23.me, geert@linux-m68k.org,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, romain.naour@smile.fr,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu, Aug 11, 2022 at 1:30 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Thu, 11 Aug 2022 11:40:49 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
>
> > This series fixes a fatal error at link time on m68k, xtensa,
> > and riscv64, caused by a bad upstream elf2flt commit.
> >
> > Without this patch, m68k, xtensa, and riscv64 would result in
> > a fatal error:
> > ERROR: text=0x3bab8 overlaps data=0x33f60 ?
> >
> > With this patch, qemu_m68k_mcf5208_defconfig,
> > qemu_riscv64_nommu_virt_defconfig, and
> > qemu_xtensa_lx60_nommu_defconfig builds properly.
> >
> > riscv64 and m68k boots to login prompt.
> > xtensa crashes when loading init, the same behavior as when
> > reverting the bad upstream elf2flt commit completely.
>
> As you can see here, apparently the xtensa noMMU defconfig in Buildroot
> no longer boots. We had a regression in elf2flt, but even with this
> regression fixed the problem persists, and we're apparently back to
> what it was before the elf2flt regression was introduced.
>
> Do you think you could have a look?

Sure, I will. Thank you for the heads up.

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
