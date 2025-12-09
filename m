Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5CFD3B98C
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0356065F;
	Tue,  9 Dec 2025 18:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CghgTe9RuP-Y; Tue,  9 Dec 2025 18:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C7BC60740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304388;
	bh=bhmDeN2ZFJB60aSlfUXDReDL4cw16zCSnlKKtOrrtpw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NhVmkIa+NG40N2eWIs1HYGHy/lWO/hgnjMqXCbyDtMeK6ZO9lZjq1V1KZ2u8bmGM+
	 yBc5u3gMXIzxI3IgtqjQQ/v/ISSKWWN8GmOd8dXUAzwkBsWXnKSjFQ0wALNlJ/6plz
	 qpxfZQJ+YSHLdZ3BFqBb41u3o6caQTcrpk+0El7usnlKrhWFXckzFpoT2J7vgVvGpd
	 1/aa907WNusuCVqWPvJr9ShdL/Zy/SMMqaVBCThGzbOX8DGQ/vCNf0mPpcuIQ6xM43
	 qsw283KQQ2jxfaZE2BdfBZe3ptqSYI7sSasvnpJtpwcUCX31QE1y/w0+kX6hPOut5D
	 SourwY15EjqdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7BC60740;
	Tue,  9 Dec 2025 18:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD9E22C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2CE140672
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrWn2Xs3jlzq for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2DE84066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DE84066A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2DE84066A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:19:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 95550780372;
 Tue,  9 Dec 2025 19:19:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 19:19:33 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 19:19:33 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ
 Ascani <rj.ascani@gmail.com>, Daniel Nicoletti <dantti12@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251203215723.2323032-12-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
 <20251203215723.2323032-12-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <5278a6d1d49bb82cc5128da5e78e0f55@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765304383;
 bh=1PbXaKIYbrJs7OFhchNxx1EauRbg6nBqEkqn1T0E4NQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sXXYciChzaGI8x6/D1a4Veq5rTpPnFrNaLXGUHaH8dxvLSRKTdoUpvc3i5r+eT5nr
 qag9BiMMa6SsvV3CjelYJCpwlQQfEaH7Y63Pxhscjyon03g2YLf1cNsMhYERAteJVY
 WfT9KUgSt/ERirQVxboEUKVgtsCqJ5LYFYFugAPanSai8Y4zDsEykDeIWAdE4GDmAk
 ieZvPucjqJq5CxpxOGqnvFKsFm+JmbSmHqtVRC/h5KejHSpi5qPkFNXocz+ECfqJBs
 UtCK0OECd6IN50GnLW7AlgmAnQ1pQbTB0n3R7KPUgxgnJdpF9NzTkxxBymQyyCDcr6
 Jd2/fEFmO019w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sXXYciCh
Subject: Re: [Buildroot] [PATCH/next 12/16] package/libubox: bump version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 03/12/2025 22:57, Bernd Kuhls wrote:
> This bump includes patches which add cmake4 compatibility.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libubox/libubox.hash | 2 +-
>  package/libubox/libubox.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libubox/libubox.hash 
> b/package/libubox/libubox.hash
> index eb37d33230..127abf432c 100644
> --- a/package/libubox/libubox.hash
> +++ b/package/libubox/libubox.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> df6e1350fd11016ef30242a279cec195d91e6748c11c40e0991593718c46fa52  
> libubox-3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a-git4.tar.gz
> +sha256  
> c4432d4f902bd0a2974d3fe76620bbb5e04b9d52e55701829aa12507651bc4d9  
> libubox-ecddb31dc34d89be5c9dc4595a4c58070eb090e4-git4.tar.gz
> diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
> index 00ae2b0595..486f2f5c0a 100644
> --- a/package/libubox/libubox.mk
> +++ b/package/libubox/libubox.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBUBOX_VERSION = 3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a
> +LIBUBOX_VERSION = ecddb31dc34d89be5c9dc4595a4c58070eb090e4

When I try to compile this new libubox version with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBUBOX=y
EOF
make olddefconfig
make libubox

The compilation fails with error:

CMake Error at /usr/share/cmake/Modules/FindPkgConfig.cmake:938 
(message):
   None of the required 'json-c' found
Call Stack (most recent call first):
   CMakeLists.txt:18 (PKG_SEARCH_MODULE)

The old version compiles correctly.

Maybe the failure is related to:
https://git.openwrt.org/?p=project/libubox.git;a=commitdiff;h=b7acc8e6fd5e13611ad90a593e98f9589af4009a

>  LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
>  LIBUBOX_SITE_METHOD = git
>  LIBUBOX_LICENSE = ISC, BSD-3-Clause
> --
> 2.47.3

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
