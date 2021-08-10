Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43489C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7464A60F11
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7464A60F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42EBD401F1;
	Tue, 10 Aug 2021 06:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNFqACvL_22a; Tue, 10 Aug 2021 06:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA6AF402CA;
	Tue, 10 Aug 2021 06:20:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC791BF30D
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B8696063A
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tX9IOmOfjwgw for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 06:20:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91C1A60612
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 06:20:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b15so9299119ejg.10
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Z/7e2y9mpdrnUf9kISmyF++8JsP9MT/tTBuq++LC6Nc=;
 b=Q3KpvRxLgeN5NBp+YRnt+L9cP8Vj84G8DgqO1zWesU912foBJPgmzblcfP2WkDDY7+
 ehdfp4hF9CTK+VWoj3cj5ZdBif/vaFew5xKT11+UdYKM/xqabu4B0odnzNip9VSVy637
 EDAfYFwx/xqki6DWQj9lo2zVNsfYGkS16Y3gfOXkO2CTP+LjH/vPi5q11m2sjv2O8nOl
 yhrGwq6lxJ8/8ALj2uHOtZO5Gx5PwZUHOUfONtt98WN/jNHbDWzVtHIYRBjOFb+FFcAv
 Gj5poWgxsJ+Ls/9KLRywoH7BO8vdfjpfx6lhsWrQO4y5mFzNLt9v3NuTk9rQL1jZ5L6s
 R/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Z/7e2y9mpdrnUf9kISmyF++8JsP9MT/tTBuq++LC6Nc=;
 b=Gr35ShO+zGXK67DQ1Pq5kyRZzmqcjF8ymkghJgY8S+jlMVbwrjnctrFQszbu+2Rj99
 GBiG81NRroSI1babR5Ud+4/5JKJYr2HLX3QOp1gjUnGTTzwhPe3Y2heeRxdiYqrZ5nut
 ZuMhvGIVnR02bO+jsgAejkpezAPV0Cx0C5XlmksatxMLDTP6X5KOHm8Sc2WRe7EnV2iR
 G8m6zSnVSKUiyPKWr+a6FBzwJgkaTGZaF3K1chaYgAPBjkGNAXM9dAaI0BY90A6kijTQ
 QVrOZwpBmOjAza5qE4aZcSk0NkmIBwXmfIc/FEUFO5bj5mko80/lVSDogtbW1ltGA/yH
 Ow/w==
X-Gm-Message-State: AOAM532It/TuMFnL6G4XyRwIEFS/foR/1yhTj3RKcAIbvd1XKtQvzQFp
 hCG4yL5FFlZe4i6pnMzuCWZsxkGmNZQByw==
X-Google-Smtp-Source: ABdhPJy9g+MmeuLPFvmWktZ4IV40DpQpw/qhWB9/QsL3lipj1TGxl/K/ZDWKfnVC/qvCZrhVA7ekrQ==
X-Received: by 2002:a17:907:3e94:: with SMTP id
 hs20mr25986017ejc.277.1628576449806; 
 Mon, 09 Aug 2021 23:20:49 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b11sm3036046eja.104.2021.08.09.23.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 23:20:48 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mDL83-00018b-3K; Tue, 10 Aug 2021 08:20:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210809193842.28963-1-peter@korsgaard.com>
Date: Tue, 10 Aug 2021 08:20:47 +0200
In-Reply-To: <20210809193842.28963-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 9 Aug 2021 21:38:42 +0200")
Message-ID: <8735rh95xc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ruby: fix RUBY_VERSION_EXT
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Correct RUBY_VERSION_EXT after commit be9783951d1d44 (package/ruby: security
 > bump to version 3.0.1):

 > ls output/target/usr/lib/ruby/
 > 3.0.0  site_ruby  vendor_ruby

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
