Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CC1C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:25:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B77A60F38
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B77A60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02FD680D84;
	Sun, 29 Aug 2021 17:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPQ9Bxm7h2JC; Sun, 29 Aug 2021 17:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A4A80D8B;
	Sun, 29 Aug 2021 17:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9361A1BF599
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8349E6070B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Spe9T7FDns81 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 17:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58758606F2
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 17:25:29 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a25so25906027ejv.6
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 10:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y2qgqB+xAUQGvTA6JvSx/hZlIwav3ca32Do+TnzQ4tY=;
 b=IEDg/cqkIoZfE8MPBZrI6sDkjVcNCa1dXr7EEcKjMw1rkstvBlKCGcdw95AsVO52Nn
 sXUKkrW7lhowHeXzfTsugCB+GdrmPee7PNDtgy3kRaeXU5o3L3P0CJofmuSgHFuLO6Sx
 xi/GXkYG7JDfINXv9h0OH+4vLYBVy78b9QzxR8wON33/U2CxZpbgmqCG7zIbBpHktWGI
 Faoq2l/8e4tCKQ8lOa9IJvp5GEKb9Bt3CwUCfRyYQ5MUGEOmhuKi5MY20TuNHbGa8QPq
 tvXpUSyi6rkMBu8/Ii3Ls14U0G2+mVpxrynlpTIPxRN2/sTK1d0h7f2F+No0ArQmUdm/
 dNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y2qgqB+xAUQGvTA6JvSx/hZlIwav3ca32Do+TnzQ4tY=;
 b=W6Gacli+pxXD9Om4HwbQY52XXADVOwqs4ovJMTE0gQOr4I5urJcP74rUefc4AJcVe9
 Ita7BkK7b5eG2sjWKZbN6Q+WRyZ8EQNxg/cUNsNrHmKXGKgfmBxD3XP8P928JUDJqJNW
 pGnTLKGWMs0YyUovrkD4Qc5vg6cPenOXD/yw714sygIcLQP6VDNWpCr36hmrEyY3fwUL
 9sDXoD9Z49wlSYlTHQnJbh5w8yUndmTC3k1yRCPc4Cxj2r7taxVslMtkNrWsDssk6txK
 FXHFtppdNb6p7IC+uHVlplOkGFa+16awDf7RrBCwoDkiBprB8MDDy+A9g+DGXXVtSj7V
 L6+w==
X-Gm-Message-State: AOAM530/nyqpuYOe6rtik/VrmkGTF/Ne7sk3GTxYq76KvpJAyRSyELl3
 NAEZvn7Rh1VXAYWBiPOuon6kRR9YdUtZgw==
X-Google-Smtp-Source: ABdhPJy6TLErHHVrR4QLBrSo15CvuVfv4BDmx8RQhC05kmNfq0uELpV3E0SFrix8BQUbR7AJDbtEHg==
X-Received: by 2002:a17:906:8468:: with SMTP id
 hx8mr20627802ejc.492.1630257927426; 
 Sun, 29 Aug 2021 10:25:27 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lb12sm5704733ejc.28.2021.08.29.10.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 10:25:27 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20210826195548.34967-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0fc30697-caf1-ffd6-9e93-07b88efa1707@mind.be>
Date: Sun, 29 Aug 2021 19:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826195548.34967-1-buildroot@heine.tech>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/json-for-modern-cpp: bump version
 to 3.10.2
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



On 26/08/2021 21:55, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
>  package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> index eb9270b311..5296be3924 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  9943db11eeaa5b23e58a88fbc26c453faccef7b546e55063ad00e7caaaf76d0b  json-3.9.0.tar.gz
> +sha256  081ed0f9f89805c2d96335c3acfa993b39a0a5b4b4cef7edb68dd2210a13458c  json-3.10.2.tar.gz
>  sha256  50be9457e5c9faaba5e60d9c73f8eabe9e0737a2d9c3e58357d856661862c18e  LICENSE.MIT

 License hash changed due to copyright year update to 2021. Committed to next
with that fixed, thanks.

 Regards,
 Arnout

> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> index b644f3354c..14843380ee 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -JSON_FOR_MODERN_CPP_VERSION = 3.9.0
> +JSON_FOR_MODERN_CPP_VERSION = 3.10.2
>  JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
>  JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
>  JSON_FOR_MODERN_CPP_LICENSE = MIT
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
