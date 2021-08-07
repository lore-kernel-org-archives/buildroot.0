Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237FFC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:55:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8317860F0F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8317860F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3983360642;
	Sat,  7 Aug 2021 17:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ox3KEDEBrV-M; Sat,  7 Aug 2021 17:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B5C605AC;
	Sat,  7 Aug 2021 17:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDECB1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A4282F39
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3ZRGO9xXfHF for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFCB282F19
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:55:27 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id f13so17994520edq.13
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=JJ2YWdTJkK7FA+jHAvOdtU1BcGHDpye0FqXv3xX2Qw0=;
 b=k5IB2RVv0lUoQCinchwiNDOp05WOZLdmAY+uwpDFe46wp2n/mEhOMqI60ZyzszAWv5
 7HWQfowpKe25ro9GGCzRkPd7qXVb8v4ZoyQro7pkY9G/bt4EzyEspD0DiwWrgEgbamBf
 o4ITe5o/4TZKz7UxPhu74393pL2rN/4ckRVmzlkozhzEvNJC3IxOXsauDErR0h7ttAPB
 m69NO13wHTM2I75pbQ+Y3QhJgEdFac38xLRQ4SOMOxQX9X2X2SV5ERKAYkgtoRHbZ6gX
 Xa0PXx7OLKXlGSPkX2sN8Pk/2odQ5jHy/2SzOQlYXc7v8cSaDDWEBHYJAxLLr6FG7lVw
 FZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=JJ2YWdTJkK7FA+jHAvOdtU1BcGHDpye0FqXv3xX2Qw0=;
 b=ImnFGaITy7Wtbi83K8Wv1liNjGjN/KNM0BFDd/GSvsIbgTTF6/k+ulM2np57rqQivk
 u+Ci7egVNLf7UPPt32JaP13z+mFDZ/rXXnkqG/efgBuVr5sxXVHJR858i8pnQ2xruW5Y
 HuI9BAOtmSo8erqcLr0SA7XmDyM3+fpRYz13quK6ea8J/xxWHwyGJ0jKoiyBwcJzMAUU
 wdbMKHtag6NozIPoauSRTOhBPFy33I4ZyVE9Hl4YuBipjNMJ4TjwVJrAXfsylWnL/GWG
 i7a4qBi4fo1Hz/l3TD4SN4WJ7Zj8IG6kpu6JXcAEvODxJlLGxGfnrEcrEy7+T0QEHua9
 IJIQ==
X-Gm-Message-State: AOAM531Y9WNMFADjJCBUnVzP0s3WPlBthRLxrAmg1ncbpojUh2u+KotP
 YQveiuyaYzDPzBR4ABMWpGI=
X-Google-Smtp-Source: ABdhPJwaqtcOlG8vp8sL+PIe2TWfLDTackixnmoY7zci4aqD8kWV6dcxg9v4AV+k22UNEbDUqwHDDg==
X-Received: by 2002:a05:6402:7da:: with SMTP id
 u26mr20254959edy.270.1628358926041; 
 Sat, 07 Aug 2021 10:55:26 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id v21sm500463ejw.85.2021.08.07.10.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:55:25 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQXc-0004GO-HH; Sat, 07 Aug 2021 19:55:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801080430.2591526-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 19:55:24 +0200
In-Reply-To: <20210801080430.2591526-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 10:04:30 +0200")
Message-ID: <87bl69f8c3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ibrdtn: fix build with gcc 11
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 11:
 > In file included from ../../ibrdtn/data/PrimaryBlock.h:30,
 >                  from ../../ibrdtn/data/Serializer.h:27,
 >                  from ../../ibrdtn/data/Block.h:29,
 >                  from ../../ibrdtn/data/Bundle.h:27,
 >                  from ../../ibrdtn/api/Client.h:26,
 >                  from Client.cpp:22:
 > /tmp/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/ibrcommon-1.0/ibrcommon/thread/Mutex.h:43:40: error: ISO C++17 does not allow dynamic exception specifications
 >    43 |                 virtual void trylock() throw (MutexException) = 0;
 >       |                                        ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c2d9033c68b5c1407d2cf87b98dff61958b8e7b6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
