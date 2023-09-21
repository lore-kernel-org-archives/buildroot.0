Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9544E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8250482B75;
	Thu, 21 Sep 2023 19:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8250482B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TP1UvaQKzRZI; Thu, 21 Sep 2023 19:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D16CA82177;
	Thu, 21 Sep 2023 19:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D16CA82177
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AA571BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61EE641811
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61EE641811
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHKvuuXXqIcW for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:00:41 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41A42417D7
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41A42417D7
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99357737980so161629866b.2
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322839; x=1695927639;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NCP90mon5LiKMNINwk2AhlKnQQGuwBIOaSc/r1LUIaY=;
 b=PMaXd56jrnZQKUiYpwu+KFDoa7ysuZ6hk/xyUwFQYejMd5m0tExaGj35YHMKMRUZbz
 O4ATdJg208hVuzO7DEIBn3Nwp7Ub8ZHs6QmQhoS/LxsbEjFw4Sn3IXz74Xcnz1flNajy
 ZxweuhCR8qR69kdJHky0MA03BuFeSmjDNVc7eTiArP8pEMcNOcnO0x7BFTcnKRHWcScv
 2TDa5dDMthpGmNS2WuX0pAhwj6dyT53InvZUYsPk3K8hSjC+rKs8U267PEMWq99mw40Y
 76Z4+rmNSefL4/1QXDyNTHq3YH2OQDK3xSFz82eee3S1SsGeIybVsskYFTuJlhGDGsgy
 OFOw==
X-Gm-Message-State: AOJu0YyqGu8y7Ct+Bhh0DHEw1cs4GyqwYnQr/7DRIn2VO7rmRLP6szRs
 6tMCBzcagCZW73+9oBDGBiIOj38ERnwYEEuklkk=
X-Google-Smtp-Source: AGHT+IGzfs04Xlejf+zTraaaf5bdRzgtfu7D9ZuqQ5pPtlf0wuEb2ITObCvEsRBceb8NMqGo/KjgYA==
X-Received: by 2002:a17:906:76c2:b0:9ae:5270:46d5 with SMTP id
 q2-20020a17090676c200b009ae527046d5mr4467103ejn.73.1695322839286; 
 Thu, 21 Sep 2023 12:00:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 md1-20020a170906ae8100b009a1be9c29d7sm1466163ejb.179.2023.09.21.12.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:00:38 -0700 (PDT)
Message-ID: <1a4c204d-eb49-94a8-12fc-c2cae6e1afbf@mind.be>
Date: Thu, 21 Sep 2023 21:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20230918074220.699340-1-angelo@amarulasolutions.com>
In-Reply-To: <20230918074220.699340-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695322839; x=1695927639; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NCP90mon5LiKMNINwk2AhlKnQQGuwBIOaSc/r1LUIaY=;
 b=bfWo3C9o4RqTuceH/KFziIOXSxAuCdYbNCRp6Ee7sZ3IFcvIHDqV2o2CRkU/EFcCyV
 TsNQAEvwHcwD5G7/BNIC/pNxB9TzJ2ciURMASo/wyrEeztv4/ekQISZznztoTLsA/bdJ
 btPDrsNf/VbsxnvNnrhlc2sD+82C3MLcm6Fb+2mXENf5HgxNZc9WJiLjV0kgH/xaau7R
 G0zqbWL7T5K4DrFS3ZYurav8fCdgB04E8v+0y/MW01sEMX3PJUwaZ8qTT+uMfOduixL1
 s6PQZXGgqa7S+dtbibgdhR4zlnt/W/3wA3AK9C/5FMWfxlz2OkQD4qmguNrJN8sW513u
 yCJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bfWo3C9o
Subject: Re: [Buildroot] [PATCH] package/grep: bump to version 3.11
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



On 18/09/2023 09:42, Angelo Compagnucci wrote:
> No security fixes introduced in the latest version.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/grep/grep.hash | 4 ++--
>   package/grep/grep.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/grep/grep.hash b/package/grep/grep.hash
> index 142d15644d..a0028a4e2f 100644
> --- a/package/grep/grep.hash
> +++ b/package/grep/grep.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking signature
> -# https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz.sig
> +# https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz.sig
>   # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c602633b88af6855b  grep-3.10.tar.xz
> +sha256  1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab  grep-3.11.tar.xz
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/grep/grep.mk b/package/grep/grep.mk
> index 2f3b405f93..61900bb957 100644
> --- a/package/grep/grep.mk
> +++ b/package/grep/grep.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GREP_VERSION = 3.10
> +GREP_VERSION = 3.11
>   GREP_SITE = $(BR2_GNU_MIRROR)/grep
>   GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
>   GREP_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
