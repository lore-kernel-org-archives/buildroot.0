Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3821BC4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 07:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC1C540354;
	Fri, 30 Dec 2022 06:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC1C540354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcLMblQ0Q19G; Fri, 30 Dec 2022 06:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CB4240103;
	Fri, 30 Dec 2022 06:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CB4240103
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5DF11BF20D
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 06:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 812ED81453
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 06:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 812ED81453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSUmKcDtQWn6 for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 06:59:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19998812E1
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19998812E1
 for <buildroot@uclibc.org>; Fri, 30 Dec 2022 06:59:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b88so22148499edf.6
 for <buildroot@uclibc.org>; Thu, 29 Dec 2022 22:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BU+V24947tAqid7Fl5FskSW4cg+BKE7ykyV6X1wGGWg=;
 b=D1MEofZ2TrLHLG7zzZhBiURdvLKnJcBUvkqXyCEJGs7GLh6XfAVs5Fm3QIUvzHCRud
 H31I+3Klyy8Ldz5czZ+eQjGdHBRYb3ZUmEIIvbQV0CQBJdpCM1pfICIzX5qceoXPKMu1
 sMXYLQNom5OZ2YCCMcf9g1FbtLqjMIXwDWex1VIgBfuHVNGfzOEd5Hj8njiiiMThSJnj
 6XcwFROQKYFKgq6kFZRRfdILR42kC7q5ivXCdQFQrqIgOhSm5GjerRbHZQi3gmlExK92
 kjFliIKPA3cF3sTsmY0zrB6xS70Q6Y9SbatLIyJFBEA3h0/txbdGk41kcCPjmJsI1QPw
 6Nxw==
X-Gm-Message-State: AFqh2kqMYeP/mvpm8Y5vKa8gueSEDgCSzSTmf6BKZF8KZzazdOqN6hxw
 +wOYrl+pLCN+Che0RxLXbti9a5AOFohWPWuMY/4=
X-Google-Smtp-Source: AMrXdXs1yT63zr1GYb7pj2tffZys0PzICCpmIjqDFFcEbkE+YBdtsBjDGyam7o+dCGCQgSR8uIFn2Q==
X-Received: by 2002:a05:6402:12d4:b0:46c:fe2d:a588 with SMTP id
 k20-20020a05640212d400b0046cfe2da588mr26575180edx.18.1672383593028; 
 Thu, 29 Dec 2022 22:59:53 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 u22-20020a056402111600b0046ee136fa3bsm9017131edv.69.2022.12.29.22.59.52
 for <buildroot@uclibc.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 22:59:52 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id c17so29376956edj.13
 for <buildroot@uclibc.org>; Thu, 29 Dec 2022 22:59:52 -0800 (PST)
X-Received: by 2002:a05:6402:14d1:b0:472:adc9:6ebe with SMTP id
 f17-20020a05640214d100b00472adc96ebemr2512683edx.397.1672383591905; Thu, 29
 Dec 2022 22:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20221230034540.1073086-1-christian__36217.5899137341$1672372007$gmane$org@paral.in>
 <pan$e2610$5473bbcb$9428bcc9$2fd44237@ID-313208.user.individual.net>
In-Reply-To: <pan$e2610$5473bbcb$9428bcc9$2fd44237@ID-313208.user.individual.net>
Date: Thu, 29 Dec 2022 22:59:39 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q-AEJCHbdKoD_VBaCp+be3HAg4LsujSkKgLBmQq=uAsQ@mail.gmail.com>
Message-ID: <CA+h8R2q-AEJCHbdKoD_VBaCp+be3HAg4LsujSkKgLBmQq=uAsQ@mail.gmail.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BU+V24947tAqid7Fl5FskSW4cg+BKE7ykyV6X1wGGWg=;
 b=kDr7u+jGQsFlcSA6NqPlKEkCmfdYANRPT3qBLgfkXadJfaDyhzfdn1d1lUl358A63D
 ZysINmMHDh5rQC0tnl68yLoYAXTbewMPcrlPcbtkcWjbA1iGUwul1aJ4D7+WZf8VHsuQ
 tnnp/ju2pT4+pUfKTXqCi7iNPeY1MU8qpGsnuQIx2zSbO+RandGcwEyJCogHunNOfTde
 8HHxQpYv1eA7eErri6coLtoUypfCVI2/Z3Btipqr3kKfnqj6YWMPfSk7T2zuQpPw2G1L
 fq1k+95pfH2bN4noKw1edo2nn9YEyiTCC1eN3GM9M39vLr0OdXOTckodUb/F2urz84zA
 pW7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=kDr7u+jG
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rng-tools: cherry-pick fix
 for jitterentropy build failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd,

On Thu, Dec 29, 2022 at 10:54 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Am Thu, 29 Dec 2022 19:45:40 -0800 schrieb Christian Stewart via
> buildroot:
> > Since commit a8807d updated jitterentropy-library to version 3.4.1.
> >
> > jitterentropy-library requires setting the macro
> > JENT_CONF_ENABLE_INTERNAL_TIMER to define jent_notime_ctx. If not set,
> > the build fails with the following error:
>
> Hi Christian,
>
> the build error is already fixed:
> https://git.busybox.net/buildroot/commit/?
> id=d47f7279f516ba2bbc6d1fd9dd37636902b9bad3

It is not. The build fails without my patch.

Note that this is about enabling JENT_CONF_ENABLE_INTERNAL_TIMER:

++AC_DEFINE([JENT_CONF_ENABLE_INTERNAL_TIMER],1,[Enable
JENT_CONF_ENABLE_INTERNAL_TIMER])

Which was not addressed by the previous patch.

Best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
