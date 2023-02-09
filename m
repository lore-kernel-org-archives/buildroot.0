Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39D4C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C17741884;
	Thu,  9 Feb 2023 20:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C17741884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8wiAt3-unEbp; Thu,  9 Feb 2023 20:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E53E415F8;
	Thu,  9 Feb 2023 20:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E53E415F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4261BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D3B82203
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D3B82203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAyXr1wbrnLT for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:47:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 222EE82012
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 222EE82012
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:47:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p26so10135791ejx.13
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ttv8frfq04Oebptc1N2Go6/M5oXQZYdTKXQWGnKRByw=;
 b=FLPRl5yKTgMzm1T7M7Igfb1R09ggRMVEpG60luFCzxIno7u1pJQT6mQZFXK+rwfBsL
 psZsdueONZHbpA6gwVlcSyhbcPfDaPhSKCMtflabBTASG/XMb3hLK5oYIQWyKXqVFGbG
 JyqQYnwrqHEUKfRm+IMc+JWTqmFQQN7Km6/Dw99DioOk/KiIwczAgwXmjgiw7CrPuHEo
 Qc0BTM5IdTm4t+3i2oL4OMNENS7HAfFpHM2vkvqIZb3ztBKReVDQUtXPhVcdaEbYuVG9
 BOqM4dt8J1i2hOD3haC2HgXLCxHxZyFYslx6VuEEj1Yd0/UQsZyT2JCq+SvlCrVS1ezM
 YwXg==
X-Gm-Message-State: AO0yUKWSQXOaTgbpvKuWwKotCzWHUdCvl/VfChbRNkZikk5eYPYC7wtO
 whgcWJF9tMwFHSDsjCNLByd/JQ==
X-Google-Smtp-Source: AK7set8UCeXw+B38kPzaXLdCQoNC49Sl8vQZArdddyeikJWx1Q/7LzCtmS5+EgN+kOn9oxCD9aQi3A==
X-Received: by 2002:a17:906:4418:b0:878:81d7:9f77 with SMTP id
 x24-20020a170906441800b0087881d79f77mr10086899ejo.34.1675975641308; 
 Thu, 09 Feb 2023 12:47:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b00499703df898sm1232155edr.69.2023.02.09.12.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:47:20 -0800 (PST)
Message-ID: <4ca77dcb-789c-2f5c-e4b3-a5c509165859@mind.be>
Date: Thu, 9 Feb 2023 21:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230208174431.85800-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230208174431.85800-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ttv8frfq04Oebptc1N2Go6/M5oXQZYdTKXQWGnKRByw=;
 b=DYL0cqcY9xYo4p5NWHGWRz0Hbjvktz5OSFxao6V0+pddHO5p/EKIz+/r2XcOIMj4Vp
 K3pKHFRgdcWsxCD2P/3cxa7WaVCHerPjE98u1VFHGozxoen34jr+kFutXMqJgtRFkDWf
 +ZQ6Tto3RtpEgdysE2suozefT+8ejRQKmgj2KLUDL6yTa4imIC4XPXg95ICdIPBy+gwg
 Fmjo0bBaPRwDS1eZbFycPd+GrnZQmPzAB9UfLjfOqSLzTXCaFPaEMhsr85H/mSkuxuWX
 qR9e9gneFzZVIKL4Nya38uLvopdI9fNwXBLYKnqkfxD0/J+c04m/rHgCWRtrp1gK1Tx/
 eTPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DYL0cqcY
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: add
 OPEN_ISCSI_CPE_ID_VENDOR
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/02/2023 18:44, Fabrice Fontaine wrote:
> cpe:2.3:a:open-iscsi_project:open-iscsi is a valid CPE identifier for
> this package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopen-iscsi_project%3Aopen-iscsi
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/open-iscsi/open-iscsi.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
> index 249253c64f..e5b965b80d 100644
> --- a/package/open-iscsi/open-iscsi.mk
> +++ b/package/open-iscsi/open-iscsi.mk
> @@ -10,6 +10,7 @@ OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
>   # well. See https://github.com/open-iscsi/open-iscsi/issues/379
>   OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+
>   OPEN_ISCSI_LICENSE_FILES = COPYING
> +OPEN_ISCSI_CPE_ID_VENDOR = open-iscsi_project
>   OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
>   
>   OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
