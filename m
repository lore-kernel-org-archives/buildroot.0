Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D39C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:29:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B6E260F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B6E260F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64B44404FF;
	Tue,  3 Aug 2021 14:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2t-Cua4-zkg9; Tue,  3 Aug 2021 14:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C297D40504;
	Tue,  3 Aug 2021 14:29:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E36E1BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E07882525
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNoWIXur9bwo for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:29:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8927B82438
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:29:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z4so25569211wrv.11
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=gy9b9gyeqSNJibd9sqlbiJ+CUv48Mu/DlMSp3LUakYM=;
 b=dQVGgb//Tyh3GVpV1HCZ8xT2KdITtSnGHpaegI7ukmVWeSLyVKdZXZ2PAqFBErnbKt
 zk1h65dsyMgedO8gITV87Mfcpl/hnzIVetIyZEbrF0pH0MfsICMubh/LwdJS8Oc4f2fd
 Rlis7nEdsQFijoiA1B4Y+vThUEn+X/vC4kOOhWt0luLd2GED6tew+IsbHJX+02psEuAZ
 Obu9GwrSjFe+detr42lpjpnpbZNaJxAJHqwgekoVKe8g45kGxaTov3WE0SZ6QfNBziB0
 U08pDxFfuXrX3AwztnRzO37JUuVoOhc/FhU0LTS/m7QL4RcrtJpTMkv7euydqLjI+h38
 XWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=gy9b9gyeqSNJibd9sqlbiJ+CUv48Mu/DlMSp3LUakYM=;
 b=inpnmkT8vc6yqu16co9BEpFBoyTuLsHP8qWTAjXq5wC/Uiw0/f/Z446tXs2XtpQQo1
 Lprzxry9AUAu8C9LWgjuSeUdcvYd6WsqWlvyE4QfxJ/TytW9mY9rnqtzv1CJCwf19KeK
 Dl0oo2tru4rXuI2RLA7gWvL/DFv+OWbJnb9yOLCbQB74hKZxGcleyoLUneLcb/jVW4jG
 LGrd6p8cRdJ4Qmaf1i3xqfnTBhfq9mJrySNMtO4qr/vU9l1gjlJVCbtsrJHYSrBYUcJ1
 3dNQ/UbKp8hAV1b0yJNj4Pm9JGEU4+OwqR0UHjT5Jo/IfHlDOB98w9A3keoDvXwv0A5p
 6nqg==
X-Gm-Message-State: AOAM5317O5uDZC7xrHedTMeRBS+U3eEstJIgZoWExrewYh2LrYleYBjT
 vvPHjTf6qErScpQRyLBeYS+RjDXCwlkq+g==
X-Google-Smtp-Source: ABdhPJw2fd9qp1TI9UG8DqwHvh2xPT2GdkR3mbZfxj4kGp0E4xj6fQnfNDTrrXbJUCGS6gEOEzzOkw==
X-Received: by 2002:a05:6000:18a5:: with SMTP id
 b5mr22928291wri.184.1628000954795; 
 Tue, 03 Aug 2021 07:29:14 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id h4sm14970290wru.2.2021.08.03.07.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:29:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvPt-0001yo-5e; Tue, 03 Aug 2021 16:29:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210716214444.344130-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:29:13 +0200
In-Reply-To: <20210716214444.344130-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 16 Jul 2021 23:44:44 +0200")
Message-ID: <87tuk6wqiu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/linuxptp: add
 LINUXPTP_CPE_ID_VENDOR
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Petr Kulhavy <brain@jikos.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:linuxptp_project:linuxptp is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxptp_project%3Alinuxptp

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
