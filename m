Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DE2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E38D60ACF;
	Thu,  8 Dec 2022 21:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E38D60ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkucruP7PCzp; Thu,  8 Dec 2022 21:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7982F60AB7;
	Thu,  8 Dec 2022 21:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7982F60AB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2FEB1BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B77660AB7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B77660AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grH10kNN6lgR for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:44:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F8BF60AA4
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F8BF60AA4
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:44:58 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id b2so7122144eja.7
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:44:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMIODJEjo9tB+ObpWoV789S5be0Xtk8kBrptjXO3q30=;
 b=5+GXy/d9ajB0qS4UAox818EN8ZYpI/OIzhI6APrTazyfaF881X7STjhgEguAdEnoQd
 kwfQK03YWgNVlXE/4RLTOtQMGxkvwqadJAJDk3oky1sNUt/eUpP54XIDDql085dRN1qp
 inIlGrKA4o5ZCjAYO7UQ54v+j5NAte3/4iiXMK5jrBRmQHB70g/G4OyFod36p+sBSSto
 AoyU9Q0HV6ZPRJ2cLiWsYoldpSqs7m+EWljBIRkBDdecSQUKnTfI3MekMzMHzf4cPbIo
 d5cQX3aKLQ0piTkJS2KiBt+XDLEIWxtdJLdSR6cKZ4UAvhjYaZfgEnSXRQ1k8bxQI//d
 945A==
X-Gm-Message-State: ANoB5pkWx2BUnFL62H7I8ZnFRqtq1GhpjxtcBjBFABnPqbsAOAuvvkV5
 Gf4AP9BSmx0FfU4XNSP8UZ7h5We5Pdbj3ezF
X-Google-Smtp-Source: AA0mqf6DJF3YxYyHMmLEw31SLyz6YNHbqGBreZwKk7Q1w+HlCQEbmHTKVfv3pPSJSuecL5slONtiew==
X-Received: by 2002:a17:906:e283:b0:7c0:cc69:571b with SMTP id
 gg3-20020a170906e28300b007c0cc69571bmr2744858ejb.8.1670535896560; 
 Thu, 08 Dec 2022 13:44:56 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 v16-20020a1709061dd000b007b47749838asm10049543ejh.45.2022.12.08.13.44.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 13:44:55 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id d20so732082edn.0
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:44:55 -0800 (PST)
X-Received: by 2002:a05:6402:649:b0:46b:a535:7122 with SMTP id
 u9-20020a056402064900b0046ba5357122mr31953015edx.325.1670535895408; Thu, 08
 Dec 2022 13:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20221208214238.4151960-1-christian@paral.in>
In-Reply-To: <20221208214238.4151960-1-christian@paral.in>
Date: Thu, 8 Dec 2022 13:44:44 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rVmPtFbJ7Xb7oBX3mh9aXBCqaS6nxB5UyRp7tDHxXzQQ@mail.gmail.com>
Message-ID: <CA+h8R2rVmPtFbJ7Xb7oBX3mh9aXBCqaS6nxB5UyRp7tDHxXzQQ@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aMIODJEjo9tB+ObpWoV789S5be0Xtk8kBrptjXO3q30=;
 b=Y2CoEPlNnHkQN6xmidnRuAr/uCIWILwryqm8mWG8p7uq93NcRS+9SYiqaXIu6nZEIK
 7xNU7kYO+Vry1VubdhGLUp0fVhNieOlhPMRiCnNR4uHgQl8IIXVU5dTMNjp4UmqjjrnI
 2JmjgA1uj71w+t05GjYgjwhxcWSDwUVSSU5sN7BTcQmaMOdjChSfGdG2vYE74ZjpExpu
 jS/fZIcGAvOYhtf/UfFD4Bs8QtFJBMhsqCRigxguSAbGmTypRkOV7rhRrKO38evwki6D
 MUuhBaVm6PEGVxVc36zq1AHiZUCi/z2x7sjdZZuwgHoLVIx7eecZF1kn1MeC5l302p1F
 IwqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Y2CoEPlN
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-proxy: drop package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Thu, Dec 8, 2022 at 1:42 PM Christian Stewart <christian@paral.in> wrote:
>
> The docker-proxy binary (libnetwork) has been merged into the docker-engine
> source (moby). Drop the docker-proxy package and add cmd/docker-proxy as a build
> target of docker-engine instead.
>
> https://github.com/moby/libnetwork/commit/563fe8e248f3afac75a270f693f38bdc3eea7bf3

Note: this requires docker v23.x for cmd/docker-proxy to be present.

So let's defer this patch until v23.x is merged into Buildroot.

https://github.com/moby/moby/releases/tag/v23.0.0-beta.1

Sorry for sending prematurely!

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
