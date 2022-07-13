Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019D1C43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 07:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D9FE61395;
	Wed, 13 Jul 2022 07:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D9FE61395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gk-wT_hxQr_x; Wed, 13 Jul 2022 07:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2110260E90;
	Wed, 13 Jul 2022 07:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2110260E90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09BFB1BF290
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 07:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFB6183408
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 07:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFB6183408
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DG7uRZkFROc1 for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 07:07:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC22B83337
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC22B83337
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 07:07:43 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id sz17so18230980ejc.9
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 00:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IWH2m+20KdWDIGbHy1OYKo6X7JJR3qhJXx39aatOcww=;
 b=vyoM9XZzNyimvbRo7/YfzNcPr/5kbWRpMNC2pBKJ+P1ApNAoRZoGCTdOhj/rm5/nKg
 Sj3rhX1ohUc4Xe2Ynu32IiQtj/t0D6d1FbA8Hx4puDxtSsq6T6TqcvzCO9X0SZ80kZV4
 SczldCTXxmFtNaos7kZJZWOtpfWsAf3kghMuR0K3qVCRjkzPxLGs/jLnbS1U5ZcPRhqN
 ktfCARH6I2ugx3vyB1R0B2Yeq22O+8br0Sb7PKxgZY7ynqTqedYatavgJOgRckO7ejv/
 xb7JpAWr9E5D2qysjEUpaWBtlZLIK3r84NDmNIKX8dmf1F48EVFPqswD76EHO9cZ0QsU
 9Q5Q==
X-Gm-Message-State: AJIora8x2C3dLdkCLvkOCQ1ytsdYmXGr3EfdvSS+h2MYy8nvsCYHKrTo
 zHMztr1/SIOQBJeOTLXIwbGgzozzbKA=
X-Google-Smtp-Source: AGRyM1uIss3auW9EsazQhvVdeB8e1Tx8qIqQvDzMSDpXtSfOZ08lh6qDGysU1iL+oS1uDaC4LfP3wg==
X-Received: by 2002:a17:906:4f:b0:712:af2:29d9 with SMTP id
 15-20020a170906004f00b007120af229d9mr1902623ejg.751.1657696061894; 
 Wed, 13 Jul 2022 00:07:41 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a50ed0b000000b0043a6b86f024sm7286189eds.67.2022.07.13.00.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 00:07:41 -0700 (PDT)
Date: Wed, 13 Jul 2022 09:07:40 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <Ys5vPCrxDXWvj+ok@einstein.dilieto.eu>
References: <d88aa72dcbbcbf5988e643e3ecd0a49e1a455d94.1654802516.git.baruch@tkos.co.il>
 <Ys5oV/gCnSknmvtJ@einstein.dilieto.eu> <87bkttec55.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bkttec55.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IWH2m+20KdWDIGbHy1OYKo6X7JJR3qhJXx39aatOcww=;
 b=a/2utXwJp4n524ZgIuWjNq+UoEhVmGOlbvAW4+p4ebFYkhmh0LAGefzsEGICT/zsNT
 HA/9Vi0L6NlzhLbnZAKMJ9MQS9HEK1DdxLD7OweXxgCM5ZtzdkiLP9xRzhsm8ebMjuBA
 aPBAvhFubOygv3b3aeKmQp8VZIni8Do19uHkoD2/4B3u6hGclvmUk4ScJxWyFhHZzjs1
 9chEsLFC41Mag/PvXzdz2sFCvrEveBnhRAz5va9bFjihACP55g63TgYyj1hNEaDAtmJB
 1ow3PXUlqnb0uTByYLDa+AYyKC2a9yW/ggh17yPEEDhy3NMWpy7imdMm6K8aVfY1L9x8
 UAZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a/2utXwJ
Subject: Re: [Buildroot] [RFC PATCH] package/uacme: requires TLS support in
 libcurl
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch

On Wed, Jul 13, 2022 at 09:43:11AM +0300, Baruch Siach wrote:
>This issue is already in current code. The line
>
>  select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>
>does not guarantee that libcurl uses any of these as crypt back
>end. libcurl might still have BR2_PACKAGE_LIBCURL_BEARSSL or
>BR2_PACKAGE_LIBCURL_WOLFSSL set.
>

It doesn't matter what libcurl is using, as long as it can do TLS. uacme 
needs one of OpenSSL, GnuTLS or mbedTLS and will work fine even when 
curl is using WolfSSL or BearSSL. Of course having two crypto libraries 
wouldn't be very efficient...

>This patch only fixes the BR2_PACKAGE_LIBCURL_TLS_NONE case, but we can
>easily add others for something like
>
>  depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
>          && !BR2_PACKAGE_LIBCURL_BEARSSL && !BR2_PACKAGE_LIBCURL_WOLFSSL
>

That might work, as long as one of OpenSSL, GnuTLS or mbedTLS is
selected.

>The reason I marked this patch RFC is because we usually do not 'depend'
>on non obvious dependencies like libcurl, but 'select' them
>automatically to make it easier for the user. But I could not find a way
>to avoid build failure using only 'select'.

There was some discussion about this when I submitted the package:

https://lists.buildroot.org/pipermail/buildroot/2019-April/551561.html

>
>What do you think?
>

I think your latest proposal might work but I'm not sure it complies 
with buildroot guidelines. Can someone more knowledgeable comment as 
well?

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
