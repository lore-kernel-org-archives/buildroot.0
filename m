Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0424EC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:06:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C33E6103C
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C33E6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F90680F1B;
	Thu, 26 Aug 2021 21:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPLa8e1FbVvu; Thu, 26 Aug 2021 21:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC50D80F2A;
	Thu, 26 Aug 2021 21:06:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACCF31BF2A6
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B22780F2A
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWtTglhSgjbw for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:06:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6B5D80F1B
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 21:06:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id j13so1310674edv.13
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+aQ4YUIVuZNVeUY7RxCmU51SFASRuKVTCdskW0tui4=;
 b=B47sabqKV5autBmSIbWciQa+586BR66Sd6LXYuGGF/hECpYxn0BzV5UGR+Q7uNhdfi
 ZovV5NQDDDIsM4Wx1UA3OtB0JgVHMB4IIT3HT9YAhB1yUGvS/VDKeybaVCdb4AJsLBbY
 /1s0tLGDw1I5aWAKoblgESQymLZuzl4JsyyPCSyVvNAleDvIEmxB0DMAk8Zfw7HqxRkR
 8BdIvfLG/VZ2sP5RuiKE9IjBpXsvLWf0NdleUTKikDbB15mbsKbQC/6SG2WR6h8++6kc
 4Jaui3c+KX4TQ+v/rEYVqEjp1OGmxfTUCwzJfyst2h2No1qx53OHNT2EpgdUmJ13LVuW
 uOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7+aQ4YUIVuZNVeUY7RxCmU51SFASRuKVTCdskW0tui4=;
 b=iaOIeq/qoY1/MPb210pOdR2AINWbOm3qaY/CWEtHZaDdwC+yNySMVdXz7fM2d5goC8
 C7zCQQz0OW6Bx9lQPrLS37c8pjO5SqDVIb7s2akRcZ2hTlTox/V9hqD+njh+OYVsepCt
 5kuc6/84C+t80rUoty8zz7rckqxIPBF1iB8hnPrCRIZ9I+4AhBl4Yw1sgGqLgO4+fXp+
 CUuA7g1je8w802Y3w4Pz90QvxXxdpqRzzUgQKx6dGmPqucC87tCKWA7e3sgvv2QFhOo5
 jA8Y9/4+vCqCZj9yJWhESHzmyOW2d3/2SMCQA38ulGOwubHhosxI3QIxFFgu4UddmzDj
 0NSw==
X-Gm-Message-State: AOAM532v++Ou6V0cxFGB8JWVMo2uSdMNUEAwxY7uC6sAsXpsKGhWIPsr
 41cTB3uVPERcqBPsBLtWE8zcdw==
X-Google-Smtp-Source: ABdhPJzxLqmv+GAIFVe5TfDSnb6Vnx7rU1daXOonkXkzfRfK23G1VdLCR/PGskJRH6ITh9qAEOUQgg==
X-Received: by 2002:aa7:c884:: with SMTP id p4mr6134503eds.203.1630012003820; 
 Thu, 26 Aug 2021 14:06:43 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bx11sm1934832ejb.107.2021.08.26.14.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:06:43 -0700 (PDT)
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <916c37d1fe52b9fd6b14eed9b68e4edb5801234e.1629958236.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <59ec7947-18f8-cc0a-dadc-9b1e4afe0198@mind.be>
Date: Thu, 26 Aug 2021 23:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <916c37d1fe52b9fd6b14eed9b68e4edb5801234e.1629958236.git.baruch@tkos.co.il>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/2] package/mtd: change ubifs-utils depend
 to select
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>, Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 08:10, Baruch Siach wrote:
> BR2_PACKAGE_MTD_UBIFS_UTILS is a blind option. The only way to enable it
> is to enable BR2_PACKAGE_MTD_MKFSUBIFS that selects it. ubihealthd
> dependency on BR2_PACKAGE_MTD_UBIFS_UTILS makes enabling it unintuitive.
> 
> Change depends to select.

 Actually, since upstream commit 5a6e813a6ba48c81889208bdbeff92b13958dd2d (which
is part of 2.1.3), I don't think this dependency is needed any more (it was a
hack due to an error in the upstream configure script, cfr. [1]). Could you give
that a spin (test with ubihealthd and nothing else) and simply remove the
dependency if it works?

 Regards,
 Arnout

[1] https://lore.kernel.org/buildroot/20210609234819.1860554-1-mmayer@broadcom.com/


> 
> Cc: Markus Mayer <mmayer@broadcom.com>
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/mtd/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index abfe8066610c..1bd143d47e7d 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -146,7 +146,7 @@ config BR2_PACKAGE_MTD_UBIFORMAT
>  config BR2_PACKAGE_MTD_UBIHEALTHD
>  	bool "ubihealthd"
>  	default y
> -	depends on BR2_PACKAGE_MTD_UBIFS_UTILS
> +	select BR2_PACKAGE_MTD_UBIFS_UTILS
>  
>  config BR2_PACKAGE_MTD_UBIMKVOL
>  	bool "ubimkvol"
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
