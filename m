Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD699E87834
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA608054C;
	Tue,  3 Feb 2026 14:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVS0jopAs-hg; Tue,  3 Feb 2026 14:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 531E383AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128966;
	bh=Utd/3Ca87v9Opru1xSPOwRt2RPtko4c6QfTdTKdOwHc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i9SvhK5cDBV9wx+kFf1Sohb7h74kbwvG17aXICHfZjSRi7ODMpk56cp3xwwM8z1p6
	 3bQMJ3EegMfc0UBnSDDAgK/jjTy4X/4hjshL+ycrvcJXVLRe1DiGYS5nJx0t0uei1X
	 PlAn7JQIb2FBCBM1+D8Flx1zZnChR5O05SidhuGqGimb4VHGCd/U+uras0tEkw+TOx
	 eoPmhhLj2i0SAF1oSHqgMQd91W3nusRA1W20j1jpzo+LgTzZ0VvJTsib1mR6+10/xW
	 lDp8/g207jqj3mR9GmIzqEKDhH+EyHrvENgR0L8M+jjbeGygR0ln89bJterN+l/A30
	 P8ElE+dcspdOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 531E383AFA;
	Tue,  3 Feb 2026 14:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB1113D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED1AB606F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9A77i35Frjh for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:29:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC77260616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC77260616
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC77260616
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:29:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43596062728so567637f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 06:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770128962; x=1770733762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9u9OxdMqNRP0zm94LhzYFmpxSaNpUHIwAFvx9TqhBk=;
 b=d+oJFpxYhoHPjijG9ennsfMIhAHLUA4KFYg8zjCA6XMdR66jar7sirCjEGMOyxzjVu
 DVNfiNnkMD+Jji8RmiYVYuKC1JkJc1yMpmEvZtVTD0tfnAYZBJHzAwL+FbmN+V5fp5kD
 w0teRlemZALSGWuXZebPEjjO4urRHtsXyQ33pslxaU9LjjEf25GP+/n2YvO4gWHhKBWD
 q5QaX1HlErayi/7rFBmIoJuAbTqIWqyYro+qgE0M114QuGucD79b+Kmwhm6gUxx7Y6Ye
 MDJ9USUERA4PMF23D76x4AD1cmlUbWHzmh8T0hW0NfwtfRhgFvC1J5QYHfyDVJuAY+B+
 99QQ==
X-Gm-Message-State: AOJu0Ywcvr0zZWj039lYPF5EsMfRBkGq1/W9hHJiM1JanFV4MBcM6iSQ
 TMJNP96um6N0ZJf4e7yutwonLiTIlW5B12mxHDJjzDUq89s9OZNJgSGXdAUvkctP+gU=
X-Gm-Gg: AZuq6aLkJ4YrmZUpLPhEu3WoXVgjtqGKn7OTFVuwNdWASNEfMPlCD6nNDvqUsHU/dcO
 jwP8eXVR0d5wLVsRWftnZPtsxG9LBaG8+CtG0n7JnC7xcgdxWSGx9kSMzbSi2O+PufjnKOKuTnF
 xKHIbJOp8aDvsnBbXsNHL7XkqLbjaO0JzTmL9U1aTWA8rfc7nrRrz8qDHktfQVl3UnqnPhSZVZn
 rwm9h+mrmkWyQVroSngFuy6/DHvKRogEb6n14pUtjW41dBpJLhdALCxxa8nOLC4ry8d89LUxPAs
 GsRAbX9isDjjGtyDAKNwUFpYQglJC/ojiqAXsuaMj+3EvZ89hj8IiwoNI+LiZXWT1koDSEndfV0
 aKrR6kS6qckh7X6j+nU5afKjzDo2AQC5xsh/Q6fHlG8AdOfpkt5DpUgM8jgpnA9/YkISVoL4L6U
 Tm17oaPADL5tAWsyWbbZDPjRfIkfZjQbCmLSVJXsU2cNNSbPL6CjKctwajBMGswdIthNv4GW0E2
 LHI
X-Received: by 2002:a5d:408b:0:b0:436:15d3:ed2e with SMTP id
 ffacd0b85a97d-43615d3eed6mr1808277f8f.0.1770128961743; 
 Tue, 03 Feb 2026 06:29:21 -0800 (PST)
Received: from [10.5.90.75]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce93sm51084811f8f.24.2026.02.03.06.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 06:29:21 -0800 (PST)
Message-ID: <2d13982e-75d1-411b-a7fa-f9b6264ccb22@smile.fr>
Date: Tue, 3 Feb 2026 15:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-5-elmehdi.younes@smile.fr>
 <aYH8O522wgwXYglG@windsurf>
Content-Language: en-US
In-Reply-To: <aYH8O522wgwXYglG@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770128962; x=1770733762; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V9u9OxdMqNRP0zm94LhzYFmpxSaNpUHIwAFvx9TqhBk=;
 b=PR96DU0ks6t15iI2Ec83grrqnRP0/Uc/KnAlCFeY76QO4v2WCLfozFe6mWNh3RjccW
 QGGGOJUgPPxd8QzZW4+7XpYwS4E7/V+qHul2ZujAyU/C2IkzsPSVGxU6rc6Tp6BWf9cT
 sPC+pJI0PQH9l4jmYQROvWMANB0LxiMZysQYE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=PR96DU0k
Subject: Re: [Buildroot] [RFC PATCH 4/5] linux: split HOSTCC from flags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 2/3/26 14:50, Thomas Petazzoni wrote:
> Hello Mehdi,
>
> Thanks for your patch!
>
> On Fri, Aug 08, 2025 at 03:31:11PM +0200, El Mehdi YOUNES via buildroot wrote:
>
>> Since Linux v4.19, Kbuild provides explicit variables for host flags, so splitting
>> compiler vs flags is supported upstream (see:
>>    https://github.com/torvalds/linux/commit/96f14fe738b69dd97a33efe3cc8ab330af5fd1f1
>>    https://github.com/torvalds/linux/commit/b90a368000abe5e015e0b045ca2ff7c2173b94c0
>>    https://github.com/torvalds/linux/commit/f92d19e0ef9bbbb2984845682e740934ad45473b).
>>
>> But with this change we can have problems with older kernel versions
>> (< 4.19), as the Buildroot commit below warned when avoiding HOSTCFLAGS
>> to not override internal kernel flags:
>>    https://gitlab.com/buildroot.org/buildroot/-/commit/dde090c299b0357fdb1a4ec44ad8d332ac57f65e
> Since your change as-is would break Linux < 4.19, here is the
> suggestion that we have after discussing at the Buildroot Developers
> Meeting: make things condition based on
> BR2_LINUX_KERNEL_RUST_SUPPORT. Something along the lines of:
>
> ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
> LINUX_MAKE_FLAGS += \
> 	HOSTCC="$(HOSTCC)" \
> 	HOSTCFLAGS="$(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
> 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
> else
> LINUX_MAKE_FLAGS += \
> 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)"
> endif

Thank you for the suggestion, I will add it on the next version

>
> Of course, if someone enables BR2_LINUX_KERNEL_RUST_SUPPORT with a
> kernel < 4.19 it would fail to build, but that's acceptable as it's
> stupid to do this since Linux 4.19 did not have any Rust support.
>
> Thanks!
>
> Thomas

Best regards,

El Mehdi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
