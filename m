Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5424EC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15AFE40568;
	Sun, 24 Mar 2024 16:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYrO4N_cqufW; Sun, 24 Mar 2024 16:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59AF4403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59AF4403A2;
	Sun, 24 Mar 2024 16:33:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A47311BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DDCC403A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFogkSVHsKnv for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 576A0400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 576A0400C4
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 576A0400C4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:33:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so2876024f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711297988; x=1711902788;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihQHpT6aXidsNubY+3rb7thKb85djW86VaTbtbHy5z4=;
 b=mwvDBXwvBVMnRKYFeik/5dufLqkUkFol9zreuhMTOqyQd7PxWK8nxmlk0pnNUTbbLo
 eAeFFvoX0CA7a8uedklg5dLBdH/UZ0tYRY5CcQz6Ybj1iMANkHnEK+u0bJumYp1m5nFI
 aUFzt2M7YjuYHX+AuJyh+tJ/yvGPKn1hqM5u6S4mFQNgXKSx+kVCmtVG8wbBif+/fxZJ
 9L5J4XJOzSTDdIVfH46JKhK6oAOSLN3rCqokT7iUKVZUpdTZSJnd+OKL+8GsrOImCoP0
 K+dcpwM1qNJ1i9VD934WLao3++eri0BnJKwIE54rfYf2LtV3wTcc5tDm2Fzx8pDqv5fQ
 3UIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAtx8cNzRJ9UOS1GvtE/FrP4BnvWPnRBOHhMexzPX1WTC0ny2YHp34/9HZW3p0SgHJ1SROvjShZg7z/fNRJmVmX44QF6pXBQ==
X-Gm-Message-State: AOJu0YwV1Pq5cJzUNfTAUaucQznD+1QyieNdY5pyy/sg8w1zuSSSexAG
 iyjbJVmIUK4xd9hggonaVAxVpHEj0jaLkTlT22IQf2zSArlJJV/0wcv9wT1kNOo=
X-Google-Smtp-Source: AGHT+IGkQPy3TtQSWLdKvvwB2NKd1kK1OlsnmcH3D4dDsCJ8zs27ttvUxMWEHh5EOXz08JzcH1x4aA==
X-Received: by 2002:adf:ea42:0:b0:33e:621e:35b2 with SMTP id
 j2-20020adfea42000000b0033e621e35b2mr2836321wrn.6.1711297988382; 
 Sun, 24 Mar 2024 09:33:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ay9-20020a5d6f09000000b0033b87c2725csm7249308wrb.104.2024.03.24.09.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:33:08 -0700 (PDT)
Message-ID: <7b0c2b66-38d2-4853-8438-2671006a91a1@mind.be>
Date: Sun, 24 Mar 2024 17:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20240320221352.13766-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240320221352.13766-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711297988; x=1711902788; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ihQHpT6aXidsNubY+3rb7thKb85djW86VaTbtbHy5z4=;
 b=CKQ3+SagFXrICBVsFbYlHLHjBn90gcdUwH2Sy5yY0aB/oNezooenC+SuDyT/w8+pXm
 s5huAffE1vUiBv4ApuNVr44hCrNm+nEAmHW/Oh4Hh7I0v6CR6oGd0aKJriLPtXAC3Kba
 YnMyN4NrAddbsVS/JAPekgZ12zH/bsViOn5xCwp77i1vXi/znD6CHqVp93T/aR1m63Kx
 LZRwPEXsbK6G+g0H70gEVyrMxE7mOjdMapfKcmW3Kadi2NkT5HSaqgtvY3iE03TemkY+
 K4r9Frapm2GMxNs7aBn4T0i1p3S1v+UsdzHdq+Kt7UHZXIIqaE6wCOoxesE7AO/VGYid
 ZWHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CKQ3+Sag
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: disable riscv with
 uclibc
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



On 20/03/2024 23:13, Fabrice Fontaine wrote:
> Disable riscv with uclibc to avoid the following build failure with
> uclibc-ng < 1.0.43 raised since bump to version 2.1.6 in commit

  I believe we generally don't fix issues in packages if the issue is actually 
in the libc itself. This does mean we will have build failures for older 
prebuilt external toolchains, but those we should fix using the exclusions in 
genrandconfig.

  I'm putting the other maintainers in Cc to check if they agree with my assessment.

  For now, marked as Changes Requested.

  Regards,
  Arnout


> 47b6737e841baf8b666ea9f37edc5f169652e88d and
> https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:
> 
> /home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
>      4 | #include <sys/auxv.h>
>        |          ^~~~~~~~~~~~
> 
> Indeed, upstream is reluctant to avoid calling getauxval if is not
> available: https://github.com/zlib-ng/zlib-ng/pull/1700
> 
> Fixes: 47b6737e841baf8b666ea9f37edc5f169652e88d
>   - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/zlib/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zlib/Config.in b/package/zlib/Config.in
> index 3a486376ac..346202c8bf 100644
> --- a/package/zlib/Config.in
> +++ b/package/zlib/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
>   	default y if BR2_aarch64
>   	default y if BR2_i386
>   	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> -	default y if BR2_riscv
> +	default y if BR2_riscv && !BR2_TOOLCHAIN_USES_UCLIBC
>   	default y if BR2_s390x
>   	default y if BR2_x86_64
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
