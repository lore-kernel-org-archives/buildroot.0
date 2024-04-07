Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4083BCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 095EB608B4;
	Sun,  7 Apr 2024 12:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuT2niRxd3PQ; Sun,  7 Apr 2024 12:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FFA608F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3FFA608F7;
	Sun,  7 Apr 2024 12:18:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 084631BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF1F1608D8
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SB2b3WwwDkh5 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:18:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65A10608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65A10608AA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65A10608AA
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:18:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2575E13F89A;
 Sun,  7 Apr 2024 14:18:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 14:18:45 +0200
Date: Sun, 7 Apr 2024 14:18:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhKPJalCJ_zyycuT@landeda>
References: <20240407092247.277457-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407092247.277457-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712492329;
 bh=AaRPeNZvdssnJGdIOp2lk6JVmHT3WRnvXYiuknYlr9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RxGYl11Y+X3HwygI8H/FUp12DSp8BWEYGbpiF65ciy331LTRw9m7oNV9mt7ZA4XVM
 nqhO7QrJt5PNIVl8Dd0t0DZAdR2CuPBzBC+3xZM8nhAI3t7hf3Ap6DvBzs4h9TXbBp
 Wmb6Xr1SWZneYOY6tMNHLViL4X0GPlBwsAbKghCCMftiYQrOnaLd/QmubOx20Jweyc
 wxzXBLfWKkYtH9cvRpCaF8fBiCNNt9zsHHiQxb3GRpvgMMgWIQpxKZp0OdPyhNRVeu
 Io7VYMV68fN+Tj6rgZfc37wq0J7vIgANJKFFn+fgQFjVCZzNOlpodzZL7WsCDkvvFz
 gtSUhivX2s4Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RxGYl11Y
Subject: Re: [Buildroot] [PATCH 1/1] package/android-tools: add libxcrypt
 optional dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-07 11:22 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/aarch64_be-buildroot-linux-gnu/12.3.0/../../../../aarch64_be-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/ab7c1ff0649bec21584654431e722efe2dc88c3d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/android-tools/Config.in        | 1 +
>  package/android-tools/android-tools.mk | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
> index bc76d545c1..a688182ed9 100644
> --- a/package/android-tools/Config.in
> +++ b/package/android-tools/Config.in
> @@ -68,6 +68,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
>  config BR2_PACKAGE_ANDROID_TOOLS_ADBD
>  	bool "adbd"
>  	depends on BR2_USE_MMU # uses fork()
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_ZLIB
>  	help
> diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
> index 3d5c76a322..f273ea5cdf 100644
> --- a/package/android-tools/android-tools.mk
> +++ b/package/android-tools/android-tools.mk
> @@ -63,7 +63,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
>  ANDROID_TOOLS_TARGETS += adbd
> -ANDROID_TOOLS_DEPENDENCIES += zlib openssl
> +ANDROID_TOOLS_DEPENDENCIES += \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
> +	zlib openssl
>  endif
>  
>  # Build each tool in its own directory not to share object files
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
