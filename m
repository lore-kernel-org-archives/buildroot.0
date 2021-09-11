Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DC6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:32:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B783260F38
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B783260F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804B684A59;
	Sat, 11 Sep 2021 13:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYvlU4_2TOeY; Sat, 11 Sep 2021 13:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC1C8849D4;
	Sat, 11 Sep 2021 13:32:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF2A41BF2B0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B89A1400E8
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXCh118aJOO7 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:32:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06155400EB
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:32:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t6so5354459edi.9
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=N9vCrW4i4uWbL8hUrIbhJvl7KHVkzYNvfA5xl57WKag=;
 b=hhZjAzKmRIH3HGTpQso3WnJIq1FRPexEw70BHUcE3o45rO+gVtIsYEWbEceQa5zqC0
 o6R9HCjtrTYv4YxAMSykRdF5uzv97u7UoWye//r/0JjbyGo4QxXGmSfolz7g+FllhVEu
 nMqpb/EoIqdL/rtWBPrBbEg+FdeQkJLPHRjoQwZrmeckAy0acpmRtIwVixwNLBker777
 y5yt5YCYTFYzHZoJ5ySaVhXgbfEOz+xHBMgClRznHS3taMcb1V+bFdtUbsWAFUb0YIHN
 bJ/y88yNs9RZLny6kD9mRRyAE0XtWxhYlk0BYv5M96RYNnWbrALI3Row5G4vd2NAlkYb
 NBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=N9vCrW4i4uWbL8hUrIbhJvl7KHVkzYNvfA5xl57WKag=;
 b=tVqEu4A9hf/e1Hqb26yD9qbDln6R1Srszq1iNMfm35lBglFcGXuXrzLqr2wqZXsEIr
 OdfuGS+R40L+4x4VyI0Eqsuah9EFy+A9hOV+OH+OnkDKpTwFgDhXFelKL0g9okd9gjpI
 Fyg++GHhHwYdp9dq1qkytxcLOc0bJIfbhc2rWQTesrDMt1jDyf3bsBRf+zCwo0FA8Gb1
 TkbVlAJ6H8U119A0WUdY2GWKGeGeZyU9Lg4Z5cMMQBn4uxjz2SG69L/CVByyiUoAmDY2
 q4oaLgdNKDfYk6R0ELsN1ZtRtsUmvO6QIEarTWrIpdjrj+Y5uPvoAXBge8ndKuKt38V7
 luEw==
X-Gm-Message-State: AOAM5319ydYNVpj4BoLt9RgfDZvnOsepLhbJSKr748WY6hFu27Ho4Nrx
 admh3lbMJP8HiE6CljcQXwI=
X-Google-Smtp-Source: ABdhPJyB8VXEZhmNMVpXp5NTcoKBmW1N+SRRmL2yytIsTACyZjlcM7iS+MGMJ0Y7El1l0end3e1u/Q==
X-Received: by 2002:a05:6402:10cc:: with SMTP id
 p12mr3286018edu.328.1631367126291; 
 Sat, 11 Sep 2021 06:32:06 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 a15sm985086edr.2.2021.09.11.06.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 06:32:05 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mP36y-0007Bu-Us; Sat, 11 Sep 2021 15:32:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Walle <michael@walle.cc>
References: <20210906155526.2196605-1-michael@walle.cc>
Date: Sat, 11 Sep 2021 15:32:04 +0200
In-Reply-To: <20210906155526.2196605-1-michael@walle.cc> (Michael Walle's
 message of "Mon, 6 Sep 2021 17:55:25 +0200")
Message-ID: <87k0jn5jcb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.14
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Michael" == Michael Walle <michael@walle.cc> writes:

 > Signed-off-by: Michael Walle <michael@walle.cc>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
