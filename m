Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D108C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 16:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE16C60D6C;
	Wed, 24 Jan 2024 16:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE16C60D6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjADUzErKXcF; Wed, 24 Jan 2024 16:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22CF560D90;
	Wed, 24 Jan 2024 16:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CF560D90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD421BF3DA
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5736640134
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5736640134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZVbpV-qI9Wg for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 16:53:33 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5856040025
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 16:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5856040025
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso660780f8f.0
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 08:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706115211; x=1706720011;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=882h257u3q5uEHXpvdcKyQHHI25CrUTUYDrHGvDKaCk=;
 b=wZFbys/khmBjQx9+xl4yWF044eIF/n21pyIh1hBvCjjPNUFj2NTLWqx44d6H6yzZYd
 RuPjzIwYg1C6HOwqfmiLsE8pzh8HicDofBGwsU0aecyedacsg3diBlHa+XB8r9LZduoZ
 YwOaCqeHWmz0wXtBl7QcEFMAhEtfpsCgM0EBiluJNvj76jKrLuT1FuwMoQMrwz/1LoWc
 o4rMCW0TSj6L4/OaRaNZL91OzApVxyS/x/dUa3wzcXXzrDiZUEGuzzYFRNtrGVBfSxhH
 xg22WWdwehqU7WRfT1yDpkKGLoyX7EsZuiom1Ucdo8GYF1OmEwByIwajYZgUhr6DFHxU
 IhIw==
X-Gm-Message-State: AOJu0YzmIpyBHrLgO3qfYhOYgVNeAwzoO8WauLyVKC/5yNfmhgDrrSsV
 OoE7DH1/e52ml8SBdSGn7VwGaFs1FRb//okA4bRPGCZ8/nRE9Lo9p22QxhpzsO4=
X-Google-Smtp-Source: AGHT+IH9wIJOWRJU9SEVrc/5ygL4d1++HLHxjkvcAa/L7cTbp8CUNT1TugEUPP/gaR5/zf993iLbmg==
X-Received: by 2002:a7b:c354:0:b0:40e:b071:5a87 with SMTP id
 l20-20020a7bc354000000b0040eb0715a87mr934842wmj.93.1706115211228; 
 Wed, 24 Jan 2024 08:53:31 -0800 (PST)
Received: from [10.5.0.39] ([80.215.186.133]) by smtp.gmail.com with ESMTPSA id
 fj3-20020a05600c0c8300b0040d81ca11casm220696wmb.28.2024.01.24.08.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 08:53:30 -0800 (PST)
Message-ID: <14aa3fb1-0aa8-40d3-b972-c490c912750d@smile.fr>
Date: Wed, 24 Jan 2024 17:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240117154942.35401-1-romain.naour@smile.fr>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <20240117154942.35401-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706115211; x=1706720011;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=882h257u3q5uEHXpvdcKyQHHI25CrUTUYDrHGvDKaCk=;
 b=e3iaNz4SPX55TnyYDi+O8l/LADW8i6wr/BlPhG2QN3RDNSxF3iQhGs4T57Ik12kfED
 BFC483nuwwAkXtRYt9yQuBfNFFV4vWyu9NiDfvePsg1oaGU+TZwkCfir2i4X8WW97asd
 W6oFhxnqnZ5FyhkTh3PZRoJcF5EjDAVKTllL1NC01fOe09bCq9w12EmIR/FyDb1Ao+I0
 kcENfkT6ANUiJCBm3xnzcTRsTEDukp/OjFwDJN73419OMgDReDpwJBSBwk0jXeC85tDr
 P0oAmeagG0zvTrW7yIZ5aBdFQqgMcfstDjUd2BX/wb9WgR4MnAvGZrW2JJ8M1k1IKUPq
 Pldw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=e3iaNz4S
