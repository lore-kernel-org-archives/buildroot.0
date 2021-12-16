Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D79C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6844E83155;
	Thu, 16 Dec 2021 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96mgBAQSLSFS; Thu, 16 Dec 2021 19:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A967D82F9E;
	Thu, 16 Dec 2021 19:37:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4287B1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3275941703
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LD87dq3mKbxx for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:37:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51BCB402A5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:37:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b7so31559203edd.6
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4LEZy0FEHRvTA8ioDjp1qkZYRWWEXE56q9Y/IwIsbpk=;
 b=KCK4qohMqpTpZEy86NtWJ5n5dKhH4XLsRxSbw60Zc76eDjy6yR7rLS2TrVCYjRMMs3
 BAjtHlyBMXO/oObmo96WzHBwhN5gx/M3S2YCkjza7UnWTakLeU3sfLb9JFPiX/4EPxfe
 b9Ho3FlQUUhdWONK6vnH0Ah0MRSrBpHCQ1E0vLKjknr1BXgcDF17y8V2Em4btHHAJx48
 vFFNvkgvLI224OWjubeoV2aD7pACVgaSGmYBOt3JhC3KKyv7EnqrSSEMrNcC+P/93q1J
 z2btAv+dxQV3KExrwF/hR+DWjVej1wQ4CPNwJKe5SvYbnOPg9t9KJnpTEuvJyGeiJ+R8
 Z0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4LEZy0FEHRvTA8ioDjp1qkZYRWWEXE56q9Y/IwIsbpk=;
 b=ClTfbjnZ4ReveFnMTUf33rMJWfiRun8mHo+k2cUIMw5tAiYzHdecyncoD9zc7zuStK
 o5raGrKrb5zAYGGGW4LCi2kY3cuNcz5gDCpLzVCRqFHpkaoFvv+rwx9IXucu48BphnUz
 HC6+259Q7Xa/XQ7sqYBAu67rhhsXXKQj3SJlHgiimJVNTITRAilmMp3ipW6Sjj4mVo/L
 cqAhvTolywGDoFtLQWQdsTl28nzW5gXxaK9LGdurlh2WIYvZXJTwQUGV7bncX6v96pSY
 pkj3iBWIJcV0ZmzhayUES9xX3mWeUaysDqTQlYeWhkHV3u/N6TVWvgfL4F5YUxnmLLu1
 TaEg==
X-Gm-Message-State: AOAM530fRC7HlZUdwhi2bJKV5/0Kg09yuY7H7n4YAOd5StpWDgnruv/t
 BbcWbGc1yhAyooW0/tcO8FUqnHSa3Cc8+Q==
X-Google-Smtp-Source: ABdhPJwZnT5+M9JGr7jeb0037gaYg0jylcwYwnwWowEXve8lae6hY7HMAkyAGyABZheGRgYhxj3Zog==
X-Received: by 2002:a50:bae2:: with SMTP id x89mr8338116ede.337.1639683425423; 
 Thu, 16 Dec 2021 11:37:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 26sm2097328ejk.138.2021.12.16.11.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:37:04 -0800 (PST)
Message-ID: <df38cb71-aef8-2001-c9b0-44085a43c220@mind.be>
Date: Thu, 16 Dec 2021 20:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211215213221.790491-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215213221.790491-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.73.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 22:32, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 803b234c83..100d2d7870 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_73_RTM/src/SHA256SUMS
> -sha256  566d3a68da9b10d7da9ef84eb4fe182f8f04e20d85c55d1bf360bb2c0096d8e5  nss-3.73.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_73_1_RTM/src/SHA256SUMS
> +sha256  c768f9fe3129e8bcc2e9679456d7edd9453a225784a8fc7dc4501806f1fe9abe  nss-3.73.1.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 2e26abdfc0..e2f7521b47 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.73
> +LIBNSS_VERSION = 3.73.1
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
