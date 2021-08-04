Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90616C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:43:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E224C60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E224C60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C67483C77;
	Wed,  4 Aug 2021 13:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6_qHTEZKkvZ; Wed,  4 Aug 2021 13:43:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0747383C74;
	Wed,  4 Aug 2021 13:43:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27D851BF82C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1641A40167
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmrZEmf-Zxlq for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:43:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E30A140100
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 13:43:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m12so2285993wru.12
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=IKnIAfPRj+rc0+nLryIPg4L3/mUq6bqnadD0KzbK/fQ=;
 b=DbrW6g+ER4sOM1jACw2NqTtECROMEUg33U4NnpbvR+tEY8J5Bfo/uC3cJT1qxcErkN
 ZruxfLM+EF91ZjGE8rEDiCYAAreJHPchBCwAOmFPPriVTJ9fLq7yRZQyX38cG1Dssoen
 hSQCfEoKL6KqAJpPLjAsC7wgBhS9vZO4HM4fpxdfyALx2XQzgps/gk6Mnth8EAalaeTC
 2z/li4Aeq6U2Zttyjzs6SxnPF1q9T5pO8o0kOOb63fE0Peg20lXZTMIacH7Tg8f9q9oe
 qr8Zta+whF+VEdrAdL2c27Pt8D9iVvwMuvH04AOMQW3dvxCdVVTYtylYLOUYm2LvcE0L
 bbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=IKnIAfPRj+rc0+nLryIPg4L3/mUq6bqnadD0KzbK/fQ=;
 b=JlV7aaOH/piaNF0kVE9WrQOWHbm82dQstSw+neznCqBYZi/slIhwmY8NpCHVORGP3t
 Ws1jiwQx0nNnae+ZHYIMTk+I8QzxR2MuTuTb8uCCWRrSA8/fLpT6kd4rYm/LWWxeGQ1x
 XVwWDXeKRuiXessq2YzMPA9K6omP3oVQnC9mUx9F8qw5vf6sBNYiarJFUU3qJzbYx2YA
 9KQ+y5+3bl91ilMq7/nrgBun3BWdKSdEF5i1SMUcwGuYffOkI72W5NQSCTEUJZFcZdqo
 9uoiQJIC4CaglH+/8Utohld71R/v6lJWQXRRoSEE8mB6EyS6ujhgOcGFRDgH/lizWPoy
 60Bw==
X-Gm-Message-State: AOAM531TjnZGSSXxULAB4dUVA6i3Pk+2057EQHd+WaMO/7qvv6nrD+vg
 tY1JmYPcdmBASX00iHijfHBOXzC0NuA=
X-Google-Smtp-Source: ABdhPJy5eTtA5E1SaE5cGi3hdFLhWYqKg7Mym/tqbOpmujVbLOu6GwBrtHHZR5r04BKL4uB3nUhIcg==
X-Received: by 2002:adf:f852:: with SMTP id d18mr28827857wrq.201.1628084615972; 
 Wed, 04 Aug 2021 06:43:35 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id 18sm2238796wmo.2.2021.08.04.06.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:43:35 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHBF-0002jj-QP; Wed, 04 Aug 2021 15:43:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210618192237.808519-1-bernd.kuhls@t-online.de>
Date: Wed, 04 Aug 2021 15:43:33 +0200
In-Reply-To: <20210618192237.808519-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 18 Jun 2021 21:22:34 +0200")
Message-ID: <87k0l1s4u2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/mpv: fix reproducible build
 issues
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Do not include the build date when creating reproducible builds.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