Subject: Re: [Buildroot] [PATCH] package/rustc: rust >= 1.73.0 needs cmake
 >= 3.20
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
Content-Type: multipart/mixed; boundary="===============2716507782420378112=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============2716507782420378112==
Content-Type: multipart/alternative;
 boundary="------------yjzUoil3warxCRXKwdh2qZHb"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------yjzUoil3warxCRXKwdh2qZHb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17/01/2024 16:49, Romain Naour wrote:
> The bump to rust 1.74.1 [1] introduced a regression on host using
> cmake < 3.20 since the llvm libraries used in rust compiler was
> bumpted to llvm 17 [2] and now requires cmake >= 3.20 [3].
>
> Select BR2_HOST_CMAKE_AT_LEAST_3_20 to build host-cmake when needed.
>
> [1]https://gitlab.com/buildroot.org/buildroot/-/commit/05392a5eae61c2855bc8d94f5bf9677ebbc5462a
> [2]https://github.com/rust-lang/rust/commit/8c1c7d37b29d72bad1f218798d121074918e9616
> [3]https://github.com/llvm/llvm-project/commit/cbaa3597aaf6273e66b3f445ed36a6458143fe6a
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448635
>
> Signed-off-by: Romain Naour<romain.naour@smile.fr>
> Cc: Antoine Coutant<antoine.coutant@smile.fr>
> ---
>   package/rustc/Config.in.host | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 6beaad0425..baa68994e6 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -149,6 +149,8 @@ config BR2_PACKAGE_HOST_RUST
>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>   	# triggers ICE on trunc_int_for_mode, at explow.c:56
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
> +	# rust uses llvm >= 17 since 1.73.0
> +	select BR2_HOST_CMAKE_AT_LEAST_3_20
>   	help
>   	  This package will build the compiler for the host as well as
>   	  two flavors of the standard library: one for the host, another

Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>


Regards,

Antoine Coutant.

--------------yjzUoil3warxCRXKwdh2qZHb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17/01/2024 16:49, Romain Naour
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240117154942.35401-1-romain.naour@smile.fr">
      <pre class="moz-quote-pre" wrap="">The bump to rust 1.74.1 [1] introduced a regression on host using
cmake &lt; 3.20 since the llvm libraries used in rust compiler was
bumpted to llvm 17 [2] and now requires cmake &gt;= 3.20 [3].

Select BR2_HOST_CMAKE_AT_LEAST_3_20 to build host-cmake when needed.

[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/buildroot.org/buildroot/-/commit/05392a5eae61c2855bc8d94f5bf9677ebbc5462a">https://gitlab.com/buildroot.org/buildroot/-/commit/05392a5eae61c2855bc8d94f5bf9677ebbc5462a</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/8c1c7d37b29d72bad1f218798d121074918e9616">https://github.com/rust-lang/rust/commit/8c1c7d37b29d72bad1f218798d121074918e9616</a>
[3] <a class="moz-txt-link-freetext" href="https://github.com/llvm/llvm-project/commit/cbaa3597aaf6273e66b3f445ed36a6458143fe6a">https://github.com/llvm/llvm-project/commit/cbaa3597aaf6273e66b3f445ed36a6458143fe6a</a>

Fixes:
<a class="moz-txt-link-freetext" href="https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448635">https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448635</a>

Signed-off-by: Romain Naour <a class="moz-txt-link-rfc2396E" href="mailto:romain.naour@smile.fr">&lt;romain.naour@smile.fr&gt;</a>
Cc: Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a>
---
 package/rustc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 6beaad0425..baa68994e6 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -149,6 +149,8 @@ config BR2_PACKAGE_HOST_RUST
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	# triggers ICE on trunc_int_for_mode, at explow.c:56
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
+	# rust uses llvm &gt;= 17 since 1.73.0
+	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	help
 	  This package will build the compiler for the host as well as
 	  two flavors of the standard library: one for the host, another
</pre>
    </blockquote>
    <br>
    <p><span class="il">Reviewed</span>-<span class="il">by</span>:
      Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Antoine Coutant.</p>
  </body>
</html>

--------------yjzUoil3warxCRXKwdh2qZHb--

--===============2716507782420378112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2716507782420378112==--
