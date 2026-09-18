Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A880DC982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7004640D35;
	Fri, 18 Sep 2026 13:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppjav2xmFp4d; Fri, 18 Sep 2026 13:09:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6975C40CF7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736973;
	b=KiPRGnNcm3NF5T7GS6+NuyYyaqpq2eEvHLeks9XmmZgkccn69xIHTeWBauMhYtVq5bt7
	 +k1VZQuFZDGyzu9eeZ1WckDUMF5F+QizyZnAryuCQSU8yljz4kl1cuO0gjJYDJZihMEgN
	 aGnIR7Q5Ldi71VLNg95TOgqY3ixuiGVawo/bIpDWeUa+xP967zTiyPTY0SzUG7KtEiMcC
	 nOKfNntHn3vBXCCGNSd6gl38Iz00zzfilCiYf3WPW9Iigf4qvtwJufQdkIQei85JrO3fF
	 dMG9wqlNTdB/zTdr7mA6QuxRPAHNmNPjxwfJmXBAxHatzApd7q3dj/IgQhwzTtZ2uFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Au8z4rwux2SFUgESBXgXuRwvLzXwbljQN4eHvGg3WAc=;
	b=GDoc07UQfehleKmQq+O14ocvqRzCHVodLZtnUO9rOpmZYaKhARt+NJzRxRvXz8FHjOZp
	 FIQv7bF44GG6PelJsjsV7X4q8XP+y359yiP286oj+AgYCQTfXFHI3aZu+MdinVEDAr3bI
	 zF+NwknGhSsu70XXn2GSIp9QLWlB7r/bbXjEPaWO6xv2IfgJJHNSjEXmpF2qXuAINpu/Z
	 fTGMwFhfJJWmIEjVqBSNgWoZ5RyAGrlCetw03FACLG82kWLuhnCQYZFjLwMk8cfyCoksH
	 FIeFQ+5AoU694r/ISF2FfIwg0ekEMeRilX93/Ye1/Zyv3KsoTyNiyNwhMdumJ/2GV3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736973;
	bh=Au8z4rwux2SFUgESBXgXuRwvLzXwbljQN4eHvGg3WAc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cbmH4AZC/1N2JVIqwvHYmIkcowih04eFTO8FilCb2L3Zn+9XdREcxGd6YxZyqtUEA
	 sl3xjNnXmvWMoF2iOT52l7P3+WW9XuWNR80Yu7tfHc6yGGeQU8vPr2so1jeFSxpqfF
	 nW5M3XponC4CtxQfbLIjpcKxaF3fTDMjEWUKD0YAGmAysh8zhCg/+injZmB8f9rtBV
	 pfJncud+KmOXQJmywGkmoV2udWoouBHWEQsTcPpSE2Xb8RmHipRq+dhP8A6tQY+ByT
	 RdXrwXWPJRXR9gspgwKGnwBkIxDUqw36Y3JgYeiYQUo7wR/iMvz7FxPHOLZTQn/0HL
	 VTnKvoi+f/MJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6975C40CF7;
	Fri, 18 Sep 2026 13:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9870829B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EBB940D0F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnUar_U9sg28 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4518940CF0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736970;
 b=Ox7JE6hRjQOXsaS05gzYcskqKpxIaMydsOoWo/7Yl4xEfCGt9D3IuiCpOLOpmZ2WN1AF
 nLLU6U5kHToYGyCOaIyLyaPP3xrGWl8UQXY2t0y2O/ayMYW16GS3wFVQikhHemBPn46xx
 VJPS22i8cd0/4E3NPzS0pQqdKxjseRzh0HTMNdfZ0rkvsAyNra7Af8TiFN1TnMxOwluFe
 +S473i2EwgMkv9C+xIOwXUFWD86QacKQaehxDzkY6ibmyScML/g3lgezYDQADuJIKojwb
 EbwRDh7LyVy9peVkgRBxYDu48fwNEa1DlNIT32Uy/J+B5EOIyU5TO5lshWDCYmifgCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736970;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=RqPzf+xuK5JDOk0TJGVOpWYvlx7E9knaJcJBVn4nlyY=;
 b=LqxoxBXUsjS95Ga/PAig0beY84Za0AOgTiuwp23dwqGDMQQNU+y7qgx5m+g30pYu55qQ
 76BIlXKgMBGiiIvpXDGMHG0vtQQSXjQPTsUzwllyXfK0eR+bA4MaN6k1tOYY4Xo8ibt3s
 RXGa/Po/8Gt7C+Bi+tniqORfBedpdFjGIYahIbYZOb8NjMeo8CmGai2s+72qlyClt2DD+
 Zso9jBLkAuuxwjEYcEDp7eQvLAy6/PQ9O2/AzGp+fV7lJYue0VVTPefWaeSMTVXzqt32U
 GWDVUBENG3hbYJM/1p94GSqvLv1EYZaamhS6t4Rtozdqj+f/Bqm3cn098/xZ5NpTDyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hJ03Gp82; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=thomas.perale@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4518940CF0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:29 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-486e1a044c5so450755f8f.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736968; x=1790341768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RqPzf+xuK5JDOk0TJGVOpWYvlx7E9knaJcJBVn4nlyY=;
 b=brNxqsKRArZF2W6tFd2xL+PdC7hiNp2q+1gLPqGoeweihxdUgLIr0jRegbSctWOVWV
 H9t9NgVYh3WOYgatfe+XP2pmQUjIj4m/umD9w6SVuCpBN8sDj3zu787Whw8oDzyekNpZ
 nttiY5fpmXDN0sUj6Lj8YO3z/DtpJ/a9e2kp/sa7uZ8yw3n8AnFoTOZgMHXusFDIhibM
 0yINMf7ZS6RwQjLI/c3t3WnjBtse3CL27bv1MyWpkO+LDH0958Qen8zBykaZnfDxzRl1
 m/NCGKeBhoQFKb45OUFfes6WcwQ3wxhq6jvDWA4EJSVyxaTX+z31vYnf4dAQt3CcPnA0
 veBg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwWXqN6+XGbOHnvfRmDYmf9dYbidxKp+gopV4uQEYdxo3OlTQENqxRDLNQCnwhMeq5BSn+PuBi81A=@buildroot.org
