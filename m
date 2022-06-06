Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6760AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B1B61074;
	Mon,  6 Jun 2022 13:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Sptl91E9rzv; Mon,  6 Jun 2022 13:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE8561070;
	Mon,  6 Jun 2022 13:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFD7E1BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E5D140546
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wtz9mo_c2qOq for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCE6140408
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id n10so28839595ejk.5
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=5w8ZAbNyqM5cEIRKSIg9l/SrEIt7seVcUx1WNE1GP5U=;
 b=X6MzTQtZmLzD8h/5+RFlES5KDdUhq1dR7iuaMiiAOFdgg/klCc24dzw0MHzD5/w2yV
 IWT5No087aHqFCRcmvNUX1kImCw2PDYpgrjdLPKgVAgXYMhzg4XPiqlGdm7Iu9pJd/TQ
 z8rbRhTlxr32sHC8WTcj/NYsSjX+RDu0Q3SjFAcebWWTV4C5wEVZtxJMDxAXytUqCpxD
 Ifu9ZbaUYRl+CH17ipKu/0zPy8BqAkkipFZR+CgUbFppdLAfKmNGj15I1oO0r/vp2ekg
 WDbB8w2tL2m3QwTcT+oDQCMrjg/qrY4aSDYtcF1Gw6yDmhZElorkX9rSQbMb9C9jGzVJ
 GyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5w8ZAbNyqM5cEIRKSIg9l/SrEIt7seVcUx1WNE1GP5U=;
 b=r30Ct6yJkNxYQbVCKFR1RJnvZxXDyu5O5RQTLClS3FRtr2ap7C0m5nd1qb2pXmx4cH
 wufJnCu7o021THwrkXGiU/HQVMrj5QkPXtSnwvWoMNHi8wWpSAK2XtPZ/RuGL89UhlE+
 EFPh3O6UQGZtv1MS8X2c076L63od1FBSgSOXEzNsJ/KOZnZ9FYTyLQB7YbCJXwIQdfmC
 VAxFuwaXuhw3N34VKcnlOP4E5/xKNQwnVh02AO/Chiuvk3D+VCOXXtyTLT0p62bszJfA
 hnSmYIjkIhKWfxecYScjfKYfHnW1DXNAJ79kUcE/Rfs34DJsVQDYm5NpMrRxahwkwxrL
 d0eA==
X-Gm-Message-State: AOAM532OQ+jyJRbYSUUMnboEohs2tQxtj17YUfoyRSfbXc20wfa8D5+O
 yYswghpcheBWiRXEVwe4l4P2rCNQD0naSg==
X-Google-Smtp-Source: ABdhPJzjHd1T38yHnl2PUkgp9+pOUNFRnCzJL+7G2fyjbXtp6jQP/ueB3w6fK+gL+KZ/pyeZUsGRyw==
X-Received: by 2002:a17:907:6d0d:b0:711:c940:7f1c with SMTP id
 sa13-20020a1709076d0d00b00711c9407f1cmr6101115ejc.399.1654520580498; 
 Mon, 06 Jun 2022 06:03:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bf8-20020a170906c50800b00705cd37fd5asm6258005ejb.72.2022.06.06.06.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:03:00 -0700 (PDT)
Message-ID: <cce18bf3-ad81-d8de-fe35-0eeee6f78e29@mind.be>
Date: Mon, 6 Jun 2022 15:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606102822.398093-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606102822.398093-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.5062
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



On 06/06/2022 12:28, Fabrice Fontaine wrote:
> Fix CVE-2022-1851: Out-of-bounds Read in GitHub repository vim/vim prior
> to 8.2.
> 
> Fix CVE-2022-1886: Heap-based Buffer Overflow in GitHub repository
> vim/vim prior to 8.2.
> 
> Fix CVE-2022-1898: Use After Free in GitHub repository vim/vim prior to
> 8.2.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  The previous one just got committed to 2022.02.x, and we already have a new one...

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/vim/vim.hash | 2 +-
>   package/vim/vim.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 9d61d6fc87..55e5643b90 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  5606a3c62dba038f4c4f2eddb305ffccbae58a7bfd569bdb8100f524564c8a32  vim-8.2.4980.tar.gz
> +sha256  3052bc702cfb49571dbcf9824827ae6032c37c7bf1a2aa0d3f7cc18c8f085dfb  vim-8.2.5062.tar.gz
>   sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
>   sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 9e70360b90..6dbb32d27b 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -VIM_VERSION = 8.2.4980
> +VIM_VERSION = 8.2.5062
>   VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>   VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>   VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
