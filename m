Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A924C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A265F60B77;
	Sun,  9 Apr 2023 21:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A265F60B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ksn9XPcj8qpR; Sun,  9 Apr 2023 21:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A1860BF8;
	Sun,  9 Apr 2023 21:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A1860BF8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A38791BF2A9
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A3B0404A5
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A3B0404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krZoScNs7455 for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:02:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D86240151
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D86240151
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:02:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l26-20020a05600c1d1a00b003edd24054e0so3397393wms.4
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074135;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s0xWhgi1WDUtx3GCSSyWagbkucFaXP9u5ViIQxtzgOM=;
 b=FOQ27JVo+7PBg/vwdTg2lRAFZ5CochPBvuk9z6GKnKbKKWn1He55IgakOXdgdbCKP6
 ZNZry6SxVxWLoMSd7GMRWa1mXomoVEsaA23a+Tz99CXXeThnyytxD8SF0ecvkfE4G2jH
 esOmRl9wkoSNVwnzc6aZo6pT3crnsfEVaj6eOli3ADxvcs9rth/c9WremJl3oIRKVZfP
 o9o2N9qurtEdcNPZNxJsaFXCOIfKRhq4mswdysG9Ygk5T9iFTdoDDpHE34m9TLLJW/hW
 GS1m1ovUlbb5DmqUBkIIdGCK/k8kcurNwtBXYnvfn81/jxIfyi7WvGmUqeoXf1cvcM1Y
 aGSA==
X-Gm-Message-State: AAQBX9ccrUg0AgfFjJEF7ZmjqUMyyvrSn5csfNJTs9e8Ukpkgz3Rcze/
 8nLCMO3L547WZ2S/e1SFbCYAMw==
X-Google-Smtp-Source: AKy350aE7q943aoP1X7DXda62fnJHYujNWg7+wz/WaBAxEgWU2h6k6G3xijMxZG58wQKZ/Zd3vztbA==
X-Received: by 2002:a7b:c5c2:0:b0:3ed:c84c:7efe with SMTP id
 n2-20020a7bc5c2000000b003edc84c7efemr5823304wmk.7.1681074135261; 
 Sun, 09 Apr 2023 14:02:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b003ee9f396dcesm15491540wmq.30.2023.04.09.14.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:02:14 -0700 (PDT)
Message-ID: <e87460bf-02ec-7d51-4040-dbb5596da6be@mind.be>
Date: Sun, 9 Apr 2023 23:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-12-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220724054912.2354219-12-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074135;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s0xWhgi1WDUtx3GCSSyWagbkucFaXP9u5ViIQxtzgOM=;
 b=Pd4R3H5C/ZPZ1A3TeI7uFHkXEVoe+5gcl2Bs64CNFUtcqgBfk/ZT+wxtPDax7ISDR8
 1KS5WHapSRrY0mdLf0Pyg8FEyXdtpR/a7/T+ZlsYsgFKylsTGoWJvbiwgygVEtvAu53y
 nshP3AWl49zoVQX7twHzck4XR2WKmInjl3e0G9/E230lP7TL5dnGcW5YLqmtPfGK/YaB
 xr3dyoHDK0mc5v4hkd7XzeyUzyCda3ejNDI7WcMzHbxUbbKA6Q8lnGtTw/IWwZqsMLg3
 7rd/WG2EX6Appa+zrg6Y95AE9sksYCcgkmS+JDEkzljXQLu3meKKQUZVmcvNMxdp+XqA
 +j4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Pd4R3H5C
Subject: Re: [Buildroot] [PATCH 11/16] utils/check-package: check files in
 utils/
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



On 24/07/2022 07:49, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> NOTE to the maintainer applying this patch: please re-generate the list
> of ignored warnings while applying:
> $ ./utils/docker-run
> br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore

  Applied to master after updating the ignore list, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore | 4 ++++
>   utils/check-package | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 541f234bfd..765e5c1cba 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -940,3 +940,7 @@ toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-externa
>   toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash HashSpaces
>   toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash HashSpaces
>   toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash HashSpaces
> +utils/brmake Shellcheck
> +utils/config Shellcheck
> +utils/docker-run Shellcheck
> +utils/test-pkg Shellcheck
> diff --git a/utils/check-package b/utils/check-package
> index 6612cee24e..880fcfa21e 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -107,6 +107,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
>       r"package/",
>       r"system/",
>       r"toolchain/",
> +    r"utils/",
>       ]))
>   DO_NOT_CHECK_INTREE = re.compile(r"|".join([
>       r"boot/barebox/barebox\.mk$",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
