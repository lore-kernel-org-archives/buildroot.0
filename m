Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B188C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:29:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C030F60F56
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C030F60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758FB4025F;
	Tue, 31 Aug 2021 06:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pB8fp7iTRaNf; Tue, 31 Aug 2021 06:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B504031C;
	Tue, 31 Aug 2021 06:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D84221BF377
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4A8280C0B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CIM8SoI6PnF for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 06:29:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFDB580C02
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 06:29:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q17so25203127edv.2
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=JgRSAXeqF7KpkmTuhzcfAakfG4EvjWfX/QVkq2hoGMY=;
 b=hMvTUXUq4901M5467gkeyqzZpiobnF5LvSjFJqTewJ7OIF30IkXPns8PLADhNV3jBQ
 xVx/8F9TX4LItGNa2ROaq9MPYCQatxN0yVpdS41tudGT9kABZWlKn39CGHVmR6UOdDpv
 E8cVEjwRlBcMEUy6rez2E2MV7X11b3hdnv4SpcXUaewCjk0pwuRwEtY1e79ltcwd6Ubk
 qloaDmOAV6FmTWCjAAdLENvTuBZcBDRF6AtDw3DHtcXHBQpNAggRyvoUczO8PPtgV8aq
 chVBvFr7Pb5pBXqMFV1j8yifM9RD4w62Utmv4PHcfo+DAaQ6wPwmdzDYLFt2bECws9d4
 uC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=JgRSAXeqF7KpkmTuhzcfAakfG4EvjWfX/QVkq2hoGMY=;
 b=nOBJhdFuyPIh+/ieSMbmnT/CJgRuFiyY/8iwojqfP0696R81fWEfa+RqAF9SWvn2BF
 jKtWhIhPUGpMcyHoPcjG9QxgZ5zBIGTo07/yhKAtbrtdAyeFKjmExZauxI3BU+V6GzU4
 +xitJDeILOQGd/Ooems37pQ8YZVlKUC2zhoHKVQYvPd1wLtXOcyYFJ66cvP0JaQmyIOU
 JJQLZhJIQoLjnrjwkvjTgnI7XvxGr44sLFOcGDFEz7Ejq/ahrxUAeYmmhyzQStiF+NWc
 W2til/iMyVk5iU4jAQrNfc8JENNrFSJGXrWRlOB59fA6mBwTb3PxvwpRyPIl8EUnG5tD
 v7Kg==
X-Gm-Message-State: AOAM531SrnwOJZoYUSbEB9F61uFNB8fQeepkoVQh88n/O6xTQWg3/O2m
 c4lqkTRqiIKeP0lMDtMx0OI=
X-Google-Smtp-Source: ABdhPJwwN2RVlkUvmysEXZ0qrAey3Ruo2WWy63AnkqVtde2vW/fWs3hI70u+eabth0GUgV0/yhrg6A==
X-Received: by 2002:a05:6402:1385:: with SMTP id
 b5mr27973593edv.276.1630391351867; 
 Mon, 30 Aug 2021 23:29:11 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 h25sm3579301eji.108.2021.08.30.23.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:29:10 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mKxGf-0006m5-OE; Tue, 31 Aug 2021 08:29:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210828080446.492253-1-bernd.kuhls@t-online.de>
Date: Tue, 31 Aug 2021 08:29:09 +0200
In-Reply-To: <20210828080446.492253-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 28 Aug 2021 10:04:46 +0200")
Message-ID: <878s0iw2iy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.14.7
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

 > Release notes of this bugfix release:
 > https://www.samba.org/samba/history/samba-4.14.7.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
