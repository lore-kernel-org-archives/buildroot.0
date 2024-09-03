Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50686CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5FAE40105;
	Tue,  3 Sep 2024 20:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMh4UAuLLRfJ; Tue,  3 Sep 2024 20:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922C14024A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 922C14024A;
	Tue,  3 Sep 2024 20:44:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA3D81BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 957A060687
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-N8kBqMyeyP for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BAE160683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BAE160683
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BAE160683
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:44:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so2029826f8f.3
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 13:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725396286; x=1726001086;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KGvaUck2pmLHBqp/GoFyYfAwwRQ76nPfO+zCqRcsAk4=;
 b=VGRT/nBwpm20ZGM3d72LNJMzk9iYq7rcRtrBMKFmLPtNp40gYix2Xxx0GrQd5vd5z7
 7IZw0ONikHY0L03EqmwCf4ZnDec/NXUTku+ti5ljtcpU7sPAVomizCWfH5+Pr2Rd/ECH
 zKLqZnnsSIEwKDlGqcgh9WrVdUkhRcEXtvXwdHfyvvGPYi6l4J5beEBoj9kr7UEY1WO9
 kX9P4ww18EY7jg75OxhyF0912yxZoFaqfBpf2OIX7GmeCtiq9cB/MSalELiKQ5spjQAL
 SdTPiWqX413vJEdx0hcvZi+hZMQFB1oOhBkNIGb/KNLHedg0T/tlGOj+7gE48qlE8559
 2wuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdfOZ9swBg2m48Wde7U/7mvo6RDCmJPGTC1/F5ba6kbfI7CKPVmZN0vvp53nSZyMFrfx4XWKw/YyQ=@buildroot.org
X-Gm-Message-State: AOJu0YwRNJqkCEaBi7ilnRVETYjaxcDfKaMMhPUdgXBlf6QftwcMf+fg
 PWbZNVCuKO805JaFymUdQNdYmJl/dq2L+XwDoRhzHsGMrbw9iI0cDi6pYpGF3as=
X-Google-Smtp-Source: AGHT+IEbfuxMpCz1j7Jr40T4gxK8hTyL+Ud3IjP4s1+4xfunD3WCUkxrFS6q9/mB5SYF4qMRCP9jLg==
X-Received: by 2002:a05:6000:2188:b0:374:bde1:6dbc with SMTP id
 ffacd0b85a97d-374bde16f16mr9913087f8f.4.1725396285997; 
 Tue, 03 Sep 2024 13:44:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df9705sm181241765e9.27.2024.09.03.13.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 13:44:45 -0700 (PDT)
Message-ID: <094e4098-48aa-42fd-a8eb-a9f31b9b8db6@mind.be>
Date: Tue, 3 Sep 2024 22:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
References: <cover.1722501946.git.yann.morin@orange.com>
 <36b2737b4867a81a9119c86f9a4fe8135171d920.1722501946.git.yann.morin@orange.com>
Content-Language: en-GB
In-Reply-To: <36b2737b4867a81a9119c86f9a4fe8135171d920.1722501946.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725396286; x=1726001086; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KGvaUck2pmLHBqp/GoFyYfAwwRQ76nPfO+zCqRcsAk4=;
 b=E/z1roFcTpUyrCQWFPdIS3PC0x/nWGzU2w9io6cXfxVNnpglEviphVumXYgSQwCeVe
 kFeSDeAPhD0eJMzsaVQzuLHcU7iAUH+AH/KZp7RknhEDS483KBW6bcsWnwLgj2yXeJJV
 Y0vPSBCVEfTjW83KwRj443VysDIjnhGw6WTaitU0HQLX8i8OLd8zv0e+MQtaPSVkqhO/
 Wz6N9DpY+e+w4yqQ+EuA0wdLHfiOcz1qEh9ndWjZLVJ7D1TYpeJDvLw3o+vBr2VqGP2e
 4KOHNquPoa6LJENqijdveU4tiTilt5j2j+pt568vf9JifwCty/2N/kD0QdBuuJiCNcd+
 LHDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=E/z1roFc
