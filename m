Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D4CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3725860EB9
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3725860EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F07402E9;
	Sun,  8 Aug 2021 19:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NWB_RgfEfyb; Sun,  8 Aug 2021 19:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F26A402E2;
	Sun,  8 Aug 2021 19:37:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9138C1BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA5D4019A
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYdBxwaTBMhz for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 806394012D
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:36:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q11so281865wrr.9
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=p98PPRE/0HW2ARxoqq6F7f8heEUXNwi6L0zWrqFwgHs=;
 b=LPVt8F06WSGq/s0msqT4nDDCEd0Hc0dDElZOQiHHJVC15/0XinS+XQCqyh0PE8M6I5
 388sNdTeoaABu/zLV0tcoLm0AaTpPMSFekAxpENJLZNsh9qO9ozQ/SEFu4HQ8/Cn2LVv
 8oU+957wdR9+uor9BovhYk8LWH1AWiNt9VMytsX5RStADttlu1Y6I8egT6P6Xg8Ej51B
 31UcZvkgmBrSb9E5tg3Evsh1BQG6gPanVZLHORpneEU4Vxp59lV6jz+7+zqFISR2lA3d
 k33hdtN0OhFn0tIrWeJiLEAp8wpktnNlX+4lJxYsTpnZhJsfJeyj/cEm6VrW7P+PpFY7
 xDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=p98PPRE/0HW2ARxoqq6F7f8heEUXNwi6L0zWrqFwgHs=;
 b=YsJHLK27YhKZ+VpkAFVz4gHN1z5PCkzbjUjS4+c2JvHz7a8iim1KiPjWcO6BTs4cm2
 TIvtCXqKftj80K4iDnCUcnlTMtw0gq0MobrD16m0+hKR66JgkZZClQGz1uonsv/qCjMj
 QzsIqDNR3bTuPD3Zv0kSOXUBXQ+7+SeStqLoyvXQiuLawmL8aqVUM7o5YrZL2tgvAwLW
 raZqPJTqKcys9SedTMot6F0eEYh2D3cGSXkUGpEwBM+bK4mrNhmcc2W9FCu7iWetZASj
 GmdfH0Kjqcx4u779RgPWkUVrhhIOX/6lmalNNhaatLbQVz/sabZLeltDKb5L/Ucx+mCj
 4SpA==
X-Gm-Message-State: AOAM532olTxWH/Dfa7Ti6uQpmsvyC+ku0erBUcjK58Y/6+LPAQavXJJq
 yjQqJgTTBVhlxoJQvMa96cdzv03PTBgQ9w==
X-Google-Smtp-Source: ABdhPJwclT9p4xUUnQLRGhZla2bHzhXFLHmfx8YBkWbIBAQWdByeqHe8vSoX2N72WJtrOU1BlwiFNw==
X-Received: by 2002:a5d:4047:: with SMTP id w7mr20002929wrp.38.1628451360781; 
 Sun, 08 Aug 2021 12:36:00 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id u6sm2318887wrp.83.2021.08.08.12.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:36:00 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoaV-0004OZ-EX; Sun, 08 Aug 2021 21:35:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210808182056.28271-1-peter@korsgaard.com>
Date: Sun, 08 Aug 2021 21:35:59 +0200
In-Reply-To: <20210808182056.28271-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 8 Aug 2021 20:20:55 +0200")
Message-ID: <87zgtr91b4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version 3.0.2
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

 > Fixes the following security issues:
 > - CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
 > - CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
 > - CVE-2021-31799: A command injection vulnerability in RDoc

 > For more details, see the announcement:
 > https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
