Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E948C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:55:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A8761078
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1A8761078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A84614041D;
	Fri,  6 Aug 2021 20:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeVUhwtYKjmB; Fri,  6 Aug 2021 20:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A914044F;
	Fri,  6 Aug 2021 20:55:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E842C1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D775E60808
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnzUN2_68X_f for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:55:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5C34607DD
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:55:46 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id e19so17120047ejs.9
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=QIETQmBoZqRvm7bCxEw6wpN7uPrH6+ajXlz67KZ/js0=;
 b=hIgYvM0H8VC/Xd7LyeM7H6hy07jM8IxE+EugkhJLYA7XE6bKA7tgXQMQgYjWzvtWNJ
 VqBQBwcet5kLY3P6dNACsBNU2SX94doQgCeK3hK23P5DFyQiEIt/Y+x54Z28DiIsvnJI
 dr6VvJvP3VBNln6fwN4AjK4YZlV6gF90y4a5oOcPw3KYx5U4NclJEcj8Pfxv5X5jkXVk
 kzpIbSqFdt1eLtLEsrfR4b+xa50/ZUMOcjW/jQ3dtZ/Gr+g5U7GhGV/TvC373/Y9zQ1H
 SWJcMrrDIg6mX7HTWeLrJJVQOZ4QFHyPSRisx2+RtLXzU2Bsh+Rpbh71d+s+L9YxETcR
 oYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=QIETQmBoZqRvm7bCxEw6wpN7uPrH6+ajXlz67KZ/js0=;
 b=QREKwRmDtUhFuFM2hCkTSnSjbklU/gxXMiWgi3TawgnzaTTUerxUFilVqYf5NzpqS0
 hQxX6XbmHvnopcvvdfxDv6VDkgjN7w5xXuLky5m9whEJpqc68+mI1++gq037ai9DhiPg
 5pn05rz5Y3azQZAXZZkjkHKv3PF9wO7txXUE5C64ZJCkxsV+6wVUEJW0skWm12UM/5hb
 il+qJhHX/ZrVjGkXobRHW3uXUW5nIt9/ucR2/d0ILKMGfRP5lLA4ei900Vlo999WkTSy
 WKt00Sa5JeSzG3q+dnjBdJNQjgtmvIy1ygilOk/rLL1zDbbLufJHJ/rkIQ5ADufDE6Lh
 9VKw==
X-Gm-Message-State: AOAM530nntwOmg/7JMbqucG0S2SC8syxPsWj2h/heiek4Qx07ufbOAep
 6nXUOPVs7ZFtTa5yt/b7uXsmSOR0p03UWg==
X-Google-Smtp-Source: ABdhPJwrVoySQVFNiTna6weWWAHxCnLJSP+Mi6JMf64qW1FjCScxw5qCv3DfX71IVs8Wue4LU+Nb1w==
X-Received: by 2002:a17:906:888e:: with SMTP id
 ak14mr11822283ejc.134.1628283344788; 
 Fri, 06 Aug 2021 13:55:44 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id d16sm1455496edu.8.2021.08.06.13.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:55:44 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6sZ-00087b-HZ; Fri, 06 Aug 2021 22:55:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <4a27ed904dd80b00498185003c9a7bb26dc9a128.camel@calian.com>
 <202fcb4f-1edb-30bd-806d-e530619d510d@mind.be>
Date: Fri, 06 Aug 2021 22:55:43 +0200
In-Reply-To: <202fcb4f-1edb-30bd-806d-e530619d510d@mind.be> (Arnout
 Vandecappelle's message of "Thu, 5 Aug 2021 22:26:58 +0200")
Message-ID: <87czqqgunk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Serious time jump bug found in gpsd 3.20+
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
Cc: "bernd.kuhls@t-online.de" <bernd.kuhls@t-online.de>,
 Robert Hancock <robert.hancock@calian.com>,
 Peter Korsgaard <jacmet@sunsite.dk>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I am not sure if the best solution for Buildroot is to just update the package
 >> when released, or apply the specific patch to fix the issue? Currently
 >> Buildroot master is on 3.21 and the 2021.02.x LTS branch is on 3.20, both of
 >> which are affected.

 >  For master, I think we can still afford to update to 3.23.

 >  For 2021.05.x and 2021.02.x, we'll need to backport the patch. Unless if Peter
 > thinks that in this case (since upstream's policy is "always update to latest")
 > it's OK to just bump it there as well?

The patch kind of looks big and scary to me, so I would prefer to move
to 3.23 for the stable branches as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
