Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BCBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357836058D
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 357836058D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0642883F3B;
	Thu, 16 Sep 2021 18:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXydLUmQQRAh; Thu, 16 Sep 2021 18:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D27D83F37;
	Thu, 16 Sep 2021 18:51:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DD6C1BF9BA
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AF1383F22
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9g6XRNXgmMLu for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 18:51:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50D6B83F20
 for <buildroot@busybox.net>; Thu, 16 Sep 2021 18:51:38 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j13so20428996edv.13
 for <buildroot@busybox.net>; Thu, 16 Sep 2021 11:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BRCivU/20+kBh8sIH9bjF446ecx01m5TDbfjlAmrKdo=;
 b=Xb2hlcC/+gSOVSaYmAyfGBi0arNrKcxIvrTVBDW0OFvdxXyR9Cq4VTE3M2aO0dcpks
 wxf6GDhACmvDuVn0cA5tglYARXQWLewQr/8M2wHSRAusdW63p8oqiBfcMt2ySs4GvvFo
 uFSNZ7UB5BFNwQXFceCkUIXrdSNhTqqhU8dqdHS7Sb9vsfQ4QInzxJs6g33tCAtFp+o4
 XoYbN1eP3zZqggeTHDZ7/mxeWelGPOIB0E0l6cqscXOwnF9wy2htGNX0NyyqJEBgDsv0
 5gyzLXOkg80uiFo1H4jGnJDvtuBnJLQvMBDurkeSb4g0xwZ9Bo3/BXIs4xNfB6H6Qjmj
 zIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BRCivU/20+kBh8sIH9bjF446ecx01m5TDbfjlAmrKdo=;
 b=gBN09HbFa8ldt+qag5cI/w4hKqaF6tyib7O0ovwkFzpUJ0Sc5jkt1mm8fHEQzLUaIG
 MVKyFLBCAq7qXhpQHRIWK7v4BwNTX7cnbwxFyoMxdtZjSis7RZmq+RsC+oajOvjqQyo+
 6/H5Qep6RZmA9w2rn9uHYBck44IjjLaoFEhCYR7X0GIbJyzq30ii2g2Mw23hzQnUhwPy
 RWdy6LuPSNRoZfC5Z/zT4JUMxjy9R9c3AEfyFqtYRCPlCVUMXN8GTulveGMlGpukZURV
 LC+EfYHaqcoRBuvYPYJEnxzma29g8HqisVDrUjsceRlVP/6Hft2ZFDMEo6szZ2cwHSCt
 ajLw==
X-Gm-Message-State: AOAM532qwYaCBQa4H07Rdn+/bEPnOBot4sz9REryhKHLYkdWLgGCTRz9
 GrpsQuYbQD0KR8yWCzbaQKxKUZgfRDN7dw==
X-Google-Smtp-Source: ABdhPJwkOcQMsx7wqwX/k4QPk0d5ZfhuNOkrQjfEQJdRNrhIarJ0Q14+0d327X4PQ8gIC8nHBObB6Q==
X-Received: by 2002:a17:906:90c9:: with SMTP id
 v9mr7609645ejw.356.1631818296084; 
 Thu, 16 Sep 2021 11:51:36 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b14sm1726730edy.56.2021.09.16.11.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 11:51:35 -0700 (PDT)
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210906152540.1831522-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <9f1484c0-8346-396d-c13a-876b6ad79b85@mind.be>
Date: Thu, 16 Sep 2021 20:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906152540.1831522-1-francois.perrad@gadz.org>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.3.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 06/09/2021 17:25, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libressl/libressl.hash | 2 +-
>  package/libressl/libressl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
> index 5f6b22aed..45afd04dc 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256  a471565b36ccd1a70d0bd7d37c6e95c43a26a62829b487d9d2cdebfe58be3066  libressl-3.3.3.tar.gz
> +sha256  bcce767a3fed252bfd1210f8a7e3505a2b54d3008f66e43d9b95e3f30c072931  libressl-3.3.4.tar.gz
>  # Locally computed
>  sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index f1f5e1974..f1847b18d 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBRESSL_VERSION = 3.3.3
> +LIBRESSL_VERSION = 3.3.4
>  LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>  LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
>  LIBRESSL_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
