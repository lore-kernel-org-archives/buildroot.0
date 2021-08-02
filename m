Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAE3C432BE
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 22:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 851B560FC1
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 22:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 851B560FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4436A6066F;
	Mon,  2 Aug 2021 22:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UD3jJi_nj277; Mon,  2 Aug 2021 22:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991CF605BF;
	Mon,  2 Aug 2021 22:06:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 935141BF338
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C83683D54
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 22:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3s5c9zeE48db for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 22:06:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D5DC83ABB
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 22:06:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id p21so26493258edi.9
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 15:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=6B+NTWv+DPR7MvfzzX8YDaR+faz4oQ57yh5QhVWbWGo=;
 b=q1Pp2p6WtcSVFH51UjCOmWcXMuQlvhoqLxrv/MVZHmXqID8XQqdlU366soYFVszW0Q
 hLZ5BbrvPvuMCp3M53cy8Gy1MiZDK6NzlN9m5LsV/zJHTjJvUe4T0hf3YgIuM9+PDzUC
 YZIm2JHGYj27XuRIc4VUB5vB+Fh4+KtIPoerq1LJd/3Ylqk9wlipANl1BjHr6Ce1qdon
 vclCh29nGv/Byg/U44YW5qs5woW9zUKql0yhK0+l7Ue7VMsw/R5HD47zcK7mlmYJLu0t
 VFWn9Loo/3Q14BvUYIzYusvHNV1pkXqLs8kxQFsEsU/pT4uLaqRopla1DLcnKKMUVZdd
 UeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=6B+NTWv+DPR7MvfzzX8YDaR+faz4oQ57yh5QhVWbWGo=;
 b=MWhuPBZ+py+ZR2znyySNkME6aSF+v+ml9t8FT3brDUNQtt8NBzeg0CRGOEzyJRl35G
 sbJrN/jkat1tvLAFOD2+5Tpa8+zQikm0qEkj+VDjIc5Ite9WBkAQGqX8bjlw0ek9Itgd
 89b+R2mDY8mvS9MgU3rxy5Z1+gPOpX8Joeq7PPwWfwNhak0uQWEWAMAMpflC7XLwOlGY
 z8ldvQKwaBp0jpQkc2Pf/m5EbatnMSvAZCeJIo8Y2mk7Vno4/yUWB6Az86qGynbGXHIo
 irhWL7nvzKSKYha7zm1xPsAnRCeQs3fa5w+NUG2T3hHWpcN8SP7733D2sGNxEylUfddX
 9z2Q==
X-Gm-Message-State: AOAM533GxjJ8/MuZSLXqozRGBfScOjb97QHq+GZA53n4UYBp+2epoDjl
 0jgFD+afO6oF516kPjEb8l4=
X-Google-Smtp-Source: ABdhPJwLDUVYjrN0BUiI39mAYX1A1WOi+t3+QRqTC9FUzCye7gBK3erCIeb0h+w9YrOBAxTiUh9wtQ==
X-Received: by 2002:a05:6402:26d1:: with SMTP id
 x17mr22592676edd.126.1627942009718; 
 Mon, 02 Aug 2021 15:06:49 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id t24sm6928387eds.60.2021.08.02.15.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 15:06:49 -0700 (PDT)
Date: Tue, 3 Aug 2021 00:06:46 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YQhsdkzd/vbHXA94@pevik>
References: <20210802172116.10073-1-petr.vorel@gmail.com>
 <2A61C2B3-401F-459C-9DD1-727E041D1A20@benettiengineering.com>
 <YQhEuH0okQM/3P03@pevik> <20210802221341.760ffbf0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802221341.760ffbf0@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Backport yet another
 printf fix
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

> On Mon, 2 Aug 2021 21:17:12 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > > And thank you for fixing this :-)  
> > Yw. I see time_t printf format is more tricky than I expected, your traditional
> > approach with casting to long long would not require this change to uint64_t :).

> Actually, we have this printf() / time_t issue on other packages, on
> 32-bit architectures where time_t is a 64-bit value (RISC-V 32-bit for
> example). What is the correct solution in the end?
I believe all 3 patches (2 already merged + this one) should fix the problem.
But I was not able to verify it, because ./utils/test-pkg didn't catch even
this error (I tested all available toolchains), IMHO -Werror=format=2 and other
-Werror are probably only on http://autobuild.buildroot.net/ (not in Buildroot
config for users). It'd be great if ./utils/test-pkg had the same CFLAGS.
Or have I (again) overlooked something?

> Apparently, the really standard solution is simply to *not* print a
> time_t, as it's supposed to be an opaque type, which can be different
> things depending on the underlying implementation. But in practice, a
> lot of packages do printf() time_t values.
Yep, convert it to string is recommended, but as you noted, many people do.

> Thomas

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
