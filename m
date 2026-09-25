Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28832C98326
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E284E60E41;
	Fri, 25 Sep 2026 14:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJwUR_NOVljT; Fri, 25 Sep 2026 14:46:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CA66C60E1C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347579;
	b=GECORk9eTqea5saEVpES+iCLUTQVB3g1VeXR0828UCLvrWllys7wFkuLkuWUbVsX2wJQ
	 ZLWLErrd1vK2xVMFxkt2CrZjpQAV6wLOOam/9Od1qme9ZM8od3fTAbHr5IBkilJxXG3l8
	 CiUpAHLD+w2gA6lga58+moX3h+6EH4IdkDyqaw/9+dMUEE9UbSUQ7Yrn8yJHIqxb+d41h
	 d4MBY9kXt9NybLHiCl9xxqWqoRb3NhPDSIcQkaOih2LvfcMjmHa8zMhjKntKXHdz2P4PE
	 PFYlkMNoOIOjb1hsl6qYLDLM1nbcRLiOC3M6J9j81f+vIFkmeWyJTe/H5svFhvvd1LA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jsl9TZXrlaieeazyo49BjUBF7QkUe27+G/lVLHi4e1M=;
	b=YTx4P7sa8BIDDCI6Vc3VvFWyxMA5FZV/AayG0N1/sN56WxlJjjGDkJInxkjVzSpePc2+
	 KPgVW4esTAFifbMc3lCqlQPPNz0cCByiQVJvUu+5zHZ04O+6XarVm1ooc04jDu5S0iJ3P
	 r4mKGvhKUuPmjXR0+WV8u08AMmOjzaqJO4TENmXzZO6nvbw4hHIeH158ou5e9M4YKb2M4
	 ywAicHV6r7IZz+9YTYhDX0F1f+WIPKhZxpzy6jy0X/SaKMFTyqNk2O5Q2zJE5EEXxfhlX
	 vhSvOVhro1djMFNC73Jjo0/NLgjyOrLGB0NzUj6WQSfded8C1jhFQzgHfIZsPFcTzog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347579;
	bh=Jsl9TZXrlaieeazyo49BjUBF7QkUe27+G/lVLHi4e1M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AqcDvIkou/rODQz8ZY1UDEjL6+0sVxNG3Eyi8Zc7yAsk5onrfzoGmdbCFaJHvC4HT
	 msHfNSPterQswCs+W/Dhfk9aCmUslsq7md31LvBwkO3mmi6fP8TKKLGVAWBbPInM3x
	 xHnhNLQRgfijc8wUUNU7am6JTwLdff2x9sxGlhVZDDc/Rb+oLnlfjmdb9a/s90620D
	 yQBerciZowtmO229Ox52Bs26Kj/wEkG+BezC9pN8RAgXNCFNl1qNBebi6oIKEwJwzm
	 Ochlxe9b6r2ItgBCEBHf2U602EwTRVwxADrHYbbo5ZkkUSJbfDJM8eBUlbrp7XYPkM
	 hxvrDCEJ0wleQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA66C60E1C;
	Fri, 25 Sep 2026 14:46:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB023332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D7DD60DE7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vopv5zpAfF3l for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 82A1560DBB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347575;
 b=chuQx8lgZXCAmfbNuhVuLLO17nlZx73vW09jTlNuAR3gBSrY0YpUDVOMJ75hwMNnZJgS
 wpNPI3ghlK/zP3YGX4ribk9fEUWkQsCTouYPbBU5wzp16Zr+DPFrZmDSTHIStWphgU8oP
 G57rd/s4AqmdDxW+4lQdNIuZjoVlsluxbcrfR1zhZz414xEi3JZpJKE3pSbj0gCd40qj+
 t7rbAzLu9nT8cpNmf/I3foh1KNXjJ/UGt5OnXFmyVy0q5Q0VY6eEtdLG7RJS97htg7Ywr
 nx+t3UqXQTxy0zIS4BmEeAzTjGv5o40BlkaTzhk0LouSx6u2zItz14KOdv7FSiVIGgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347575;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CiXaqf6WL+OtGtn2pOq4czqhuKkuyDxe9MKcZg9fo3U=;
 b=hB9mMiSnn7X/7HNAQEob9UFBlb/dL/7gfuo7I0B0lvpUmevf26yWZBzOa+2a5iR2QP0L
 UTLq/Hz3299UdRAtocMC75f90oBmvzRUds3KjGtF6DQKcEDLcb8eugkOKL+dHqWCx3hBL
 1KDqCYGzritnZ2YNE4v3AoLXw6KBNvrPasnzRydhazDtVSeeqKrjDjb42kHbChXeThALN
 /3a7RAA2BrYBs/ZbagVkyYhxgOHPEj9RtnIBDJSQZoNU6fj8MdkqvbrOPTr8OuNjC5cQx
 g8mGaFcjS2SoTXYdTeYhhSVbR59WtX0VWsw+s8WIq/QXFKMlXkig8z/OU7qDxkhD9fw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AjV0IM1L; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82A1560DBB
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:15 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so5922825e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347573; x=1790952373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CiXaqf6WL+OtGtn2pOq4czqhuKkuyDxe9MKcZg9fo3U=;
 b=vLGpQJBwF6PFBMdWBCHPCrR3OQKpl4v/JREza3rx8unPFKfWUpvLZaa7oOIqFw/wi0
 MeozaUxPJGaC2vxrhnlcLpFqlua2ChWNAZwcZ4dhri6BqsbUWonmBM4IOjgdsxYy4qgv
 YVH2kFGsWUJdm/q9OdTPANFZRqP1Dedyy2/9iXX7FKipVpbDLopF/azAEepTtG7vUjA2
 b++Bh8ujbSx7o9cfJ53tI2b8JJqhxDFZ7/nzf60WKe+SEo1o4eZOzvpBMJV3uVnDAdMb
 FILLXn54BVyPcEUHU1mP7eLOtby7StqQ4FSMNsitL05RqUsHkkKPuIdVWW2oBKCHJEXu
 DUDg==
