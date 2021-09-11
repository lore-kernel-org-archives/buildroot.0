Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58900C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:02:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1080D611C3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1080D611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0FE74042F;
	Sat, 11 Sep 2021 13:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZihnIrdfc2Jn; Sat, 11 Sep 2021 13:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1A374011A;
	Sat, 11 Sep 2021 13:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65BE51BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50B404011A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RjMgJ18WOYA for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:02:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4870400EB
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:02:10 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c22so5304959edn.12
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ixnqyTflRt7ndMf6qNypdYUpCXpxKYpEFeeeiNQgF/Y=;
 b=Iva+BKKoH7itA9s4NG1aoeEcc1PiO5yj8jhxvy9wu+W3OWq5cWHjsbDzsvHXePT4HX
 HzlpWPevJxhSks2lortGlmdIbLYFakywLlLluL2mrDqNgobSNoCQMVt2kpLaDcSlviB2
 9Gv5QPpkig0dqV3WE9+7xJ8YRDhEjkytWrR9rrQM5nUI78VTiPcPw741BG4stxdWQwfX
 aZIVSiw5ZxKnJ8kwm9CeR+mcNDTsJ/C9JzbyHF/F6BMrnJFzbHxIeMEw1cWO6rhKbB1v
 yOkzoHAKXO+v+b2Qrb75PcidBneLwSjHJCBVdGla/F/zwLYWhAw4s+IenyE6nOq/Rtvc
 ZBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ixnqyTflRt7ndMf6qNypdYUpCXpxKYpEFeeeiNQgF/Y=;
 b=33QO3ZlHRIA3o+Q2JnYu9J/OQk0DTa5UBf4Bu2BEC5SLC9kwA/5iA+Ai8Fj9Qcuj8y
 JbktVefyktzqaZyRVNaivXr69klwNRZ+oJTNUuMyVs9nGgF8lGfNOkVzh3x3VC4SHI+/
 WgiNcD+CTKOvkn5QQrvs3MhiQPQOJyqaDwquQriu5ZrnfAHl79/+epyxwb2poOVU5dpS
 SEXj71XgqtSAryti4XPQnPfeHrttTukN4fqqKXPlrNjIsXJPubDCscw8Vw+Rlg/uHZeY
 M5Ws2vuFQtGi/bDYsmugvBFQRRlf+ap7Gzcyjm86lPFKfDFASwqEkKr11niUu2NH0KAX
 VZSA==
X-Gm-Message-State: AOAM532BGoVgYgQNSKKlpL4QXpxrMM/wHgvTuTiAD52vKP7Y8ewlGf27
 IQhK6PDDH3pW4cXvOfb0oVVH3W9KnF9cTA==
X-Google-Smtp-Source: ABdhPJwEe08SAWwrixKg3k0quwi65wqMPcG4VuBMcFiX0XHrm2KbQo7dR2GabgHzOzlFRuviY0AH4w==
X-Received: by 2002:a05:6402:1359:: with SMTP id
 y25mr3201357edw.50.1631365328836; 
 Sat, 11 Sep 2021 06:02:08 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i26sm899484edt.62.2021.09.11.06.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 06:02:08 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210828074644.209625-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <535de2e7-ad6c-b402-ca1a-d9925e11d276@mind.be>
Date: Sat, 11 Sep 2021 15:02:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828074644.209625-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.61
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 28/08/2021 09:46, Bernd Kuhls wrote:
> Release notes: http://www.bluez.org/release-of-bluez-5-61/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
>  package/bluez5_utils/bluez5_utils.hash               | 2 +-
>  package/bluez5_utils/bluez5_utils.mk                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> index 815cf4b160..f4c7fc3cbb 100644
> --- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
> +++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Keep the version and patches in sync with bluez5_utils
> -BLUEZ5_UTILS_HEADERS_VERSION = 5.60
> +BLUEZ5_UTILS_HEADERS_VERSION = 5.61
>  BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
> diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
> index 117f39cc93..3ba2482468 100644
> --- a/package/bluez5_utils/bluez5_utils.hash
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
> -sha256  710999580d01ee59ec585e5e7c07fd94eddedc001aa26fe7464c546f9d945304  bluez-5.60.tar.xz
> +sha256  83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b  bluez-5.61.tar.xz
>  # Locally computed
>  sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index 5f5a7f44c9..ce927b7a43 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Keep the version and patches in sync with bluez5_utils-headers
> -BLUEZ5_UTILS_VERSION = 5.60
> +BLUEZ5_UTILS_VERSION = 5.61
>  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
