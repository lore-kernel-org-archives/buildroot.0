Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15FAD767FC
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 12:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 870F840FCD;
	Fri, 19 Dec 2025 12:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVFrkBXbbhn5; Fri, 19 Dec 2025 12:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E46E40C47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766145870;
	bh=O189J/+ZO1XP3AZrHFRdLwtM+HjQ4EOYTQln0d9aIUc=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFBaDNiXrwR8Vnjx2kP6z2YAtFB5IhRz0xRDlX4UEMLwwqrtydz28nqmcAXjpKjVz
	 RRRdO/l3hTH/gixl20By58g56VWQPpsrs4HTRXysczpeCNcmwsq5kiuUqek7NJMVL1
	 FubSIdo+Y5dGLh8ghpjF2pbeLW6m3EuFlPByq08lOiQ7heSGFldLTqFc2fGQ2UWzWu
	 onSCi+1MtyPLHRsZGl+uu/sx5DpF01i725pwS9gaTsuMorQvmZSao+LEmwVrj3Mjf6
	 aL6hCKgLRy7yAbEdouZ3TTI6dDVGNdgiL5UuZeQGr8+igUCm/nLDWUgJva9GqMsuW1
	 XQWT+rwSMdNuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E46E40C47;
	Fri, 19 Dec 2025 12:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06EE3119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 12:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECDA060C17
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 12:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hLLI3plnaZe for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 12:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5491360D53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5491360D53
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5491360D53
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 12:04:26 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so118206a12.0
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 04:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766145863; x=1766750663;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5hOsg/QUT6Z9Hael6KUoWHlxRU0/lWUFBe0Q8KzdC+o=;
 b=IGbkpI83GhAC95+3DK5WDrye/fsCgAEK72kQnKKgkBS73Wp/WoUC+VrOslHiu/MFgH
 69gcJ4zDPJzmQc0mGTfYeyv3CXNww6/zcnQ12n8WaD3ayW2AAfpyjVMnLxN6aIpuOKMH
 p4KgkwwsrNAZY/BZgqZd7O/iiefBH+hork5gOnleG1n5mXuze/zlOSsnxQe9v373SuBd
 qxdY0a5W1XVEpCdchOlUuPy0z4zOlyRjhl0h2tTUKYIJhAFkzGNiKtZ7cimdGJXI5oX5
 KcMz1X99uUVJaQMKd3hV02x/L41mBgaTN4f2ncMeGShM/6Xm9YesQ8yZYZnj54Hw3NaT
 AGZA==
X-Gm-Message-State: AOJu0YwJoxaA46YjvvpWJC66krFFWWRohazYytcQTLpU5d5cMJroelzL
 I637RUNeSS3feODdwUziUiE/SzHwHJ2hIK5Q4YjNo/QBGxDrnrTfh15selkU
X-Gm-Gg: AY/fxX5tZA/u3b6gaoBrZNPIZuYtgbZFVRfz+37vBU0PKY6/fmeACOEQPpgzWJxX/qK
 FxeLdQO0wvJkSkUvssOAwMPc4KCA/vMMedBNTuoOmdhqb2G7tkgE+VN/NONuvTp6MdjUx+imeiJ
 XEA/8BP7r7CiAms+Lk1T57LDZq9adpD9IXd5EsMOHdDUGcas6sp0q8NyRQDWIEC9VCPKHHe2g2T
 cA1gh6Myj4GsDefh/RGYZze5zo5Qu0ae1kOgLbFwK4O2kAyxgVMGmrWEYQmGrArQssimM3vAPXh
 xmlYmx8xoQFY2tENWaPJWsl69Ui53fixHuMOmOTlQmJyBJ9RL+fpPH5lHLyaqyhD/Rgbq7dMZVb
 JG/KclpT5SQfJjivWztfsblPrLsWblvCPWWMmJb9iNGxRDq8DNHsF6IfNgrys8F2VTQbdd9zdoy
 m4jEa4lx9EMyvoRze5j3f/PYVfyMnjXYxdl2rUci5Ym9aWNBeRGcTM0OmJBhHez0Si0Q==
X-Google-Smtp-Source: AGHT+IHJnyPfe+A/hbs6eXo5E5XGF4DSfbTjgdJo6KjOHaVsJ4m8RgMTtVwVUKkO9c2vBRmsFqHjxw==
X-Received: by 2002:a17:907:2d8c:b0:b73:2d9c:9581 with SMTP id
 a640c23a62f3a-b80358bd87emr307532066b.28.1766145863023; 
 Fri, 19 Dec 2025 04:04:23 -0800 (PST)
Received: from ?IPV6:2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab?
 ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5bdb9sm224118666b.7.2025.12.19.04.04.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 04:04:22 -0800 (PST)
Message-ID: <d1588eb5-6b95-4fc9-8758-e979d4dcdba7@gmail.com>
Date: Fri, 19 Dec 2025 13:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251218222527.3861751-1-bernd@kuhls.net>
 <20251218222527.3861751-2-bernd@kuhls.net>
