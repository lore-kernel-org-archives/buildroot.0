Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4712BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4372840E8;
	Wed, 18 May 2022 19:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHkj61AxsDg8; Wed, 18 May 2022 19:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B759784091;
	Wed, 18 May 2022 19:16:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCE9C1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAC5C40198
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0uf1gwjgZM3 for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:16:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9402640101
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:16:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id z2so5674254ejj.3
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=86rs3eGDTeMC0X5w1qHTXJDy+InF0np5dhPPqTwmJDM=;
 b=U3R7voAtY0K1oAX9bSsX5VRuhq968ldVw8bJCtsPS78ublhdhhXJVwBH/BPhaeUZq6
 j//mMEHPhP0O1Ex7evjGqr2Ym8xGwy66jACV7WQmjIzT1GqrNkIoitj6LHbtGmQa4nrl
 J5aog7oyLJ8fcC6da97c9vHtUTWLO7KKFMqagDqYI1vfHnNwfa7hdzWjB2aRD8JgVkFQ
 Kt6M5/Vf+COMuiZIrUyZu8FTs6t/YKgLLnPn+AZhCSuSPyoVFsdmt+QiZy28wgoZ8UZH
 uEWsfBJ5tEhWtegWVhUtch5KlT3zna+niHfwieHZX9U0reB/cBdDlL/omNuiCby0YuEx
 rFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=86rs3eGDTeMC0X5w1qHTXJDy+InF0np5dhPPqTwmJDM=;
 b=jboQle5yEiBEblIYdD9jLYfvij0CTYFgnq0TvpUyvl4TyHOW4bcNahLH/a7+IFRbiz
 iW7fXI2MHOxT/J/ZIuacnstgck+KKkzqwy+/mJd/B1i0FfKX5Ud+7XGXCqUZbQpnK44O
 VNAtUPbRKJ+CbUp3SoWdUNMHhXyOVTzSvG7Ns2nSSIxOMvjBHfNgrqDSC0Be9KWPnyel
 BR5i5qDGi8z18+b41d+iFkM5GZg1/xNs4juHzbi3lqvG7dXmYrW71fa+2LXsv/Zay94u
 PuPZ3XDqNiOV/1ixzYSt5+SxcG8itAOyj0HoAY6B0X5P/tv1JFmUuM1bmvqba/hzgWsa
 GA5Q==
X-Gm-Message-State: AOAM53080ltPmf7gijygv1XNcYg0WPXKRlbPlHFmM+NXTaNJvKRnbId0
 XFPkhLG9Kn/Ggh8ohrVvJHFV3F1PNfEFmw==
X-Google-Smtp-Source: ABdhPJza2vLh7vWhieuskaOxwm5Cpp5uH0JbOE2DAuoZczIuE/ksd238m2fzGT1dTTzBkZjb0S/UVw==
X-Received: by 2002:a17:907:d9e:b0:6f4:2983:c371 with SMTP id
 go30-20020a1709070d9e00b006f42983c371mr1011928ejc.558.1652901389506; 
 Wed, 18 May 2022 12:16:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r21-20020aa7d595000000b0042aba7ed532sm1691693edq.41.2022.05.18.12.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:16:28 -0700 (PDT)
Message-ID: <67eeeff9-8b6a-1ce8-70c7-c35ff3aadc82@mind.be>
Date: Wed, 18 May 2022 21:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220513202108.750746-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220513202108.750746-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/janus-gateway: fix build with
 libressl >= 3.5.0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/05/2022 22:21, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> dtls-bio.c:40:1: error: variable 'janus_dtls_bio_agent_methods' has initializer but incomplete type
>     40 | static BIO_METHOD janus_dtls_bio_agent_methods = {
>        | ^~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/92fe19446b40551c0139254d9efc6b3904fa287a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0004-Fix-build-with-libressl-3.5.0.patch  | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
> 
> diff --git a/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch b/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
> new file mode 100644
> index 0000000000..6d75318a45
> --- /dev/null
> +++ b/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
> @@ -0,0 +1,25 @@
> +From 8e450a097f5f0c7e9c034e954fbc709797521f1c Mon Sep 17 00:00:00 2001
> +From: Lorenzo Miniero <lminiero@gmail.com>
> +Date: Fri, 13 May 2022 18:42:38 +0200
> +Subject: [PATCH] Fix build with libressl >= 3.5.0 (see #2980)
> +
> +[Retrieved from:
> +https://github.com/meetecho/janus-gateway/commit/8e450a097f5f0c7e9c034e954fbc709797521f1c]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + dtls-bio.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/dtls-bio.h b/dtls-bio.h
> +index 92f06d7c0a..fbfd4c37bf 100644
> +--- a/dtls-bio.h
> ++++ b/dtls-bio.h
> +@@ -35,7 +35,7 @@ void janus_dtls_bio_agent_set_mtu(int start_mtu);
> + int janus_dtls_bio_agent_get_mtu(void);
> +
> + #if defined(LIBRESSL_VERSION_NUMBER)
> +-#define JANUS_USE_OPENSSL_PRE_1_1_API (1)
> ++#define JANUS_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
> + #else
> + #define JANUS_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
> + #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
