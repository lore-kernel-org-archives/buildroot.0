Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C85CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463E46F497;
	Thu, 11 Sep 2025 19:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WVpfh_DTb2r; Thu, 11 Sep 2025 19:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60EF96F482
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60EF96F482;
	Thu, 11 Sep 2025 19:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0290443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9633360E37
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tii1ZOngyT4x for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C834616AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C834616AA
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C834616AA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:20:13 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so166833966b.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618412; x=1758223212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mISBfjFctMiiwcZyuBIZ/zVlx9HUr25wQrvi+KcbB3o=;
 b=fty0oeI7WEtUWHuewmDyQD6cknsXK+8ttHg5aH2FU2Hk2Zb+wEiJgkF5xPvEY0AnYN
 VruAdvjqyPLEPR8GPA7qnFXBLURhvDGmPCAzr8QJKLxF/BpPWq84vLvzQvwdWSF63vo0
 xuT+BWxkH2QdfeDVh1W2SyoeUz/1oHg32FoGCQJdAEKKOEyGdHqiO24tVYR58lYhZAIo
 0mc60UH+LNCCKrf+9Bhm8hOxcWDc0hdPEjvR64fwI1LPuuRYH2juceasX/kFMeDzSkOS
 goM669iDUdjcnylvOp9m0z2I0zDx7XW9rhiQn11neyQrV5QeXCifoM3yoh2fJzys7xQ7
 F14Q==
X-Gm-Message-State: AOJu0YxTjbJJlwX3k7TOhT1DR4ux/BfTOc5SfEbduaTGXXEgvS28RS4x
 9QRreBnDpylvgL67hnEUImE8aTpaoeXkAZifVu3Pj6PAvTjGz1VUf4TdYyXluY/X9oCzU8Li0pc
 zaRDRNP4=
X-Gm-Gg: ASbGncsIG+PvPxo+lgj8IW7uPNCuhRvrQkjNAScSZuxXVMsbA8PQihRkFL9YlovrbPU
 2AuUjeH0r/e8MBTDlLGPCv4RYv6WDhB3Tzbxfo32y4lY6yNWkwrBhUH/oC2Ag8KhDzBUogDdEKK
 6phUbG2dCmdwPnJe1x4jRjt/l1cK5jEonYMTZQGDK4Cijk3Zcmu/t5DmNtcSx4pcvdfOt3oamZo
 dRobQ6hkN1ORWbaEqHOkzNX0qHkN4pXPAlKF6HWGT6ZumrmLPynBJ6xU06X5u2W1OWaKDR684NX
 wfdai1/y1cpKfHFBTd72siFiYkWGABuIuxjhTwXC10jb4mnnOb1V6XyMaaO2K1+c9Z9fsvQ0QnP
 IWY/kGahEteBDt2ldQfPqPsGDuqSs7YOwUscVtX8iMuLfYA7JyxXqnKNQBA==
X-Google-Smtp-Source: AGHT+IFYeSu+FGDeNP9XlBvHAmv8xkOzovFmq9fTfn4SBpPJ/fqsJSgrj9C+LiRcKUHgXwej8Bm+XA==
X-Received: by 2002:a17:907:962a:b0:afe:90d2:b952 with SMTP id
 a640c23a62f3a-b07c3512afamr24652166b.29.1757618411820; 
 Thu, 11 Sep 2025 12:20:11 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f2122sm189957566b.85.2025.09.11.12.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:20:11 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:19:48 +0200
Message-Id: <20250911191948.2671276-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250811205938.784904-1-thomas.perale@mind.be>
References: <20250811205938.784904-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618412; x=1758223212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mISBfjFctMiiwcZyuBIZ/zVlx9HUr25wQrvi+KcbB3o=;
 b=Xn6A2/ISf6lhEKJHfFzPX3xDpu0aVbq7SMp/8JyUNZk/mC0akE/qNL645vKC68+pnH
 ip3V4LOma/0QRHu/kJSQuaayCVYn9NFziVrXZKeTXLeutfxx7pGXEJ4tvo+cXjJKrOuQ
 egHaLhSdr1zw2tzWRt6C4A70pVrSZjp2GK2Z6l6IHNHnNXGRXOpyPAvCCX00XHUwlQrs
 IPZUrcyJ8+bWy6nswKnpJAedHB5PnoPZX3Aekqq1CmlwkZPJNWYoVy2td1CBdiy7HwKV
 tpEJm2UymziUWb5rJ9X0U04Rpown02c/reZJh4i3ELY9axOy1wtCTJ+JdgjfcP5ZYv3c
 tLbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Xn6A2/IS
Subject: Re: [Buildroot] [PATCH] package/mariadb: fix openssl RMD160
 requirement
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> On the autobuilder the mariadb package fails to build when the
> BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 variable is not set.
> 
> See the following autobuilder error:
> 
> ```
> /workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c: In function 'ma_hash_get_algorithm':
> /workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12: error: implicit declaration of function 'EVP_ripemd160'; did you mean 'LN_ripemd160'? [-Wimplicit-function-declaration]
>    40 |     return EVP_ripemd160();
>       |            ^~~~~~~~~~~~~
>       |            LN_ripemd160
> /workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12: error: returning 'int' from a function with return type 'const EVP_MD *' {aka 'const struct evp_md_st *'} makes pointer from integer without a cast [-Wint-conversion]
>    40 |     return EVP_ripemd160();
>       |            ^~~~~~~~~~~~~~~
> ```
> 
> This error can be reproduced with the following config:
> 
> ```
> cat <<EOF >.config
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_LIBOPENSSL=y
> # BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
> BR2_PACKAGE_MARIADB=y
> EOF
> make olddefconfig
> make mariadb
> ```
> 
> This patch adds a requirement to the RMD160 crypto for the MariaDB
> package.
> 
> Fixes: https://autobuild.buildroot.org/results/f2b/f2b749cb7019856c5434c27987e8bfb2dc179cda
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Tested building by removing all the other crypto except DES & RMD160. It
> builds on that case.
> ---
>  package/mariadb/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
> index acedd1da9d..142ec815ed 100644
> --- a/package/mariadb/Config.in
> +++ b/package/mariadb/Config.in
> @@ -12,6 +12,7 @@ config BR2_PACKAGE_MARIADB
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_PCRE2
>  	help
>  	  MariaDB is one of the most popular database servers in the
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
