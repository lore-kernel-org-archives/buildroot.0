Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47562C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2B561372
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD2B561372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B012407CF;
	Tue,  5 Oct 2021 19:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_xMyH9A3kgj; Tue,  5 Oct 2021 19:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02967407EF;
	Tue,  5 Oct 2021 19:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB2541BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA45E83E0D
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdvD3ltmZS6Q for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:33:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDA5783BBA
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:33:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id p13so1061016edw.0
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dAmxctMWg8rKpURwAGwaxFlrFFJSE2xrnLFi7JTYcUQ=;
 b=L08SIRb2OZhWdnMIMJjj3ftsZpgxv9xmaUDj2nFPiuI0keVKRHzl6TEKUeZSmhUjrH
 r9fpWoncHYzp3el9O02gfABwNwXWdjrYLZ2KMnGiiaJw9CyaPvGxpWJQgZQ9mhzjL0dU
 FegM8YVCpFtJTBUMDRyPzeldvm4x+AjAXGQ5StOHYqASTCSsqLe2z4D0A1J77NX6jQE+
 9WmFBfXlu+2YsQi4MQK1NoiAdvi7Y7U9kXb5GOu2q0FFlPdFVA7Q9sjhHrFy3wYWTN3k
 i1sPyNt0fcXqkSYvKIHCkjjirIgupKCgMRqrb5yG4h48rOyANEjDn+Nh+ekrQwDDR7cl
 tQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dAmxctMWg8rKpURwAGwaxFlrFFJSE2xrnLFi7JTYcUQ=;
 b=jT+XWHOJ0TAeUAkbo1rrjrXCoPLWNa9RJOlGDEdqbky6Tc9OPXExduHKdC3wANlD5j
 LsnTUuWhTVO8BrGcphGtYyw7Vl32BkC4CrmywbQi3eck5RWms2bt49+M/PGUkWL//i+B
 Bg8UL8/Lyc7sMoTVHYuAHVrt9G1OM5ZpIqPXqp2aLnt7b0BUAs575MkB0a6czCDQ9zHh
 SkV+qGZXEORwGnoJX8wLRRnBh+cV/MbvW2Ihr9p8G/Z69cZTW2pq+TIRFbUL0LWkHAbz
 TXMa3CGuuZ+GBrF1x1Mw1I9RGHAwer3LehS530hU2LiffPFzbxKqoAxur0s4BJUnan2v
 8dlQ==
X-Gm-Message-State: AOAM532kUV3TJOjS0fQANy+v+CbICi6vgdUWOiChsieb+bJY6mYWXfjK
 02boqjoN3X2o1JMFOTKTRBaZdg==
X-Google-Smtp-Source: ABdhPJySpNJgebuSX4Sp0vKygm+l+O3yzREtuM0LLK1eTDnOHrC/pD7GyjvuCNN+33vnR5uz9ev75w==
X-Received: by 2002:a17:906:165a:: with SMTP id
 n26mr25863068ejd.236.1633462419952; 
 Tue, 05 Oct 2021 12:33:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r26sm8117901ejd.85.2021.10.05.12.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:33:39 -0700 (PDT)
Message-ID: <a37ec92e-409a-3559-8e70-98da571e453c@mind.be>
Date: Tue, 5 Oct 2021 21:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210927163727.1472686-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927163727.1472686-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/wget: bump to version 1.21.2
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



On 27/09/2021 18:37, Fabrice Fontaine wrote:
> https://lists.gnu.org/archive/html/bug-wget/2021-09/msg00005.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>   - Fix tarball hash
> 
>   package/wget/wget.hash | 4 ++--
>   package/wget/wget.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wget/wget.hash b/package/wget/wget.hash
> index 11071566aa..7f89bedb88 100644
> --- a/package/wget/wget.hash
> +++ b/package/wget/wget.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/wget/wget-1.21.tar.lz.sig
> +# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
>   # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
> -sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.1.tar.lz
> +sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
>   # Locally calculated
>   sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index ae036478b8..f30fa39917 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WGET_VERSION = 1.21.1
> +WGET_VERSION = 1.21.2
>   WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
>   WGET_SITE = $(BR2_GNU_MIRROR)/wget
>   WGET_DEPENDENCIES = host-pkgconf
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
