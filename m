Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FADC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D335360F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D335360F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B074783D0B;
	Wed,  4 Aug 2021 14:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZdZFZpyZf4S; Wed,  4 Aug 2021 14:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F1D683CCC;
	Wed,  4 Aug 2021 14:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 855F51BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74C4C4148E
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3P2-nPVO8cnS for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:05:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D67E4068C
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:05:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h14so2382384wrx.10
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=9mGslvf1acCY+dtCW+ZV0/UDAyhetNfMONKp0kdypx0=;
 b=vXXQaPBcBOiKCQIOPXnb/lqiqk+DyhbySV8qwP3i29nS7a6CUe84n97bevRrcq8RFt
 kXeY0N8/42mVRalFLHkft/UBOdMf2iVqAnEiC7S7rIR2hEn46SWLU2sDNwYSAt4lMY0T
 QfzjBDe8Pm5tHdQONoxG+xbpfraLPX2k11VJh+YvpEmE/AYg/zIxrz8GodCVZXC2Lm/4
 djIugN4IAnQkSBuPC/+XaQupbeT+20+IROcFdZlvFVt7/n54U5lK5I0eyuTT3tQ4VQsi
 1GN3Z9msEfrx6ZOtepAI2rsvKYj5sgg0AbZP1pm50HQobKRsOMVCenkNahG3mcG4ghjk
 zHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=9mGslvf1acCY+dtCW+ZV0/UDAyhetNfMONKp0kdypx0=;
 b=HNsQC9slo9wPJcBykBSn1VA1OkMKXp1g+0mFy6yWz0BL18BvLN0Z4Y72sOPrQi9+ot
 JtctaywrYsLAisXz8fx93YPR+WP4itoy7qvQ10npr+Gw4Am59wc6CfquBUYKClfpdWGj
 OdUkiN63ipheIlt6s0v+joUSNyXD/8CTNML2iCQVFUXnliL2Pr1uEaJBas6IPNk+mzAb
 F9AIFV8nQUZDFn2CnTIOMikHo8n4xHmrOJoNrT6uZM5XB69jxiAWTZRFxltefgpjBtQ9
 iyd2AC9ERLDkenLhlOO6qAoD9RKBIm1ast4xWCOQZRcblv9N0zP8If114LAXHaXnYY9r
 Esiw==
X-Gm-Message-State: AOAM532+ZuJnRhogXzIlCxd/7ynDpFBdbc4RzWAERMd4W5FM+TmjbHL1
 +t4Gk/HAEkJAGDO7drRrzxfh8JvFYMg=
X-Google-Smtp-Source: ABdhPJwKzejhQZjBEXKs/PqLYuboN5dd/UvR3dMuSQ/nibVIFIaWHokPprk0qbc9N1DRCH3pdVlTOg==
X-Received: by 2002:adf:f287:: with SMTP id k7mr28183803wro.206.1628085933551; 
 Wed, 04 Aug 2021 07:05:33 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id v15sm6351589wmj.39.2021.08.04.07.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:05:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHWV-0003OJ-VE; Wed, 04 Aug 2021 16:05:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210718220700.3297109-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 16:05:31 +0200
In-Reply-To: <20210718220700.3297109-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 19 Jul 2021 00:07:00 +0200")
Message-ID: <87tuk5qp90.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ripgrep: add
 RIPGREP_CPE_ID_VENDOR
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
Cc: Sam Voss <sam.voss@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:ripgrep_project:ripgrep is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aripgrep_project%3Aripgrep

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
