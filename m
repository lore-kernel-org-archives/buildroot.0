Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B296BC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B9B660DB2;
	Fri,  4 Sep 2026 12:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzEfs9mNoqwT; Fri,  4 Sep 2026 12:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2491860C34
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524329;
	b=ZzWlzmTnIEseRdieN0Czap/I6bIBVj25DvrPrfyrZYamWaGuWKYjHzLQdYcbuxm6BXM0
	 by4Aw+bVPwqomw8vH8u13qXsmTr+GHaKq8bElwaBFwzpwJPUcxe/HtLNSxBFHlYM9TH1o
	 0y9YB+Xf/9f1xLShn15p4M58LY+XVxAJcndEcHcxd8RXaZXyQ65ENWu19e9dD3kiycmFe
	 mxZFU5Y8IFUVKVYOXSaDavHJRtMWBd7jLUZ7Bjv3RVVZWIxhWW0V/PLkRpkFlg8nhgLCT
	 Tc86ISG3NNgJlTJNj3ZPF+sht//0/llI3HLbj8cTEma+4G4+vNQ4QImsKcq/+jGPprg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524329;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zsuW+Sb/AnyKn6+om4Ou/PGmcLdsecLL8ZZctYSxYo4=;
	b=jVjgDh1rN0rdtZj+aHs08d4YD1V7S4h9N9RTdj4dRfoURBUeVCyHQbSOQRhl8xvHtnlq
	 ZXL/G+uzdtequPHBHue5XLfGFdPOZmcB0XV0zcA47V9YEIviwi2jYQnH1upQVzXeG1Ja3
	 cjDM1AV4gca49AgbOWid4f+ZJAmQwlthw9Ku0Wn4fQkPH5pdK3GP8qsBws1QBFLJVUpUd
	 NXlFGgoZ9J0XuLeT4T6zI7OW+BnASAIVE59SI1huQLhNdmE5XfvD43qpKkrleDttOzR0A
	 vuAJp76IP1vE1iQWqCNCb6XUEMb5Kai64jvAa1mXKLj07Vv9odtfBxiicNRQ6++jekA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524329;
	bh=zsuW+Sb/AnyKn6+om4Ou/PGmcLdsecLL8ZZctYSxYo4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hEBmxoMRdj8zb8ln59eltX7yAtj7faFUiG2I/s0IC3bXp7aeM6LaCR65wdt3Q8HJT
	 ml6N273HSh45b/UFhSU2PYW6rIfwMWFx6PfjNXODDgFrSOUYM8JP8Pc/Dfl/6HjtBj
	 KH6y+gc4yIdklzqUwwCnDCxrz38cM94L90/jkqqv6oxgD4pWE7wqM5jiu1AzL491nC
	 JzwrCriYJCUqs9B20yGpEMiQfY+Hf3E3WL7Fm3BSgLZJeyJVeTy2y1bPN1+GUzdciP
	 ay0p5cPb+eADY8MGrNKuM6dQlpez37BT+tLwmAwJu2aooLEQuqVVMXJoFe3xA45vGO
	 LzuF7J98f0w+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2491860C34;
	Fri,  4 Sep 2026 12:18:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EEA7F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 411F640376
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeM7rKXmq3ah for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F28C240080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524325;
 b=cmoe5DuafoolRDST3H1BA5CgajthUfbkVJIStt2XqJ5uL5HELqSbE9qKwhGGC+Aabxnu
 M2nGbk5S6nUTI+0FmyE1HOvKSRZhT2xJBm9uKnauloj8BRyvl6FECYEcRSUlEvR7lCTcn
 6y0KY6RSuc5irJxPf5zMUTLMRg0Y7FbOKUjdEnZ2aywNs2BtO6qMPVpQCJBu+nPUrdlLW
 ZgCOUiEDv8OabZehgsUrqUaCo+Q5RaX0h3hci8tMpq03JYlhVTGe8v/Yjkn06kAN149g/
 e5TzhC10I2hLx7RYBpFv6JlDBAT38aqBOpERw6jInN8Y5NSiLwRm6jtPyBS/TVGsuqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524325;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=mN70FDpCW5AY64qAUwlReDg6Ei1/Ed1ssySbY6axYF0=;
 b=aA1WsKMOiay56LaI/uskSbWCw4YI/rPZXZgf1pj/kEtIViAzSkjmHYCBeJ740V3juJCv
 c5Iu9RxgeeOxgENABGzB9h9gIADpsgTsEpn7M6Qgp+1DuH5AFN1s+dZDhbUEvuA4dwC34
 yFMc2wP6LQjuillZRjaWKZ4/QAOP4T2K5B/GwUbQC1YXxrABU9yU2aajNLr10+qZd001S
 dz2iROIowCTHMPZbZYkP/2CosYo79Ggjv3YIB030NJQiOyDG1REggmxktGzJUbW4TJ1gI
 6qKnc5a+pT/OcLE07pDRVi6zhwBSwEjUgLWKK4uaRMRfNpe0qlzsR5MCc+6Ay38U99A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RfqqSYmS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F28C240080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so12467895e9.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524322; x=1789129122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mN70FDpCW5AY64qAUwlReDg6Ei1/Ed1ssySbY6axYF0=;
 b=tFLnD8v3+MaVsIpycH4lTjcTSF+xtS4ZlNRZ54iR+8eNciz0Y+lfEXAwFNgIDyTMj4
 gY7qBEdNz7BHaEZURNuDsJJeqUtFI2nfdRDncqRYRGR141uPWxijUHMFiOVBB5pKEUVx
 yzAZhlEjMdjG0mCmFJc7RQ1lx0mJvsxhUPyRdpY+A/djXtIHlaRSnYaR9Il9uld8SROd
 cFUD0mPGzj8Si8a9EZg3Tcr80M4/KvdsvOJKQ8xDuXQAnS32vpYj927IipQ33tMBNAGd
 Nvv7hJztCMlaXwzLj6AdeQAiWKEIOvnsqBHmBMa6x548v4RV9Jv4cG+N8Q5Q56eXN+QC
 RZIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxg/H26LWMknZnd3AKOTw9GrDnqUEmTejS3LFX/Y7cE0rtdeafQuVN5HBHq8AwY9V1yO9n7gMnorYw=@buildroot.org