Content-Language: en-US, ru-RU
From: Alexander <shirokovalexs@gmail.com>
In-Reply-To: <20251218222527.3861751-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766145863; x=1766750663; darn=buildroot.org;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5hOsg/QUT6Z9Hael6KUoWHlxRU0/lWUFBe0Q8KzdC+o=;
 b=erpNt2VhdataLrQT9+3u6hHnOtttU7F8qkGbOLXeYAK/+KOIq10pHtUa9jicfqMRjP
 WmJ7lwGgKsVHMB9y96Y4qIUGU/g26lpfTAl2uOCLi0fs4zOwhaLQYrXKMJ73hxpiulbu
 2Fnzdi1nQcXPf/nRirK2GWdG0D2sJXdILImmIIsAUPpUIJtIyPgF1EdtMg3KIZX+OPGf
 R1MdGn38tKA9SxrKjjTeym7mW3x6oO+LJkLzQQyEyfYLyeN+b2S6gvL1Vbse9g7R+E88
 /KbPanHfTV2+wSWmZHboQNZk71GtbDxwTYhgV+NYRMBz3rAjY2PV1EFQn0K8TLwKlu/3
 UVJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=erpNt2Vh
Subject: Re: [Buildroot] [PATCH v3 2/3] package: update cargo suffix to
 -cargo5 and fix hashes
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
Content-Type: multipart/mixed; boundary="===============8734284023352875878=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============8734284023352875878==
Content-Type: multipart/alternative;
 boundary="------------BMpnBv0aTkkllP7N1GnXfsKH"
Content-Language: en-US, ru-RU

