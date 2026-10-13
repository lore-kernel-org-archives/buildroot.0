Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7181CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BBF980CD9;
	Tue, 13 Oct 2026 21:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgV2iaqJ7g73; Tue, 13 Oct 2026 21:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9328D80C6C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925707;
	b=n2FknkURFtFK9q8JBickEwQocqwfl+LLHjS5j+kWAvyAVikpnKFt5BFtpurgc+6I2pZh
	 /2WvAyFvhC6esQecAf5QSIlfV2lfyl3Ea71/OIjnKvpXXd+PtvkChz0QnENMRap4ew7of
	 orbk0y2F8Qu+W7YfnRl9LD8Fc8USH1e15Hj6vWisY7+aMnFCf8sgJ/wextj4lS9i00E4H
	 MC41ae50mz1ciS2PDOtlvNV1UfpQScrQqBljQf5WAYbanX/2uFt4HfJdW5uTL1OZDDWgh
	 zJOHf5heB7o1ABUXzBEqxn0A89uXx+fn47O7rIoN59FjYCQIyZWh5Od2JRqdJV24RNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925707;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ns1ZELMh5+no7V8UpuarBLOhGlWF6CT4iMxzUxMOzMI=;
	b=LZDpE1HXIdOt/QxE9uxTin67gcd6K/Vs6JcPbEPP5F11ZTfBi5xm56yOvq7f+pTi/hj9
	 piFnrjYAo53R/yyORhaT6U0ZyxmPOIhNs5kKmBU1w2nJGdwZ9AagaR9tSTSzrNqTRdaDZ
	 tT9PATBoiaDVZSPqhMF9mjyFmIbTpF8uWRsYdgh9WPFGSpfirPn2R6lPquTkmUzoKpObX
	 2AKntuKgl/j+3BHawf6G0a/F/a5PmtsNgu3cyWZ5Df3kIzzqIlpPqow9bOqLGFYQ0JTiR
	 A/Xpr6SCQ8FeHOWpCLsNOTu4xK97c0D7QqhaErWjSG8EQZZ9q6N3ZmJuKP8NGd79YQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925707;
	bh=Ns1ZELMh5+no7V8UpuarBLOhGlWF6CT4iMxzUxMOzMI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W4V4a7mY5je2oLKKN3cUG2DN7MDw1unv76/pYgfq9yLZj+cxuCmaXEcrN6w/7QbOU
	 cp57KHsGKPqhtvt851bFdnz30hPdcIRAVZoqpU5a5D78jDLqf83njZPLVyEFfO92ld
	 2swRobv4bcCV+crw6BEJKCDrWFIg8FpXmP1mahiOmoixQcBhFaJPuVdkjB7QUuM1gO
	 nKIRydsEa+e3HiJ2gXQ/nt+uuT4EumxScSA6tvOJRzsmiR2ZQItQEKZ1/WFh5APz5x
	 w/D4vUo/Z6aG8gE4IrBfRBP/GB/6z542sx8Z0QYTr/5TVfUN7e4LIbqzmkIQMwhcp5
	 67G/Qz/atiHPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9328D80C6C;
	Tue, 13 Oct 2026 21:08:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C4EA2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32100607EF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y13PsGZl2zWs for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:08:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB996607A9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925704;
 b=o7dA+sm5mPGspaszTbJ8mhFAopAOVIEWYNciRuL6nljc5LOx16HjH0oE1a3kysguqx1m
 xeyToRp4zBCdaYsf4j/cZG4T/gbbpqzvg75aRmtqxF4f+q3Lj3ELXSE039D6S0+bUzd7i
 7buKWxjbOtXso56GVfmsWvKqffAWBHnsZBl30tZMggn2pxj98ASVna3Q/LBR9giXsmCN8
 xrvE0xO2L00NwLDLsLHyYPjcuKYLkrcg2+4Z1Zt7MCfrVHK/pH1jkjlhEVQdRFjcbkK3w
 ps55cXcmNAlPFLuufpUdR85MOSnfzYEOIpIhRYA7Xrjjh3L5ZsjFFbT4GJAljTFnqGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925704;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=/LkCgGIOatOeHgw1PbRH7LprqHKJEqVenDxwi2SGTZQ=;
 b=hMWfbp4YW5fMYPYdjSCULeFFxYNjFjyzje9PbSgPngQc7Llc5TsUBjgPlTiqaWZmIELt
 fGtVTwZnvfBjI9h9rt6zTPB6dprkRkzNucFHcHmAZA8nVjOityXPRQRDT0P5uGEO0jien
 /wmG8Oy2brFGvBYTIyRBIr8THv6QhkafM0C2wNqm89jPr3+lFG/LAdxd5yawiwNBu+M4r
 6iarobchKe5M42kQz+V2Qt0Negxc0fqCPe6Bk0VdaNv2zW1NTjbXtwjy8nLhEKFKtGuLN
 NjZFhUskKIccacIYiz1VxWds3X46YeNNbE2FTWCchiEpZL2u/wflO52kC7NeR7lEKGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PzGCowx0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB996607A9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:08:22 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6ac76a02368so3269312a12.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791925701; x=1792530501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/LkCgGIOatOeHgw1PbRH7LprqHKJEqVenDxwi2SGTZQ=;
 b=JMOj2MvpZoZSrsQpBLBl3ALco0ZZrKE4N4hHxlVmBpbImT6PTZgds7/4zvCKper3t4
 BxYb8Q2z5lAw5zarto9jaqxeDxpj3qJzvUuJ6sifSN2XP4d8y8kWzC/uygAnNBJm29/y
 8+aLja/Kxo0vsevt7iVi9mSjE8xJSg9pfqUapZoS9eZV2rbu7K/4VWDhy8SxDFdRsyU+
 F8wlwla42bTRwahJbgndAey+UgVNl3LLSgkroJdUkEq3BZQDebULqP+NqM8zg5fvAcnc
 i9xeH2D5P2Vc3p6BQoLkLZz8h4Cr7jluKe5bVEw+TlUwH/i+A+HM5JkX4eLfdXr2HrSL
 DZTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzRkazAm3BcEymH5kC7xoDI1H6siXwPu0833MY1cSz5wh9K+anXbKYBs6dd42KLiUPepgnh4XMrTfE=@buildroot.org
