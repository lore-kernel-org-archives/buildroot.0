Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B6CC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 12:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA7540284;
	Tue,  9 Aug 2022 12:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA7540284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 509w4djOUgxA; Tue,  9 Aug 2022 12:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E482A401DF;
	Tue,  9 Aug 2022 12:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E482A401DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFA3F1BF38A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9348C812FF
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9348C812FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dm9S5mx1PlYp for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 12:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DB1812F7
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60DB1812F7
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 12:52:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o2so9536476lfb.1
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 05:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=OlxoHG5/tsr3bdTBQhbO62wrVlIQgobHU5nGEW8KPBA=;
 b=v7LeCcHERim8mdXws/EGMiPPccwYEtH7ip4i5nM7eOd1qlsFPm/ayx6vvIlsZqWE6C
 GDThZSbcprLNJqemqm9yqpRt4jlBxRr8lS0Y2hEXjERrQFhekjqAcN29YYYUWxyMHn2e
 TY7ia41cQ8HbK9MGM3PDfggDka08LUM85sNtsvWMHecYrt9OzOToDrH63c/Q8ZJAcUw5
 eVWKmrFc4qKd7h1dnWNqd6D0/NpiL9AE8Fd1q+99rbYSwGqV+7xQMmxtl217xNTg+iFE
 JlTGjV8kXkSiBiBN72rDsW2d6Jb+g5BmtrC1tYa/WZK0363NgOOcETc9fpClABL8G5I/
 upOw==
X-Gm-Message-State: ACgBeo1ZMnzTkeFcHZTlAyueU87gBFfFzu/7UvbAQGdxFoBZMgObAZIU
 4nVe9bqX9Qebqd+SZQnzKG2Q2FkfL99qrEtypcacqXAN
X-Google-Smtp-Source: AA6agR7oRY6KPOJzZK/dWRa950omPfv6rq8KvEXqCT3/THQQlhfEpOTAWwDOslhgjNkeIeQ6hlPNaaWBa1jb0WxcXzQ=
X-Received: by 2002:a05:6512:374a:b0:48a:8c6c:20d with SMTP id
 a10-20020a056512374a00b0048a8c6c020dmr7998103lfs.234.1660049572522; Tue, 09
 Aug 2022 05:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
 <20220809075704.86472-4-ardeleanalex@gmail.com>
 <20220809134928.56a91c28@windsurf>
In-Reply-To: <20220809134928.56a91c28@windsurf>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 9 Aug 2022 15:52:41 +0300
Message-ID: <CA+U=Dsqk+vC-v_1gj7DjAkzFcbXbP5WoP0C8+5m4MZ9wPpVM_w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=OlxoHG5/tsr3bdTBQhbO62wrVlIQgobHU5nGEW8KPBA=;
 b=ZprJn8w10HRYzUynuuGu2CEsYjNU/n5fTn0aaaJ/jM/3J+5k5YBJ+geRicsZaULNJ1
 qjk7mb88s4FEOq0IUJgUlFA8KJKSBskG3spz8sPc0fvkuI89ctqe0FzzUF1vBIB5MsOe
 ASTuHwUNjhNEYtvH8otSxy2tRygGf4wKRrFVvcT7HrQIFr3gy0QqibPoRB56f11stDOQ
 uJTpG7CPED20NwCX6/RmER86XmEzdd1VSlLtrWQMBbWxZ9aOymSwx6/vNXztqNlVXmbi
 sBsQt8czz7VyqfiK6az5dzGe1wkLEmpmos1cGVv7f5+nW67k4sN4GLur+Pg9XPSTtGfo
 9ZEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZprJn8w1
Subject: Re: [Buildroot] [PATCH 03/13] nodejs: remove v8-qemu-wrapper stuff
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 9, 2022 at 2:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue,  9 Aug 2022 10:56:54 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > It's pretty broken, so we won't use it.
> >
> > Even with this wrapper, I get:
> > ```
> > debug-wasm-objects.tq src/wasm/wasm-objects.tq
> > /bin/sh: 1: ../../out/Release/torque: Exec format error
> > [324/2786] CXX obj/src/libnode.node_wasi.o
> > ninja: build stopped: subcommand failed.
> > make[2]: *** [Makefile:127: node] Error 1
>
> This is odd. Did you debug this a bit?

not really, no
i can try again
but the error is so weird, that it discouraged me to check;

>
> On my side, trying to build:
>
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_NODEJS=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> before applying your patch series, leads to a different error:
>
> ninja: error: obj.host/tools/v8_gypfiles/run_torque.ninja:1271: multiple rules generate gen/torque-generated/bit-fields.h [-w dupbuild=err]

i think this is fixed in patch [4/13]:

https://patchwork.ozlabs.org/project/buildroot/patch/20220809075704.86472-5-ardeleanalex@gmail.com/

apologies if the patches are not quite in the proper order yet;
i can try to make the order better, so as to keep the principle that
each patch doesn't break stuff as much as possible;


>
> The issue was reported at https://github.com/nodejs/node/issues/37441 a
> while ago, it is not fixed apparently.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
