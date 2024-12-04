Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270A9E77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6358407CE;
	Wed,  4 Dec 2024 20:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgBIRJWaRRCG; Wed,  4 Dec 2024 20:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89B89407E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B89407E9;
	Wed,  4 Dec 2024 20:12:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69151AE8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A5A6407A2
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0EdWHe9MLLm for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:12:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BE6540793
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE6540793
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BE6540793
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:12:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e06af753so89273f8f.2
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 12:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343165; x=1733947965;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ITh7qm7NZ0K8YQXCaW6Wf9YAIfT6bfc2MaJ5S8bxD4=;
 b=NrUfiA2Ll4nAJLgazbbHEiNm1kJjNMlEj/CQ6pC8EPmkDYRU//2+uedwyzaFs4PqZn
 MHs48TL1m8HemXXoUGjlNwt9OTaJYE672RfHuYvMJCHlAhoibg1AZpphTzPJzLwYO0ce
 9flfsxqZhAN9mhowQYZYVqV7IKLY3t04H8ytDxm7Vx303WOXv8bp8KVQKWdAR4auRvb0
 Q2EPbpAfXOu2vwt3p+F7hq75VSjRvUeo0MpxV0fuqLaoUvupIoUh1vTiLY/1iGnEJteK
 oUXl2BVsGW+09Zyia50GWevp3bWoHwh+HSnXdVHfyV/qo+wESaHtyZA+Z4vkY/8h6sZu
 DmxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEmHsakrrqAzh7fqvhnWVOZQSbHGl8q2IrfGMiRRO9HcfdpsDoYdHkT3W8PMKXRIZHm73kHYhnods=@buildroot.org
X-Gm-Message-State: AOJu0Yz/h1HN59x7HebB62Kz6wcx8Fa1oepEqr6ITxqM0JVInJgb4tPP
 lvxRWavwy2sOCccGR79Z7+BwQ3Q4nlM0uZORejEOTFTPAs26crlh/2VI8Z9JWSs=
X-Gm-Gg: ASbGncvaEMlQ+Lp5ZLZk4Wu94PeLb51j4hPsX74A+c8QUlY19tucqBysU4Jpt/Hhehq
 TgJHGsXZ1ZdiKFg+MvbCmaabM10piVClQJ2LYBOSPX5EDTS8kfTF5VXQw9QuSFXcKHa6kwAeGqg
 abq1pT4OBgI6jrc1BhZMMVEhNimorn4d71XtAihZFxLNmY3UW7DraYIsGVQ7gkCSG7uc91fDyep
 Nm2yYXDH6hl22XBtO4AO9rLytw+v7alnwE5rrfc05ZtT8BtjOEcU+FXIpHGJIhGSQVzhIUWhIZK
 wuqQcKuqr7514+VKckzAagy69u3AVpGrT9eXdEWsoyLdLkTR0H1b9lShfAuWSVXj79Y7e4bjeTb
 iVAUP
X-Google-Smtp-Source: AGHT+IFXNrjEsV23kHTaVzbRneZaGwdemD7/xIKVx75TvDsafi7ut9GC1e2WlA9W//shxZVcgdJ00w==
X-Received: by 2002:a05:6000:440b:b0:385:df43:223c with SMTP id
 ffacd0b85a97d-385fd3cce20mr4810808f8f.13.1733343165049; 
 Wed, 04 Dec 2024 12:12:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd687c3sm19655715f8f.77.2024.12.04.12.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:12:43 -0800 (PST)
Message-ID: <2f1a6309-ec06-4d61-b181-0c263f9054c7@mind.be>
Date: Wed, 4 Dec 2024 21:12:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20241101213855.3427509-1-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20241101213855.3427509-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733343165; x=1733947965; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1ITh7qm7NZ0K8YQXCaW6Wf9YAIfT6bfc2MaJ5S8bxD4=;
 b=gFofbZBqV8o/QFdjtgi9AKHuzDVRuNH++wHUZ/xFvBnbGwOr0JW3KfU6uObzlgdDJ1
 nv3y53e5gL741xeDdB8btLCy3fpqWkZ0Z7+BIm74gb+sDudoMRnqRN8onv6tDRiJX5om
 zAQCIp64LU7mwaWXR6avJ8OnRi78VviWSykkna9CVb06tvit9TTvS42F4o10jKdCzsOP
 8EwVydAmmkl8Gr/nfN6Ma0BSDfN++0c4xAw2CBRzslHqYvF81lvhe99vATmyEHo9eNiW
 SBef3mFbJ6/IIui6D8JkDolma5s+MnD3cL9P9ZRQeG0HJbLtPE46qHibaxyIOgQr53Oi
 NvOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gFofbZBq
Subject: Re: [Buildroot] [PATCH] package/rust/rust: remove Cargo.toml.orig
 fixup
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/11/2024 22:38, Romain Naour via buildroot wrote:
> When the rust package was added in Buildroot it was using
> the 1.23.0 release [1]  where some vendored sources contained a
> Cargo.toml.orig file that caused issues with
> support/scripts/apply-patches.sh used by Buildroot package
> infrastructure.
> 
> Since then, Buildroot is now using rust 1.74.1 (2024.02.x),
> 1.79.0 (2024.08.x) and 1.82.0 (master) where vendored
> sources no longer contains any Cargo.toml.orig file.
> So this post-extract hook is no longer needed.
> 
> Moreover, since Rust 1.81.0 are present in
> src/tools/rustc-perf/collector/compile-benchmarks/<vendored pkg>
> where there is no .cargo-checksum.json file.
> 
> Since then, the sed command fail and stop the build:
> 
>    sed: can't read [...]/host-rust-1.81.0/src/tools/rustc-perf/collector/compile-benchmarks/serde_derive-1.0.136/.cargo-checksum.json: No such file or directory
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8232367821
> 
> [1] b50522d838d8ddfef80bf8036e511319982da16e
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Note: Rust package was updated three times with this issue
> (1.80.1, 1.81.0 and 1.82.0).
> ---
>   package/rust/rust.mk | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 802aa0f413..29c03594d2 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -25,22 +25,6 @@ HOST_RUST_DEPENDENCIES = \
>   
>   HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
>   
> -# Some vendor crates contain Cargo.toml.orig files. The associated
> -# .cargo-checksum.json file will contain a checksum for Cargo.toml.orig but
> -# support/scripts/apply-patches.sh will delete them. This will cause the build
> -# to fail, as Cargo will not be able to find the file and verify the checksum.
> -# So, remove all Cargo.toml.orig entries from the affected .cargo-checksum.json
> -# files
> -define HOST_RUST_EXCLUDE_ORIG_FILES
> -	for file in $$(find $(@D) -name '*.orig'); do \
> -		crate=$$(dirname $${file}); \
> -		fn=$${crate}/.cargo-checksum.json; \
> -		sed -i -e 's/"Cargo.toml.orig":"[a-z0-9]\+",//g' $${fn}; \
> -	done
> -endef
> -
> -HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
> -
>   define HOST_RUST_CONFIGURE_CMDS
>   	( \
>   		echo '[build]'; \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
