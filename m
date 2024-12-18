Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA518E77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 19:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5EF8502C;
	Wed, 18 Dec 2024 19:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Rj4vzP-ctsc; Wed, 18 Dec 2024 19:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81EAF85018
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81EAF85018;
	Wed, 18 Dec 2024 19:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95AA5C0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73BDE41A5F
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_h7dIqBzWqZ for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 19:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DBA7405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DBA7405AB
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DBA7405AB
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:47:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso55365f8f.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 11:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734551223; x=1735156023;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMwYWf9AWBupkjO+5HOw4gDK5vSrstu5yHfFqotCtEY=;
 b=aWW3vQ9mGFQJhWyOqYYuK5US6UEOfFcldMRrzWkDM8MzvprBW0yaez2b0s0q5x7U88
 Ii0DK/JIzlgHp1dcdD8w5WlG+LROpFCTng9daAfM2bnVgNILEgfhdibCRJdy5nBsCARc
 bK6c6Zy8Ukds3fYX3QgJrnpKMwUv0vVDfkFLEH4OLzKW/k2A3n7R3Og9SUtHkCJiLGrk
 /hLYv1p8YYDU49gUlF8BAob5f31D9nImpo47p0sKxMuSsMgTozRSOyfV6fx+okYNsTsw
 r97DBUHlCSzeWZAvBNheYJdnlZD4Ajd/lU0gfpJzuMNOGKIa2J+99EESLOpaoTBoqGNa
 Dijw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG0txEXS6GGFTNw/2uJOWZJnkGV52x304YrM23ET0V8/EshTyJEQLfhzMOVKn7aTQj9Ksef6Q3qF8=@buildroot.org
X-Gm-Message-State: AOJu0YzKuMYkbhiA0H9h75NcL14CCXFnVXEfoanXY0HXWIoyQgB0isEF
 MOJFOlf+55LBV3UQ0mylG7frop5UXMOluIsXsXy53Xb/W1433Ial7PUeqMHpg5fxYnp/TuogvlH
 h
X-Gm-Gg: ASbGncvDLXAPh1SlHtCyjE1wCy4jvvWM3R1XnpcQkTErtJai4Bzq6p08QjveZlQG0Qz
 e9opTaUt1ScmkdWjL3cLBqZ7p8ZmvWQNYQK8mVN34JlzJc2G4hnY8d47mWIRv9oM5+HVYk+gGu/
 yHL84BEBFWGiZG9WyXp0bsmBCXzee2nxhuxQ8dGJ+KXO//gfOEQaaLk2U6+4e3FfyecnfwMyKCy
 rFWldNPpIhWwuBYyvRZK/PBBpn82hXodSg+UQXxLziSGlqzI3alC2cP0sS2xhIzYoLadcf73xDW
 1AROkTh3Tsmn0WeaJ4tcqFsCy/RhkOVFTzzLFuzNy9t7PKLLlsk48GVdsxhLQ9YaMdZENTqOuya
 lr8psq2dOKTQ=
X-Google-Smtp-Source: AGHT+IHXkzBbozOcQUwFIL+zKSw45dBLl6eiQFXUj49US/LqV5YXQdnDo0AQCzER/Dqh6Fr2dFeJSw==
X-Received: by 2002:a5d:6f02:0:b0:385:f909:eb2c with SMTP id
 ffacd0b85a97d-38a19b34eb1mr994629f8f.38.1734551222698; 
 Wed, 18 Dec 2024 11:47:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8016083sm14701373f8f.31.2024.12.18.11.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 11:47:02 -0800 (PST)
Message-ID: <1d5b970f-bf39-4320-9462-a408cc8e57bb@mind.be>
Date: Wed, 18 Dec 2024 20:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Gao Xiang <hsiangkao@aol.com>
References: <20241215223539.1862343-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20241215223539.1862343-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1734551223; x=1735156023; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZMwYWf9AWBupkjO+5HOw4gDK5vSrstu5yHfFqotCtEY=;
 b=EyeQbDStRTQKxWWDhFzszQrz4sJY/EIS8/GK7gqW7PxXR3YIV6iwwbmPSlzcGFW7Df
 h9ou7XYCNQW9EMoAIwrN2dM+M4VF8soBFcERJl8zm7mUPsoORhFJpYHilbU6CQ4ZKqOy
 SmGOxoGl1VN6JjSUqLLgLKn6jkO1rBatvqbFiR9wRcweWKmdahbx5waE8ylwloSWm5MJ
 J3pGvR3DD/++l1iAeXwMdoU09PcsAtXbVyftRVqFai99WFcKhg1IKP9AoX6CWHzGg3eJ
 Mbj121+I+rDUjEOddtkWQa2DDly9/VwpVrJ4744D6sG8AZP0VcdzZF0+ar6leuClhPuw
 Ps8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EyeQbDSt
Subject: Re: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version
 1.8.3
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



On 15/12/2024 23:35, Julien Olivain wrote:
> For a change log since 1.8.2, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8648505460
> ---
>   package/erofs-utils/erofs-utils.hash | 2 +-
>   package/erofs-utils/erofs-utils.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
> index 573da1762d..3b8a5dc3da 100644
> --- a/package/erofs-utils/erofs-utils.hash
> +++ b/package/erofs-utils/erofs-utils.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  64b6ff7e899f62480283cee63787f37f0f9c4be7a6bc7a23d734aaa873a6cff4  erofs-utils-1.8.2.tar.gz
> +sha256  3c5cc03603ea08ba9ae5e0420eeaea5ff17ed29e2280685310356cbf25304e85  erofs-utils-1.8.3.tar.gz
>   sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
>   sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
>   sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
> diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
> index 40349c309c..930b40f6f1 100644
> --- a/package/erofs-utils/erofs-utils.mk
> +++ b/package/erofs-utils/erofs-utils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EROFS_UTILS_VERSION = 1.8.2
> +EROFS_UTILS_VERSION = 1.8.3
>   EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
>   EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
>   EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
