Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A16C36005
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 20:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7497040B7D;
	Tue, 25 Mar 2025 20:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4cbtKvPC9Xp; Tue, 25 Mar 2025 20:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD9340B37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD9340B37;
	Tue, 25 Mar 2025 20:46:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2567E4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8B6840176
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikmaNtiDyEbX for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 20:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A23E940175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A23E940175
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A23E940175
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:46:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso1542335e9.0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742935612; x=1743540412;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e7rPuBxzCajp+PqQ4txOJAqWmIPPyxJOEzYbaM5rEIU=;
 b=AT6cUP8R1jp+2YFxHCDZkb0Nq+v1ZnBJP3x+Wi8mh2AhYWAxKGkFZGJ4bFBYQyq9Tk
 ts1JTT9+ayWZHg8ZScPxCWJRugyrD2iNwbstwN858EafUqrbHTAjMdrh6GN291QdU6Mo
 Pt2Wh7+J+lHhhV4v8jukWEGjVg3793KZgVJeBN8/6sGEdjEeXE2AQClgMF4yVm/0V+1K
 WMqhzkOJCuGmRYMt86X1j/S30YrSuNYEyl95zIQn4DKMGwu0LJUhie8cDQtOWBAFIECM
 dzhsaTsIi5DOnDent0MylATp5kqDlYy8geawygYxej2hlrCuyOfXWVoA4l+WM9iMl/xo
 t9UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhvupAEONUvbruG0gY1RIQG91iCKZkSptA+bLO5KoQgR6+6KlhANRahP76+6pfRlgA7Hhb+/ENr+Y=@buildroot.org
X-Gm-Message-State: AOJu0YxyOdvUmM/LcEyQ8YpARbTKgZEb8lk/Gmmwt5rEM/kQwzhSinMK
 jpXkKAZ0O1sProHQZpqX++n4V6GtEAYclHYmgmutFf+8MI8Pc5PpGCr+mG/oUdI=
X-Gm-Gg: ASbGnctXF37c+bHULmiUssFrXXSqBuqh2Hdey4OKQq/8cb9+Blfe/+8G0v5tl4xefjo
 aktwIcd19xW76uPr8Po3WO8hOz4za81NPNK6FDTzmiNStfrSmL6ko4VC+Ol76cwO+yjy6FV/zN4
 fEtZKmM5mwJSVHof33eF0oh/W1FSFne/b9E6SaorGJC7ZdespWqijUxfrJAPhMg4UISApODi0YM
 45/CkEPth1I/855FXM4yoBJY/4F6GshAOVRIlsxX1W8mr/uSxPc/7D5Ytz7DPePY5xUpcm+VEJX
 YuGsWdz1yx47hbFRUeO3R9X5kwTwrW7naYGtzM4YApLlIo7ZPxiXAUrOK95ur3hzlYnvk4T9LYe
 vXtSf1VSKmr1AIw+RBvaNLdBXwbtPoYRY3Rj0lRmB3YwQHd2f8NW4NjW4sY9cPsLGvS5jRbLn8S
 o=
X-Google-Smtp-Source: AGHT+IFq4LbmK15iV9ipsErdUHDX+2y/385/mcE7Q7Z6URJ2y8E8WMgWhUtSEhSGXiYIbufGrBOJOQ==
X-Received: by 2002:a05:600c:1c07:b0:43c:f3e1:a729 with SMTP id
 5b1f17b1804b1-43d77643440mr8757515e9.12.1742935612374; 
 Tue, 25 Mar 2025 13:46:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995789sm14879883f8f.17.2025.03.25.13.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 13:46:51 -0700 (PDT)
Message-ID: <dd4446da-b5e0-4c6a-9ab2-2844eef56eba@mind.be>
Date: Tue, 25 Mar 2025 21:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
References: <20250314210313.775885-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20250314210313.775885-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742935612; x=1743540412; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e7rPuBxzCajp+PqQ4txOJAqWmIPPyxJOEzYbaM5rEIU=;
 b=AhA3K5Do6t8LX7L1h2/HyCNRvofbz1JXLYokVhNpSbn0JkD6gK3c/BHjgFMvD4MJHd
 tfUFBnjNI8Hsqkr5/9dhI/P+VkMJiIkuKaRk60knd9COLIvF4H2zo20lJma6JG0h7yZA
 mXqnDeg2TQ6no4Mw5+LyHnVvFC21qVk7Q1QETknkkiyrWwor+/vVdPiVJpK793dHs5fF
 fPf7jXxhfvZEv+kI28/cZSYpZ9c9IMy15TLBkxthBVgYfSIcdkwrdsejbDJRm0Gl6PAz
 +e0sFYEKgpzDgwUEiQWCy02hFqfHqIWnOrLtflpgbAlJuyAbEg5ugBqHpJJ0mf5Nhse4
 Q1yQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AhA3K5Do
Subject: Re: [Buildroot] [PATCH 1/2] package/tesseract-ocr: needs gcc >= 8
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



On 14/03/2025 22:03, Julien Olivain wrote:
> Since Buildroot commit [1] tesseract-ocr fails to build with gcc 7,
> with error:
> 
>      src/api/baseapi.cpp:67:10: fatal error: filesystem: No such file or directory
>       #include <filesystem> // for std::filesystem
>                ^~~~~~~~~~~~
> 
> In Buildroot, tesseract-ocr has a C++17 requirement captured as
> gcc >= 7. Gcc 7 has only a partial and experimental C++17 support,
> which was sufficient, prior [1].
> 
> The tesseract-ocr upstream commit [2] introduced a usage of
> std::filesystem. This commit is included in version 5.5.0,
> bumped in [1].
> 
> The C++17 with std::filesystem support was introduced in gcc 8.1.
> See [3].
> 
> This commit fixes the issue by raising the gcc version requirement to
> 8.x.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/f32da8b9844ae5f1b9dc6b7a89d7d9bd9d194f55
> [2] https://github.com/tesseract-ocr/tesseract/commit/4e42f9de541f21acb010886925afe42094a15dfe
> [3] https://gcc.gnu.org/gcc-8/changes.html#libstdcxx
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied both to master, thanks. I've added a Fixes: 
f32da8b9844ae5f1b9dc6b7a89d7d9bd9d194f55 tag to this one as well - such tags 
will enable tooling to make LTS support easier.

  It's weird that there are no autobuilder errors for tesseract-ocr... I guess 
it's because almost all builds fail way before they reach the letter t...

  Regards,
  Arnout

> ---
>   package/tesseract-ocr/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
> index 4d9b78733e..79a27780b2 100644
> --- a/package/tesseract-ocr/Config.in
> +++ b/package/tesseract-ocr/Config.in
> @@ -1,13 +1,13 @@
> -comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, wchar"
> +comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 8, dynamic library, wchar"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
>   menuconfig BR2_PACKAGE_TESSERACT_OCR
>   	bool "tesseract-ocr"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
>   	depends on BR2_USE_MMU # fork()
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_WCHAR

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
