Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E0E748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 606AA81FB5;
	Sun,  1 Oct 2023 16:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 606AA81FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuHvzzcEDeaM; Sun,  1 Oct 2023 16:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BFA81E1E;
	Sun,  1 Oct 2023 16:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82BFA81E1E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF2031BF909
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3FEC418D5
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3FEC418D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dA6dIQzpgvmu for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:36:34 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B8A1418A1
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8A1418A1
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2c12fc235fbso29091601fa.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696178192; x=1696782992;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RM1SiMes4CZrwFa/FstTTbJd76vBLAN/fl6xbgkJIrA=;
 b=SXqKFUCuNLRoyqkLzcxx4vwkzgGuGz7/ifXDin+TsVAkfuECHUI49voLIhFEZQOMuZ
 Usqi2XjOYJXz8+t4Z8yBdIQFPY01Y2UM/12VtUliKrol6xixo9lhqJ3NQUNahzZ96tPK
 ws9x8bO3lxkj8+c/8ZHU9GA4p+QQdIK7lGvW52yfziBJdNAXOq9wyjPDZ4yHOo6Hzt2d
 Bo9tOT8do0C1D/+HML/UtRUBn7iTZZ5EEfr5rC/C3PpCfIPZO89XxbXpKyOXUCTEmxwn
 5dzIeU1s9VoOnjUbA+9ViB3lqQw31pdEWjFimN4rmpxzn2lYvjk/2b6qYwxWk5Wgat88
 Osyg==
X-Gm-Message-State: AOJu0YwGiFaagV3QzuEllANWO3oEecdZXU4vrfukDURR6kipxiTq8A8m
 cnCLIj+1Fg5KBKPkjlo9XNXjUgjnEq+0FCMb
X-Google-Smtp-Source: AGHT+IHkokRTcp7pSwWW0XUROPq4HcWtdMHhajBLaMcvCOcDZIe3PTLPWUzON9v7qtYwZLmBd67/Gw==
X-Received: by 2002:a2e:8ecb:0:b0:2c1:795d:2e4c with SMTP id
 e11-20020a2e8ecb000000b002c1795d2e4cmr7322517ljl.2.1696178191715; 
 Sun, 01 Oct 2023 09:36:31 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 a24-20020a05651c011800b002b9de06f119sm4728806ljb.67.2023.10.01.09.36.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 09:36:31 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-50306b2920dso2875411e87.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:36:31 -0700 (PDT)
X-Received: by 2002:ac2:464f:0:b0:500:96dd:f95a with SMTP id
 s15-20020ac2464f000000b0050096ddf95amr7000418lfo.24.1696178191204; Sun, 01
 Oct 2023 09:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
 <20230929075844.1145939-2-thomas.devoogdt@barco.com> <87v8bq5yc4.fsf@48ers.dk>
In-Reply-To: <87v8bq5yc4.fsf@48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 1 Oct 2023 18:36:20 +0200
X-Gmail-Original-Message-ID: <CACXRmJiqq=PqKqL-hwsCXDYKUGbjes80HygLQ9veAV-xpROkJA@mail.gmail.com>
Message-ID: <CACXRmJiqq=PqKqL-hwsCXDYKUGbjes80HygLQ9veAV-xpROkJA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v3 2/4] package/webkitgtk: make gbm support
 optional
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
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, all,

The USE_GBM flag is only useful if USE_OPENGL_OR_ES is set, otherwise,
the flag is ignored.
But if USE_OPENGL_OR_ES has been set, then the default is that USE_GBM
is also set, and that is what this commit avoids.

About USE_OPENGL_OR_ES, yes, we only should enable it if we support
it. It's a bit unclear to me what the exact dependencies are to enable
it.
According to this
https://github.com/WebKit/WebKit/blob/e92f5f33fd267fc387efd7099bb6970e24e71afd/Source/cmake/OptionsGTK.cmake#L337,
a fully functional EGL implementation is required. The flag
USE_OPENGL_OR_ES on the other hand implies that libgl or libgles is
sufficient,
but this commit
https://github.com/WebKit/WebKit/commit/cfe917fec45bf72c371087ece034feee8454f1b4,
indicates that libgles is exclusively required.
I also saw that mesa's libgles implementation depends on libegl
(https://docs.mesa3d.org/opengles.html), so by this reason,
I've added in a follow-up commit/bump, the USE_OPENGL_OR_ES under the
libgles condition.

Kr,

Thomas

Op zo 1 okt 2023 om 14:20 schreef Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > From: Thomas Devoogdt <thomas@devoogdt.com>
>  > This was added upstream in commit:
>
>  > https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498
>
> This talks about gbm AND libdrm, but you don't seem to handle libdrm
> here?
>
>  > The 'USE_OPENGL_OR_ES' flag is default ON, which will enable 'USE_GBM',
>
> Should we then not disable USE_OPENGL_OR_ES and only enable it if we
> have opengl?
>
> --
> Bye, Peter Korsgaard
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
