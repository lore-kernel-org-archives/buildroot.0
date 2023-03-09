Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BAAC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A633960BF7;
	Thu,  9 Mar 2023 19:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A633960BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRE7kgdzFQvO; Thu,  9 Mar 2023 19:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1ED60BE6;
	Thu,  9 Mar 2023 19:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD1ED60BE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5CDE1BF410
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F496821DF
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F496821DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzxINqOLwRbD for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 19:40:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CC8820E4
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75CC8820E4
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 19:40:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cy23so11385648edb.12
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 11:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678390844;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TMLz+nCjtM9Va5LE3iksP+8ua38KVuu+Z9BzzhQXZH0=;
 b=U5jZEyEulWo335Wk5cfRoi4frJyoGMFz547WyO4tp9sX2QyfaB1eBbsleh0A8zf5sl
 zuEaOZJUV306q4R3hKHyHTYujMR9OYKx9LI7qYNKM+eT6PuyKdaOGfvT3BNfLb9fWCo8
 Ct/SvimOUd/PnUqGwEd9hthgurtd2cTl0yhHuL/92I9c1fEZS6k5ounPHtVhx0kt4aza
 F3U7+cQOFpG6HreATg1S44QVi601DHEhaTbLHZ91TFIipiMElV2uqaW+2LGo7qtsUfvd
 6Cnf4G2qcXuOECuy6RmtpXueiQjt+r3tL5n912+4TLYgy5hVSPAk5ULs7Q5NXRqVbq+d
 bXhg==
X-Gm-Message-State: AO0yUKUMphUPOsTroGm6Utw518i2YbM408Jn1Dh/c0nis9TkG+QyKqzL
 7fVtIrwZHFq11vKnlOMyvmw/hQ==
X-Google-Smtp-Source: AK7set/fDWFmC2jbElglv6/Loy674s0aKEuUPMMmLw2cWiUy3x3+BTlfjSdkdaQNTJeYAt6MEAexPw==
X-Received: by 2002:a17:906:9451:b0:8e1:d996:dca2 with SMTP id
 z17-20020a170906945100b008e1d996dca2mr22008349ejx.64.1678390844654; 
 Thu, 09 Mar 2023 11:40:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090680c800b008cd1f773754sm9104175ejx.5.2023.03.09.11.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 11:40:44 -0800 (PST)
Message-ID: <a8480700-e3a3-a90c-8ca2-ba19e416730e@mind.be>
Date: Thu, 9 Mar 2023 20:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB04936329051AD467C99376869FB59@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <VI1P190MB04936329051AD467C99376869FB59@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678390844;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TMLz+nCjtM9Va5LE3iksP+8ua38KVuu+Z9BzzhQXZH0=;
 b=NKw/RG0nVJnKetSfEiuk1nyN04mjsAV16/S6AD1f6NuxCsRghMkraYoi5TIu5qV5U6
 ezn2PAJNhYG5WeAdvpo+9IYqx1aGVK0eAiB5a02Zkh4MRdpIrv/qgotLmohXJubODVlA
 077b4Hwaf5C/l0YyPtlEdxwU2mJ9bSZAb1wHc5X8Ho84hBKy3buwjOwki6pxDBnkIWMm
 krDjtkiMkI+B2dOc54gxnDJbjNHzKNTsRxhliCboM1p1yteuf4QDdnwsY/neUxETydrN
 zz8bskNRja9dnLyX/X0bqWqqxrYJaNiQRZtW0toPQx0En0tMCNJTZhrzLbtKiCuMVuMC
 dwwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NKw/RG0n
Subject: Re: [Buildroot] [PATCH] package/libgpg-error: force cross compiling
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2023 08:15, Lang Daniel via buildroot wrote:
> By default autotools enters cross-compiling mode if --build and --host
> differ [0]. This should normally be the case as buildroot sets itself as
> vendor in the toolchain triplet.
> For libgpg-error the --host flag has to be set to a generic triplet
> because this information is used to lookup the syscfg.
> When compiling on aarch64 for aarch64 build and host would be the same,
> therefore cross-compiling isn't activated, which results in a build failure.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/6d4/6d4bc520c12313508d0fadee11d5b88c35a3cba9/
> 
> [0]: https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Hosts-and-Cross_002dCompilation.html
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgpg-error/libgpg-error.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 3f4a45a7e4..3ab8535a9c 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -14,6 +14,7 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
>   LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>   LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   LIBGPG_ERROR_CONF_OPTS = \
> +	cross_compiling=yes \
>   	--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
>   	--enable-install-gpg-error-config \
>   	--disable-tests \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
