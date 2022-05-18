Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E1DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C95241030;
	Wed, 18 May 2022 19:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9S7Hj7z5GOr; Wed, 18 May 2022 19:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 031EE40BA4;
	Wed, 18 May 2022 19:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 374C81BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 266AF6124A
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4d1W8Vb8qmQ for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:18:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AB9760EBE
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:18:24 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id z2so5682950ejj.3
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=POjB+S0Wgxcz5foL/zOWUhLDbTPg3v2FJBDlDnXgi9s=;
 b=Rj6pHB7hSgKojV50YnKPLo0u/mmiHsuHscf0/XuzKTjAkDWmKDh0FBshVVhS+fNlkT
 2oirh9fIIAUiygEmwEMd5cu2+C0mLg4TaublVgeUwt0Yb83bhR8QAxh/n5haknyU0WR+
 M5boSmuQKCB12pPdQDlVcvz9gyuZu6ZZVJQmwUWQVEC8bEM8Sc4uyFlWevMwio/TKsDf
 g3WS+wfA308k8whSyPhPCnM8eQkLspG2IbeuuKET3rCTAt5VqtKeZh72H6APEG0teijq
 9QvlCzhYrI+Ciuro7zYExtyf4lE5I15sl7tisbIu6C3zfSE6JFSkey7ZUd7Z8/495z+P
 xxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=POjB+S0Wgxcz5foL/zOWUhLDbTPg3v2FJBDlDnXgi9s=;
 b=v1dUcuCAba5bvGoRA81Yr8ohfiO5BMMRfb7XGfIlAaC9WbbSZS1uRrRiBgi9jREtJ0
 dFhZEB7LfnNNiurbJgcbYeDIXK19qMti+jD+4h9Ajwlesrnb+Zw1vvBSFaBlcAf03Hg+
 092iGXS/lf5zkpDRjiIPSRvArOGlUfSKk3qAWgOWDD5lKxgoDXJKHkZXL6fgVDhmgHxr
 WP1/P78G8KlqYG3bxBgrr3/Vrv5QawU7ynd0a7mgsEV9Szz4TsVT6YFuDlVEKSJdMUpJ
 2z8YtDhTPKdYN94Q2QoMxBk828y+v8r2SSgKKbycjtAQ5XyE1gUHjYFdRuHiuDdiCHgN
 EbDA==
X-Gm-Message-State: AOAM533bbDyqyqP+LWOUkLtwwP23Ty8V+wRrJG9BMT5NB6uvR7kpJoL6
 kYQ58oLEByK4mnAysxL8Wv5sunOMkw4JcQ==
X-Google-Smtp-Source: ABdhPJxNOuwMlBC6AagPfN4hQYXzPovAlAPQxumdb9g8TyQ+oOEs7XttL+zhdPX/4q5ExJkj57ZVcA==
X-Received: by 2002:a17:907:62a6:b0:6ef:8118:d3e2 with SMTP id
 nd38-20020a17090762a600b006ef8118d3e2mr916625ejc.605.1652901503207; 
 Wed, 18 May 2022 12:18:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a170906844100b006f3ef214da1sm1271867ejy.7.2022.05.18.12.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:18:22 -0700 (PDT)
Message-ID: <0e2cac5e-33ff-a4d3-258d-d48ed3c4e4a7@mind.be>
Date: Wed, 18 May 2022 21:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220517204317.198644-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220517204317.198644-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/python-service-identity: add
 missing python-six runtime dependency
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



On 17/05/2022 22:43, Romain Naour wrote:
> python-service-identity 21.1.0 release requires python-six at runtime [1].
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2459841098
> 
> [1] https://github.com/pyca/service-identity/commit/705f4af829adf4d1b6e44250d8039635a73199d5
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-service-identity/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
> index d6ca060562..09ebd97a65 100644
> --- a/package/python-service-identity/Config.in
> +++ b/package/python-service-identity/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>   	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
>   	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
>   	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	help
>   	  Service identity verification for pyOpenSSL.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
