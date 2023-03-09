Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71961C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB6660BCA;
	Thu,  9 Mar 2023 19:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB6660BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgMQawMbxQb5; Thu,  9 Mar 2023 19:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16BEA60BE6;
	Thu,  9 Mar 2023 19:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16BEA60BE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA321BF410
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77FD040510
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FD040510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dtxf8J_742g4 for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 19:39:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B89400BF
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04B89400BF
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 19:39:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j11so11487872edq.4
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 11:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678390747;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/YeCAdhaAkuPlNVaywjrmf74jE6ZRzV9XVaDDUiL2/o=;
 b=LIkAloB5NPtf3Te3EcMqvQEMC07iYlrxWFHeEUv9iDqd3qm6DSnCu6F+/ok5MxAz7M
 rZqUHzbyUpBYTMAxoD3I7SCYUcqXQTeKWGQ5nE7PxCuTeYcYMabrDBxGjNC/L7cZGKSO
 f1QVVqgiPNFrcEknP9vsRj5hXt3fLQtOYq9RIUGA+gxGCuZ9SorI91ZA0OXqi4/V40bY
 dCThoPtYFggTyo6t3YABpixFAKuI+NdXH3JJeBvX8NFi+jMfLH15pOhOZ9i+KapJpr4t
 wJ2iziuxTYkcDsV9BfZzHPNiSDndqj2jR9pF3o+QSYAk1HMwllMJrXafifrYDgL4aWBA
 KmUQ==
X-Gm-Message-State: AO0yUKWxMa5em6iKI31hMQaqHBiext9uzNde0dVlS0PQjDmJt4ysnjIV
 Tn8KkkKa5S0/sqGlhyI9TqVyFQ==
X-Google-Smtp-Source: AK7set/W6S6yKRsALsp2EJ3dE+17ldhS8i8xuJ1L+GJWwAcb4m48yCOuuQ1UPPPn0V0sTcCwLGjBZA==
X-Received: by 2002:a17:907:60d1:b0:907:68b9:e05c with SMTP id
 hv17-20020a17090760d100b0090768b9e05cmr28332694ejc.58.1678390747029; 
 Thu, 09 Mar 2023 11:39:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y94-20020a50bb67000000b004d47ce55e57sm126049ede.10.2023.03.09.11.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 11:39:06 -0800 (PST)
Message-ID: <69ed7f1c-5ac3-af0a-b0c7-40b241a9d7b2@mind.be>
Date: Thu, 9 Mar 2023 20:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230309192513.54802-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230309192513.54802-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678390747;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/YeCAdhaAkuPlNVaywjrmf74jE6ZRzV9XVaDDUiL2/o=;
 b=FVzgFDqeWMJmQxJxL9Kdz3lzzPzAJig1DD1WqQH5a078B3wmP2a5697SJTsjTbcNz+
 HkofK85vGI/Nz+vSQq3B1n/9f4VIeU8AFjKb45UHRi+PFk/82BYk+VoxX3c7nH2wTI8Y
 +PJ/AcZf9dCs9XFab3oUgLxpzyyNS+Om+C7f+BnEGnViAOcuOx57aIyoctH6dFzXL+tG
 hpvbqJ5QGx59fT1dxh6FgKHALG3qFw8zSdZv+ZcFVJevb5Hfgl2EWi8mGMIzP5tJlHqN
 YeUQoYFvRy4tAaWIIRrieUu5qr9dF9PERItAaRr+vAeQTnqCLfX7tVD6TzMgf5iLI3DX
 SYjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FVzgFDqe
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.56
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



On 09/03/2023 20:25, Bernd Kuhls wrote:
> Release notes:
> https://lists.apache.org/thread/89vkczkfkdyz65d5q59pcyzrn5ts60s6
> 
> Changelog: https://dlcdn.apache.org/httpd/CHANGES_2.4.56
> 
> Fixes CVE-2023-25690 & CVE-2023-27522:
> https://httpd.apache.org/security/vulnerabilities_24.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/apache/apache.hash | 6 +++---
>   package/apache/apache.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index a1185c5618..36144917fb 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.apache.org/httpd/httpd-2.4.54.tar.bz2.{sha256,sha512}
> -sha256  11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac  httpd-2.4.55.tar.bz2
> -sha512  94982f7a1fedac8961fc17b5a22cf763ac28cb27ee6facab2e6a15b249b927773667493fd3f7354fb13fcb34a6f1afc1bdd5cf4b7be030cba1dfb523e40d43fb  httpd-2.4.55.tar.bz2
> +# From https://downloads.apache.org/httpd/httpd-2.4.56.tar.bz2.{sha256,sha512}
> +sha256  d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c  httpd-2.4.56.tar.bz2
> +sha512  5f12cd9878d822384b1bb163fea4d8edee5e7a0dd8b2389264387971268145cccc6a5a27ddf0436c5f1f631acc5fdc4874da2a47911483e421ca40bf783e0e12  httpd-2.4.56.tar.bz2
>   # Locally computed
>   sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 13018a9b1f..80205a6362 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -APACHE_VERSION = 2.4.55
> +APACHE_VERSION = 2.4.56
>   APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>   APACHE_SITE = https://downloads.apache.org/httpd
>   APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