This is a multi-part message in MIME format.
--------------BMpnBv0aTkkllP7N1GnXfsKH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Alexander Shirokov <shirokovalexs@gmail.com>
[package/broot: compile on aarch64, armv7, x86-64; run on aarch64]
> Following the bump of rust to 1.92.0 the vendored tarballs contain
> .cargo_vcs_info.json, .github/ and due to the newly added files
> different hashes in .cargo-checksum.json:
> https://github.com/rust-lang/cargo/commit/ee08992ec93dd5086dda2a331837b528322635cb
>
> Therefore the hashes of all Cargo-fetched packages need to be updated.
> This commit therefore changes the suffix of Cargo packages from -cargo4
> to -cargo5, and updates all hashes.
>
> Signed-off-by: Bernd Kuhls<bernd@kuhls.net>
> ---
> v3: initial revision (Julien)
>
>   package/aardvark-dns/aardvark-dns.hash                 | 2 +-
>   package/bat/bat.hash                                   | 2 +-
>   package/broot/broot.hash                               | 2 +-
>   package/dust/dust.hash                                 | 2 +-
>   package/espflash/espflash.hash                         | 2 +-
>   package/eza/eza.hash                                   | 2 +-
>   package/fd/fd.hash                                     | 2 +-
>   package/hyperfine/hyperfine.hash                       | 2 +-
>   package/kmon/kmon.hash                                 | 2 +-
>   package/libzenoh-c/libzenoh-c.hash                     | 2 +-
>   package/netavark/netavark.hash                         | 2 +-
>   package/nushell/nushell.hash                           | 2 +-
>   package/parsec-tool/parsec-tool.hash                   | 2 +-
>   package/parsec/parsec.hash                             | 2 +-
>   package/pkg-download.mk                                | 2 +-
>   package/procs/procs.hash                               | 2 +-
>   package/python-bcrypt/python-bcrypt.hash               | 2 +-
>   package/python-cryptography/python-cryptography.hash   | 2 +-
>   package/python-maturin/python-maturin.hash             | 2 +-
>   package/python-orjson/python-orjson.hash               | 2 +-
>   package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>   package/python-rpds-py/python-rpds-py.hash             | 2 +-
>   package/python-rtoml/python-rtoml.hash                 | 2 +-
>   package/python-selenium/python-selenium.hash           | 2 +-
>   package/ripgrep/ripgrep.hash                           | 2 +-
>   package/rust-bindgen/rust-bindgen.hash                 | 2 +-
>   package/sentry-cli/sentry-cli.hash                     | 2 +-
>   package/tbtools/tbtools.hash                           | 2 +-
>   package/tealdeer/tealdeer.hash                         | 2 +-
>   package/uefisettings/uefisettings.hash                 | 2 +-
>   package/zoxide/zoxide.hash                             | 2 +-
>   31 files changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
> index 134dd34a1b..e24e43450a 100644
> --- a/package/aardvark-dns/aardvark-dns.hash
> +++ b/package/aardvark-dns/aardvark-dns.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  aeb5fc77455b01916b28f7c306834446f3f6e184c02d38b177c578bb4f01939e  aardvark-dns-v1.17.0-git4-cargo4.tar.gz
> +sha256  417ef1d4c7be461a64e09877adc7683d44f80acd793c6f6b66f0ead74a931831  aardvark-dns-v1.17.0-git4-cargo5.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/bat/bat.hash b/package/bat/bat.hash
> index 532ccd98a4..0911e87cf3 100644
> --- a/package/bat/bat.hash
> +++ b/package/bat/bat.hash
> @@ -1,4 +1,4 @@
>   # Locally generated
> -sha256  e62f9f1b14090044db860727a3c6bcb0d5b840f866ccaea4298518eeeb807a72  bat-0.26.0-cargo4.tar.gz
> +sha256  f91d1bcc21d0d4e94c8390e6aa3603c2391a6a865a63a126448c5ce5c3e606a9  bat-0.26.0-cargo5.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
>   sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
> diff --git a/package/broot/broot.hash b/package/broot/broot.hash
> index e01762f275..0594afca38 100644
> --- a/package/broot/broot.hash
> +++ b/package/broot/broot.hash
> @@ -1,3 +1,3 @@
>   # Locally generated
> -sha256  a006e15ec340d05451459f6e95a52789b6f55c93617129ca9178d00d43437cef  broot-1.53.0-cargo4.tar.gz
> +sha256  4ffd4eebd50d6ce747aa639022c87aeeaf6cc0962f0a55fd55d0669979a2c58a  broot-1.53.0-cargo5.tar.gz
>   sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
> diff --git a/package/dust/dust.hash b/package/dust/dust.hash
> index 83b01447b6..ae17280073 100644
> --- a/package/dust/dust.hash
> +++ b/package/dust/dust.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  275c2d7bd06205588b7e20e4b478e0df7213f426a1441923e3f2dfaa80cf4828  dust-1.2.3-cargo4.tar.gz
> +sha256  ea824ccefe82b92c265410921d84d59970e0e60be7154b072b0237f5bc8c638a  dust-1.2.3-cargo5.tar.gz
>   sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
> diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
> index 0be30f0442..6af453302e 100644
> --- a/package/espflash/espflash.hash
> +++ b/package/espflash/espflash.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  5edf94cd55daceffd08278f7789ea58b24de2051f0e15d8b7ba441bc94337d87  espflash-4.0.1-cargo4.tar.gz
> +sha256  cbbde861d082450f70aff29b496c778345abf37f290ec7af0c66813f1681d7ac  espflash-4.0.1-cargo5.tar.gz
>   sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
>   sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
> diff --git a/package/eza/eza.hash b/package/eza/eza.hash
> index 0bc5061ab1..87dbae2705 100644
> --- a/package/eza/eza.hash
> +++ b/package/eza/eza.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  d31a17b4733589da761ad79bc9faf4271b358a0ef9fea19dabb5f38827ba7cf4  eza-0.23.3-cargo4.tar.gz
> +sha256  237669ffb42fa0af639650f7ab69c41ca1d1a8213c5f7ac2b0bd1bb20e2d52d9  eza-0.23.3-cargo5.tar.gz
>   sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
> diff --git a/package/fd/fd.hash b/package/fd/fd.hash
> index 991be349b8..ae96a719de 100644
> --- a/package/fd/fd.hash
> +++ b/package/fd/fd.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  4a32dbd98dab4faf307954bf854d0c0c5719816e1cd28fe49385b6925cc8c515  fd-10.3.0-cargo4.tar.gz
> +sha256  d7302531dddc718b2f6e362f839ece29023b89b46447e5e3de913af14f106283  fd-10.3.0-cargo5.tar.gz
>   sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
>   sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
> diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
> index ca3bb41a89..4d2c345ced 100644
> --- a/package/hyperfine/hyperfine.hash
> +++ b/package/hyperfine/hyperfine.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  9fb27f85472255c40f0ac24a932fae3cb5836cc99558d1f7a36a66e937be45a6  hyperfine-1.19.0-cargo4.tar.gz
> +sha256  8de11008025147b60972927b335f294ac0ca66e3ac84d6062ef829dc0650242b  hyperfine-1.19.0-cargo5.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
>   sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
> diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
> index c9c129648b..c5246ffdc8 100644
> --- a/package/kmon/kmon.hash
> +++ b/package/kmon/kmon.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  7b66ef3d20951dfdbe6a62c82ee6de4bb6db23135e65cf535df5d934a7d462d4  kmon-1.7.1-cargo4.tar.gz
> +sha256  c025d4b0518b8e9490969e27ad83734630c7abdf87fe16d4b3fab7493e1b5790  kmon-1.7.1-cargo5.tar.gz
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
> diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
> index 9a1cbca0ff..89548e398e 100644
> --- a/package/libzenoh-c/libzenoh-c.hash
> +++ b/package/libzenoh-c/libzenoh-c.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  5b1cc424771338f28ed16bce23a442856ed5b7f7f3ba1ff2aeb7373d68b484dd  libzenoh-c-1.2.1-cargo4.tar.gz
> +sha256  a5293697acbe83384867c4320460b32a17ba431d6d07bf1357560bed9f6c4da4  libzenoh-c-1.2.1-cargo5.tar.gz
>   sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
> diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
> index 79fcb2eab1..34c678afd2 100644
> --- a/package/netavark/netavark.hash
> +++ b/package/netavark/netavark.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4c696e3e61b425270762f8d9d97705358de15de80e06fac7142cf65011d1dc0c  netavark-v1.17.0-git4-cargo4.tar.gz
> +sha256  1a2a189c0f7a3653600ad130be6e06e8bcebe477b8196e64b285a43ca07fcfbf  netavark-v1.17.0-git4-cargo5.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
> index 074bb694a6..10d378ac48 100644
> --- a/package/nushell/nushell.hash
> +++ b/package/nushell/nushell.hash
> @@ -1,3 +1,3 @@
>   # Locally generated
> -sha256  3f4f31e1c4832c34dc4c6058a78e9a893595e165334bb9be6a241618ce2861ad  nushell-0.96.1-cargo4.tar.gz
> +sha256  02e0a6c450490e1822cc23608297d303d65b8c04ccb50f2fba1d9977ef7793ea  nushell-0.96.1-cargo5.tar.gz
>   sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
> diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
> index f84c64802d..6974ffbf69 100644
> --- a/package/parsec-tool/parsec-tool.hash
> +++ b/package/parsec-tool/parsec-tool.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  6ddb379cf9ab309a64c869cd64870d4e58414398f00fdb0ed1524f1e684db226  parsec-tool-0.7.0-cargo4.tar.gz
> +sha256  1abaa1e9eff5c27e86905305b0f181f3dcc7da9977fa9fb2678bec5e543fad25  parsec-tool-0.7.0-cargo5.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
> index c6d9ad8d01..80ba791404 100644
> --- a/package/parsec/parsec.hash
> +++ b/package/parsec/parsec.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  1d12fc9718a8690790974348e8ac170bcee433c074c06ba5db7c0a15c372b30e  parsec-1.4.1-cargo4.tar.gz
> +sha256  66498917e26c8e357cf99e41af2cf4c9581aefe8159004532cf57cd867c67733  parsec-1.4.1-cargo5.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index ef268f5c83..ce63ce9658 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -12,7 +12,7 @@
>   BR_FMT_VERSION_git = -git4
>   BR_FMT_VERSION_svn = -svn5
>   BR_FMT_VERSION_go = -go2
> -BR_FMT_VERSION_cargo = -cargo4
> +BR_FMT_VERSION_cargo = -cargo5
>   
>   DL_WRAPPER = support/download/dl-wrapper
>   
> diff --git a/package/procs/procs.hash b/package/procs/procs.hash
> index 35f1f6d2f4..c22c713608 100644
> --- a/package/procs/procs.hash
> +++ b/package/procs/procs.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  09f2faee76bad885af50bf2977ea34b64810645a0b781699f8c822311211575e  procs-0.14.10-cargo4.tar.gz
> +sha256  e23f8d99cfc22f9682f4f66e2fd8cf917a57d4c816e907c2cfddd36e75ff388b  procs-0.14.10-cargo5.tar.gz
>   sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
> diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
> index a30e716df0..34bec561c0 100644
> --- a/package/python-bcrypt/python-bcrypt.hash
> +++ b/package/python-bcrypt/python-bcrypt.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  c209e01bb77628213eecb2152cf143c95e4147e3ef54aada6cf69803fafdc67d  python-bcrypt-5.0.0-cargo4.tar.gz
> +sha256  82b7dcbbf3faae879c84b8c0511042dcbaa151db82133d981a625afeeba24b17  python-bcrypt-5.0.0-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
> diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
> index 02b2b891e2..ab26dc86c8 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after vendoring
> -sha256  9c070a97c37b4cc487737fa7a1fec27c2d44ba54c39f1c2cc558b2b9878283f9  python-cryptography-45.0.7-cargo4.tar.gz
> +sha256  ea413c0c34eba531d96d42e449b3a782fac628d5170399a47a70d5f2da75829b  python-cryptography-45.0.7-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
>   sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
> diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
> index b530d93b49..6a184bb2c1 100644
> --- a/package/python-maturin/python-maturin.hash
> +++ b/package/python-maturin/python-maturin.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after vendoring
> -sha256  d50215b4a1ed4261f6de56413a954c14dfbc7f3481f176fe64ee078dd6a9a052  python-maturin-1.10.2-cargo4.tar.gz
> +sha256  03dd4e0eb82c679606f8bf604769c0e9cdc2b83f2a14264aefca25be17798b16  python-maturin-1.10.2-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
>   sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> index f55aab62ef..32bfcdd06f 100644
> --- a/package/python-orjson/python-orjson.hash
> +++ b/package/python-orjson/python-orjson.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after vendoring
> -sha256  ab71a5f3d6efb4a3dd0cacad24e62d774907be42ba2e01be8a3ddeecf46d078b  python-orjson-3.11.5-cargo4.tar.gz
> +sha256  23fb0c4e4f26e617c9d54553aa7f366c42dfbd3982d3f11732319c21f5a5764c  python-orjson-3.11.5-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
>   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
> index 6ab537ad67..c9799415d1 100644
> --- a/package/python-pydantic-core/python-pydantic-core.hash
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  8919dc76250449ed22d47e94f53929cb44eb982cd4ad80dc0607f8018868e549  python-pydantic-core-2.41.5-cargo4.tar.gz
> +sha256  1285ed4d60a38858edea6f387d9a8b2337471f8b071feb94c4457c0f9f09c7c9  python-pydantic-core-2.41.5-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
> diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> index 9c72c1e7ab..fd01150a63 100644
> --- a/package/python-rpds-py/python-rpds-py.hash
> +++ b/package/python-rpds-py/python-rpds-py.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  9f8d17fa01176f0f0f5b20675d4c1759f9f8b02d667ae085bd70236b3681ae4f  python-rpds-py-0.30.0-cargo4.tar.gz
> +sha256  bb9a50f6202fe4e19ee079c2b7cde03efc3a397b48cbe7ab34b7555853134b06  python-rpds-py-0.30.0-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
> diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
> index 54aba0c849..54458f7f09 100644
> --- a/package/python-rtoml/python-rtoml.hash
> +++ b/package/python-rtoml/python-rtoml.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  9174c3af184cbd94e67ac99f63a54c5f8ecea95421b36f15204f6eab762af047  python-rtoml-0.10.0-cargo4.tar.gz
> +sha256  62eceac5e16ea48549c7f9349ad6dbafdb023f162ecd3cd05fdc637ef3c47c09  python-rtoml-0.10.0-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
> diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
> index 47a5b7be67..2fe7d277a2 100644
> --- a/package/python-selenium/python-selenium.hash
> +++ b/package/python-selenium/python-selenium.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  b5a238e9712d8f41c78c27759ec14c761acecc14505399c020b69de8bc38e51c  python-selenium-4.35.0-cargo4.tar.gz
> +sha256  4d0caffc87f374268cb68b8e6ad070c5d844024b0c6884f4015278df5f462895  python-selenium-4.35.0-cargo5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
> diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
> index c6cfa63ea3..fd63990b1b 100644
> --- a/package/ripgrep/ripgrep.hash
> +++ b/package/ripgrep/ripgrep.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  cb56abf62d2e9924a873af5dba4ecc87964a5144459d240a83e42c26ea6f9d7f  ripgrep-14.1.1-cargo4.tar.gz
> +sha256  a09abd4553b9778e0da31109f6f66ffe5bd723fc7c506a7e632b06e9b2a018cc  ripgrep-14.1.1-cargo5.tar.gz
>   sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
> diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
> index dc79a62ddd..f276907b56 100644
> --- a/package/rust-bindgen/rust-bindgen.hash
> +++ b/package/rust-bindgen/rust-bindgen.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
> +sha256  d605ff54fa299bf416041dc7a7bd1c74b80e869221d7fa6a15061e7b29af1722  rust-bindgen-0.72.0-cargo5.tar.gz
>   sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
> diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
> index 88f3fdf46d..94b5af17b4 100644
> --- a/package/sentry-cli/sentry-cli.hash
> +++ b/package/sentry-cli/sentry-cli.hash
> @@ -1,3 +1,3 @@
>   # locally calculated
> -sha256  5072542aad76e1cad27ef643c50b2d959bd5d49e742d887fbad83391d9ce61e2  sentry-cli-2.20.3-cargo4.tar.gz
> +sha256  9bf440aefec2e9d8e390f234dc1ed5a6f426236c39289724160495c6395be8b6  sentry-cli-2.20.3-cargo5.tar.gz
>   sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
> diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
> index f62d3c36d6..bc1a1937f7 100644
> --- a/package/tbtools/tbtools.hash
> +++ b/package/tbtools/tbtools.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  3fd91206483884f44ef757343f68c9acf91817ebbcdf4c0f6821a3734eb54984  tbtools-0.6.0-cargo4.tar.gz
> +sha256  6a320823f1a153717d659ddcf9f2442e09777e7f16b7530d27014806498f713a  tbtools-0.6.0-cargo5.tar.gz
>   sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
> diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
> index acfaad0271..6f72a475af 100644
> --- a/package/tealdeer/tealdeer.hash
> +++ b/package/tealdeer/tealdeer.hash
> @@ -1,4 +1,4 @@
>   # Locally generated
> -sha256  40952b9921d750bd6a84a7624b7b19558a9bbf1be6433b70db5ec2ccd840e33d  tealdeer-1.6.1-cargo4.tar.gz
> +sha256  81df068fd329ace5a51c9e29d804fafdd160137205d4fd6a0e3a039e5ce993f4  tealdeer-1.6.1-cargo5.tar.gz
>   sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>   sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
> diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
> index b9b5222d4b..7299019137 100644
> --- a/package/uefisettings/uefisettings.hash
> +++ b/package/uefisettings/uefisettings.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  3c199e92e9dde29d5a1be33994cef27eb9450f1dbc006eb5e09856e2be7f172b  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo4.tar.gz
> +sha256  7ba63c6a1e88bdbf54bb2a557f02a8e76647b8dca117fad77c55ee4f086efa13  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo5.tar.gz
>   sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
> diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
> index 64c1efd277..1be96c8b8e 100644
> --- a/package/zoxide/zoxide.hash
> +++ b/package/zoxide/zoxide.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  728fbe4e44cb9b4b8bb0753e962e2889619cccdc354ac141d6e26eb2ca8ee9b9  zoxide-0.9.8-cargo4.tar.gz
> +sha256  fe347f2b49304038c88c10cb3719d968ff70177c3d2934639c6e58278fa55c06  zoxide-0.9.8-cargo5.tar.gz
>   sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
--------------BMpnBv0aTkkllP7N1GnXfsKH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Signed-off-by: Bernd Kuhls &lt;<a href="mailto:bernd@kuhls.net"
      target="_blank" class="moz-txt-link-freetext">bernd@kuhls.net</a>&gt;<br>
    Tested-by: Alexander Shirokov &lt;<a
      href="mailto:shirokovalexs@gmail.com" target="_blank"
      class="moz-txt-link-freetext">shirokovalexs@gmail.com</a>&gt;<br>
    [package/broot: compile on aarch64, armv7, x86-64; run on aarch64]
    <blockquote type="cite"
      cite="mid:20251218222527.3861751-2-bernd@kuhls.net">
      <pre wrap="" class="moz-quote-pre">Following the bump of rust to 1.92.0 the vendored tarballs contain
