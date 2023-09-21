Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1313EE7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C188483CAA;
	Thu, 21 Sep 2023 19:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C188483CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UU7f9HllUKVu; Thu, 21 Sep 2023 19:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C58783CA8;
	Thu, 21 Sep 2023 19:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C58783CA8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3EC21BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACFA940235
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFA940235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmowOowCrmoQ for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:01:19 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F132A401A1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F132A401A1
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-530e180ffcbso1486214a12.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322877; x=1695927677;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QDD6nenq/yMQrCiXwjrSjMYuMyxVKVfbApyqayk7wSI=;
 b=Jbh+Hsuke2sp3l5Uyb0mVH0wL8OUAXS5CeFjPIfa6OW90tHHgvt8TPLjPJkL1KVHct
 ujAhKEnqAnN7jIVYh68MjoT9m3LkyYU4SZD3r2ZjmgHmuXQ/TiOz9i5T8NKERUFozJ9O
 jdLDncMXI8gN7X7CHkpkL+MF2rjhRhyCHKpgHniLAq0lpBlS9IASaITSF2aAlwQAUO3p
 AiewfwQQtW/sl695U4ozNjjp/OpBkm19OevjAA2WRjxGJhrg/dn8XhLEOXq4UOkZSJgu
 /6ok5uFJo58kHfqN5dbf9R3cFG1uTSz3Qwx4FSRLIzbCElTnT0VecMBR997FPnI5SvJq
 /2SQ==
X-Gm-Message-State: AOJu0YzQlGuUf1QlYaS6OWsFeePgxzFRoBk9Zx7b6PdcOoTCinwc+lH2
 X85IEWuqTk74iMK1RTtChMaPNul8k/Zvuc5Yup4=
X-Google-Smtp-Source: AGHT+IFU7ykAyHO1FKSI+j7rxx8hIrl+XUyOHu4opQpIw7yk5Wosqi3tvY96kqSZSEd/jUEU+KTtMA==
X-Received: by 2002:aa7:ca46:0:b0:530:f296:d446 with SMTP id
 j6-20020aa7ca46000000b00530f296d446mr5925548edt.34.1695322877149; 
 Thu, 21 Sep 2023 12:01:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l14-20020aa7cace000000b0053331f9094dsm1206438edt.52.2023.09.21.12.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:01:16 -0700 (PDT)
Message-ID: <669e0019-c53c-c59e-7881-73b65fb1ed04@mind.be>
Date: Thu, 21 Sep 2023 21:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20230918064806.2998824-1-buildroot@heine.tech>
In-Reply-To: <20230918064806.2998824-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695322877; x=1695927677; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QDD6nenq/yMQrCiXwjrSjMYuMyxVKVfbApyqayk7wSI=;
 b=YNP+z9tGurTha9kjoHkxDnDmpTdjKXjb8Hg86FJejz7Q/rP3opVnt91JjpEKna7CgJ
 rjFlrQsw3xKThKVTTSE0Bquy8rDDZQ1s6Aiu1zXVPU/tdx3s6Pp5cTSHgRxwoSSWqqI0
 f3PUye7Ry3JIKQERWCDWd2T+BDcAuA0DN7SbFm7x8TSDIG7lST0kiXQ+2O6wxye6wqpy
 5MVrbHGJZ+u/UAmM6WE2Liktsr/s0cGmC5QUEtYZIz/N8OYfx8eo+il5UHoT8BBXsrxa
 eYLSCW71YESg2o7AoKp5dG/KIl7f2FVjHLPreO97lpspz9UjrVkLh2jzkn7KWNQtmmps
 /qDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YNP+z9tG
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.4.0
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



On 18/09/2023 08:48, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/catch2/catch2.hash | 2 +-
>   package/catch2/catch2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
> index b533792f8f..88a6a06df2 100644
> --- a/package/catch2/catch2.hash
> +++ b/package/catch2/catch2.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  d90351cdc55421f640c553cfc0875a8c834428679444e8062e9187d05b18aace  catch2-3.3.1.tar.gz
> +sha256  122928b814b75717316c71af69bd2b43387643ba076a6ec16e7882bfb2dfacbb  catch2-3.4.0.tar.gz
>   sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
> diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
> index 6e4af3d670..580ddca5da 100644
> --- a/package/catch2/catch2.mk
> +++ b/package/catch2/catch2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CATCH2_VERSION = 3.3.1
> +CATCH2_VERSION = 3.4.0
>   CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
>   CATCH2_INSTALL_STAGING = YES
>   CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
