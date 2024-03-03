Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D6CC5475B
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2271340A03;
	Sun,  3 Mar 2024 10:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nB3pEAw6VlO; Sun,  3 Mar 2024 10:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B79DD4109B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B79DD4109B;
	Sun,  3 Mar 2024 10:50:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC481BF293
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB2060A9A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFyqfPuABtMI for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58028608BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58028608BE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58028608BE
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:50:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9678D13F89C;
 Sun,  3 Mar 2024 11:50:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 11:50:41 +0100
Date: Sun, 3 Mar 2024 11:50:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZeRWAXh2NYMm-uSl@landeda>
References: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709463043;
 bh=XSANaZO8P5+AjnHI2Bcxhx7lPzy9OkDlvoxuqIXhp4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uP9LHIFSczC53fCA9abG4H7UjfEtqU8M4mdkbbci8BHX00/fzx4c0ZQ/i+bxXVFiY
 fGttCcl4CvIJHHF6oAGxMoUE4XdozZc+hhFQV03UHuxyl5PAj47xWOsOFJ74JvET5m
 H1bdkWQvwMBwQU5TrZIlBvoMpwipDgEv7hes1R4P8hMf7D7qs9xrLdLgbvicVfNmzh
 jViNC+WMMlfhtUi8+YF8n/eTbD4bdTJ1KsET2qJPTq+weh5u++22ySkz91orS1r09K
 c/jEzq1cyP7MtApJEZHUJTo6ZQJXcq3mzT3MmLt7+KMAnB/cisWcuwWNV7mIE6zTsg
 Ejl2eoSE42k5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uP9LHIFS
Subject: Re: [Buildroot] [PATCH next 0/4] Upgrade to Binutils 2.42
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

Thomas, All,

On 2024-03-03 09:40 +0100, Thomas Petazzoni via buildroot spake thusly:
> This series of patches update binutils to version 2.42, doing the
> usual dance:
> 
>  1. Add 2.42
>  2. Make 2.41 the default
>  3. Drop 2.39
> 
> An fourth patch is added to drop some code that is no longer needed
> now that binutils 2.39 is gone.

I've made some comments on two patches, to which I individually replied
already. Whole series applied to next, thanks.

Regards,
Yann E. MORIN.

> Thomas
> 
> Thomas Petazzoni (4):
>   package/binutils: add support for 2.42
>   package/binutils: make 2.41 the default version
>   package/binutils: drop support for binutils 2.39
>   package/binutils: drop BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
> 
>  .checkpackageignore                           |   3 -
>  Config.in.legacy                              |   6 +
>  ...or1k-fix-building-with-gcc-version-5.patch |  50 ------
>  .../{2.39 => 2.42}/0001-sh-conf.patch         |  14 +-
>  .../0002-poison-system-directories.patch      | 167 ++++++++++--------
>  package/binutils/Config.in.host               |  14 +-
>  package/binutils/binutils.hash                |   1 -
>  package/binutils/binutils.mk                  |  10 +-
>  package/elf2flt/elf2flt.mk                    |   2 +-
>  9 files changed, 111 insertions(+), 156 deletions(-)
>  delete mode 100644 package/binutils/2.39/0003-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  rename package/binutils/{2.39 => 2.42}/0001-sh-conf.patch (82%)
>  rename package/binutils/{2.39 => 2.42}/0002-poison-system-directories.patch (79%)
> 
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