.cargo_vcs_info.json, .github/ and due to the newly added files
different hashes in .cargo-checksum.json:
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/cargo/commit/ee08992ec93dd5086dda2a331837b528322635cb">https://github.com/rust-lang/cargo/commit/ee08992ec93dd5086dda2a331837b528322635cb</a>

Therefore the hashes of all Cargo-fetched packages need to be updated.
This commit therefore changes the suffix of Cargo packages from -cargo4
to -cargo5, and updates all hashes.

Signed-off-by: Bernd Kuhls <a class="moz-txt-link-rfc2396E" href="mailto:bernd@kuhls.net">&lt;bernd@kuhls.net&gt;</a>
---
v3: initial revision (Julien)

 package/aardvark-dns/aardvark-dns.hash                 | 2 +-
 package/bat/bat.hash                                   | 2 +-
 package/broot/broot.hash                               | 2 +-
 package/dust/dust.hash                                 | 2 +-
 package/espflash/espflash.hash                         | 2 +-
 package/eza/eza.hash                                   | 2 +-
 package/fd/fd.hash                                     | 2 +-
 package/hyperfine/hyperfine.hash                       | 2 +-
 package/kmon/kmon.hash                                 | 2 +-
 package/libzenoh-c/libzenoh-c.hash                     | 2 +-
 package/netavark/netavark.hash                         | 2 +-
 package/nushell/nushell.hash                           | 2 +-
 package/parsec-tool/parsec-tool.hash                   | 2 +-
 package/parsec/parsec.hash                             | 2 +-
 package/pkg-download.mk                                | 2 +-
 package/procs/procs.hash                               | 2 +-
 package/python-bcrypt/python-bcrypt.hash               | 2 +-
 package/python-cryptography/python-cryptography.hash   | 2 +-
 package/python-maturin/python-maturin.hash             | 2 +-
 package/python-orjson/python-orjson.hash               | 2 +-
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-rpds-py/python-rpds-py.hash             | 2 +-
 package/python-rtoml/python-rtoml.hash                 | 2 +-
 package/python-selenium/python-selenium.hash           | 2 +-
 package/ripgrep/ripgrep.hash                           | 2 +-
 package/rust-bindgen/rust-bindgen.hash                 | 2 +-
 package/sentry-cli/sentry-cli.hash                     | 2 +-
 package/tbtools/tbtools.hash                           | 2 +-
 package/tealdeer/tealdeer.hash                         | 2 +-
 package/uefisettings/uefisettings.hash                 | 2 +-
 package/zoxide/zoxide.hash                             | 2 +-
 31 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index 134dd34a1b..e24e43450a 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aeb5fc77455b01916b28f7c306834446f3f6e184c02d38b177c578bb4f01939e  aardvark-dns-v1.17.0-git4-cargo4.tar.gz
