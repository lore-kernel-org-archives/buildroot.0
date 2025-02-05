Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8041C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E76040481;
	Wed,  5 Feb 2025 12:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHMP9nO8yfB9; Wed,  5 Feb 2025 12:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2800340400
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2800340400;
	Wed,  5 Feb 2025 12:27:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 968D612F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A82960B7C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfko31o9o5ix for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 559F460B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 559F460B6B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 559F460B6B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:27:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so47370115e9.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 04:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738758435; x=1739363235;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wPArjaYpNQ9iiwDmdoN3K8AErJM0oF5EbIZwlLQXqQs=;
 b=S9cND8RNmac36HteCu2r2vUH9YZvwjgMt7HqGWtHriGdeAHmeFc4EU+CMkf7dF0tpT
 M76NkjPX57RFprDc2GhmBbBDoPPznviqZ0ZLHDiQxYooKvfu1jRNg2FSOfnZkqDmHHVT
 zyzBzJhDUNZOjN9dXy2Zm0QyQ+g+QTkUrlj0cxCQUX7VgE1i2EmDiux/nNkiEUbYG6Ld
 kXCaJ4pZvgeYQHKMm4GXSwkhJ03SnypHMOkIz2sYcoUPmVPd/8ysBhOj8hjhvy7FddNE
 UI6pwVfuX41XXAcW13HoB+JOoGdCAHdLiTSgJN3bUcbArsBOpG+JkUybDykw+Ai7yVWC
 uTNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViyBktHm4Igniqovx0n2OjRW9H5he/HgOihSylN44hlgYoQ7oX2H+emtNN+R2MVnBOm8PKf0BqWa0=@buildroot.org
X-Gm-Message-State: AOJu0YxcFNhdljaiPFmt3nbRJFUjC5YJ7IrDE9LyjGQjDObap0oyVz7X
 SaVigledal8MMXPifWSltMcylAElO7s3wEeW7UHKtUKzZMgvtqLzH3QVsbPtVqs=
X-Gm-Gg: ASbGncunPkDclKWulo5qBgNc/GMhs+lIrM6sPrnwlEmQuLn8LxyXThMzaqnk8izK0fE
 BIgeAFpA+OKZkLolP+l4bDdhwzkOf3WRjgZ3HTSh6TNfNYX8GwxKcss8ONGaCBk87HKntD5OxOF
 lM3iSkb2fkCUFAxTE4146lmWT4T7jMg9Qa9mh/2tR3iuak8JZSUIdVGZBmoBX/rm/JT2auzHKjF
 HFWX3CHUZrKlzuiG/vlSwSIW3t6SwVGXTRAy7w+jCb1i0AbJDagQsCUfN4S+sPAlwsIIHHX9aBC
 9WMwy0WDOYBuH5oXsLXHXZLxdn2ZDhWH0hatNe9tQytSsok=
X-Google-Smtp-Source: AGHT+IFIQdVOex9vXttMYv/gAi1e1NYBx4di1/Wo+/65cW+W6tzFGl+1WjKWc2jh68CocGU5ROravg==
X-Received: by 2002:a05:600c:c87:b0:434:fa55:eb56 with SMTP id
 5b1f17b1804b1-4390d433affmr21407175e9.7.1738758435064; 
 Wed, 05 Feb 2025 04:27:15 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c121951sm18462829f8f.45.2025.02.05.04.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 04:27:14 -0800 (PST)
