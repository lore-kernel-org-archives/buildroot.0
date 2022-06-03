Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AF2C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 04:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E897E83FFA;
	Fri,  3 Jun 2022 04:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T3VA4Z6aFaV; Fri,  3 Jun 2022 04:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E8083FC6;
	Fri,  3 Jun 2022 04:49:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD5231BF2CF
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 04:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA7F041927
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 04:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bsxj1LAOv9ZO for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 04:49:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53FA241922
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 04:49:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w27so8670215edl.7
 for <buildroot@buildroot.org>; Thu, 02 Jun 2022 21:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/1mhnkzX4mz5kmAoeE1OZl1Xx5GCkE/NYTWc/+yuX0A=;
 b=OPOOUKJCfpNyKdbvizci+k7A+cSH4t3KIoobpWl9gQ6SD0UjqniNJ+SPJqfq1zxjrL
 xI2St1RbJfCC+nvCs1mF7lglVIU9MClLnDkIdbUHPcSiaLmzUHBP0kpz15kutawT1O+z
 TanIeCztnDjJjEYxHT/eYKr6DaD+r64PJFGBYgmfXUehI2CTBqmWmQN2Io9+5ZWlW6MZ
 zzFXaeX0Eqjbegdz1GQ9GQsq5vk9CePsHK4Kw5MJAd8L39l/uYjXdeiPemtq2vUXid6E
 7WeVGuw56Cg8R6X/x/+rZ2KT8E7iu5rMybmn+APSRhrrL2bPePw2o9ox9yQljVe4Yaga
 /+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1mhnkzX4mz5kmAoeE1OZl1Xx5GCkE/NYTWc/+yuX0A=;
 b=XbYDubrRbnt28Cslqca3clz8TrAp1iAa/FrUxYCkdMspVxYvEFpZFmJHePkwHS9q2X
 jHF1fqwR0+H3MHDNxgyfnHn+I2DwGEpnvO9mXPhvf9ll8kaGG2U1r+8lsmegklvOfXJ3
 bonsNWbk4lf68BDYT/ZLWyS51TCUaqA3X8RzTCEQ7RzJh6g4hX/FpmQ1t5Jkc3r00NcU
 JW/K6MgNA7dKWpyFumG7DJ8OVxxahbxZ7N4GeISZvQRW/D6P5k/m4XtVczyK1yQPL+nw
 t2Ls/nzT2dpz9TGsCRCWR4lAt5hxFyBVcaXwl3jwMnW4VkT4odyT6O0fuamedolFbfLG
 2WhQ==
X-Gm-Message-State: AOAM531rmWMOH1TSSkEKaFPQp0Q6g1a2Epow6IseqCWR07mZ8NxIJ+pP
 tlkR5hotw2H1htQYjcuNkr8R/Req3jq/c/oa
X-Google-Smtp-Source: ABdhPJz53Nq0hxhbcvjUytePvtdDuF/RDKhL08g4Uk4AW2fhQFOYRnTcEHUoGxlUzU/6N1RjkFlxHg==
X-Received: by 2002:a05:6402:50d4:b0:42e:686:df55 with SMTP id
 h20-20020a05640250d400b0042e0686df55mr8586173edb.403.1654231748328; 
 Thu, 02 Jun 2022 21:49:08 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 z8-20020aa7c648000000b0042e309906desm445219edr.58.2022.06.02.21.49.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 21:49:07 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id h19so8733471edj.0
 for <buildroot@buildroot.org>; Thu, 02 Jun 2022 21:49:07 -0700 (PDT)
X-Received: by 2002:a05:6402:90d:b0:428:bda9:3e6b with SMTP id
 g13-20020a056402090d00b00428bda93e6bmr8798887edz.132.1654231747409; Thu, 02
 Jun 2022 21:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <62999194.1c69fb81.b5e75.5008SMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <62999194.1c69fb81.b5e75.5008SMTPIN_ADDED_MISSING@mx.google.com>
Date: Thu, 2 Jun 2022 21:48:56 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rTCXB1bu4_0Pwxx7yzkYrY9P8DTbkSTuKM8bEa50dJVA@mail.gmail.com>
Message-ID: <CA+h8R2rTCXB1bu4_0Pwxx7yzkYrY9P8DTbkSTuKM8bEa50dJVA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-06-02
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

On Thu, Jun 2, 2022 at 9:44 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>   aarch64    |         host-go-1.18.2         | http://autobuild.buildroot.net/results/24c9186f5583e2849fa1753f3bc3cfb1441c5a4e

Building with musl on aarch64, pthread not defined errors,

is BR2_TOOLCHAIN_HAS_THREADS set with musl, and if so, is pthread
available there?

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