+sha256  417ef1d4c7be461a64e09877adc7683d44f80acd793c6f6b66f0ead74a931831  aardvark-dns-v1.17.0-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 532ccd98a4..0911e87cf3 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  e62f9f1b14090044db860727a3c6bcb0d5b840f866ccaea4298518eeeb807a72  bat-0.26.0-cargo4.tar.gz
+sha256  f91d1bcc21d0d4e94c8390e6aa3603c2391a6a865a63a126448c5ce5c3e606a9  bat-0.26.0-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index e01762f275..0594afca38 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a006e15ec340d05451459f6e95a52789b6f55c93617129ca9178d00d43437cef  broot-1.53.0-cargo4.tar.gz
+sha256  4ffd4eebd50d6ce747aa639022c87aeeaf6cc0962f0a55fd55d0669979a2c58a  broot-1.53.0-cargo5.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 83b01447b6..ae17280073 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  275c2d7bd06205588b7e20e4b478e0df7213f426a1441923e3f2dfaa80cf4828  dust-1.2.3-cargo4.tar.gz
+sha256  ea824ccefe82b92c265410921d84d59970e0e60be7154b072b0237f5bc8c638a  dust-1.2.3-cargo5.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index 0be30f0442..6af453302e 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5edf94cd55daceffd08278f7789ea58b24de2051f0e15d8b7ba441bc94337d87  espflash-4.0.1-cargo4.tar.gz
+sha256  cbbde861d082450f70aff29b496c778345abf37f290ec7af0c66813f1681d7ac  espflash-4.0.1-cargo5.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 0bc5061ab1..87dbae2705 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d31a17b4733589da761ad79bc9faf4271b358a0ef9fea19dabb5f38827ba7cf4  eza-0.23.3-cargo4.tar.gz
+sha256  237669ffb42fa0af639650f7ab69c41ca1d1a8213c5f7ac2b0bd1bb20e2d52d9  eza-0.23.3-cargo5.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 991be349b8..ae96a719de 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4a32dbd98dab4faf307954bf854d0c0c5719816e1cd28fe49385b6925cc8c515  fd-10.3.0-cargo4.tar.gz
+sha256  d7302531dddc718b2f6e362f839ece29023b89b46447e5e3de913af14f106283  fd-10.3.0-cargo5.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index ca3bb41a89..4d2c345ced 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9fb27f85472255c40f0ac24a932fae3cb5836cc99558d1f7a36a66e937be45a6  hyperfine-1.19.0-cargo4.tar.gz
+sha256  8de11008025147b60972927b335f294ac0ca66e3ac84d6062ef829dc0650242b  hyperfine-1.19.0-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index c9c129648b..c5246ffdc8 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7b66ef3d20951dfdbe6a62c82ee6de4bb6db23135e65cf535df5d934a7d462d4  kmon-1.7.1-cargo4.tar.gz
+sha256  c025d4b0518b8e9490969e27ad83734630c7abdf87fe16d4b3fab7493e1b5790  kmon-1.7.1-cargo5.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 9a1cbca0ff..89548e398e 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5b1cc424771338f28ed16bce23a442856ed5b7f7f3ba1ff2aeb7373d68b484dd  libzenoh-c-1.2.1-cargo4.tar.gz
+sha256  a5293697acbe83384867c4320460b32a17ba431d6d07bf1357560bed9f6c4da4  libzenoh-c-1.2.1-cargo5.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index 79fcb2eab1..34c678afd2 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c696e3e61b425270762f8d9d97705358de15de80e06fac7142cf65011d1dc0c  netavark-v1.17.0-git4-cargo4.tar.gz
+sha256  1a2a189c0f7a3653600ad130be6e06e8bcebe477b8196e64b285a43ca07fcfbf  netavark-v1.17.0-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 074bb694a6..10d378ac48 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  3f4f31e1c4832c34dc4c6058a78e9a893595e165334bb9be6a241618ce2861ad  nushell-0.96.1-cargo4.tar.gz
+sha256  02e0a6c450490e1822cc23608297d303d65b8c04ccb50f2fba1d9977ef7793ea  nushell-0.96.1-cargo5.tar.gz
 sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
