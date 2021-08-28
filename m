Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B6CC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:05:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2FE60E93
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D2FE60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA05E4012A;
	Sat, 28 Aug 2021 16:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MV0ahETxJLCI; Sat, 28 Aug 2021 16:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42465401FC;
	Sat, 28 Aug 2021 16:04:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC0B81BF48C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A96CC6069A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 16:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAQKhvbVAWJw for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 16:04:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8953A605CE
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 16:04:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x6so7149563wrv.13
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VcoAu0t2cPB0e9YzQkPcWtPvrnH8Sp0p++EZgiwoyJU=;
 b=P1hQdd3DeuOUgwKkTLa+EMiguZZK+9GA939/+2FHAlNznH2WOz8/71k9ymhRTHlhFI
 ZRf0rv0l1hD0wcvOsajWX7h7g9XzO3q2yKd6aBKuYHhspfOYkjXJ3r0y0RHCBlkJ+XQG
 vvRA/OVShtdEQJ8vsIlYZDA8jPZPnXhHCacp1nCmFhQeGdHawrE+VMO7jrOoA9UP/JBd
 zmyLaBbPjVlD9nKapPyrG/5HnG/GUiJd83owB+QHqyS5go156rRYUoiNHptO1HM+NVhi
 b9olNbq/B7aRxd/7pnQ9K2kC3jDF66AP4lGHP0FujibaogqsIhJdxUaTdowlFMM8yTre
 arYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VcoAu0t2cPB0e9YzQkPcWtPvrnH8Sp0p++EZgiwoyJU=;
 b=CMr5IGz1PS3UXDJg8sUrAap2fW0N/iYfHMcGwzzz1LmtBO4Tz2JA1Qw2T16TpiNnQe
 JfU1AlEsGgpkX40DijwnMSnMJbgx729U5g58/zrP/DnF/AmQe1+o1HGzGpTFjqUx3sWB
 fDrSfCyIMeRSRS1WoeZg9kKqB5jWRqXwtj3bwT6xrZ3XVDp0nOdHYEwatTRqdMwsKUPq
 kkeenPUsvJbXnFe1B9RuKeiH8i0GgqhXP08fFV59+CqIBLX+DefYMl8Pzyvirr7RG3gb
 DtVQBwRCwF6+/M6ZfHZ5MbS4PrfriNhIs3yuxFuPiGaQYfkynsU6n+9+8Z3K0fE4cAMx
 b4LQ==
X-Gm-Message-State: AOAM533E48cxgLJqo92/i/7gvK6bxRHSCynDbnM3J4VSO8ijC2zAFkXl
 CarE4OFpDGvKXtuL5pFdQLitAbsyX8Dzhg==
X-Google-Smtp-Source: ABdhPJyx/VQK8B5FU/pWWxhEIPXsxf4z4bGewKuogBwqtNMurlX3WqMZ8tzCcLtgtdklrITKb+Rpsw==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr1534182wre.50.1630166689773;
 Sat, 28 Aug 2021 09:04:49 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id n4sm9533525wri.78.2021.08.28.09.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 09:04:49 -0700 (PDT)
To: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
References: <20210826191158.10975-1-texier.pj2@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <67a23449-b96c-aab5-0358-799237fe61e4@mind.be>
Date: Sat, 28 Aug 2021 18:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826191158.10975-1-texier.pj2@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/stunnel: bump to version 5.60
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 21:11, Pierre-Jean Texier wrote:
> This release includes the following changes:
> 
> - New features
>   - New 'sessionResume' service-level option to allow or disallow session resumption
>   - Added support for the new SSL_set_options() values.
>   - Download fresh ca-certs.pem for each new release.
> - Bugfixes
>   - Fixed 'redirect' with 'protocol'. This combination is not supported by 'smtp', 'pop3' and 'imap' protocols.
>   - Enforced minimum WIN32 log window size.
>   - Fixed support for password-protected private keys with OpenSSL 3.0 (thx to Dmitry Belyavskiy).
>   - Added missing TLS options supported in OpenSSL 1.1.1k.
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>

 Applied to next, thanks.

 Regards,
 Arnout

> ---
>  package/stunnel/stunnel.hash | 4 ++--
>  package/stunnel/stunnel.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
> index 0ae20cb906..b8cc62be13 100644
> --- a/package/stunnel/stunnel.hash
> +++ b/package/stunnel/stunnel.hash
> @@ -1,5 +1,5 @@
> -# From https://www.stunnel.org/downloads/stunnel-5.59.tar.gz.sha256
> -sha256  137776df6be8f1701f1cd590b7779932e123479fb91e5192171c16798815ce9f  stunnel-5.59.tar.gz
> +# From https://www.stunnel.org/downloads/stunnel-5.60.tar.gz.sha256
> +sha256  c45d765b1521861fea9b03b425b9dd7d48b3055128c0aec673bba5ef9b8f787d  stunnel-5.60.tar.gz
>  # Locally calculated
>  sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
>  sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index cf2e29cb9b..cc56eb39a8 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  STUNNEL_VERSION_MAJOR = 5
> -STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).59
> +STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).60
>  STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
>  STUNNEL_DEPENDENCIES = host-pkgconf openssl
>  STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
