Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF13FC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:40:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994ED6104F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 994ED6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5935E83AFC;
	Thu,  5 Aug 2021 20:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkVcBBXfM92n; Thu,  5 Aug 2021 20:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACF7C83566;
	Thu,  5 Aug 2021 20:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B98E1BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 773AD401CA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-ymXFmiSjhC for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:40:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C2EA400CD
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:40:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id u15so4155817wmj.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=z8HSx4Sg3TLdHtgqHDSE4PpODhP4F6yCNLNn6c4RK9U=;
 b=F+b1lJZ8NLv1ZEWs+6yViUtRUKHBxJfNDogw4QX2rHbJ3w8wJpD51zcN4gCRJSIHK3
 VkhoAvUi88l5caa2+3EvCR7cAevV+Xn/ZHrDXshHD3+UFrMbKkMGC2M/jwMRdjf/uWVd
 msPFuq6q/cFZ9YijkJMXcAlipPDay93k1UXh+dfQo0R3FwA9Z/cAuFagppQlkH+Fkn3D
 7v/heGIBYHNBhKCEkEtYbr+HNdNNVwveFMczG3C8a2YPUUmhhXeTN1Ku5s5UmWgO7ZUg
 IbzefQ9Nf6YlRoQD2RD7cB61DorFp8bmfAnc8BB49svyquEnVX9S1pIlru1bn8eZK0mN
 hknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=z8HSx4Sg3TLdHtgqHDSE4PpODhP4F6yCNLNn6c4RK9U=;
 b=NaNMdgUKhcfEERNW6KDJcgXIWHT9v6pbRqf8dX4p9ZpH109+461gXHMwJZ16FOqD1F
 xqj16DeO8eA7LZTqthuEh8hucEeOcisFo682ZCpGC2I4zbcQfytrvHsg68N23U0ZT2ag
 2mAWY40uFHVSyq3Brn5CtpQJuzng1N77XbsIPFVH7/cKnN/feRnRtAg8V2kKFtZsT9gy
 YQ4k2KJc4BHS0xPqejaMupoXoLLePZYCyQcsBmPJrXLe+XtpCqTqaGSYtijKMb6dKqUX
 ORpNrgDJuzdKdJBq640R77izI8Cw1VcPWOyPEkh0J7lRGo42lKIXC+nGS9NfO+00oTas
 xV3w==
X-Gm-Message-State: AOAM5313iImUwWUqwAclNCEqE4yjxdE3JCXA0hoTZ6qkzqJnFo3F5kDW
 p07YElEUacuknEzhFbZ9kxg01Y90T/k=
X-Google-Smtp-Source: ABdhPJy6jZ6tR0uE8KHtt7pcmky2tvCHBBM/OUE3KHgaqlK/1v5RpEG0PlOSq+qTnuhc6u6QtRwAVw==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr17129466wmp.68.1628196000462; 
 Thu, 05 Aug 2021 13:40:00 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id m32sm6716982wms.2.2021.08.05.13.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:39:59 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBk9m-0004by-MH; Thu, 05 Aug 2021 22:39:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210726055413.209564-1-bernd.kuhls@t-online.de>
Date: Thu, 05 Aug 2021 22:39:58 +0200
In-Reply-To: <20210726055413.209564-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 26 Jul 2021 07:54:13 +0200")
Message-ID: <87tuk3iq1t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.0.8
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Changelog: https://www.php.net/ChangeLog-8.php#8.0.8
 > Fixes CVE-2021-21704 & CVE-2021-217045.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

For 2021.02.x and 2021.05.x I have instead bumped to 7.4.22, which
contains the same fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