X-Gm-Message-State: AFuF++mxJsdei0Xhfwfpv6e9FWMZhGieH4TlQc7wyNjkM4+dOCPpMlx5
 JUzCbKx6H2PJ/bP/xi4g4f7z8ynSzJ34qLK9UkkofVwzjgMmbaIkZAC+b8FRMhVszms=
X-Gm-Gg: AYBFou0nJGUPQ7btzjt6ZkpnnWETjW+JxfZnWGv2kQJBnyycwbLW22QL3okYJwmBDbJ
 bLsp0yBg9VHqLifbW5a+HCD8ppKUM1SGezAi2YQB++ziYbt4ag1til8H/Nndrioqw35NjUyilMP
 KUPGAE6X74EXbMv2NuWshpZ/aCzkup9sZhbIeW+ljqcaDvRGYD3Yu7xLLsPwBt63nDqnvrEYfLp
 Frt3sescbLD97nMzrVozYqr8oE7ShMBXh/YgPPNg5wpH5WA/NJPj8yYYqqa+RmlY8Y1efG+hTSu
 V8k3I6ndydcI9rcHvk/DpeSW8w1ZYi7yAgylA6iMMRDgHPgwZhvfL1Vpv89baa4haTwoYeKXmFI
 pXEvvtjd4asD8FmKARlp4mLWDvwYYyROT5hROgEoGGyLOoD/3LjY4+i6y4vauxTd5ORiQxhNU62
 a3Ny3AZATU6vY7TWXp9SrBCJ27inM6Jz9affe/8MZnsNA2eVYFKN+bWvgUvhn5ZCXN
X-Received: by 2002:a05:6000:4025:b0:487:c99:8bec with SMTP id
 ffacd0b85a97d-4871e21232dmr3543706f8f.3.1789736967679; 
 Fri, 18 Sep 2026 06:09:27 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871ff56411sm4459515f8f.21.2026.09.18.06.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:09:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:09:26 +0200
Message-ID: <20260918130926.163305-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905062316.383690-1-bernd@kuhls.net>
References: <20260905062316.383690-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/i2pd: needs gcc >= 8
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
> Upstream started using std::string_view
> https://github.com/search?q=repo%3APurpleI2P%2Fi2pd+string_view&type=commits&s=committer-date&o=asc
> 
> with commit
> https://github.com/PurpleI2P/i2pd/commit/a3e0b3710c66b854eee33d7532cbe262e9a72ba0
> 
> first released in version 2.54.0 which was added to buildroot with
> commit dea4f02bbb24b2125df6f4aa7a4b301a2316ef06.
> 
> Building the package with the gcc6-based defconfig
> bootlin-aarch64-glibc-old is broken:
> 
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/i2pd-2.61.0/libi2pd/Base.h:14:23:
>  fatal error: string_view: No such file or directory
> 
> BR2_TOOLCHAIN_HAS_GCC_BUG_64735 can be removed as well now as it depends
> on gcc < 7.
> 
> A backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/22dfb2cf28943aeaf56911d53553585d6047adb8
> 
>  package/i2pd/Config.in | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
> index cb6f7894ea..fc2f3b9367 100644
> --- a/package/i2pd/Config.in
> +++ b/package/i2pd/Config.in
> @@ -1,13 +1,13 @@
>  config BR2_PACKAGE_I2PD
>  	bool "i2pd"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # string_view
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	# pthread_condattr_setclock
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR # boost
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> @@ -24,15 +24,10 @@ config BR2_PACKAGE_I2PD
>  
>  	  http://i2pd.website
>  
> -comment "i2pd needs a toolchain w/ C++, NPTL, wchar"
> +comment "i2pd needs a toolchain w/ C++, gcc >= 8, NPTL, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
> -
> -comment "i2pd needs exception_ptr"
> -	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
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
