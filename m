Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E413C19F2D
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CEC58177A;
	Wed,  3 Aug 2022 21:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CEC58177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6G-k7wF_HCi; Wed,  3 Aug 2022 21:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FB1D8174F;
	Wed,  3 Aug 2022 21:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB1D8174F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB90F1BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C746140332
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C746140332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrYiUC8UdpIO for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:07:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B428401D8
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B428401D8
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:07:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l5so557808qtv.4
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 14:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hbl8NJZ1Tz6L9HabkXNxP4V5AGrLWSr+W7hPx4iCNpk=;
 b=WCtT2jWXVUtkuqZnY1WLFnXfYckIGRI+YSZPXhabI+n6+oOZuuAmzXT5axW5UyTwHY
 9xP4DCuuRWoG3LYMMHoAn06orrAVsBJs3Rk6IHyZ6VmE7kDmDiSXiB93diaXRPdmjX2i
 CsJJBjB1c9mkFdU0h0wTqQeMEzRSUWmRadsFjHmjmp5/k0ooGEjEW2G1GB15BgK5jgQr
 XpDRnwfacmy3m8vE9XFM9Wb/KcVMJvuZ9d5olwiN7jgIa0y8M1gUplceCmoCYAEpmxuI
 pMgeO3F11Cza36T18MNqqPB+hPbX4lmQZemBm2QpQcpXZcuJ7lSUrDvFl6wn++6ESrR7
 CP5g==
X-Gm-Message-State: ACgBeo1pGxr2OrOJbPWFzAOOHf29UzOITAxaNWzROnElfiHBht+TLN7d
 AKSyvl6+y5jsmBFx9By5dgiPKw==
X-Google-Smtp-Source: AA6agR6U/eykOCLXurDvIMBT/Kj0M56q9ngm1Lu4VoqUtOmcZH9e/XB5LbTbVgGmK9KnliKpR5uQXQ==
X-Received: by 2002:ac8:5b83:0:b0:33f:eebc:3ef4 with SMTP id
 a3-20020ac85b83000000b0033feebc3ef4mr2382102qta.665.1659560835097; 
 Wed, 03 Aug 2022 14:07:15 -0700 (PDT)
Received: from hefring ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 t17-20020ac87611000000b003051f450049sm11591481qtq.8.2022.08.03.14.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 14:07:14 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date: Wed, 3 Aug 2022 17:07:13 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YurjgRP6eQWSspWi@hefring>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
 <20220802202142.1770838-4-Ben.Wolsieffer@hefring.com>
 <20220803001527.5aee21c7@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803001527.5aee21c7@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hbl8NJZ1Tz6L9HabkXNxP4V5AGrLWSr+W7hPx4iCNpk=;
 b=6yoJjfgZAFkUmqiiasOfL7UiCNBwCaMiZ0HjfMte9UDJFaDC8v6RiPIOVR4aHavZMI
 I1blmtdJEK2ELUtcyVpr4YVaKkVY0+H0gJdY8S53npv5VRju3Ew58Caqp1yctGscwqli
 nHcBDOFLBwhnCk+b/eKo+bOdhSYiDLz8eu0D02iGvQ+i50O9Y1hO8KSZtWeIvL0EGblO
 F10lc3c/p2M5L8D24Jasp9gVmMnvR1NDSefo045q2DGBMHBYNK/sgc5yNA296BqNnw/T
 UNFerAQ6eGWU8xGyyw3HOolvSn5q2KOTQDASKjQKuZ5RIDTCAz9d6pYGQ2D+tCE5siRz
 03EA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6yoJjfgZ
Subject: Re: [Buildroot] [PATCH v2 3/4] boot/uboot: pass -mno-fdpic if FDPIC
 is enabled
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Aug 03, 2022 at 12:15:27AM +0200, Thomas Petazzoni wrote:
> On Tue,  2 Aug 2022 16:21:41 -0400
> Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:
> 
> > If the FDPIC ABI is enabled by default in the toolchain, it must be
> > explicitly disabled when building U-Boot.
> 
> Missing SoB.

Sorry, will fix.

> Who added -mfdpic by default? Directly the compiler?
> 
> If -mfdpic was added by our toolchain wrapper, then the toolchain
> wrapper (toolchain/toolchain-wrapper.c) already has a few checks to
> avoid adding -fPIE when building the kernel/U-Boot.
> 

-mfdpic is enabled by default when the toolchain is configured for
arm-*-uclinuxfdpiceabi.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
