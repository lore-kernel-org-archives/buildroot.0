Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39FFC38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 07:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 466934060E;
	Wed,  1 Feb 2023 07:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 466934060E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bv3HocdV8hru; Wed,  1 Feb 2023 07:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50B10405DB;
	Wed,  1 Feb 2023 07:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50B10405DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90BAB1BF215
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 07:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76EFC81E66
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 07:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76EFC81E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9z_Cicbbd-eE for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 07:37:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FEB881E65
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FEB881E65
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 07:37:50 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id j17so27994737lfr.3
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 23:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7pTc2fNiI3uSj3+tBCx9T7JjXddnNZCoyaQ5BZIsMc=;
 b=vYFl0n4XI4ME5Sc3Og2DtdKK3gm1pCMAKj7wn2wHQyF39vInHLf23qGxkFJC/q9R8W
 e7P+V4QzyKrrJsp4BYHUmIzVMKd5kTgKLKSF5ox0aAofPsYpUBMTH6wtQ+yajuLFh3bW
 Dkl2sv/FOv9QSEsMIbfA6gfHPEv7gWdy6zRB365x8PGEuiCnbsBRMMeIIjKVmOco1yJZ
 uUi3Moi6V7vVi78yzVxHKKN7om9Gd9W9U+ebILSAxozQRtno+pfDmzhzRM5k+zo3eIRk
 tUIEU4U0kYzmvWQB7gGNUN8v7YHrPRIA40BMSkv4CZyfsvyEeeSEJXT7+mZCAfZEdsuj
 yMGA==
X-Gm-Message-State: AO0yUKUqMEqCeVQAajjAu2RKGBC8FV2E/83SQ14zsj4Ww2ZsPzmhYR4K
 xfMiw/ZBJSmUdY9nXqoIh0NRzTgGICsT4HAG
X-Google-Smtp-Source: AK7set9NqTxEZV+IBM8nuge/fv7BaZnn/T/+S5iwAz7cB35SuAArRvL15qzl+O9OnY8aQIgeBKlonw==
X-Received: by 2002:ac2:4903:0:b0:4d5:7fad:a042 with SMTP id
 n3-20020ac24903000000b004d57fada042mr208188lfi.41.1675237067654; 
 Tue, 31 Jan 2023 23:37:47 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 v29-20020ac25b1d000000b004946b549a19sm640390lfn.45.2023.01.31.23.37.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:37:47 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id cf42so27975154lfb.1
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 23:37:46 -0800 (PST)
X-Received: by 2002:ac2:5bc9:0:b0:4a2:3efe:a4fb with SMTP id
 u9-20020ac25bc9000000b004a23efea4fbmr218984lfn.216.1675237066440; Tue, 31 Jan
 2023 23:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20230130121930.3472747-1-thomas@devoogdt.com>
 <20230130121930.3472747-3-thomas@devoogdt.com>
 <87357p4zny.fsf@dell.be.48ers.dk>
In-Reply-To: <87357p4zny.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 1 Feb 2023 08:37:35 +0100
X-Gmail-Original-Message-ID: <CACXRmJi+kNFatbTmf8HJ-+deFRtHZVMb3FB5anhYZ4pGN2ACGg@mail.gmail.com>
Message-ID: <CACXRmJi+kNFatbTmf8HJ-+deFRtHZVMb3FB5anhYZ4pGN2ACGg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v3 3/3] package/fluent-bit: needs arch
 support and C++ for wasm
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

There was indeed a reason why I first did it otherwise,
I was a little bit confused at first, but the solution with a
blind option indeed seems to be the only right solution.
Thx for fixing this up!

kr,

Thomas Devoogdt

Op wo 1 feb. 2023 om 08:23 schreef Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
>  > See:
>  > https://github.com/fluent/fluent-bit/tree/master/lib/wasm-micro-runtime-WAMR-1.1.1#supported-architectures-and-platforms
>
>  > MIPS & RISCV32 are mentioned in the supported list,
>  > but that seems to be wrong, so excluded those.
>
>  > Fixes:
>  > - http://autobuild.buildroot.org/results/dfb/dfb8f71d7e016cdfd3beb4b8196081898bd49ae2/build-end.log
>  > - http://autobuild.buildroot.org/results/ecf/ecfe7b67af68cd7f397a50360900cd9a7afc830e/build-end.log
>
>  > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
>  > ---
>  >  package/fluent-bit/Config.in     | 15 +++++++++++++++
>  >  package/fluent-bit/fluent-bit.mk |  6 ++++++
>  >  2 files changed, 21 insertions(+)
>
>  > diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
>  > index 11ceb55d4f..50437cab60 100644
>  > --- a/package/fluent-bit/Config.in
>  > +++ b/package/fluent-bit/Config.in
>  > @@ -10,3 +10,18 @@ config BR2_PACKAGE_FLUENT_BIT
>
>  >  comment "fluent-bit needs a glibc toolchain"
>  >      depends on !BR2_TOOLCHAIN_USES_GLIBC
>  > +
>  > +if BR2_PACKAGE_FLUENT_BIT
>  > +
>  > +config BR2_PACKAGE_FLUENT_BIT_WASM
>  > +    bool "Build with WASM runtime support"
>  > +    depends on BR2_INSTALL_LIBSTDCPP
>  > +    # see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
>  > +    default y if BR2_arc
>  > +    default y if BR2_arm || BR2_armeb
>  > +    default y if BR2_aarch64 || BR2_aarch64_be
>  > +    default y if BR2_i386 || BR2_x86_64
>  > +    default y if BR2_RISCV_64
>  > +    default y if BR2_xtensa
>
> I know that Yann suggested this, but it doesn't work. We cannot mix the
> arch dependencies like this with an option with a prompt, because the
> user can still manually enable the option on an unsupported
> architecture.
>
> You were also missing some help text and I think this "filters written
> in WASM" feature is quite unlikely to be used, so I changed it to
> default off with:
>
> config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
>         bool
>         # see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
>         default y if BR2_arc
>         default y if BR2_arm || BR2_armeb
>         default y if BR2_aarch64 || BR2_aarch64_be
>         default y if BR2_i386 || BR2_x86_64
>         default y if BR2_RISCV_64
>         default y if BR2_xtensa
>
> config BR2_PACKAGE_FLUENT_BIT_WASM
>         bool "wasm runtime support"
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
>         help
>           Support for WASM-based plugins.
>
> And committed, thanks.
>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
