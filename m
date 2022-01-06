Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85B9C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553DD60B95;
	Thu,  6 Jan 2022 22:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KACvaFsh4CuM; Thu,  6 Jan 2022 22:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF6560A9C;
	Thu,  6 Jan 2022 22:30:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8457B1BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7091640A4D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILw3GLlRrphN for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:30:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84B2140131
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:30:21 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id x33so5722385uad.12
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qOgAYOjecsRumbPYvPfYOw3FzGdupTTFLwDqvMZavUM=;
 b=QYV5+HfumOOtJ5XIoT0wLKP7PcInscLEkJgDxtjkqS5F4f+oe3XId7kECj6KO8Ypx2
 5r85HaXFRG77qtOeRekklbV5ctu4tA/G0+L8AY6ujO4Pi3R9aRz58DSaz6enzQuPMoEk
 SdShvMedTGOQHyR/0gH6KBzBrinWTXxnC71eDq0eCt6C8eGTImp12sR2JmQJeUcdes4u
 9BIumOWpho+zoSVPCywxq/yw9wqCUNaJWzBG0fmohq1jH3kps7Zvk796RnR3dFKTg2Y/
 ZjyjaSWVFzFJBZkO2l5CRDw2zBFJNbBLm79ydMVR6HjzCtXOYd6twb7eHSE/qgFkA05u
 AV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOgAYOjecsRumbPYvPfYOw3FzGdupTTFLwDqvMZavUM=;
 b=EqiO/o8O24UnCVFdSaOBtW9rdEabk/s5zrlpiJOt342NZ9cMZhl8cGQHuUOtAGAW7g
 hfd9iU3PKLv3vjGZ+lKdvGBEWf007/nZm4kYHMRLI7FCYTclkA/VyO3cP+Cyqh9KLArY
 XrYWtL1vYPZO3lazwm/MO8pN2HZkj9WOMUFsl/QQ5J7pZGDf3TfiCxbNJFRANtoF/7Au
 BRJ4pC4qTPEdO5K1lsPm1TXpGavK0BQBg0TuasgAiPpF7kdRGeKngUhA7iUNnUCpJ7mN
 x78vXrCDN+BILkgmrCcxya6H55+C2qq2/BbwRhAjqTxOUaAMlcOiqiEQKL+r+NZXiDfO
 kpBg==
X-Gm-Message-State: AOAM533MjS+MBxqC16NIDaItk/QW35xOtqR0qhRxF6ckuxOC/vBfCxkt
 gXAzJrAt5S2m6vZJKpYXEzc52jIb5ZDlIDBr
X-Google-Smtp-Source: ABdhPJwschZcHN/0Haymp1Dc/3c+jJqrsrJIlpSfN8TPzJEKQnFoEl04wPOd5DEMeOIS+wmGB8xbXQ==
X-Received: by 2002:ab0:745a:: with SMTP id p26mr20222093uaq.53.1641508219839; 
 Thu, 06 Jan 2022 14:30:19 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id h3sm2096142vkf.2.2022.01.06.14.30.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 14:30:19 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id c36so7016445uae.13
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:30:19 -0800 (PST)
X-Received: by 2002:a67:cb91:: with SMTP id h17mr20211196vsl.35.1641508218906; 
 Thu, 06 Jan 2022 14:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-10-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220106210000.397694-10-thomas.petazzoni@bootlin.com>
Date: Thu, 6 Jan 2022 14:30:08 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pDv2xL6Ghrqmy-j=Kw+EQRTmXr+sBmR8FbN9Eo8N3rBA@mail.gmail.com>
Message-ID: <CA+h8R2pDv2xL6Ghrqmy-j=Kw+EQRTmXr+sBmR8FbN9Eo8N3rBA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 09/11] package/tinifier: new package
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
Cc: Christian Stewart <christian@paral.in>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Thu, Jan 6, 2022 at 1:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This is a Go package that needs vendor modules to be downloaded at
> build time.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> +TINIFIER_VERSION = 3.4.0
> +TINIFIER_SITE = $(call github,tarampampam,tinifier,v$(TINIFIER_VERSION))

Build tested.

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
