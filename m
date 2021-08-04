Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C142C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:06:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1B160C41
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE1B160C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB53960776;
	Wed,  4 Aug 2021 18:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wfk8A9JTBDBx; Wed,  4 Aug 2021 18:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75F6608B5;
	Wed,  4 Aug 2021 18:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39C4A1BF381
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2636F401D2
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6ei67BYDLkW for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:06:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB62C40137
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:06:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so1981043wmg.4
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Vq7Z5BRwRofYPQx3L0H+Cv82/yDp1NzRNNU3TlpwxQo=;
 b=jL9URcH4KAji03xe2kkah/xJaUni3Jpyk8jfd5wuzlAAnkgToXnuT7I6zmkmU4zu72
 lQJhrJ3MlSLLwYURUvZBc0eInZt6mh50Svk6B3/PxQ8D+ViCet/SsjKCTB/FcDCE43hi
 XZiFqEEEitsmavajLF0LF3vSKfnLtC9WhKaqH2tmoQJm+jAFN3lm49VWfSgj/HyHx0tR
 SLd4GD1oritZNsx1GKQMab6FTBPUkxAK2+1TT0L5rhI12pu8zkWyohjwxZYKZIuC724q
 CUV9FcePa7KhVwLybI4NEZ+rgKtCR5ju/NfdkIxSe9LYaerLDeE8fomttEIKQiZAplrk
 jyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Vq7Z5BRwRofYPQx3L0H+Cv82/yDp1NzRNNU3TlpwxQo=;
 b=dP+OGF0xKtI9sW1PSdowHL9LxSHHRXgrsR2Od1fgHBmGle04KNEKKlwNLCLZhuj2+x
 mE/6VF9ynGHCr/6UA2viycF2Pki2YUuLqnXWTFTdx42awgmPv04a3o6Gh0WnGzEPPDt0
 x5I1su42OlZfTArj9MspBLiaGF0981BM7FqYwpsANr9eQQ2CbacKdECXj8bdnyZ3ZmOf
 Z8B1oannbyT5hSqHPf6+1LCwRg875C1d0FR0Ks7zHUdIVE1KUKxNjHIwLgz8lVtv3KZQ
 p+2FlJNXkYgJqlF+xVU+cK0xdE5zDPzTn0RTS/JhzmsExVST8TCuhdBeNYYCYliqVuOU
 +Vnw==
X-Gm-Message-State: AOAM531WWr+YYY/nQyhZfVwe9ZzJcd9APjjkDJnErH2v5X3kzhZAtNBl
 XGXbc15xG8UkFIBtOLN06b4rW/53kD4=
X-Google-Smtp-Source: ABdhPJyHsA8HIJK+7qTVGn7O4b7794/FiQcD4jPaMWrqd2aYY93bIXPHm7wkIPxxmZ/flUFfJBfPDQ==
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr834900wme.22.1628100386075; 
 Wed, 04 Aug 2021 11:06:26 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w5sm3903031wro.45.2021.08.04.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:06:25 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBLHc-0006AV-VE; Wed, 04 Aug 2021 20:06:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210718195712.3287050-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 20:06:24 +0200
In-Reply-To: <20210718195712.3287050-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Jul 2021 21:57:11 +0200")
Message-ID: <87v94lnkyn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libgudev: add
 gobject-introspection optional dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Nathaniel Roach <nroach44@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gobject-introspection is an optional dependency (which is enabled by
 > default) since at least version 219 and
 > https://gitlab.gnome.org/GNOME/libgudev/-/commit/43a593b5b4097b887e49eaacafbc1337bd709718

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3bedc9fa3b14939825fb9cdebc6977057c3f6118

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