X-Gm-Message-State: AFuF++kSvebECXny/LGHoclsFOkzGJtoa1dLBLS4E+prUsxwwaApxTuT
 dVJcJ0iWvs4rfwRhm2LDhHPe0y3c310p1D986KRPwPzZn0+Rv59cfh9tg+o48Iv65C4=
X-Gm-Gg: AYBFou2XCFlY7VHtHYu8YUbl98DFHzMQZpV2XuqtcY0wx3pqwee7/iOFgdTShWw99ke
 G32mkGZ1KHx3XdY1nOzOlRFBpCSosmPj6uD9gEtkgLWSCDg5VygCY3SxGOXXO2HLvBh1NHKLUF0
 7B3iEwP9w/zFkFMzU2jmVWCFpEZlhOtM6HkJz+StSDR2LHBsIyr3Nboc2i80zJ3f48+2YhQTIyF
 THsOY6bEBvf42u5T1liosCFsCOQs1/HsOvLt9V75XSxSYx8hEJFM1vS1VSYojwSLxEe+2QG+p0/
 nrGd8LKU02kQTjnFFveC3rZTbGnLk1zETpPViFw0EW95EmJnM9DEs+xUBTHV4Q3UCrRnT9Gsrm4
 sD0XqS4Uu2ng2OTjmdtZ4HrkrFP0/gSO0TImSmYyqE8NmU1OGDhDdxP0VhA3m/deT4JkxB/r7gi
 1RIuxd8mx0s11qOYI3D4hAZpNHWnbKp0OFtHSuaITDLn/t3/C/76FWWA==
X-Received: by 2002:a05:600c:8b2f:b0:49c:fa21:1c80 with SMTP id
 5b1f17b1804b1-49cfa211cf4mr38217395e9.21.1788524322346; 
 Fri, 04 Sep 2026 05:18:42 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6023d6sm149904705e9.8.2026.09.04.05.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:42 -0700 (PDT)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:41 +0200
Message-ID: <20260904121841.405853-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825093406.1932342-1-thomas.devoogdt@barco.com>
References: <20260825093406.1932342-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/expat: fix no high quality entropy
 warning on Linux <3.17 or glibc <2.25
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> xmlparse.c:150:4: error: #error You do not have support for any sources of high quality entropy enabled.
> For end user security, that is probably not what you want. Your options include:
>   * Linux >=3.17 + glibc >=2.25 (getrandom): HAVE_GETRANDOM,
>   * Linux >=3.17 + glibc (including <2.25) (syscall SYS_getrandom): HAVE_SYSCALL_GETRANDOM,
>   * BSD / macOS >=10.7 / glibc >=2.36 (arc4random_buf): HAVE_ARC4RANDOM_BUF,
>   * BSD / macOS (including <10.7) / glibc >=2.36 (arc4random): HAVE_ARC4RANDOM,
>   * BSD / macOS >=10.12 / glibc >=2.25 (getentropy): HAVE_GETENTROPY,
>   * Linux (including <3.17) / BSD / macOS (including <10.7) / Solaris >=8 (/dev/urandom): XML_DEV_URANDOM,
>   * Windows >=Vista (rand_s): _WIN32.
> If you insist on not using any of these, bypass this error by defining XML_POOR_ENTROPY and be vulnerable to hash flooding;
> you have been warned. If you have reasons to patch this detection code away or need changes to the build system, please open a bug. Thank you!
> 
> This is caused by the upstream commit "Autotools: Stop using /dev/urandom by default"
> https://github.com/libexpat/libexpat/commit/d30eca113a44562137d59835cf2255ea32d11ba6
> 
> But since all Linux systems have /dev/urandom, we can just enable it by default.
> 
> Moved config options to multiline layout to fit within the 80 characters.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/expat/expat.mk | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 7645edfd52..a82be75a4d 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -14,8 +14,16 @@ EXPAT_CPE_ID_VENDOR = libexpat_project
>  EXPAT_CPE_ID_PRODUCT = libexpat
>  
>  EXPAT_CONF_OPTS = \
> -	--without-docbook --without-examples --without-tests --without-xmlwf
> -HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
> +	--with-dev-urandom \
> +	--without-docbook \
> +	--without-examples \
> +	--without-tests \
> +	--without-xmlwf
> +
> +HOST_EXPAT_CONF_OPTS = \
> +	--without-docbook \
> +	--without-examples \
> +	--without-tests
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
