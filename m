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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E03DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:11:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D5161056
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9D5161056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73DA840E8;
	Sat, 18 Sep 2021 15:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdxiLG1jp8Kf; Sat, 18 Sep 2021 15:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1316C840E7;
	Sat, 18 Sep 2021 15:11:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A80381BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4364840E7
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSdEG60jR-Fr for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:11:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6246840E4
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:11:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3D641B00533;
 Sat, 18 Sep 2021 17:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631977901;
 bh=qa/YQrFeGvXJmWYi/7p+YSWOyRCq+MXNWV3bjriOvaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vUjTd7Uf3gO1SGGTHi9jLK4f+MNIcX7LUPFd4Mt4u1jxyFP82dZjbXUSjBWycxjvw
 d8yqgmMNBx7cfjLm3zeYn+DUowRYaUBxOLuO6bhflu0Vw5/mMr4igKoGJXgvKy7LZz
 xbS9gnsN5tzogyKlZDgVYtr5UJMGp//WPVjeTUP1I2IJj/StOgDn98hYPPcO0P7R5P
 YdP9UwFHcvEH0+UggYcyfCsqnwwfcQK1lonmgGou7AzqfB/4R3MxC7/5Dvq+wTewKq
 YzWatsTSZdF6tVgG7/wmrSmE821F52ItSKdPq7kKgifn35H7eKomcOw2SvgOOrEjzo
 xXR73vFlMk6Lw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:11:36 +0200
Date: Sat, 18 Sep 2021 17:11:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918151136.GT1053080@scaer>
References: <20210916165040.1941425-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210916165040.1941425-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: bump to version 1.0.2
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

Fabrice, All,

On 2021-09-16 18:50 +0200, Fabrice Fontaine spake thusly:
> https://github.com/opencontainers/runc/releases/tag/v1.0.2
> https://github.com/opencontainers/runc/releases/tag/v1.0.1
> https://github.com/opencontainers/runc/releases/tag/v1.0.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 6 +-----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> index 598bd3067f..365beac21d 100644
> --- a/package/runc/runc.hash
> +++ b/package/runc/runc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  02dac7f1a0dcfe55dd9820df787adedf030060870354915e7bba86f8487ce93c  runc-1.0.0-rc95.tar.gz
> +sha256  6c3cca4bbeb5d9b2f5e3c0c401c9d27bc8a5d2a0db8a2f6a06efd03ad3c38a33  runc-1.0.2.tar.gz
>  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index 62b9f09bf2..e77ef8111e 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -4,15 +4,11 @@
>  #
>  ################################################################################
>  
> -RUNC_VERSION_MAJOR = 1.0.0
> -RUNC_VERSION_MINOR = rc95
> -RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
> +RUNC_VERSION = 1.0.2
>  RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
>  RUNC_LICENSE = Apache-2.0
>  RUNC_LICENSE_FILES = LICENSE
>  RUNC_CPE_ID_VENDOR = linuxfoundation
> -RUNC_CPE_ID_VERSION = $(RUNC_VERSION_MAJOR)
> -RUNC_CPE_ID_UPDATE = $(RUNC_VERSION_MINOR)
>  
>  RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
>  RUNC_TAGS = cgo static_build
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
