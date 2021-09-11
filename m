Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FAFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:45:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC5660EE7
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFC5660EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA2A608D1;
	Sat, 11 Sep 2021 20:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xvhvmArUwAM; Sat, 11 Sep 2021 20:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB40F60833;
	Sat, 11 Sep 2021 20:45:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEBD11BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD1EE4042A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6UHtgYRmam8 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:45:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B26744028A
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:45:47 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x11so11820923ejv.0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+g5P3fXCJMTyqRgaglin8hqfT532ke4ZBygC2n2uUno=;
 b=GCqLx4Y830H7okaH2ayTg0aYjowasqkyz67p8U15TziSpzTcCF/NNcRmy6nbtdLZUM
 x0WTM+8pB2uVwy0M85UJf5aet1wmYDDcupzgb/6eOx9kd3LNs5f2wcAa4iJU/QHYdpTf
 GRoT0uaKQtGJ9nwbjyG1pxAwtC1GwTH91yEtgstZys+cq1ybC1Z7Thz2EHllPT4sNswq
 MHtknqhlrcmHUpqB8TuD0i4/3WB+4wk0K5+p081O/vKzt1jST+IieRzplnqdksqhpcaX
 pSu9nkJFsMJOSnDB2PYq0st+Ta2SrwYwGHWBWX+iR8YfETrfKJpCKS//uAWZByduVNhS
 Bq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+g5P3fXCJMTyqRgaglin8hqfT532ke4ZBygC2n2uUno=;
 b=IABqunrOYCwZmGXOnnl60l08tTNP2EU4f0/LeZh15PidHfELIUZc6ooq4sYijmwZdv
 6L+HW2lQJXONYDvUnbNYJotNWBZ17ZSZgYHivUtCp4Bw3S7Rur+1dHB4zrLrVNMnOxj9
 8DbQBrVWO69Vd9EqX5fYES9ianR5medunHu2rLgOJDay4/hqXShiMUImMF1Q6A1RfVzz
 ugrXu8/FfAPWGW1L/xqlBPjyN/zM3H0tiUDE4gpYDOcmzCICuHYEOJuz8pi/SS8Cw78D
 3E2nulB19BHH6oWDVsHjLD4pBdxqDhxkG3q77TJ1Ts0kiDXbxxPsktYEwCRu4zYfFSI3
 7plQ==
X-Gm-Message-State: AOAM531ZDB77BiHjz4jf9lRF96uWeLc0dEXN4+3h6eebMcQCAVwr7HNH
 Yb7FPnva9x7sTzyghCIQzcQNEQ==
X-Google-Smtp-Source: ABdhPJxWHVWEQ/r6IahhCJ3AKsuA2L6wU4J40wdDSU8oj/e81c8w80RfHbLjZL4WDqg26X1+Umfvww==
X-Received: by 2002:a17:906:660f:: with SMTP id
 b15mr4398405ejp.491.1631393145784; 
 Sat, 11 Sep 2021 13:45:45 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o3sm1182879eju.123.2021.09.11.13.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:45:45 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210905065036.145629-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <654e08f8-5bb3-12a0-3565-42060da95c3c@mind.be>
Date: Sat, 11 Sep 2021 22:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905065036.145629-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix python3 detection
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 08:50, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/101/101d1caa355c2d7ee1762b394c1bf4e29350bd06//
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 To answer Thomas: it's since commit 37f75b756182dd17871d1cd9e8bca83f326de690
which is only on master. I should have put that in the commit message I realise
now, but already pushed...

 Regards,
 Arnout

> ---
>  package/tvheadend/tvheadend.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index cd8fedf1f0..6000e82a6f 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -154,7 +154,7 @@ define TVHEADEND_CONFIGURE_CMDS
>  			--arch="$(ARCH)" \
>  			--cpu="$(GCC_TARGET_CPU)" \
>  			--nowerror \
> -			--python="$(HOST_DIR)/bin/python" \
> +			--python="$(HOST_DIR)/bin/python3" \
>  			--enable-dvbscan \
>  			--enable-bundle \
>  			--enable-pngquant \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
