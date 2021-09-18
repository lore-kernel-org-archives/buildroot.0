Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05558C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 08:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65AE461244
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 08:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65AE461244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22FFC60747;
	Sat, 18 Sep 2021 08:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXYowTD_46rU; Sat, 18 Sep 2021 08:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA006069E;
	Sat, 18 Sep 2021 08:14:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B389D1BF365
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 08:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C1F401BC
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 08:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPLuxmhBVXEX for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 08:13:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B5C4400F1
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 08:13:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9B876B00571;
 Sat, 18 Sep 2021 10:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631952834;
 bh=JDY8bzw2h0zctMRgGz6yn0AuoLGe5r9PV2uFtphk7yA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P09bAE+XgbJ/Ho4deAMAEoSYqo+a8x2n1mXWUOUKa2/fGrExcAjK/X9XY7s7TpwdM
 iyvnVG2m2UPJ/2xg7C7ZMQQNgf8HpA1/Kd5gPUz/CKPscTa52vueCYW/kL/GONoPwG
 JuWn9ubmGZJQgTgEAgzHJ2jPT+IyJkQMgfaGJ9wCU6Rlaue/4adTUW713SL3B4Iz3V
 AIX309DLMJTRd174Qf6/e/GNUKJplgB+11D2UnMsXWX3IHE0XgHMcwteQFa4CcrKrP
 lcpbcEsrlxWY9JLsiv7DuNGoCXBQMcH0dTqacZIwBXsMRcMAlWP7okBX0DtpduVL/2
 qDZwzwYmc17jw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 10:13:46 +0200
Date: Sat, 18 Sep 2021 10:13:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210918081346.GG1053080@scaer>
References: <20210918005027.97811-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918005027.97811-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump versions to
 11.0.12+7 and 16.0.2+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Adam, All,

On 2021-09-17 17:50 -0700, Adam Duskett spake thusly:
> As the github repository has changed from github.com/AdoptOpenJDK/ to
> github.com/adoptium, both versions are updated in the same patch.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/openjdk-bin/openjdk-bin.hash | 6 +++---
>  package/openjdk-bin/openjdk-bin.mk   | 7 +++----
>  package/openjdk/openjdk.hash         | 4 ++--
>  package/openjdk/openjdk.mk           | 4 ++--
>  4 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> index 04b3c42d25..696371eb51 100644
> --- a/package/openjdk-bin/openjdk-bin.hash
> +++ b/package/openjdk-bin/openjdk-bin.hash
> @@ -1,8 +1,8 @@
>  # From https://github.com/AdoptOpenJDK/openjdk16-binaries/releases
> -sha256  7fdda042207efcedd30cd76d6295ed56b9c2e248cb3682c50898a560d4aa1c6f  OpenJDK16U-jdk_x64_linux_hotspot_16.0.1_9.tar.gz
> +sha256  323d6d7474a359a28eff7ddd0df8e65bd61554a8ed12ef42fd9365349e573c2c  OpenJDK16U-jdk_x64_linux_hotspot_16.0.2_7.tar.gz
>  
> -# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
> -sha256  e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb  OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
> +# From https://github.com/adoptium/temurin11-binaries/releases
> +sha256  8770f600fc3b89bf331213c7aa21f8eedd9ca5d96036d1cd48cb2748a3dbefd2  OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
>  
>  # Locally calculated
>  sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index b48155dc28..641a212f17 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -6,15 +6,14 @@
>  
>  ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
>  HOST_OPENJDK_BIN_VERSION_MAJOR = 16
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_9
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_7
>  else
>  HOST_OPENJDK_BIN_VERSION_MAJOR = 11
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.11_9
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
>  endif
>  HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
>  HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> -HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
> -
> +HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))

I've reinstated the nice empty line that acts as a clean separation. ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
>  HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
>  
> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> index ba6c4385e7..2b4a2c7a62 100644
> --- a/package/openjdk/openjdk.hash
> +++ b/package/openjdk/openjdk.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  openjdk-16.0.1+9.tar.gz
> -sha256  55841c01dbe6606e0d5f88045fb2da02632ce3a2d9d9b25d030a06eadeee0f62  openjdk-11.0.11+9.tar.gz
> +sha256  b4a0e71e41a11175e8a7c1dba86ed5b0aa878413158c8d48813db1b64ac9536c  openjdk-16.0.2+7.tar.gz
> +sha256  9a37c9641b45f5c51fe19c1ccae141daeb5dcdbd59fa2f56e7dea7bf09484bec  openjdk-11.0.12+7.tar.gz
>  sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index cbb975ca25..aac5c87e73 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -6,10 +6,10 @@
>  
>  ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
>  OPENJDK_VERSION_MAJOR = 16
> -OPENJDK_VERSION_MINOR = 0.1+9
> +OPENJDK_VERSION_MINOR = 0.2+7
>  else
>  OPENJDK_VERSION_MAJOR = 11
> -OPENJDK_VERSION_MINOR = 0.11+9
> +OPENJDK_VERSION_MINOR = 0.12+7
>  endif
>  OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
>  OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
> -- 
> 2.30.2
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
