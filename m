Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38095EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A701420E0;
	Fri, 13 Feb 2026 19:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gmw6ta1sQ64y; Fri, 13 Feb 2026 19:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E31F420F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011522;
	bh=4qYsq/T+fkDE5KCwQQ74251HHRgUfylLpKaa+lkytRI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K155uPCeKHi533EKO6qjFdfDXhKT0CX0ubEFRCAqSozehSn6h54FGNz7q3NKHLWOD
	 fATQE80PdEzOat2N+YoFbL4ZSsnqVLH/+wd390V6QTHhjp/ugoKiiRFZ6IYxfieDwu
	 q6+XP86pMolREAAcdqDG2lgDTkM7VC27kJ0q4ifD36nISoDlcRA2qcLCYUgqVurFPJ
	 rY0YG7vMlV+L6PPXWRPng++XBWJdKifhBSw/vJ4uHUrnA+flSBfvRuuNLZ3Fg5y7uD
	 B+nfSIUq61wS1Z1f+F3qnjDfrQB0f3sD58+M6lENWVcCEnoFbhEstCcS/yqHeC7TAe
	 +7FPTZh6XyCNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E31F420F3;
	Fri, 13 Feb 2026 19:38:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B18CB69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A026141F97
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1FMyIhvH77I for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75D9641F8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D9641F8D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75D9641F8D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso10013445e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011460; x=1771616260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5Lud0KoIjvBQWY5XgLJJosKhHecL3bKXY3nkQvtM+GE=;
 b=vx3NCVVMA+gtPS+Xz3+Sa4RlftkZXKRkwcfMRS+tFuttATSSADYnNisMnbBt4kxmJ1
 CbH5aANY2rwgHxxZowSoyLwB1yiy2Vz6MWp9HPxf4DQ1AJw/mdSODDhFk6/tuCYFIUJs
 JXnO1MUTCYRKIQvutZ69gWDM47gX746GMs4840PKhcZyxYNPXh2N2VNXDqURDotWtmoL
 LWcVY03rbvv0udLoNufLCS3LqXHaezKyEUYlNVLXpObD61IOvnQlO9xw62OsHGWVIBFS
 pC2RO3LtmTvAG6Y/k8p8qx3iJXqsjAlasOUw/QYniSKdmL7jI1BVdyEsokgmFyGo8zA6
 9l7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaaT/48b/+fgRb7jD15Ns2YHtr3aICQe2LUEofpyvE8mWBElzhr1I1N4VyTBqL23wiWzejlr3o01w=@buildroot.org
X-Gm-Message-State: AOJu0Ywe8zjC0xlTOAH4WXoBwvH+0BBCC1xqllOqYr6H2c5HxYT23M4z
 w+r0Zko0O4gBAICAOs353Y5WB/ZW+flliGIiCryzQxGmR7ZIpzNp+Jx53a3LE0p1X8k=
X-Gm-Gg: AZuq6aLWhNI9MwN70/PYvqEcRdzeyxPGNlSlT/aHnqzOnzmSeu4eWwn2NwRxH2NsReE
 1dse+a55JKe0PwFyy0xDzzQnf21dQhkkq+GpiR7cB5UJtxanZAO2/IKZjygLQoDEcfbVP+21r7K
 8bM8CEGJc2ncDzEX5F+jVEIed9H/QysZsgEbJsNs7QK5px7AA4pWcrbVhjM78VcwwdrMx/LLk1C
 9pdNIyjTZOa0erQLsDqp9iEi7lCauXhd70Vf5nLmIfe3ehh/k8NJ6Dt4Q9H/I/9oYPMJcuNUZzr
 uAukOhkbo696MbaLT/lPY5jPsZ31bTW8N2YHh2MwfugOIVkThdBCRgP+60w+U53HXJtkN9zh9z0
 Z3YrMj3DljIjbfAhH27oChxgr1QyYRyIB00J8G1bQpnizC7sruHecagYkuiZrNxt5gaHX31jBVc
 gTLqZbde9lgp49T0E=
X-Received: by 2002:a05:600c:314f:b0:47e:e970:b4e4 with SMTP id
 5b1f17b1804b1-48373a6e371mr39071905e9.29.1771011460224; 
 Fri, 13 Feb 2026 11:37:40 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8075sm7554277f8f.29.2026.02.13.11.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:39 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:39 +0100
Message-ID: <20260213193739.40247-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105194056.2156773-3-bernd@kuhls.net>
References: <20260105194056.2156773-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011460; x=1771616260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Lud0KoIjvBQWY5XgLJJosKhHecL3bKXY3nkQvtM+GE=;
 b=dQwJIwqHhZi+ICQBmq632F5c1zWcX1Aysn7AbUomJVOmLt2pDWLHVSRsgo5N+FoPMf
 z6tVSvWJ1in6MF1CuQsxl9WARo8pCD71b/1777vLPo1BtEkIzRCmvYbIV9iY5hKpF5eP
 RpKJbdEMSarWmuw9UyO0WtX4AzBvdCzhsYJ3hAMA6JGxXjemDlVgm17V5ohvdiGINryX
 uyde2LsESieKdkORt7/6HSNidpex/DUckyndvdDXFE8Yqgext4qsi2TXFCmsP6oew4vG
 Wjc5mXeTPQAxjIOhZd24HXgJ95QnNj5LD98Gubiv4VPZSU8AZ1laGRR7uWecxQAdQ4VY
 MJqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dQwJIwqH
Subject: Re: [Buildroot] [PATCH 3/3] package/dc3dd: needs MMU
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
> savewd.c:75:27: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
>    75 |           wd->val.child = fork ();
> 
> Fixes:
> https://autobuild.buildroot.net/results/40a/40a90638f90260ca2cb51bac03b0f8fb23a6ccc4/
> 
> The build error occured already in January 2025:
> https://autobuild.buildroot.net/results/9f3/9f3fefe5578dc41272e460146b566ac20f6cde75/
> so a backport to the LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/dc3dd/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
> index bd181b7065..b4b7dfd691 100644
> --- a/package/dc3dd/Config.in
> +++ b/package/dc3dd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DC3DD
>  	bool "dc3dd"
> +	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_RISCV_32
>  	depends on !BR2_arc
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -13,6 +14,7 @@ config BR2_PACKAGE_DC3DD
>  	  https://sourceforge.net/projects/dc3dd/
>  
>  comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
> +	depends on BR2_USE_MMU
>  	depends on !BR2_RISCV_32
>  	depends on !BR2_arc
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
