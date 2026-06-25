Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57096CDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DA841132;
	Thu, 25 Jun 2026 15:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wr2oKTJmeMxe; Thu, 25 Jun 2026 15:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390BA4112F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782402620;
	bh=8CvtvL2ka/ATE+MNH+UFM2pAjOEmQZVKuUi31pTChhM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZheA6bAYVb8/a1dV3+E3P5Akr04a3CgjfZPZP9f3mwjujZdK4njCMSmiLtVsJnHwJ
	 Qw1cUkBnq0EjMeVJCHFV8qeqC6CqjX8yCkxlAAgSrA0buQybPDdFcp8941BAMKWU5a
	 OWJJJe5ly4wPLD5pdgaeFMwTdKQ/wBNh0z2ovr7ndnkH4Ts1nWVUN9hqEw0Es9o9rP
	 zWQLJvj09AdVG9Cikf+3YEjhii9BuySmYXzSLydbuj0s19IpuIzdjfHxsRKEmzbiwk
	 /qGu/PDcv4PhBiiHk2/xnIWGHcKCV8oBeu8Pk4DJpeIZyyNqxqthuyEiTH2uy0GJyo
	 F+LxxWXWZBEFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390BA4112F;
	Thu, 25 Jun 2026 15:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FC2254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FC55408AB
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uG3Kwf2prQup for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3CD24025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3CD24025E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3CD24025E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:50:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1wS4xa43sh-00CxcQ; Thu, 25
 Jun 2026 17:50:14 +0200
Message-ID: <c48c6d9f-d67c-44c6-9155-3882570caaf3@gmx.de>
Date: Thu, 25 Jun 2026 17:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260620184651.3823451-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260620184651.3823451-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:a/7zOmVSSTbkXBLzEsM4N59LB97ZUWhMN4Wm4fJO+Gkh1blol3b
 TzdyC0NP0fIx8Ts3sS4HcTcwe3D+0o6z9YiUi9VAinlqpg3BRD/SaZuAkNVFm1TDES1+Tyf
 tN5t0uDT/VDwQl8BW0CuUg2pdnr2z0NWFg0paVEz56RzIYRXU7eseXm9xu7RoLBVGOsYKb5
 rRtIHwE5HXxA3f7iREdFw==
UI-OutboundReport: notjunk:1;M01:P0:f8IxZEIZbNE=;L0qavz/tyO2ThHHb4IUuYs61ahZ
 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
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782402614; x=1783007414; i=fiona.klute@gmx.de;
 bh=dnkwaPCCtaRZum58iEupwKMidrNXk6GEyt0Ek1hErgA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Fn2scSIFeRBuOJ78n/OECN0coghoHBr5gymwUiNbPJ4pkoiV3DbnIG6ScTnYXdIX
 15/TkeJbZH/LO1bViNnrh1wKXVlMpN1+8D4B2c6Vb7BH1hT12Ow7/SytFL8SHe68x
 SraOGNtrwP5v9qXezUIBkGpuqJ43LfKrO157+UqfwEp5tSwlSaULX1dy/fpyYMFvK
 1R6xx/lsqKwUeEylhyH0ScR8axQqzhCJqM7rn0uBb+yiafNdOLR+Xa5t2QhN3nsLi
 aSePHs/yTuD/mni81PX5YXAwcfpThUcV4EVxkQYa2ci9CaPQVscxv+mJDb8zLEhiA
 W9BsHb6fNphNYAKe9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Fn2scSIF
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: allow musl build
 for login/runuser/su
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 20.06.26 um 20:46 schrieb Bernd Kuhls:
> Buildroot commit f89ca996b6deb660b53c33196b8b309fac659bf9 fixed the
> build of linux-pam with musl in 2020 but did not remove the restric-
> tions in place for login/runuser/su which were added earlier with
> these commits:
> 
> login (2015): 25ecd24579f293ef4fcc6847094c4af39f4113af
> runuser (2017): 09860f354ae0824cfead384e994d3f119e22b851
> su (2017): c6488923fb785ac11f6ec78e53db5da22203b178
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/75fbf2c4a4cb132b66c59560f0470ebc063416fc
> 
>   package/util-linux/Config.in | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index c63cec2a9c..df7435e71a 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -210,17 +210,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
>   	depends on BR2_ENABLE_LOCALE # linux-pam
>   	depends on BR2_USE_WCHAR # linux-pam
>   	depends on !BR2_STATIC_LIBS # linux-pam
> -	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
>   	depends on BR2_USE_MMU # fork(), linux-pam
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
>   	select BR2_PACKAGE_LINUX_PAM
>   	help
>   	  Begin a session on the system
>   
> -comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
> +comment "login needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
>   	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
>   		|| BR2_STATIC_LIBS \
> -		|| BR2_TOOLCHAIN_USES_MUSL \
>   		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
>   config BR2_PACKAGE_UTIL_LINUX_LOSETUP
> @@ -366,7 +364,6 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
>   	bool "runuser"
>   	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
>   	depends on !BR2_STATIC_LIBS
> -	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
>   	depends on BR2_USE_MMU # fork(), linux-pam
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
>   	select BR2_PACKAGE_LINUX_PAM
> @@ -375,10 +372,9 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
>   	  to ask for a password, because it may be executed by the root
>   	  user only)
>   
> -comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
> +comment "runuser needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
>   	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
>   		|| BR2_STATIC_LIBS \
> -		|| BR2_TOOLCHAIN_USES_MUSL \
>   		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
>   config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
> @@ -411,17 +407,15 @@ config BR2_PACKAGE_UTIL_LINUX_SU
>   	bool "su"
>   	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
>   	depends on !BR2_STATIC_LIBS
> -	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
>   	depends on BR2_USE_MMU # fork(), linux-pam
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
>   	select BR2_PACKAGE_LINUX_PAM
>   	help
>   	  Run a command with substitute user and group ID
>   
> -comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
> +comment "su needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
>   	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
>   		|| BR2_STATIC_LIBS \
> -		|| BR2_TOOLCHAIN_USES_MUSL \
>   		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
>   config BR2_PACKAGE_UTIL_LINUX_SULOGIN

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