Message-ID: <a6a49139-556f-40bf-8223-bee59a4ecab1@mind.be>
Date: Wed, 5 Feb 2025 13:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Semyon Kolganov <semenak94@mail.ru>
References: <20250203-repair_mpir-v1-1-db848d68b586@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20250203-repair_mpir-v1-1-db848d68b586@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738758435; x=1739363235; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wPArjaYpNQ9iiwDmdoN3K8AErJM0oF5EbIZwlLQXqQs=;
 b=cYRx3Gd700+hDe+XrFQs54NYAfT+sYIhHff03AgA7tFRKt6b1lQwDbqCVpHO/WgBS4
 V0waMjfF/7BwBTWdRpJPZBI/i/OMGC66nJ14+agxW2slVU0yqHQI1BxmkynBqw2DUFST
 AdekfBf2nCLE9uLgI8yUgkPROh8YBRi+Ayp6JjP9NFeIhghMYafK3KIbUxOunR1fN1KL
 DYujTpbf3ymM8MuHKuSCRt+J//R2XmbWu5pn0hGxyexDvsS0FcWsjWfXTKUy4cbJKxrV
 himCD5z/cmLslN9ryUcYnreEic44RHth1NIf7Ru2KS3ODrgd9i9UzXfW3HHfTLVrr3rD
 C00w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cYRx3Gd7
Subject: Re: [Buildroot] [PATCH] package/mpir: replace source url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Thomas,

On 03/02/2025 19:14, Thomas Bonnefille via buildroot wrote:
> mpir.org is now offline. This commit switch mpir source URL to a mirror
> repo on Github.
> Unfortunately this repository uses the same name for one of its branch
> and a tag, so we are forced to use the exact commit sha1.
> However this repository already included in the last version, the fix
> for Xcode12, it is now no longer required as an external Buildroot
> patch.

  It also contains an additional fix for GCC 14, so that's good as well! 
However, it also contains 163 other commits, so it's a full version bump.

[snip]
> diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
> index 71d0c19d12e1e3858600db9506a2ad846021e5d5..dec36c3b36b0b64deef19e1d7608cb0f4f3fcfed 100644
> --- a/package/mpir/mpir.hash
> +++ b/package/mpir/mpir.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb  mpir-3.0.0.tar.bz2
> +sha256  4dd706e813505956a44cfbb8aefb8a6fef519bdc956d4730d8c7c83f058c094d  mpir-307663bf8b4daad22a7a593bfddf381b68920855.tar.gz
>   sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LIB
> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
> index 46cd35e4365bafbd30cc500bc975c3abeeb85c2f..c55061e1875cf995afad75519d36c9cc0da9f260 100644
> --- a/package/mpir/mpir.mk
> +++ b/package/mpir/mpir.mk
> @@ -4,15 +4,15 @@
>   #
>   ################################################################################
>   
> -MPIR_VERSION = 3.0.0
> -MPIR_SITE = http://www.mpir.org
> -MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
> +MPIR_VERSION = 307663bf8b4daad22a7a593bfddf381b68920855
> +MPIR_SITE = $(call github,wbhart,mpir,$(MPIR_VERSION))

  As discussed in the BR dev meeting, it's nicer if you can write it with git 
describe --tags. In this case that doesn't really work though because master 
branches off before the 3.0.0 tag. So let's construct it manually:

MPIR_VERSION = 3.0.0-163-g307663bf
MPIR_SITE = $(call github,wbhart,mpir,307663bf8b4daad22a7a593bfddf381b68920855)


>   MPIR_LICENSE = LGPL-3.0+
>   MPIR_LICENSE_FILES = COPYING.LIB
>   MPIR_INSTALL_STAGING = YES
>   MPIR_DEPENDENCIES = gmp host-yasm
>   # 0002-Fix-configure-failures-with-Xcode12.patch
>   MPIR_AUTORECONF = YES

  Also remember Baruch's remark about the comment.

  I've marked as Changes Requested.

  Regards,
  Arnout

> +MPIR_CONF_ENV = MAKEINFO=true
>   
>   ifeq ($(BR2_MIPS_NABI32),y)
>   MPIR_CONF_OPTS += ABI=n32
> 
> ---
> base-commit: d5b3795e92727c6565901cddf0c0f17c7854df56
> change-id: 20250203-repair_mpir-f83c6d03fad9
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
