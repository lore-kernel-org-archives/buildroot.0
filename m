Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7E0C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:14:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8001561179
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8001561179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB53406A2;
	Fri,  6 Aug 2021 20:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eobmEkmLzEkC; Fri,  6 Aug 2021 20:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AEC14059F;
	Fri,  6 Aug 2021 20:14:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9851BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE8CA606DF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0hCnLoLb2mj for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BF55605FF
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:14:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y7so14698361eda.5
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=79a3hSRL7BCl3Tz15v636qFTRdf30p9UlWX7Gl1RfHY=;
 b=cfPeysPDuB1axwwhJcJ0ytVHiwBruLZ0HQq4UNopGxN9fQpy/+cV8pkfoFe+szzXEN
 LcVu0GUgX9ZUiDY4e5I3Nb5jDKqu3F35ujQb9WL/Kr73R91o55CJmKsxlz/Wrp6ecmv0
 5iuJJ0UU7fLF9RxtpnqHJo9D1BPHY7v8pJiLFEZOcAQK1RlyABO1/lTTMvG7PQNeSzIi
 T0E7gyhcEZ8MiIUsECrAZIz07qTEYbOrqo/TG9CkIMMJWpGTLu+1luSz8zktnTGNQny9
 vwoFNDkNlK85JVzyNDakVFiuc5A5sqwqFC8WGNzll0PjbUIlf5oIRFWop9N61KDsCdks
 wQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=79a3hSRL7BCl3Tz15v636qFTRdf30p9UlWX7Gl1RfHY=;
 b=GEI3b1kP62bC/abnhwhoEi6yI+xVTZw2M/bjidm+B1mN62O6YGTFhGuGLhuIG3HDki
 L4j91ngZxJg9XGPSS84HGSAX9j2x8Dkp7hJNRS+3e2rMzhtB8aLO+NAfVzuBzYpNiGdw
 lGEljBqzDMHl18kEHsroIlB+vIkan+4F/QM4mvcIHS6r34Vozictq5NDi43maCuBV8W1
 HZJrSKK0xIgBr96ZCozNcCM4a68y5agayyTMykThPUErUBcETLo6sD8ZrCv2fgmbcyWQ
 D8J3lernOFQtLrYnEIGhisubvvNjvcWY1ObF0PhGudebPyGF0pQJ9Bqv7t+yh2pXEA1I
 OqSQ==
X-Gm-Message-State: AOAM532bGgelcgodJFZZ1AMpZmGzVrGI2n4lrE6e1gY/YwGWan9AwpD6
 oOraJBaCZpXnV6MRknlnpLA=
X-Google-Smtp-Source: ABdhPJwkLYz58bdvUuC4HwdWa+KX4av/+cXPYXC+MzJgcFm8MhE/ZDChLG8WUJqlXZev9IbaxTZblg==
X-Received: by 2002:a05:6402:3128:: with SMTP id
 dd8mr15661923edb.367.1628280840279; 
 Fri, 06 Aug 2021 13:14:00 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id k23sm2865516ejr.2.2021.08.06.13.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:13:57 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6E8-0007cE-5R; Fri, 06 Aug 2021 22:13:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20210727205758.E132689099@busybox.osuosl.org>
Date: Fri, 06 Aug 2021 22:13:56 +0200
In-Reply-To: <20210727205758.E132689099@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 27 Jul 2021 23:29:07 +0200")
Message-ID: <87zgtugwl7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] utils/scanpypi: fix flake8 errors
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f982f7043419dea2d21ebe20c1b383633a517674
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit e43c0509442c746bea305aa2b0a5f7ff5adfd142 introduced two flake8
 > errors:

 > utils/scanpypi:300:26: E231 missing whitespace after ','
 > utils/scanpypi:302:9: F841 local variable 'setup' is assigned to but never used

 > The first one is easily fixed. The second one needs a little bit of
 > explanation. Before commit e43c0509, the return value of
 > imp.load_module() was used to be able to explicitly call the 'setup'
 > function in it in case the metadata was not populated. Since that
 > commit, calling that function is no longer needed, since setup.py is
 > executed in exactly the same way as when it's run from the command line,
 > so if that doesn't work, it's completely broken anyway. Therefore, we
 > can simply discard the return value of imp.load_module().

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
