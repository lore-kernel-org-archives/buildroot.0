Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B75C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:24:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C4860041
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5C4860041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AD1C4023A;
	Fri, 30 Jul 2021 13:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDNrNj-AY4ox; Fri, 30 Jul 2021 13:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC35240159;
	Fri, 30 Jul 2021 13:24:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5051BF390
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7899083ACF
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VAvJpBo2bAg for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3C2B83A7D
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:24:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id yk17so9105868ejb.11
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 06:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=H3pXqHKWAUJdl6pggZdYttSa2tXIBHtIxVV70q2E+j8=;
 b=ikHtilo+TDft8npD7Yx5vv3fufJS18lDoQzthBuz1Qvs2DlQXGSHl/HMXnBpvWmZhP
 XbzCWkuSswktt3xNRik4lwpyvqxm1IcyQt8rU80sBDl3iDkBtU52hclaXZpViZ9SoLBa
 kCKViCcN0AlcPng+J18s2koTrhmvoIQaRh0a6iPm7quuL597K7CWNnH8032gf1K44P6H
 T919Aym+rRN04vHMEJSClo1kWFAJD6e2KOkhvwm2EnzkdhP4XocW2D5uEWM9G5h/7ETe
 DZslPZZuyJJvEej9zQDJW1zM1CYbgjdgq2GkIyktsBzQoZwjcWa01U6YIm/D76SuQVnN
 Ow+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=H3pXqHKWAUJdl6pggZdYttSa2tXIBHtIxVV70q2E+j8=;
 b=tDg+nB8M9RMdQ74NKXHOFyqFyoSZ5DXRGOvEjhFsOZfYtCQhbqqQvtGTiqD0y9RzSz
 aEoKUZeyj4eO5pFNydLVAO7VnXmvfuoyndnUhwVcsTeGInnyk2nhiYyQaGktCDpxWiwP
 g2TkbBdPLDshrRnhB4ebW6x5ZOEoDTC/7T2wbwLCJBCvBMVteLU19zhe2CMYZcZrUEQP
 HtCko02a6T3WJu5J39iNmy0CmuyuDtcXau6uVubHNDoGl5ljsqIwNtxAtTvm7IgSLkLV
 wDrEnS+BWn0KtpwBhlAEfQrVSWeAKKzSBDBoiX6mKnh0JoPUHsaEd8k4bvYFOpVbgcvp
 8CGQ==
X-Gm-Message-State: AOAM531N3cgAH9bOPcJjq44tdAOErCu1AYfmjFsjMzEeBsAKkIJE6e1X
 kxmsTxF69JceXJb17NRy0D7/ZgpOTkI=
X-Google-Smtp-Source: ABdhPJzct16Krv5dddknuPAnOX0wnlnrrcOrwKOA75si8xkd16eoy4K2Dzw7WkvjVgmCgAfvuF+SzA==
X-Received: by 2002:a17:907:2719:: with SMTP id
 w25mr2559216ejk.239.1627651470073; 
 Fri, 30 Jul 2021 06:24:30 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 t11sm559408ejr.89.2021.07.30.06.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:24:29 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9SV2-0001ZW-RZ; Fri, 30 Jul 2021 15:24:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
Date: Fri, 30 Jul 2021 15:24:28 +0200
In-Reply-To: <20210714085346.2464634-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Jul 2021 10:53:44 +0200")
Message-ID: <8735rw0wab.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/nginx-modsecurity: drop
 unneeded select on pcre
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop unneeded select on pcre which has been added by commit
 > d35873ab0ce5921974239354f8c6e1b4ccc6e565

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
