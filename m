Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:49:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0877360E78
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0877360E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE1E860A41;
	Wed,  4 Aug 2021 17:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gPP8z_OTxzl; Wed,  4 Aug 2021 17:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5864760776;
	Wed,  4 Aug 2021 17:49:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 671D01BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56E894035F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZyiiuWRfeTG for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:49:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC9464031C
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:49:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c9so3146035wri.8
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=S1yUWYEm6I2zZOcgHfKMV8+vEiAg5UfYcBI2MexgxrI=;
 b=PUdXeUfOZAGSzWLRQ42vCIPl8UVeKj656GFKLhvJ93ZPHzeljFMEobClHEFa6LlmAJ
 TH7s2cUt6EwoB9did98YkkD+6dJlwDwy1gcD6Gjq/8wPT8dX14DezzQWXmKUSJjOXLYP
 OhBrKKg2A+CM+AG/MT9XuU7wkH+KdoM9c6M4bOjLaHsNzO/exrPTtTW3Z5eal03hJCj0
 YI8K/fwqqgUeaMthNXJ7hTdLPDFiYTX7eAoxf/ixsrwEPJ4ONCEKdpCMF6WO+I42X46p
 VXTvl0mDMnLK6eaz4vF3s6SubtgYwRJ8TUougVJ8wfABF0dIloGi61XB2GRArt6EPGnW
 Uy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=S1yUWYEm6I2zZOcgHfKMV8+vEiAg5UfYcBI2MexgxrI=;
 b=IQwXss0dmuEcAhNhqTKsJdP4QC56g/tFjJpHyt0q4uz76ltqgxAQwnqiL17c02vKLG
 NG0cZt0qxFdA1z0oyJSaTRq4VwyXmIC6i5NBuPRIiEp1Iw5APV8Y14mkRfmU48FtOSIz
 HEr/kBFgfbuTlUteQmlYAxVZKtB25uZikIhXVLmbrhkZunQeTfOG9vctyZ7/hoQdMxXD
 w/93wjq/vkwiGouLB7TNv1UKesCS70RyBkSzibeEyG332h19GV9TR4/NsVQ0EOG1JaNZ
 41c54RDhTmaNACVBWQVjXbE3xjOLVslXarhpil03Az7oZio6z1n0hijI2A+wsSrVY5fI
 lnoA==
X-Gm-Message-State: AOAM5336ahLxa/iRRUEu+wahVbutbJiGB6E3MsIGGsYB2KH3E8xszNTg
 iNc6TTHr5dEH91oO4M+kEEM=
X-Google-Smtp-Source: ABdhPJzIFR2jJqg/04qd4zbYzYAUDhyZfSg18tdmwGoCsMZU65do41oCy9ikw4c9D+l9+DlElYi6Ig==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr605446wrw.72.1628099390939;
 Wed, 04 Aug 2021 10:49:50 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id f26sm3349696wrd.41.2021.08.04.10.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:49:50 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBL1Z-0005ih-5q; Wed, 04 Aug 2021 19:49:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721171059.489242-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:49:48 +0200
In-Reply-To: <20210721171059.489242-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 19:10:59 +0200")
Message-ID: <87mtpxp0ar.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: add SELinux module
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

 > Support for bind is added by the services/bind module in the SELinux
 > refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
