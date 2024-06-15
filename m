Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A92CC27C7B
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 17:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27722405FD;
	Sat, 15 Jun 2024 17:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TfH2Gb5RADd; Sat, 15 Jun 2024 17:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B5740600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B5740600;
	Sat, 15 Jun 2024 17:05:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11C821BF31E
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 17:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F15F780E20
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 17:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMqR_F7R0kGP for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 17:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D359680E6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D359680E6D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D359680E6D
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 17:05:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6A96D13FA38;
 Sat, 15 Jun 2024 19:05:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 19:05:02 +0200
Date: Sat, 15 Jun 2024 19:05:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zm3Jvr23hF3MYpLT@landeda>
References: <20240615100123.641349-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615100123.641349-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718471104;
 bh=NjzQkLbzoAEsGy7pc+MGO+HwT5LOgG+t3x20HP48cJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ry46rZ9+gOjzqNkXiCwjql+va2v/HJc7+4G6S1DIm06elZfJ9VTSRGj2a0M9whtrp
 GbndORhp2gF7WtHjESwK0JwH5veQHx0sEbpGG20wi4McnoL0KsshYevWzhgeOMzC0x
 gwNGaAVweGRoXgpOdEpKetA6EHCFGdZhuww2HK5mYJVp6BPNv203wcc5Wpdi9M0UUm
 5avca2mSEBrb4MlIYhOwbZEbYWoNeEQpcaEpHUS0/GZf6pdVEqXgiO3IRwuNRSCC2C
 uuB1fw2OH+MAcR/XntS3EY8humFzPLvpGIarTzNhus0zVdRNF3eiDruRf2ztmvR+mt
 2oZR9j+1LHsvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ry46rZ9+
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: bump to version 9.2.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-06-15 12:01 +0200, Julien Olivain spake thusly:
> See release announce:
> https://octave.org/news/release/2024/06/07/octave-9.2.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit a4d38ef, with commands:
> 
>     utils/docker-run make check-package
>     ...
>     0 warnings generated
> 
>     utils/test-pkg -p octave
>     ...
>     6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>     support/testing/run-tests \
>         -d dl \
>         -o output_folder \
>         tests.package.test_octave
>     ...
>     OK
> ---
>  package/octave/octave.hash | 4 ++--
>  package/octave/octave.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/octave/octave.hash b/package/octave/octave.hash
> index 3ea5a1cd8d7..d9313734f16 100644
> --- a/package/octave/octave.hash
> +++ b/package/octave/octave.hash
> @@ -1,5 +1,5 @@
>  # Locally computed after checking signature
> -# https://ftp.gnu.org/gnu/octave/octave-9.1.0.tar.lz.sig
> +# https://ftp.gnu.org/gnu/octave/octave-9.2.0.tar.lz.sig
>  # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
> -sha256  f1769f61bd10c8ade6aee352b1bbb016e5fd8fc8394896a64dc26ef675ba3cea  octave-9.1.0.tar.lz
> +sha256  dcb2c098701cfcbc083f07e90e146261d15cdbf5e89c031032422112c89b47da  octave-9.2.0.tar.lz
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> index 6a21bef7b87..69b292bb6b8 100644
> --- a/package/octave/octave.mk
> +++ b/package/octave/octave.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OCTAVE_VERSION = 9.1.0
> +OCTAVE_VERSION = 9.2.0
>  OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
>  OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
>  OCTAVE_LICENSE = GPL-3.0+
> -- 
> 2.45.2
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