Subject: Re: [Buildroot] [PATCH 2/7] package/go: expose host CGO linking
 support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/08/2024 10:45, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Even when configured for cross-compilation, the go compiler is always
> able to build natively as well, and this is was we use in Buildroot to
> build host go packages. This implies that when the target has
> limitations, those limitations thus also apply to the host builds.
> 
> This means that, when there is no CGO linking support for the target,
> the compiler is built without CGO linking support, and thus CGO linking
> is also not available for the host builds.
> 
> Of course, when there is no go support for the target, the CGO linking
> support only depends on the host architecture.
> 
> Add a new Kconfig symbol that repesent whether CGO linking is available
> for the host; host packages can then depend on that symbol, like the
> target variants do on the corresponding target symbol.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Perale <thomas.perale@mind.be>
> Cc: Christian Stewart <christian@aperture.us>
> Cc: Anisse Astier <anisse@astier.eu>
> ---
>   docs/manual/adding-packages-golang.adoc |  3 ++-
>   package/go/Config.in.host               | 12 ++++++++++++
>   package/go/go.mk                        |  7 ++++---
>   3 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
> index 3ddbe57afe..aa25426591 100644
> --- a/docs/manual/adding-packages-golang.adoc
> +++ b/docs/manual/adding-packages-golang.adoc
> @@ -49,7 +49,8 @@ infrastructure should depend on +BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS+
>   because Buildroot will automatically add a dependency on +host-go+
>   to such packages.
>   If you need CGO support in your package, you must add a dependency on
> -+BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS+.
> ++BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS+; for host packages,
> +add a dependency on +BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS+.
>   
>   The main macro of the Go package infrastructure is
>   +golang-package+. It is similar to the +generic-package+ macro. The
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 11ce6df369..eefca03b02 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -36,6 +36,18 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>   	default y
>   	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
>   
> +# CGO linking for the host. Since we use the same compiler for target
> +# and host, if the target can't do CGO linking, then the host can't.
> +# But if the target is not supported by Go, then the host can do CGO
> +# linking (except when it itself does not support CGO linking).
> +config BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
> +	bool
> +	default y if BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	default y if !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	depends on BR2_HOSTARCH != "mips64"
> +	depends on BR2_HOSTARCH != "mips64el"
> +
>   # Go packages should select BR2_PACKAGE_HOST_GO
>   config BR2_PACKAGE_HOST_GO
>   	bool
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 660c7a9bad..7e0dfc5880 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -91,10 +91,11 @@ else
>   HOST_GO_CGO_ENABLED = 0
>   endif
>   else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -# If the target arch does not support go, host-go can still be used to build
> -# packages for the host, and enable cgo. No need to set all the arch stuff
> -#since we will not be cross-compiling.
> +ifeq ($(BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS),y)
>   HOST_GO_CGO_ENABLED = 1
> +else # !BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
> +HOST_GO_CGO_ENABLED = 0

  There is still a weird situation here: if the host is mips64, then it's 
possible that the host builds do _not_ support CGO, but target builds don't - 
and we still pass CGO_ENABLED=1 for host builds. Of course, host packages that 
rely on CGO should be excluded already in Config.in.host, but what if CGO is 
optional?

  My first intuition was that we should have a separate HOST_GO_HOST_CGO_ENABLED 
for host builds, but the problem still exists for the go-src package itself, 
since it has host and target in a single build. In fact, what will happen when 
you build that package on a mips64 for a target that does support CGO?


  Anyway, I think this patch is still progress, but a bit risky to still apply 
to master just befor the release. So I applied to next instead.

  Regards,
  Arnout


> +endif # BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
>   endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   # Ensure the toolchain is available, whatever the provider
>   HOST_GO_DEPENDENCIES += $(HOST_GO_DEPENDENCIES_CGO)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