index f84c64802d..6974ffbf69 100644
--- a/package/parsec-tool/parsec-tool.hash
+++ b/package/parsec-tool/parsec-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ddb379cf9ab309a64c869cd64870d4e58414398f00fdb0ed1524f1e684db226  parsec-tool-0.7.0-cargo4.tar.gz
+sha256  1abaa1e9eff5c27e86905305b0f181f3dcc7da9977fa9fb2678bec5e543fad25  parsec-tool-0.7.0-cargo5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
index c6d9ad8d01..80ba791404 100644
--- a/package/parsec/parsec.hash
+++ b/package/parsec/parsec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d12fc9718a8690790974348e8ac170bcee433c074c06ba5db7c0a15c372b30e  parsec-1.4.1-cargo4.tar.gz
+sha256  66498917e26c8e357cf99e41af2cf4c9581aefe8159004532cf57cd867c67733  parsec-1.4.1-cargo5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ef268f5c83..ce63ce9658 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,7 @@
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo4
+BR_FMT_VERSION_cargo = -cargo5
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 35f1f6d2f4..c22c713608 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  09f2faee76bad885af50bf2977ea34b64810645a0b781699f8c822311211575e  procs-0.14.10-cargo4.tar.gz
+sha256  e23f8d99cfc22f9682f4f66e2fd8cf917a57d4c816e907c2cfddd36e75ff388b  procs-0.14.10-cargo5.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index a30e716df0..34bec561c0 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c209e01bb77628213eecb2152cf143c95e4147e3ef54aada6cf69803fafdc67d  python-bcrypt-5.0.0-cargo4.tar.gz
+sha256  82b7dcbbf3faae879c84b8c0511042dcbaa151db82133d981a625afeeba24b17  python-bcrypt-5.0.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 02b2b891e2..ab26dc86c8 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  9c070a97c37b4cc487737fa7a1fec27c2d44ba54c39f1c2cc558b2b9878283f9  python-cryptography-45.0.7-cargo4.tar.gz
+sha256  ea413c0c34eba531d96d42e449b3a782fac628d5170399a47a70d5f2da75829b  python-cryptography-45.0.7-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index b530d93b49..6a184bb2c1 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  d50215b4a1ed4261f6de56413a954c14dfbc7f3481f176fe64ee078dd6a9a052  python-maturin-1.10.2-cargo4.tar.gz
+sha256  03dd4e0eb82c679606f8bf604769c0e9cdc2b83f2a14264aefca25be17798b16  python-maturin-1.10.2-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f55aab62ef..32bfcdd06f 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  ab71a5f3d6efb4a3dd0cacad24e62d774907be42ba2e01be8a3ddeecf46d078b  python-orjson-3.11.5-cargo4.tar.gz
+sha256  23fb0c4e4f26e617c9d54553aa7f366c42dfbd3982d3f11732319c21f5a5764c  python-orjson-3.11.5-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 6ab537ad67..c9799415d1 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  8919dc76250449ed22d47e94f53929cb44eb982cd4ad80dc0607f8018868e549  python-pydantic-core-2.41.5-cargo4.tar.gz
+sha256  1285ed4d60a38858edea6f387d9a8b2337471f8b071feb94c4457c0f9f09c7c9  python-pydantic-core-2.41.5-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 9c72c1e7ab..fd01150a63 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9f8d17fa01176f0f0f5b20675d4c1759f9f8b02d667ae085bd70236b3681ae4f  python-rpds-py-0.30.0-cargo4.tar.gz
+sha256  bb9a50f6202fe4e19ee079c2b7cde03efc3a397b48cbe7ab34b7555853134b06  python-rpds-py-0.30.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 54aba0c849..54458f7f09 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9174c3af184cbd94e67ac99f63a54c5f8ecea95421b36f15204f6eab762af047  python-rtoml-0.10.0-cargo4.tar.gz
+sha256  62eceac5e16ea48549c7f9349ad6dbafdb023f162ecd3cd05fdc637ef3c47c09  python-rtoml-0.10.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 47a5b7be67..2fe7d277a2 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  b5a238e9712d8f41c78c27759ec14c761acecc14505399c020b69de8bc38e51c  python-selenium-4.35.0-cargo4.tar.gz
+sha256  4d0caffc87f374268cb68b8e6ad070c5d844024b0c6884f4015278df5f462895  python-selenium-4.35.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index c6cfa63ea3..fd63990b1b 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cb56abf62d2e9924a873af5dba4ecc87964a5144459d240a83e42c26ea6f9d7f  ripgrep-14.1.1-cargo4.tar.gz
+sha256  a09abd4553b9778e0da31109f6f66ffe5bd723fc7c506a7e632b06e9b2a018cc  ripgrep-14.1.1-cargo5.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index dc79a62ddd..f276907b56 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
+sha256  d605ff54fa299bf416041dc7a7bd1c74b80e869221d7fa6a15061e7b29af1722  rust-bindgen-0.72.0-cargo5.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 88f3fdf46d..94b5af17b4 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  5072542aad76e1cad27ef643c50b2d959bd5d49e742d887fbad83391d9ce61e2  sentry-cli-2.20.3-cargo4.tar.gz
+sha256  9bf440aefec2e9d8e390f234dc1ed5a6f426236c39289724160495c6395be8b6  sentry-cli-2.20.3-cargo5.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index f62d3c36d6..bc1a1937f7 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3fd91206483884f44ef757343f68c9acf91817ebbcdf4c0f6821a3734eb54984  tbtools-0.6.0-cargo4.tar.gz
+sha256  6a320823f1a153717d659ddcf9f2442e09777e7f16b7530d27014806498f713a  tbtools-0.6.0-cargo5.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index acfaad0271..6f72a475af 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  40952b9921d750bd6a84a7624b7b19558a9bbf1be6433b70db5ec2ccd840e33d  tealdeer-1.6.1-cargo4.tar.gz
+sha256  81df068fd329ace5a51c9e29d804fafdd160137205d4fd6a0e3a039e5ce993f4  tealdeer-1.6.1-cargo5.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index b9b5222d4b..7299019137 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c199e92e9dde29d5a1be33994cef27eb9450f1dbc006eb5e09856e2be7f172b  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo4.tar.gz
+sha256  7ba63c6a1e88bdbf54bb2a557f02a8e76647b8dca117fad77c55ee4f086efa13  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo5.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index 64c1efd277..1be96c8b8e 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  728fbe4e44cb9b4b8bb0753e962e2889619cccdc354ac141d6e26eb2ca8ee9b9  zoxide-0.9.8-cargo4.tar.gz
+sha256  fe347f2b49304038c88c10cb3719d968ff70177c3d2934639c6e58278fa55c06  zoxide-0.9.8-cargo5.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
</pre>
    </blockquote>
  </body>
</html>

--------------BMpnBv0aTkkllP7N1GnXfsKH--

--===============8734284023352875878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8734284023352875878==--
