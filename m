Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E17C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:03:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A284360F24
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A284360F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492BA83E3B;
	Tue, 21 Sep 2021 19:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sohQVM6lroHs; Tue, 21 Sep 2021 19:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1988834D5;
	Tue, 21 Sep 2021 19:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43FD21BF3A6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AC95834D5
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQPMRfTMbqlc for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:02:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 095E9834B9
 for <buildroot@busybox.net>; Tue, 21 Sep 2021 19:02:54 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r5so210201edi.10
 for <buildroot@busybox.net>; Tue, 21 Sep 2021 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XyUDvP4TFp8NfayU1ALqOMfr41Y0ceyLJBfVOVOx/jQ=;
 b=YfFiZhjCKSIY+gYEoBz1jSgNwzJKzwceM1EmCGCofJ70E8UtQjw4rFWm6d+/nULWS+
 6vguRelGdZhX7NWpKlf2uoZ0/Ym9SV82TLB41eelNwmei7swwt4H7vgPIcyN+T9pllJI
 K2cWvc4nO+2XZJx8H2/zG8NRgG/P5R1TEihuvBEfUotrOUtFVCvdadk/ka3Ljy7xpKGo
 WRvWUZru47rweKLL3Jv+5j5VQLSFFTV0wLC2cODV3qeRragLqLh/Algl5uz6PnBL9KK/
 /g/ZB1XejN5nrAXMNikFuFzPiwnLywacIQ9ipCSu0ToquGmazqbPLK5hEfbDn/CZcnCY
 Wzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XyUDvP4TFp8NfayU1ALqOMfr41Y0ceyLJBfVOVOx/jQ=;
 b=uV919ANEGxgPv7T50I1evanN59wZJVaijRR7gNaUaWB6oPJL6PP8JURjLxSdiJhhnR
 7GKt8buKXkZEf0B6ZrBRmflT2vrWo4Wh2SOy2RbPPsC52ea4ADx8b2DdDulHfB0j4uoz
 NI4FoTk9AA4ftj6thKlMv4qYra/Bwnx7/+DkrK6PbRAScrtNufteZEd2HP913pYbBx2l
 u9hlELVMcsWTsvc6CsuossltUnxANp222UtMTsRgNbyk737I/oH0zLXUoU8vjl7AYqPA
 b00fdRtjcq5RhZHS5SkfrywG4ZXMkOTqtn9ArolD8ILszLZOT8JIZGDlsztC1EvTa83/
 83yg==
X-Gm-Message-State: AOAM532RW9Ecaj/KI4WspmPAg8lb1xt2KULSu7305O+lDiHnN0JIbC1a
 mMXCo8w2rz+xnjMq7i2HVpLLOA==
X-Google-Smtp-Source: ABdhPJy1u/UGrlm7Z08N4vjlMj/pj3yjKqBNWioRvtenS/yCJsY8oyMDC1zZr1ARKkAXCa/BEVV4AQ==
X-Received: by 2002:a17:907:785a:: with SMTP id
 lb26mr37490955ejc.77.1632250972998; 
 Tue, 21 Sep 2021 12:02:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ky16sm7450038ejc.98.2021.09.21.12.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:02:52 -0700 (PDT)
Message-ID: <82b6bcb2-e8f8-3ef5-0e54-00b1ee58021d@mind.be>
Date: Tue, 21 Sep 2021 21:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210909083621.2067123-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210909083621.2067123-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/webp: bump to version 1.2.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 09/09/2021 10:36, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/webp/webp.hash | 2 +-
>   package/webp/webp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/webp/webp.hash b/package/webp/webp.hash
> index 24cec6dfa..cf7b1dc9d 100644
> --- a/package/webp/webp.hash
> +++ b/package/webp/webp.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  2fc8bbde9f97f2ab403c0224fb9ca62b2e6852cbc519e91ceaa7c153ffd88a0c  libwebp-1.2.0.tar.gz
> +sha256  808b98d2f5b84e9b27fdef6c5372dac769c3bda4502febbfa5031bd3c4d7d018  libwebp-1.2.1.tar.gz
>   sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
> diff --git a/package/webp/webp.mk b/package/webp/webp.mk
> index ecf26faa3..d1462426c 100644
> --- a/package/webp/webp.mk
> +++ b/package/webp/webp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WEBP_VERSION = 1.2.0
> +WEBP_VERSION = 1.2.1
>   WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
>   WEBP_SITE = http://downloads.webmproject.org/releases/webp
>   WEBP_LICENSE = BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
