Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22EAC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 00:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56846611F2;
	Mon, 25 Jul 2022 00:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56846611F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdydujNB58Rs; Mon, 25 Jul 2022 00:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DAD6611EE;
	Mon, 25 Jul 2022 00:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DAD6611EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26BBC1BF96B
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 00:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00A7F83E11
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 00:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A7F83E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BYHK000y9KQ for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 00:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1542D83DF8
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1542D83DF8
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 00:35:23 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t3so12081878edd.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 17:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KjiKaaOI+yiDndlMXK1K5h9SOblGNBJVhLMKX6ysUfg=;
 b=UPpsf2HtCuqZ0iZZ7akSUhdlj3h94Udh7zAqtwhrT7mClqm1cmISNnIAfd+lDYschg
 PYt1FMW+TTpnP3lzh9G49/GKNh4jQeNysBOnKURCYRaV9Dz/RHe+Nz3M44hHDxnvpbG2
 IFeJQzRLpSt2ORh26Qmp+XeN+2np2E7ixTiUrHZtqeIfe3Q/feKOu+Xd/GD4BUX36v1M
 iEqwiShBUBv14D1SW20YAJL6E61F/3Xws3cYBeejd8kw/wPmQOPQeoxD3Dqe2n9prnCd
 LBBWWvdsYBtJCQetL3HiaoAi2Yx1CuN6xveZug+7iOFSqobX2Y1KPpJKNxfijUoYvhkp
 tKUg==
X-Gm-Message-State: AJIora+jDu1kxR9r9wnDXdX00OzG9z0ImkC/VpJmTMaopHFTfgZh/9gY
 QL7Q/7v38u1BRlmpVpPrU15CX7/Q/oj1PFbh
X-Google-Smtp-Source: AGRyM1ukqjBL78xNFlDikweQmTBVZ3RQHQ8Jngd5u/15sdsPkS1y7g6UuxX2dhTJWb+A1DoJqrQl0A==
X-Received: by 2002:a05:6402:2709:b0:43c:62d:7a63 with SMTP id
 y9-20020a056402270900b0043c062d7a63mr1961631edd.130.1658709322042; 
 Sun, 24 Jul 2022 17:35:22 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b00722e50dab2csm4706727ejh.109.2022.07.24.17.35.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 17:35:21 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id oy13so17808694ejb.1
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 17:35:20 -0700 (PDT)
X-Received: by 2002:a17:906:cc15:b0:72b:5e0d:9a2a with SMTP id
 ml21-20020a170906cc1500b0072b5e0d9a2amr7680404ejb.614.1658709320619; Sun, 24
 Jul 2022 17:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220724233752.674437-1-christian@paral.in>
In-Reply-To: <20220724233752.674437-1-christian@paral.in>
Date: Sun, 24 Jul 2022 17:35:09 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qpoJJL5x4Ut_t4tPWqxhqgTNKU_N7k5x9ZJ=Lo7MMyyA@mail.gmail.com>
Message-ID: <CA+h8R2qpoJJL5x4Ut_t4tPWqxhqgTNKU_N7k5x9ZJ=Lo7MMyyA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KjiKaaOI+yiDndlMXK1K5h9SOblGNBJVhLMKX6ysUfg=;
 b=gHw+ftoTAvnzgway80nBZwXQ7s6b3/8UVtYQR5QKLD6dcOua8ARPStYI61fwEbv7mp
 +UrXb7SyuJlTAFw0TA6sBXJirsx5MUX7rJuMkewCq//Xnk/BWT5fKyj5VTY25XmvkJE/
 Py7ljz1GmmUrJFMkfaB5SS9hKt/2Tg5WIyZqmyQBNS4RqsynXIKF/qHU5kaT3j1ILsko
 r81DEdZyJOlHkagZsHri7uEQulPJr7ve/14et+3hGuprlrIwOOQkOMMQOV8Xj2BK7oRF
 ZQwPPn7/oog2obg3K6MnFYBCR0TCH4wPXNmQuJ5Gc7zlF5LeIPuSIp3JReZaQVI3Y+JX
 /+KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=gHw+ftoT
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, all,

This change still needs 1 more adjustment to work correctly in all cases;

On Sun, Jul 24, 2022 at 4:37 PM Christian Stewart <christian@paral.in> wrote:
> @@ -125,7 +124,6 @@ HOST_GO_HOST_ENV = \
>  HOST_GO_MAKE_ENV = \
>         GO111MODULE=off \
>         GOCACHE=$(HOST_GO_HOST_CACHE) \
> -       GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
>         GOROOT_FINAL=$(HOST_GO_ROOT) \
>         GOROOT="$(@D)" \
>         GOBIN="$(@D)/bin" \
> @@ -135,6 +133,13 @@ HOST_GO_MAKE_ENV = \
>         CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
>         $(HOST_GO_CROSS_ENV)

HOST_GO_MAKE_ENV is used to compile host-go.

It sets CC="$(HOSTCC_NOCCACHE)" which causes an error:

go tool dist: cannot invoke C compiler
"buildroot/host/bin/aarch64-buildroot-linux-gnu-gcc": fork/exec
host/bin/aarch64-buildroot-linux-gnu-gcc: no such file or directory

Go needs a system C compiler for use with cgo.
To set a C compiler, set CC=the-compiler.
To disable cgo, set CGO_ENABLED=0.

CC should be unset, or set to the host C compiler, or gcc should be
built as a dependency of host-go.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