X-Gm-Message-State: AFq9FYIMP7Ikf6wG6KeUPOcJx+rt0Brh8ohWmwfWX90nsu7r+Sb1dc92
 5mF3aIdbKKmPQSTS8GPNtiWt8C54d6iuB6RYpmHWEif2rNDycAE7Gi2N+DYIdQ+JvIiDWhkSZUF
 2fQ89
X-Gm-Gg: AYBFou3hISoCEdPW8JELVCa++GWaG542FN88ZkSKyt/325DsjZdgApqFV+vYIb55Rhl
 af3zqqAWD/btm5893upZk9VWf9oLANswuFLc55JVJQ4sTyurtGeJPoBoL4p5Ib63ZRpKHGJIckr
 CiGGLoLrGhmKU709bn6EeXV5FjXlE/zdCg/9clHLaFk9dB8tL6OLVgPG9YlYcm339l7shu0oBPV
 Ry1kbrAmipRpRUHuaYVdwSlRJHaf26w7PhTEV3Zn3MA/lufzEi8PTEi+eMCx5cMomspGidhPopQ
 240hG6zO/rjE1VYNdgy2erbLaN8K8H2NChxocUYewJ4s6NSQDfqTGUHLaXlG/AVb4P+PSvKHb+F
 5ZiZOX8LMrAwTE0tAsnJkXvjCi9QAeuJKVrJ24zcRvqXiO19Z9VTZWIWIrUsQM0/zK037XzQwan
 QcIwbY90IWhhYnANREGOQFo6cQpQMuwrBtTtQZuwZqbIUA/3sJKOvamw5bWcm/zao=
X-Received: by 2002:a05:6402:450e:b0:6ac:9a44:d409 with SMTP id
 4fb4d7f45d1cf-6b17c1dec0cmr11868691a12.4.1791925700812; 
 Tue, 13 Oct 2026 14:08:20 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b20386327csm286087a12.18.2026.10.13.14.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:08:20 -0700 (PDT)
To: Tom Wambold <tom5760@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>
Date: Tue, 13 Oct 2026 23:08:19 +0200
Message-ID: <20261013210819.19943-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20250518153357.10003-1-tom5760@gmail.com>
References: <20250518153357.10003-1-tom5760@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/go: go-bin host-go provider
 implies target support
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

Hello,

Looks like this patch has been superseeded by 432cf9be9f43b26dbe7856feb3295b8e25c85048.

Best regards,
PERALE Thomas

In reply of:
> The BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS configuration symbol is
> used to determine if we can build Go packages for the target
> architecture.  Previously, this depended *only* on the
> BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS symbol, which is true
> only if the host system can bootstrap the Go compiler.
> 
> The go-bin package makes it unnecessary to bootstrap the Go compiler.
> Also, some host architectures (i.e. arm64/aarch64) don't support
> bootstrapping the compiler anyway.
> 
> Update BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to depend on either
> being able to bootstrap the compiler *OR* using the go-bin package.
> This fixes being able to use the Go compiler to build target packages on
> an arm64/aarch64 host system.
> 
> Signed-off-by: Tom Wambold <tom5760@gmail.com>
> 

> ---
> Changes v1 -> v2:
>   - Added missing Signed-off-by
> 
> Changes v2 -> v3:
>   - Remove new BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS symbol, and
>     just re-use the HOST_ARCH_SUPPORTS symbol.  They were always the
>     same value anyway.  Thanks for the feedback
>     @thomas.petazzoni@bootlin.com!
> ---
>  package/go/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 7e354b3298..a42e37f90b 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,7 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	# See https://go.dev/doc/install/source#environment
>  	# See src/go/build/syslist.go for the list of supported architectures
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
