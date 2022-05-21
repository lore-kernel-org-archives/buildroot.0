Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6C4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87DD4196C;
	Sat, 21 May 2022 12:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifGhzXD0Cucm; Sat, 21 May 2022 12:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D59418F2;
	Sat, 21 May 2022 12:40:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E371BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F866844AC
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLmSlcPEiVez for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34CBC844AB
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:40:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k126so5807526wme.2
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pRv77fB8gCLOqTXbNjwMZxJqGALNhqMV0tqC7dVzaNI=;
 b=mk0ZfOXeTwmmghCVpBcfeAW4scRJQOgK2t6vIulfjSHmZgzoaVXRpNQiyl2S/DxVH0
 tM12+oyDB+e5C3YemJWdiPKY1JnJiNdowji5gjvnl55H+g6qaVEzjk0P5bHuWDSqySte
 c/JFw6UnKIw55S4f9JGeMplH3bs6CgTrCqQ9YritXRuGJ8SXSTTzt6TCc55qV5Kkk46M
 +kJmzipxrFP8ldQNeuC1+Es8FKLLjU3LkN8kmcT7pKmoBWwy6QZQvXcwMECfs4mGtPmM
 20dNX2GDrbNrZuxDDvICWnCghgwACohw075Sivn+BbNWraXPJM9dLmktn5sObVXDe78O
 ybNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pRv77fB8gCLOqTXbNjwMZxJqGALNhqMV0tqC7dVzaNI=;
 b=GuzpeA7oUoNJCBq7AXhKKF/JUKteyc21qvbUmhv4Q5W8C+NOWT2WIgSJIOirla91LS
 2rJcPc0w+jQlGfC6W9eJPPOJ5bXd9l13zLvKCUa8kqBh6YpZPDk+b4RsNZs/5q5y4Rr7
 j856xQlKFPGx0VrNJoOw/eX+TJOo12V8rop8V8FvhBCT13NYY+Xoes3pKfVY2h3Fr/OU
 +5QpFicCJJiX96cc7lNU5uLJtW8IzmmNYPOCvhBFplXRU/in3I4zLBEM8QJAuXiXi1vE
 WUbi/RGMlsrwM23RoVnmaXd47ep5l+U8dBM8fjlV6udTA4VZF4yzDV5x787a8LfMonKD
 rWng==
X-Gm-Message-State: AOAM5338pooCVr9Gm1nEpGAM74Hj4HvQ6QNPEPLwJVs8kiNsy3qDU6tM
 J+ndzzzbFkiXSVWuj37iO86W3/gqqVvP3XjFbZOrv2b6pic=
X-Google-Smtp-Source: ABdhPJzU5hr5jDVErmd9WFdZw2PvxjgfDkjp2TioBAQnVc125iJsdDta5wL0Hm3H71QU3kZdgboDkl4dEfNymifZbaM=
X-Received: by 2002:a05:600c:1f1a:b0:397:3aa0:a77c with SMTP id
 bd26-20020a05600c1f1a00b003973aa0a77cmr6294679wmb.141.1653136836850; Sat, 21
 May 2022 05:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220521123838.2881-1-heiko.thiery@gmail.com>
In-Reply-To: <20220521123838.2881-1-heiko.thiery@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 21 May 2022 14:40:25 +0200
Message-ID: <CAEyMn7ZQ-r-U9w_+0tKxqOOO-a=7j+10VTLe_04EEqGDDiG=uA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 0/4] U-Boot bump to 2022.04
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Sa., 21. Mai 2022 um 14:38 Uhr schrieb Heiko Thiery <heiko.thiery@gmail.com>:
>
> Since U-Boot 2022.04 the host tool mkeficapsule requires gnutls. Thus the
> dependency to the host variant has to be added. Unfortunatly this adds
> additional indirect dependencies to host-libasn1, host-nettle and
> host-libunistring are added and will increase the buildtime.
>

This should fix https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067271

> Heiko Thiery (4):
>   package/nettle: add build support for host
>   package/libtasn1: add build support for host
>   package/gnutls: add build support for host
>   boot/uboot: bump to 2022.04
>
>  boot/uboot/Config.in         |  4 ++--
>  boot/uboot/uboot.mk          |  2 +-
>  package/gnutls/gnutls.mk     | 26 ++++++++++++++++++++++++++
>  package/libtasn1/libtasn1.mk |  1 +
>  package/nettle/nettle.mk     |  1 +
>  5 files changed, 31 insertions(+), 3 deletions(-)
>
> --
> 2.20.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
