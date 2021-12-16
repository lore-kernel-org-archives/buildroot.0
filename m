Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10830C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2CDA4179E;
	Thu, 16 Dec 2021 18:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtOfPsGItS3h; Thu, 16 Dec 2021 18:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14F214178A;
	Thu, 16 Dec 2021 18:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD251BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1527340371
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmU8jpkp48Qi for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:22:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E1C140B50
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:22:54 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z5so90833371edd.3
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=tIP3mCqhl3PjEsIlheeGCbyMO6OudMoG3jOUz87+DGk=;
 b=ahNrxSpoYiFY6sGMFIWmukKWJ8rLZ/DAK9RDSRdZvePcELRkBP4lQ7jua3K9hFoh45
 NryU+06P8UuZwq8jogX6ELeyYyHVss80FSGZsM57E8aoqNNkJhmfxxlu7rMuPKM0C11+
 mele9+APzdUHXWNxP8zWVrPgj/5V7ORT0oyG4UvQJcG+ro3aYZdsHsDi9GW9jpSmWSfC
 qpnHiECsqlRb4D1jXLgcvtjL1dTByORiP1Sig6I8O5sZj4vGHz5Evq6s/EpIWy7VhpQq
 9WcJuuSLMWsH5y3fVWmZsjGwfG8jRFtR/RosjJKKU4ag1XS8yoa4Hb0NCW632Luh2kMx
 98dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tIP3mCqhl3PjEsIlheeGCbyMO6OudMoG3jOUz87+DGk=;
 b=65E9lYVIbr8hSgQNNKOi97Ur+CH8Ubp0zdCuBNV4JnF3ntW89vzIdeyCJSUMT8QlXK
 yXsYzFnUccZiL9LtzljNCJmMmapvCMXo8834pcQkKjUPMPkwiYAJ0xUpXqS3Jx/O2VOt
 JGeDbkyWq5RKY+swEyJrNrOlVKUukJhPBOw3phBPswfKhR1MowFpTJyQdLi1LdZw3lu9
 kgPDpVFBKAtBxuCvcdTWHSUREqaNqeuTcL2BKryuXUoXE3wBHNoJS1MJw2g5Nry1GN9X
 +9cO7riAv7YyLFFhxc8LhhWzVBzkq9VcFbbD+GC0RUk4xa5WkIKslx9y6Mbx2L2hRZBc
 N4PQ==
X-Gm-Message-State: AOAM532K7nfrJIqay4GkcosmS0wK1AtK2O24CCsZKG74FbbDgk9CS/2g
 Bqeq6igPzgL9LlQ15HWSLzBE2g==
X-Google-Smtp-Source: ABdhPJyLAKVVtQf3uAY4M9hRQzNH4xjXfUNUbDUUVqhh+feTCVyUw7PzWftLjm5LzXhgPND6mXPm8g==
X-Received: by 2002:a05:6402:42c6:: with SMTP id
 i6mr21906053edc.223.1639678972477; 
 Thu, 16 Dec 2021 10:22:52 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ho17sm2035602ejc.111.2021.12.16.10.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:22:52 -0800 (PST)
Message-ID: <ba02c044-f4c6-509c-179d-649c453acf60@mind.be>
Date: Thu, 16 Dec 2021 19:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214231042.3277459-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214231042.3277459-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlcipher: bump to version 4.5.0
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



On 15/12/2021 00:10, Fabrice Fontaine wrote:
> https://github.com/sqlcipher/sqlcipher/blob/v4.5.0/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sqlcipher/sqlcipher.hash | 2 +-
>   package/sqlcipher/sqlcipher.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
> index ddc78ef7d6..f831e615d8 100644
> --- a/package/sqlcipher/sqlcipher.hash
> +++ b/package/sqlcipher/sqlcipher.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  b8df69b998c042ce7f8a99f07cf11f45dfebe51110ef92de95f1728358853133  sqlcipher-4.4.3.tar.gz
> +sha256  20c46a855c47d5a0a159fdcaa8491ec7bdbaa706a734ee52bc76188b929afb14  sqlcipher-4.5.0.tar.gz
>   sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
> diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
> index 776e2d0dcf..c47aa48429 100644
> --- a/package/sqlcipher/sqlcipher.mk
> +++ b/package/sqlcipher/sqlcipher.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SQLCIPHER_VERSION = 4.4.3
> +SQLCIPHER_VERSION = 4.5.0
>   SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
>   SQLCIPHER_LICENSE = BSD-3-Clause
>   SQLCIPHER_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
