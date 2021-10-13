Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F90C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:24:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B3561165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9B3561165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF8940155;
	Wed, 13 Oct 2021 18:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgEDy10agMuh; Wed, 13 Oct 2021 18:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D1714021F;
	Wed, 13 Oct 2021 18:24:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 758561BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6585D60ADA
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNVGrTMKDf68 for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7127360ADF
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:24:23 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g8so13940710edt.7
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Jsuy6vHhWygIc/CwU5YeCuTMt/DDDYKvp+U7Otv1t3Y=;
 b=L0Nhtoel1VTqYVjUOHfdGopuAI48yGfs0lKMEbTjGxt5f4910uqOkz7QNmI11EVbk/
 MMqoNhWvPMWOVoEdWBwTxerllEr9RNK0Wjk5zvMh4u7UCDxuS25T+Nh3BNESj/lfxpBV
 maMckKTvMpqBDoqSS2/fJ1M9CdXz9RFDgCuPOK/aP5VjWUOTu3PVeASbEP+y5+pTdHcI
 fuHVYP2t4xYS2u5xKOWZCq30/eD1mPCc5g6wvMOaCd2MsdSzQnhtTjmQJIEiwPXrjqg4
 B+f2+FvZgGg0zAECxYYLbmu5Qm9A8gfZ6BbszmipB/hPsRUES9YR0yHXyoH+SvrZScq9
 4ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Jsuy6vHhWygIc/CwU5YeCuTMt/DDDYKvp+U7Otv1t3Y=;
 b=j6e0LUaZ2jxDV94zBzzu/w5YGcSy0Lv8AkkkCj3OUF1jkOIx8TSRY+aLdBXpnPtFL0
 /zZ0qFsx7C5FFJFd4q0c421tPngl+wEVv26fW6ybrpus5c5sejV/CaT1Euy9NCM3/qfz
 Si15x/ZqJ9woKKcf+cJTlwbqo8Aj2NNdLfTtXI2zVEG3DY1aUeYizReR46V+cOAIwyNZ
 gCFI16PSzAiGit6izUsj1se8eNXjFoVEn8T9mlpG7L6TjlbEoFraw54NUfHeO7dvRQfI
 PSK5SCd4SNzFAe6eFlCKgoHutEi0lv3XBbN9KNqOmSvrVtsBqxnKF92D2YbLpcRGxUO+
 JAew==
X-Gm-Message-State: AOAM532EkWDFBQh0yDFYNkTKrkD7PHijvv7vsOVQFy2DFRTj2gltgpEr
 s6WG+a4md5kGD46EvZkmEvJiug==
X-Google-Smtp-Source: ABdhPJxH/jYn/jmqB7ibVo+TxY3yYF98HWsF+NK9Ay4OcnAoFz67iSECOZ28Gqt5Et4fZ5PN3Z8eUg==
X-Received: by 2002:a17:906:1510:: with SMTP id
 b16mr1002361ejd.332.1634149461713; 
 Wed, 13 Oct 2021 11:24:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u23sm275417edq.36.2021.10.13.11.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:24:21 -0700 (PDT)
Message-ID: <7a7d8323-fb62-65f1-b60b-dcbf56776f03@mind.be>
Date: Wed, 13 Oct 2021 20:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211005202232.32172-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211005202232.32172-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/log4cplus: bump version to 2.0.7
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



On 05/10/2021 22:22, Peter Seiderer wrote:
> For details see [1].
> 
> [1] https://github.com/log4cplus/log4cplus/releases/tag/REL_2_0_7
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/log4cplus/log4cplus.hash | 2 +-
>   package/log4cplus/log4cplus.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
> index 28e5b204c7..a668eca37a 100644
> --- a/package/log4cplus/log4cplus.hash
> +++ b/package/log4cplus/log4cplus.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  73519a5e47c40cf375aa6cd28a703b01908b5dcd3f4cb4290db2fef237c8180c  log4cplus-2.0.6.tar.xz
> +sha256  8f74a0a5920ba044b24e2ebeb0f1e5e36d85d5c23ed48d9fe328882b16130db8  log4cplus-2.0.7.tar.xz
>   sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
> diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
> index 8b62fb8f92..56a85025cb 100644
> --- a/package/log4cplus/log4cplus.mk
> +++ b/package/log4cplus/log4cplus.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LOG4CPLUS_VERSION = 2.0.6
> +LOG4CPLUS_VERSION = 2.0.7
>   LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
>   LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
>   LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
