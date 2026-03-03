Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D734EC047D
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 09:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A4F561383;
	Tue,  3 Mar 2026 09:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOkv9YSD_sDG; Tue,  3 Mar 2026 09:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D5C361099
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772530574;
	bh=GBBQc+to0jeOUmvke9AoKg1ZMnxYzMQeOntkpAGxjRA=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CBzauqV81Ep113FvZcYKtG5La3qiCL29Iu68O93QNoMVDlosnrHern2L8yo6cJWo/
	 L/6xWX56kE5w8UnzEmXO8WKMISyVUyElGTBuVwsIKlHIL9kFrZENsIzCgPEiNSJ5D0
	 7ioevCyelAVbEgbrTZRtxYxEA0cH4fxj+Q2WLA/u6sGsUnZNiiTXKS8U9ZdP/+1F62
	 tZlt3a9cQlypN5/Vhkw8hRHF6fvSpUgwCMAcvv6WRux8Qb802FygyqEW8Olyn2pp2T
	 GEsV00Ezww50YqqXuHFFeF+6AVWY/smLpJEve60udu3BpO17as2Ec+gckgtcvK+VgU
	 snb/8rIPIZCog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5C361099;
	Tue,  3 Mar 2026 09:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 560C2231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 09:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 538E382306
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 09:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zR8Sl7T_G8PP for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 09:36:11 +0000 (UTC)
X-Greylist: delayed 463 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Mar 2026 09:36:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7716E822EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7716E822EE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7716E822EE
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 09:36:10 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 9C424440EA1;
 Tue,  3 Mar 2026 11:28:22 +0200 (IST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260217075502.713155-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 17 Feb 2026 08:55:02 +0100")
References: <20260217075502.713155-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Tue, 03 Mar 2026 11:28:23 +0200
Message-ID: <87ms0pb6tk.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1772530102;
 bh=8u8oKxk7qmzWQuJtUptafwg8lz9+HxwiL8PowW2lHx8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NGFxV880qfjHwOeoGDACFLbTYQvkWwmjruSxzWqrJpus5lIXEOVwlgTqFGp9yEuu/
 zEE7fG2ucV23OBwzoPW+3HfFlnCsb0vwitOyudeAcIuSySBRZiQwTN+8UmUmvmyDiP
 855qRwBobvWW/1HIO1VH4ldbMmRWKT8kqrKYPU1HNZLrUn0N0XRbqzwLRCXEJF/7RM
 baNVG5GWQ4QCNf5ZZqXYrFl1RVRadGJok3mofseXyFHyjyhIL5a6ld/3WqJaFPGLXl
 eJ+EB7BC1R9v95aJRgUeRn9jy02sGjlu9I3A+3BD9oCsYtxMzwBpzg6BczskPuHLdY
 zOMkKFkRE71bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=NGFxV880
Subject: Re: [Buildroot] [PATCH 1/1] package/socat: bump version to 1.8.1.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Tue, Feb 17 2026, Bernd Kuhls wrote:
> http://www.dest-unreach.org/socat/
>
> 2026-02-12: Socat version 1.8.1.1 has been released.
>  It fixes compilation with glibc 2.43, xio-netlink.c for Musl, and a few
>  minor bugs, see file CHANGES
>
> 2025-12-08: Socat version 1.8.1.0 has been released. It fixes a couple
>  of minor issues and provides new address types TEXT and STALL and a few
>  new address options.
>
> Rebased patch 0001 due to upstream commit
> https://repo.or.cz/socat.git/commitdiff/2cc1f11d02928e7eca9560506dfc6e97a0ac92e3
>
> Updated hash of README, used as license file, due to version bumps:
> https://repo.or.cz/socat.git/history/HEAD:/README
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/socat/0001-no-documentation.patch | 4 +++-
>  package/socat/socat.hash                  | 6 +++---
>  package/socat/socat.mk                    | 2 +-
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
> index 5dbce0576e..13e9e503f2 100644
> --- a/package/socat/0001-no-documentation.patch
> +++ b/package/socat/0001-no-documentation.patch
> @@ -12,6 +12,8 @@ Upstream: N/A
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  [baruch: update for 1.8.0.0 and 1.8.0.3; git patch format]
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +[Bernd: rebase on 1.8.1.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   Makefile.in | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> @@ -22,7 +24,7 @@ index c01b1a4a2306..fd89acb06f3c 100644
>  +++ b/Makefile.in
>  @@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
>   TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
> - 	proxy.sh socks4a-echo.sh socks5server-echo.sh
> + 	proxy.sh socks4a-echo.sh socks5server-echo.sh socks5server-auth.sh
>   
>  -all: progs doc
>  +all: progs
> diff --git a/package/socat/socat.hash b/package/socat/socat.hash
> index b1c3d3cd11..3a4eec60c1 100644
> --- a/package/socat/socat.hash
> +++ b/package/socat/socat.hash
> @@ -1,8 +1,8 @@
>  # From http://www.dest-unreach.org/socat/download.md5sum
> -md5  8ef0bc4f602636797917f8574c3b249e  socat-1.8.0.3.tar.bz2
> +md5  5456f0f0c5d4505b68edcb10e23ef128  socat-1.8.1.1.tar.bz2
>  # From http://www.dest-unreach.org/socat/download.sha256sum
> -sha256  01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095  socat-1.8.0.3.tar.bz2
> +sha256  5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b  socat-1.8.1.1.tar.bz2
>  # Locally calculated
> -sha256  f51653b61cf2516c39e8f2edefc11604d0f9d14f0c6ae988bef228a1f0283ad2  README
> +sha256  86e46422f9381b386bd2eb6606f9d6c3ff479f905660d0f318c571292ab304b8  README
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index 69f8f40452..3d40540599 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SOCAT_VERSION = 1.8.0.3
> +SOCAT_VERSION = 1.8.1.1
>  SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>  SOCAT_SITE = http://www.dest-unreach.org/socat/download
>  SOCAT_LICENSE = GPL-2.0 with OpenSSL exception

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
