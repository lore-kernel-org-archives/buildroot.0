Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE52C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:07:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567EC60FC4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 567EC60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286E84066E;
	Wed,  4 Aug 2021 20:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fle98pPjWE9X; Wed,  4 Aug 2021 20:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C73040639;
	Wed,  4 Aug 2021 20:07:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E67E81BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DECB740298
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNSX9N2LU1Q6 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:07:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DA6140164
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:07:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z4so3527045wrv.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ly7wPxEs9fmNbP9dx31+r9/gs+Na58VnLtCoENk12GY=;
 b=G8BOGisjDF9nJ8oFvqFJiiSO4AEjCuw74/7zR+JiInM1xSaKQknOViMhWS7vXlaF/K
 1dzxBtYon2Nguxkch7Ovk5ZT69nJ1i2fR48Yg6tyLzAuOuaxAVCwSxVzBjWCyrB0CG1y
 ekpm+0QsDgPx8UqwYGEKpxLYPBAHeTtmbw+nNh41X0M467p60sTm3fxnH2XpO8dPzQz6
 ckO9a6orTZv4zX3ko414RjJ/qsaGoyd5zC2t6Ck+Urk3R16BKGoNd9OtTq6oxH/YxCGZ
 husS7Mi+yz0dCTYCT3ZGGQhG9P17EKCrLZi7iAj/d+9LuX6d4zs0ucN+xzqqOxvYD4pg
 FjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ly7wPxEs9fmNbP9dx31+r9/gs+Na58VnLtCoENk12GY=;
 b=kIJ0jRKCM/Qlf+1oyJ+2U3pyERiHmrL9yUuRDXeE16ZmvG9fpV568sQk+2ujHvEAVg
 avY8/f0KogXbYzb/GoUpQFcKsAHVfxoYSsVjwq+svX8vidTDNFUzOARwO9lkbSvyUpIC
 2aq8HO2I5CXcRKtypxmnHMcU+tDItkg8dwl6IfzIQ8qKWhe3EfQGhXCUlltN/pgi6FJ8
 mNp9pah8cRlUaj4hgt+pWH1gg6lzBfvDdGq2iOX+6UCvgu1EEGN3QZKO0grE/Njv3CbU
 qOaebm8nitX3iFlnPrphgJAgIUiL3rOYk5++M2O8Xt02nv38kRD635edWdQuNF9p18Rq
 8lYw==
X-Gm-Message-State: AOAM5329vZJpYeE849/N6V7AKlzIZzFV2AFeQ7iDwPHPHlDPobeVUT6r
 i150WYqED47wWjyNGtDVPY8=
X-Google-Smtp-Source: ABdhPJzWV9ajB4Z/tP8+CAWPrfv7uXoBg9JX7zVf5uJ4urE059bKwsyu4XlIGaI8ST1cK2m/clHihg==
X-Received: by 2002:adf:e94b:: with SMTP id m11mr1014136wrn.339.1628107662138; 
 Wed, 04 Aug 2021 13:07:42 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b14sm3920759wrm.43.2021.08.04.13.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:07:41 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBNAy-00077S-Jx; Wed, 04 Aug 2021 22:07:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721200313.502434-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 22:07:40 +0200
In-Reply-To: <20210721200313.502434-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 22:03:13 +0200")
Message-ID: <87im0lnfcj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: add SELinux module
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

 > Support for chrony is added by the services/chronyd module in the
 > SELinux refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
