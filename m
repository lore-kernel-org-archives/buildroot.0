Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D998BC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 19:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5D661167
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 19:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E5D661167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49734069B;
	Fri,  6 Aug 2021 19:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWc3OiLEBX3F; Fri,  6 Aug 2021 19:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41F2E40428;
	Fri,  6 Aug 2021 19:47:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16C201BF5AE
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 19:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0606383955
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 19:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KP_MvIAyoOyc for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 19:47:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A00683868
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 19:47:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id yk17so16789723ejb.11
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 12:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=lz7WdUhsik+XGJnPuBMtyruqI1GjAShmwgi2ndpOzUw=;
 b=pXf5oFbGaMN9anK7H8cKeaoxxX9Grn6+eZI0dzMnRYR3E7d8zfTbl49/VhJJ2Su3ZD
 HUSjdvCjmg9sYDEunpLV+8kNtEs/qGW96AfLNXny3hlKhFmbnFgz1N615YBIYYtyOtTd
 kmSDY07G5ForLwhFKOTKqNJYgdOf/I3/NRM/ZwwZCzBDC+XEWknNILafVNHEwl9Ll+l8
 KzV4BXHxgKZvPGeYpVKMP0ybffDA5Shv0zxXHbulSvcCEgp3qZ2MKOEbj66U5ulN2stL
 3cmriT7TGGXrAVdwxFNxaeeb8sSlIz6HKArhllyWaKGEuPmd2tlCA2WjMUUC7vWhuYvI
 vGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=lz7WdUhsik+XGJnPuBMtyruqI1GjAShmwgi2ndpOzUw=;
 b=Wyj1WL2A3fGOaA+APz3G0kJ6Gyf3RcO/+NwC+tps4meBg0Nih3LaEUaOWd9BeqZOVL
 lp8Hupj5MFwsttzAazaStTf6AlWs03WaTyt3KlN93SCn179nlOEF39DjeMLVT8vcBjnl
 7sTd+xfk8z4+tGoJmge7jMe6qt8n4+61P3h2iXLbJjEvirqNXGnzF8BzugcKIoy23tob
 +je4jXzd561PWLVN3sSY1be/KukxuU8jg/3yWNljWbEIhJQ99NB4hHGhSOrzRjeFkSEz
 j8QwjBsLSIId6nAUr7YKraDkJPOQ6jvp8Tz9uFJenraVkaQatOuMYXg9ZLH4Tfsgl9rj
 SgEQ==
X-Gm-Message-State: AOAM532VzVtDHPmqy90qC/uBGHXMDSDvDe6B3+XslyNSYW64ZP4jxLEO
 9Bg5CV4tfNr0OmWhegAKrSHM2m9LwwlEUw==
X-Google-Smtp-Source: ABdhPJxHvkmwTvFf+51+kTPUN4fyHQl9zuUHl9w4kwvHPLxQ97iqlbjTlNWrwO6oK54CKFxyFcw0Lg==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr11467492ejy.532.1628279267245; 
 Fri, 06 Aug 2021 12:47:47 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id m3sm4269370edb.7.2021.08.06.12.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 12:47:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC5om-0005bd-4i; Fri, 06 Aug 2021 21:47:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210726062343.767811-1-bernd.kuhls@t-online.de>
Date: Fri, 06 Aug 2021 21:47:44 +0200
In-Reply-To: <20210726062343.767811-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 26 Jul 2021 08:23:42 +0200")
Message-ID: <87h7g2icdb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libX11: bump version
 to 1.7.2
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

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-June/003092.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
