Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3914C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:21:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BB96104F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97BB96104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50AEC83868;
	Thu,  5 Aug 2021 20:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBnB0H8V3Epe; Thu,  5 Aug 2021 20:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF49582F0F;
	Thu,  5 Aug 2021 20:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9AF61BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B9E404FB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dO9e4oCGw52C for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:20:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EADE64045A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:20:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b11so8153006wrx.6
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=LrCeGkTG8SD5e6rjSQ6vVUKG6H/dQq6HJVgomwjitNI=;
 b=ZCXzmEvzQGxL8TP20cKoCTBtquW5nCwxRK7nwyELv1+Pxh73B64fgVfAOH5FRbI6oG
 ZFn9V3gSTLB0/z3iJ2MM6WlgBOUu4cZE3NO8RFfh/LACo/nIjKjW9Tyn9FDb/ZqguIsl
 7N8RNUtsM9airW9dElKGpYMhAkO8KQgiO8enraU9HHTa4/IhesvSSUB3pnd4I2FjmnEM
 h94QI4uuqbRH8MD+xobE10HWaMwklVEimETI2Wdgy2Kr7LX9vyfU4P5Xr10jwOsYfirO
 jx/qFKpmTti+K9nkspw2W3DX3mbYP+GdYil1uMDIMDXF27TaO29W96P66hRHx0/BeX7u
 Av3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=LrCeGkTG8SD5e6rjSQ6vVUKG6H/dQq6HJVgomwjitNI=;
 b=NjjGYTsMPJjF396f5KqcaRE6YgZaqv7QBL/dvJto9uguTCL9nm2J3ehOr1MnV7FjeE
 x5yFpnd+TMNUhmBwLqaK9y1yWdDhUOubB/b/ckrHpbOvLXsdCMSQPBA1ZAyMs+tkd9lS
 roXaKMQotbxxf4ez1dmlPcWC8gg2GTQqDumG4LpqPOX72CLIC4jo3tXIzMwD0RqyUfDe
 NE+TSRLcRGXtDxeJsD3koe5Utg23U3P8GRVAkjsATf40kQWCIPb1FLZz3MfKHmqr8BS1
 D9U7PbmldQIi8zbvGwQl5V+iQEJYHHfYrmShE1MA8rRvTDMkYknq7CTqWxQSjgdLQXNf
 qPnw==
X-Gm-Message-State: AOAM530jmgnozYuUUiqylNpVz2lXNP0NcDOyKZN00Nc/PdsgoWtsYXeQ
 f4Io7JXXupX55ot7SJAkpSIGAVFeoxY=
X-Google-Smtp-Source: ABdhPJzggpVxCJb5asYS/CHSz8a42moSjl8in03xtuQErNTiy51ih4Tm2WxqasylUFwdvw6R1KqvVA==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr7172972wrr.229.1628194848058; 
 Thu, 05 Aug 2021 13:20:48 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id u15sm13073wmq.33.2021.08.05.13.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:20:47 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBjrB-0007Xt-KL; Thu, 05 Aug 2021 22:20:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210726055213.133600-1-bernd.kuhls@t-online.de>
Date: Thu, 05 Aug 2021 22:20:45 +0200
In-Reply-To: <20210726055213.133600-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 26 Jul 2021 07:52:13 +0200")
Message-ID: <87y29fiqxu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 7.78.0
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2021-22922, CVE-2021-22923, CVE-2021-22924, CVE-2021-22925 &
 > CVE-2021-22926: https://curl.se/news.html

 > Changelog: https://curl.se/changes.html

 > Removed patch which is included in upstream release.
 > Switched _SITE to curl.se.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