X-Gm-Message-State: AFuF++kM/AMBga4/yMUvZHUddgOE7LNXC8Budk8MexxwQ6hpXSH3l0Tb
 o2SoOPV+izU5Er/nHdKnrg+fuSI8uR8HH3fcJoalFUWXpWduGF9C9w74gJf4PCdEutw2KMHj72n
 Myq+4NJeY7Q==
X-Gm-Gg: AYBFou1xigp8o3vKKJ8DnpK93fDh3Cn/fviQJSEnCssWg2FXvkthNSaAjSW7ca5yaxd
 kQVSX4PmRmHfYZcqZU8TDL+eLwM9Egbup7yV/QCQI4C+xchelkVrnXzCgezigccpEy1WpBPs2AS
 bQi5OYr1FTHV8BlebSoH3y22dEyow34qHqtUsHuPOkQYkI3dGyfoUJNgj8g97f3cowXuOHsxnhj
 E5uldHvuvB4s7N7AI2AwR0OAw8QrWzcDM157nZTKFmV4gveu7PFEwdEc9KwixBsFhhF9YYjCo5Z
 ZKaFH1h5rerqektd2zVm3XQNZXXdTAq6kSWutz27CgtIir3Esf9BGugbrQiHVblqrw9LAvwz5St
 BQw1npAqbLW+uZdy1frM41eZC5J1sPPPBzjecGWZYLWPf2VuJMPmviR2uzj4ywqBnHbj6FTzykN
 h3TuV5BpH2I88ZeiACeyI491NPNZWW7R/8n0AVPgyr8bGzKS0cEyf4sM4tAS1Uj74TfmnBxcEFk
 d5aQBQZ0pfJcnQpN2CDvpEk/2eZkJpEQKVM9JVG79o=
X-Received: by 2002:a05:600c:4fcc:b0:49f:ce78:3560 with SMTP id
 5b1f17b1804b1-49fe66f1a05mr113634995e9.17.1790347573322; 
 Fri, 25 Sep 2026 07:46:13 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4c8dsm174877625e9.3.2026.09.25.07.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:12 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:10 +0200
Message-ID: <20260925144611.4098979-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916205022.2349080-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libest: needs OpenSSL engines
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes build error:
> 
> In file included from client.c:14:
> client.c: In function 'JNI_OnLoad':
> ./../../src/est/est.h:834:10: error: implicit declaration of function 'ERR_load_crypto_strings'; did you mean 'ERR_load_CRYPTO_strings'? [-Wimplicit-function-declaration]
>   834 |     do { ERR_load_crypto_strings();      \
>       |          ^~~~~~~~~~~~~~~~~~~~~~~
> client.c:88:9: note: in expansion of macro 'est_apps_startup'
>    88 |         est_apps_startup();
>       |         ^~~~~~~~~~~~~~~~
> ./../../src/est/est.h:836:10: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
>   836 |          ENGINE_load_builtin_engines();  \
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> client.c:88:9: note: in expansion of macro 'est_apps_startup'
>    88 |         est_apps_startup();
>       |         ^~~~~~~~~~~~~~~~
> client.c: In function 'JNI_OnUnload':
> ./../../src/est/est.h:860:40: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
>   860 |          OBJ_cleanup(); EVP_cleanup(); ENGINE_cleanup(); \
>       |                                        ^~~~~~~~~~~~~~
> client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
>   101 |         est_apps_shutdown();
>       |         ^~~~~~~~~~~~~~~~~
> ./../../src/est/est.h:862:10: error: implicit declaration of function 'ERR_free_strings'; did you mean 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
>   862 |          ERR_free_strings(); } while (0)
>       |          ^~~~~~~~~~~~~~~~
> client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
>   101 |         est_apps_shutdown();
>       |         ^~~~~~~~~~~~~~~~~
> client.c: In function 'est_client_raise_exception':
> client.c:122:17: error: implicit declaration of function 'ERR_print_errors_fp' [-Wimplicit-function-declaration]
>   122 |                 ERR_print_errors_fp(stderr);
>       |                 ^~~~~~~~~~~~~~~~~~~
> 
> seen with this defconfig
> 
> BR2_PACKAGE_OPENJDK=y
> BR2_PACKAGE_LIBEST=y
> 
> The failing code was added upstream on Jul, 6th, 2020:
> https://github.com/cisco/libest/commit/ab998c0918d1d46e1d8664a89b249cac08606e53
> and included in version 3.2.0.
> 
> Buildroot commit 5bbb1834a412f2fb2d9692cdc40c99097fb8a46d bumped the
> package to a tree including the aforementioned upstream commit on Jul
> 24th, 2022 so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v2: added history of the build error (Thomas)
> 
>  package/libest/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libest/Config.in b/package/libest/Config.in
> index bd5f40afae..3a0328c2f8 100644
> --- a/package/libest/Config.in
> +++ b/package/libest/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBEST
>  	bool "libest"
>  	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
>  	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBOPENSSL_ENGINES
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	select BR2_PACKAGE_SAFECLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
