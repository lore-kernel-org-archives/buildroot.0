Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAC3C30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 04:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3F4846B3;
	Fri,  5 Jul 2024 04:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QpHch2MBNz1; Fri,  5 Jul 2024 04:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55E08460D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55E08460D;
	Fri,  5 Jul 2024 04:54:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCF3E1BF291
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 04:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BABF560747
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 04:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1-ZfAtUhOu7 for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 04:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71904606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71904606B4
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71904606B4
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 04:54:54 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c66so460741e87.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 21:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720155292; x=1720760092;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=koq3psPGdI6VrbzJ/QYnc2XrQYCScrpS/qQvDD1zwwo=;
 b=hlFzHIb17tSG7kJmaXaWZLjbEu8ldbkbWnDEP6uzx5D1dJ+TOyzZGe1FW5txyEufnq
 GxFLUfA7p9tbQ65Ri8nxSpwHhD4+QmIwjfrp/7eGwIRUCbtZF6/RklnVEzKA7hlzRqNR
 aiisM3/OSR+nu43gBca7XOFG3KTuAoCvVv5dSW1dAcO2r4Q9tJDn5ovpi96HjMzF/5r5
 kWc8nQev98GJLZ2mgfqTvfhGs+ZQySXy0YsTHSxjOOJvNK0GpBotJvNBrrhQ5JF+MYaK
 V4qlPhQ3rre0tkDRrQbK7edBOI1fnrEt+1qn5Rvi1HugaVRPEKv+ui07a3EU5jLuRETW
 oTpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpK7LITv+lzQ8OObGZ8tFCq+8E/RoOu5WlGCtNMfxBXr03qTcbMgDQaIohNyfxbayEydb0NOsuZOfi80B32P3T8IzivIxqng==
X-Gm-Message-State: AOJu0Yyqy6orb3F3IuYaGthMgZsDd0f+qnEKeCZk8zTHbOp4kQfK/AvR
 TxEcuflHfDkynZKDfmVnSee4G63RKEXiAuWXVMiP/Yiv0mvCT7K2
X-Google-Smtp-Source: AGHT+IEFKbrq2Naq8CEPHZmytlfrsuXP8EL9Di1LCo7+hutdifMVHFTiSqwHMVzdOQQx+WQP0BOduw==
X-Received: by 2002:ac2:456f:0:b0:52c:d628:c77c with SMTP id
 2adb3069b0e04-52ea06a6d17mr3113401e87.43.1720155291728; 
 Thu, 04 Jul 2024 21:54:51 -0700 (PDT)
Received: from gimli.local ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ea3310693sm225346e87.90.2024.07.04.21.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 21:54:51 -0700 (PDT)
Message-ID: <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, Peter Korsgaard
 <peter@korsgaard.com>
Date: Fri, 05 Jul 2024 06:54:50 +0200
In-Reply-To: <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
 <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
Organization: Addiva Elektronik
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720155292; x=1720760092; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=koq3psPGdI6VrbzJ/QYnc2XrQYCScrpS/qQvDD1zwwo=;
 b=XF8op756L1j7QY2XELMveEVB7YXmMKrUVAEczurSsaUthjTA9XFi1PQOWIhZlN+kip
 zd2GM65VRD3NhrzBZxCA00xwRvrYZX2lFfodYkLs0argnpCXyBiovlV7vrCR+oRVAn/y
 EUrSgyLgHRZM0+TLPBsu2KFsrF/FZIbEB4qhS8OIdSM5KNBR9rAtu3YK2s5+RUL1bdTw
 AG4s7rkZH/nJ7MNGM9kn4JYgzgqg2j76fnADkWJMf6a4eqxhjqvIbA4oSr5TpoJisQr0
 qYSsJIUXbQ3JczHJnHsgDQwYZbBTPYGsBdUu1n7gzuPpVfH4AWH+PZyQesvrAUW38dVI
 oxTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XF8op756
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
Cc: Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2024-07-04 at 22:10 +0200, Arnout Vandecappelle wrote:
> On 04/07/2024 14:59, Peter Korsgaard wrote:
> > Yes, I will get to it this weekend. I'll have a look if cherry-
> > picking the fix on 9.7 is better than bumping given that DSA keys
> > are no longer supported.

Peter, I had a look at the https://www.openssh.com/releasenotes.html
and apparently:

   "DSA support may be re-enabled in OpenBSD by setting 'DSAKEY=yes'
    in Makefile.inc. To enable DSA support in portable OpenSSH, pass
    the '--enable-dsa-keys' option to configure."

So I guess with that 9.8p1 could still be a candidate for 2024.02.x?

> The Debian patch [1] hopefully applies cleanly (and hopefully doesn't
> depend on anything else).   Christian, Joachim, would you be able to
> test that patch and perhaps even send a Buildroot patch against
> 2024.02.x?

Thanks, it does apply, and everything works fine on 2024.02.x.  I have
however not been able to verify that it does its job ... have tried
getting the poc to work on both unpatched and patched systems, but so
far without success either way.

Anyway, I'll post a Buildroot patch against 2024.02.x shortly.

Best regards
 /Joachim

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
