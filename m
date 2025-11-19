Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2735DCF256C
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 05:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69C541D00;
	Wed, 19 Nov 2025 05:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJ2ZAhSr0kDI; Wed, 19 Nov 2025 05:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C67B141D89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67B141D89;
	Wed, 19 Nov 2025 05:02:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6268D160
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 05:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48AF141D89
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 05:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5W3i2TK2o1R for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 05:02:01 +0000 (UTC)
X-Greylist: delayed 405 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Nov 2025 05:01:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29A4141D00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29A4141D00
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29A4141D00
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 05:01:58 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 5AD1744064C;
 Wed, 19 Nov 2025 06:53:17 +0200 (IST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251118211149.2013582-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 18 Nov 2025 22:11:49 +0100")
References: <20251118211149.2013582-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Wed, 19 Nov 2025 06:55:09 +0200
Message-ID: <87ikf6wriq.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1763527997;
 bh=yDGeBjbD7XhKkQS2FZcvioMHQx60NevkYobCAftKlDw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sn9VA6Q/all5pYQjAPqa3J6ucvP08V7AMaEc/HyEU+Udq765du3FJTvtrdYXXe7o2
 ZAaB3vCeIxH9fZvsNE8KTUJTtaBjxj0NxLndITVssct6/17dkj16wTXjMfa4wnsrn8
 KaPuPtb5KLnwiP532/zXu44Xd4C+wO0akkuk8dLOk4tS0JDaoaZSWlb9mypoxrGO41
 BvdVGQcO/+TvJy/mBAdBBP4S5whpfP5Xfn+PMvQ21LDX6/BZ56+CpyU1mPXlGWe1l7
 e7nAvk5dGvUY1ClFqmCPCB1uzTwrhiEFRU9Y0O+mjp8CcEY+MNn7u97RVeYSK54m2+
 anRmqoLeYdDYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=sn9VA6Q/
Subject: Re: [Buildroot] [PATCH 1/1] package/xinetd: bump version to 2.3.15.4
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

On Tue, Nov 18 2025, Bernd Kuhls wrote:
> Switched to maintained fork:
> https://github.com/xinetd-org/xinetd/issues/30
>
> Removed all patches, they are either included in this release or not
> needed anymore.
>
> uClibc builds are broken due to missing ecvt/fcvt functions:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/stdlib.h?h=v1.0.55#n830
> needed by
> https://github.com/openSUSE/xinetd/blob/master/src/sio/sprint.c#L176
>
> Added -std=gnu17 to CFLAGS as per upstream recommendation to fix build
> errors with newer gcc: https://github.com/openSUSE/xinetd/issues/49
>
> Fixes:
> https://autobuild.buildroot.net/results/399/399108140f1932e867e2907c5fa1be2add53beab/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

...

> diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
> index f63a8a2251..1542e44b6b 100644
> --- a/package/xinetd/xinetd.mk
> +++ b/package/xinetd/xinetd.mk
> @@ -4,18 +4,25 @@
>  #
>  ################################################################################
>  
> -XINETD_VERSION = 2.3.15
> -XINETD_SITE = \
> -	$(call github,xinetd-org,xinetd,xinetd-$(subst .,-,$(XINETD_VERSION)))
> +XINETD_VERSION = 2.3.15.4
> +XINETD_SOURCE = xinetd-$(XINETD_VERSION).tar.xz
> +XINETD_SITE = https://github.com/openSUSE/xinetd/releases/download/$(XINETD_VERSION)
>  XINETD_LICENSE = xinetd license
>  XINETD_LICENSE_FILES = COPYRIGHT
>  XINETD_CPE_ID_VENDOR = xinetd
>  
> -# 0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
> +# https://github.com/openSUSE/xinetd/commit/91e2401a219121eae15244a6b25d2e79c1af5864
>  XINETD_IGNORE_CVES += CVE-2013-4342

If this CVE is fixed in 2.3.15.4, why do we need to keep IGNORE it?

baruch

>  
>  XINETD_CFLAGS = $(TARGET_CFLAGS)
>  
> +# gcc-15 defaults to -std=gnu23 which introduces build failures.
> +# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
> +# versions will work, since they are using the older standard.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> +XINETD_CFLAGS += -std=gnu17
> +endif
> +
>  # Three cases here:
>  #  1. We have libtirpc, use it by passing special flags
>  #  2. We have native RPC support, use it, no need to pass special

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
