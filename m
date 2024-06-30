Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C4AC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E398116C;
	Sun, 30 Jun 2024 14:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SG3DH4dv7Hep; Sun, 30 Jun 2024 14:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD7AA8113A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD7AA8113A;
	Sun, 30 Jun 2024 14:25:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B341F1BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E0EF605A9
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeBxWHh38ul7 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEF80605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF80605A6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEF80605A6
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:25:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4255fa23f7bso15700985e9.2
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719757501; x=1720362301;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RwpmXZ9kzjLMpuSfeyyxpBja/a7BGazD8yEoiaAoJfg=;
 b=VYomeoeGuOaEPwlb2YZe4g4lkHmN6rFi0cv9HT1ZARV3vl6hqEX3ErXhCNxwLpWjsE
 h72BLMA5XHNZzzIOWXljW8tTHCL9P5Iursx8KfubCjELFbkoE/pGnulGkZJ1B+uZS5B2
 zjxPp3fw9XrmuPNmCgpRT3TpfHa537Uk+VIvDseqQXT7GS/b+j6ehePDm/YewpqwlyRr
 ehVVOkMc/RHLGdG5rygP318Vy1qgeS0GJC2RgQmlJ2SYEWgjQGrQznsT7s2lFgRKKJF5
 j5nBW3izeXkXWwr4nl/oMj1WSvOYydqWAlK+RN4RiYF3RhH3R1yLHLGA4JhAci/dMpY4
 EzNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwuP3hd0kUqaACOdPfCQL0Iqa2Olx04OJgLE7aR8W7L4+LtUohy//Kxy0c/Vcu91IG5IlwAogacE6GuL3fv/0QbfduUZY7Dw==
X-Gm-Message-State: AOJu0YzQP8QcKB8rTZpN+olFwyiU6gx+NS+e+H/7RWmAjAWln853XMPh
 ELylKTYKr1z3Nv56im6IzYoNSiaNibMgF7ybhEJignjyZ4FaxWmz06iM8whmNfE=
X-Google-Smtp-Source: AGHT+IHkgR4j4CSq5gJzeIYLFuABmMsmAnG+4eF3kFGxbpFBOW2yCUNq+x7VpJJ80KhH1ZKNCX/pCA==
X-Received: by 2002:a05:600c:1907:b0:425:80d5:b8b2 with SMTP id
 5b1f17b1804b1-42580d5b949mr6334545e9.16.1719757501128; 
 Sun, 30 Jun 2024 07:25:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0642acsm117262665e9.25.2024.06.30.07.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:25:00 -0700 (PDT)
Message-ID: <708a7766-b35c-4b94-ab28-21e53020f1f6@mind.be>
Date: Sun, 30 Jun 2024 16:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Kennedy, Andy A Collins" <Andy.A.Kennedy@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <BN2P110MB1060371DE485BB6BB29E11DAC8D6A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <BN2P110MB1060371DE485BB6BB29E11DAC8D6A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719757501; x=1720362301; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RwpmXZ9kzjLMpuSfeyyxpBja/a7BGazD8yEoiaAoJfg=;
 b=KVHKP1SZUplGDwZl2HiytIyLQFh1aC3a7UB6fLEcI8xweQhn+TwY0AAmsafviKvpUw
 +uSi8cD5GlhJQGt7M1jfGUTf0KzMInlykh5JS7LZHCQ/nEnuy5IORtO6BSq//3+3J4fU
 uDdGB94HyHD7shUZM+QX8j8UBKCtBMUJGAzE1yMuup8XTYh+y+la8Uu8/Cx6yv6iMiQl
 ODTIOeZiZRxyzi6OuyiNmEKFOHtEiZI4eaaTWwlsELB36vUMK8Haspafr9kdLjGG71iy
 /5w1AsZWmeCYY2n9a0RtVL8Sj15Qc3pPtc7KGqCany0a5IAgl/D9MF12sG0jvkR+MbQc
 gHnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KVHKP1SZ
Subject: Re: [Buildroot] host gcc?
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Andy,

On 26/06/2024 23:02, Kennedy, Andy A Collins via buildroot wrote:
> Many years ago, I recall (perhaps erroneously) that the toolchain build
> also required building an intermediate gcc to get to the latest version
> of the selected toolchain.

  We still have that: package/gcc/gcc-initial.

  It's not a host gcc though, it's for the target. We need to build it to be 
able to build the standard library, and we then need to build the final gcc 
using that standard library.

>  I now require selecting options that need a
> toolchain that is older than the version of gcc I'm stuck using (for
> reasons I won't address here).  Specifically, I'm attempting to select
> BR2_PACKAGE_PYTHON_SCIPY which has a dependency of
> BR2_HOST_GCC_AT_LEAST_9 and BR2_TOOLCHAIN_HAS_FORTRAN, the latter of
> which is easy to overcome by configuration.  The former, however, is
> what stumps me.  I need to provide a gcc that is greater than the much
> older version than gcc-9.
> 
> Do I have an easy path to this goal?

  The relatively easy path is to build GCC 9 outside of buildroot, and specify 
it by passing HOSTCC and HOSTCXX in the environment. Or making sure that GCC 9's 
installation dir is earlier in PATH.

>  Assuming the answer is no, would
> there be support in providing a way to select the current toolchain
> gcc build as a host to host compiler at the same time?

  Sounds like a valid idea, but it's not so simple to implement, because it 
means that HOSTCC has to change somewhere in the middle of the build...

  Also, it's probably better to stick to a single GCC version, and make sure it 
can be used regardless of whether an internal or external toolchain is used.

  Regards,
  Arnout

> 
> It is good to be back!  I've been missing from BuildRoot for many years.
> 
> Andy
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
