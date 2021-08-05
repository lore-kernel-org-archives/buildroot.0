Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C331C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:05:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404996104F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 404996104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E6882881;
	Thu,  5 Aug 2021 08:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Bee94nzBZXj; Thu,  5 Aug 2021 08:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05CB82AC8;
	Thu,  5 Aug 2021 08:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 115D31BF853
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C526058A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vhid47udQSk0 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F15E2605D7
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:05:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b13so5328977wrs.3
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NZvUW1/Fb7CiVrZ8B4KPadwQTv0h93C6/70qY4YlPMY=;
 b=fsk5lUYaNB6zOc/mCfVT9sFf2cW1FB+j7k+cXjNLvfBI2hXzPMHaxcYuOgFJqUXLTy
 6zNg0D0Wv7LKnjG6hM5M4hRSwfty8NTN50URyEdYEzEjc/vhcJdWw3wJRTNcR0XVrq6T
 JWjzd9IdG5+Tz8jWHB3K04XT6j/OZYbpa8FuwI9MHgAzfeTnN3Lqy6d9+iTx9UaljjX0
 zUgHrwfCarvAhNc/Am1EGOzWW2njzDKQxNy89cpXdyE4aTvLMRAmjRUA76jv3QUM/B7+
 wmbDfKJrJ1kc48X7S5zzThpkZvHRyc0xAWh2YiYgc/ICfCj82pjWkIhyzINuE48yiI9z
 TcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NZvUW1/Fb7CiVrZ8B4KPadwQTv0h93C6/70qY4YlPMY=;
 b=KpVQPKWHZXS0PqCG639LhvmmeQLys6TiXNhZGVPI49l2Ne8OkBeZRhk+LIIZcTnNYh
 TvpRjTx0p0hfjuwX+x0RTaTo9ei1FKW5j5NlRfzXyZPhKKd+jJWfOgNQZvd6T1ytHpWb
 Bo2Pdyw2wHGK7gBsel/XEySbXPtMNbaf0t0udM0nIIt9JLtxPrW5sVR1cUHfjv3JzzlW
 jJF1GpJN2p0suDDWpjfTsrQqg/ez3p1UqRNr/hGGSxA1f2RoHFzibjYl4zX9EeZwusFL
 fG8n/3GXhPNzKyitqBn8wBMx/jMax3cs9J9f+Jc1aDTFYVK97EBpKarUyyRxEKXDZ8N5
 nz0A==
X-Gm-Message-State: AOAM532WjTgzWa5PFw1n/ngodkl2NFHAnfXL9PtugUrCZrBGV4c3vz4/
 Bj12fdnRO5e8GcTFLxAzx9o=
X-Google-Smtp-Source: ABdhPJzzHB6mqf84emRauZst/x0kWLpwmp513JFcaqCr2NE/1j6kgi/1boVlPOTPFdLwXXnHQnKYVQ==
X-Received: by 2002:a5d:6186:: with SMTP id j6mr3723763wru.115.1628150704072; 
 Thu, 05 Aug 2021 01:05:04 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id z17sm5350004wrt.47.2021.08.05.01.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:05:03 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBYNC-0006AR-Ht; Thu, 05 Aug 2021 10:05:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721222731.1168996-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 10:05:02 +0200
In-Reply-To: <20210721222731.1168996-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Jul 2021 00:27:31 +0200")
Message-ID: <87r1f8mi4x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: add SELinux refpolicy
 module
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

 > SELinux support for openvpn is added by the services/openvpn refpolicy
 > module.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
