Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF86C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FAD560F45
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FAD560F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA1694000B;
	Sat, 18 Sep 2021 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ADdCwG30HjX; Sat, 18 Sep 2021 15:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7646400C3;
	Sat, 18 Sep 2021 15:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2821BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BA39606ED
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXG_S-_PotFW for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:31:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6730B606B6
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:31:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D6DE4B00565;
 Sat, 18 Sep 2021 17:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631979070;
 bh=CYWy8BlhLDSe21SKBdPlPKHjD3FtkHUJTGGqA87jj7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7qA14Iy8W6Ijp2fCrfBVys2UwDq94/ghhI9XmHMSOArH9ple/XNZYER0h0RMeVIo
 bm9XJSNlKXHQhqLPUKD6y++gy2GrLuP/M5M/WlBivUnOCEBZ7NW11fTmtFltOoHVgF
 ZmyrpeDHdnbMdxwvbvQTdRqQZKY5k6LvNTVNuKFexFfeKOQT+roFkl+laSfKHakXOw
 PWssva0L+5xXTCPibuDLrG/ELKo7Ft54M6yxtXjPPpTx2NL3s+SRfQlavnhG2hLt58
 gqj20HBbPoYTKlNHC/hRmD6JiV3NJEJ1yJSz7P+9Yx6FPSNCmK+q8DXVrZukYiR32t
 w+JLZJDnU+ioQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:31:05 +0200
Date: Sat, 18 Sep 2021 17:31:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210918153105.GA1053080@scaer>
References: <20210915191412.14613-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915191412.14613-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: bump version to 9.11.35
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Petr, All,

On 2021-09-15 21:14 +0200, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Hi,
> 
> tested:
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed
> 
>                              andes-nds32 [ 1/45]: OK
>                              arm-aarch64 [ 2/45]: OK
>                    bootlin-aarch64-glibc [ 3/45]: OK
>                bootlin-arcle-hs38-uclibc [ 4/45]: OK
>                     bootlin-armv5-uclibc [ 5/45]: OK
>                      bootlin-armv7-glibc [ 6/45]: OK
>                    bootlin-armv7m-uclibc [ 7/45]: SKIPPED
>                       bootlin-armv7-musl [ 8/45]: OK
>              bootlin-microblazeel-uclibc [ 9/45]: OK
>                    bootlin-mipsel-uclibc [10/45]: OK
>                 bootlin-mipsel32r6-glibc [11/45]: OK
>                 bootlin-m68k-5208-uclibc [12/45]: SKIPPED
>                bootlin-m68k-68040-uclibc [13/45]: OK
>                      bootlin-nios2-glibc [14/45]: OK
>                  bootlin-openrisc-uclibc [15/45]: OK
>            bootlin-powerpc-e500mc-uclibc [16/45]: OK
>         bootlin-powerpc64le-power8-glibc [17/45]: OK
>                    bootlin-riscv32-glibc [18/45]: OK
>                    bootlin-riscv64-glibc [19/45]: OK
>                     bootlin-riscv64-musl [20/45]: OK
>                       bootlin-sh4-uclibc [21/45]: OK
>                     bootlin-sparc-uclibc [22/45]: OK
>                    bootlin-sparc64-glibc [23/45]: OK
>                    bootlin-xtensa-uclibc [24/45]: OK
>                     bootlin-x86-64-glibc [25/45]: OK
>                      bootlin-x86-64-musl [26/45]: OK
>                    bootlin-x86-64-uclibc [27/45]: OK
>                             br-arm-basic [28/45]: OK
>                     br-arm-full-nothread [29/45]: OK
>                       br-arm-full-static [30/45]: OK
>                 br-i386-pentium-mmx-musl [31/45]: OK
>                    br-i386-pentium4-full [32/45]: OK
>                       br-mips64-n64-full [33/45]: OK
>                  br-mips64r6-el-hf-glibc [34/45]: OK
>                br-powerpc-603e-basic-cpp [35/45]: OK
>                br-powerpc64-power7-glibc [36/45]: OK
>                        linaro-aarch64-be [37/45]: OK
>                           linaro-aarch64 [38/45]: OK
>                               linaro-arm [39/45]: OK
>                      sourcery-arm-armv4t [40/45]: OK
>                             sourcery-arm [41/45]: OK
>                      sourcery-arm-thumb2 [42/45]: OK
>                            sourcery-mips [43/45]: OK
>                          sourcery-mips64 [44/45]: OK
>                           sourcery-nios2 [45/45]: OK
> 45 builds, 2 skipped, 0 build failed, 0 legal-info failed
> 
>  package/bind/bind.hash | 6 +++---
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 9311d82d6d..12b80149c5 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.11.31/bind-9.11.31.tar.gz.asc
> -# with key 2455774D42FDFE6B9C383EB8FE1002BC5970811F
> -sha256  f5f24457f42b2e86870d887596e47500e4d40521a098dcb96f3a06f18adfa36a  bind-9.11.31.tar.gz
> +# Verified from https://ftp.isc.org/isc/bind9/9.11.35/bind-9.11.35.tar.gz.asc
> +# with key E9AB6E79233C0416E8993F450C03AFA90A5967C4
> +sha256  1c882705827b6aafa45d917ae3b20eccccc8d5df3c4477df44b04382e6c47562  bind-9.11.35.tar.gz
>  sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index a5c246a54a..0d95da209c 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.11.31
> +BIND_VERSION = 9.11.35
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  # bind does not support parallel builds.
>  BIND_MAKE = $(MAKE1)
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
