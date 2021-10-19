Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD62C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:37:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E6D961027
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E6D961027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A2260AD4;
	Tue, 19 Oct 2021 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id en1lXTSs6u-C; Tue, 19 Oct 2021 19:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4196260886;
	Tue, 19 Oct 2021 19:37:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E88601BF328
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5298405C9
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHTAtSikHr_R for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 19:37:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F6CA405C4
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 19:37:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd94:aa5f:dfc1:b524])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2139A19F553;
 Tue, 19 Oct 2021 21:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634672247;
 bh=FYVbkmJCuDZigXgz9gtFv4OHo11cSwpX3jBeCL7PPek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mWcR8PbsnNsP3ndBP6KOQjpEmC9XDHWBAViwUt4x7hIUpKUb+hyEj2OgWpsaFbSFT
 7IYkl8ECCgyGMu3+Bm823AeqUQ0w+VPoTdgIBhyc/vouHai8PgiHYKKwh2HaWGn4bj
 giVIJ9b6EG9um/cUFDIn1TGuttoBmLoy1gVrSSTwwMSLefzV5wwYdi7AFrwH4Mrb/S
 7FFhqIclYnSoVpjlNfJPxnRh7sbjq0ADUFayTlhZrj8/DJx4hbtCkSOgo1QAOfJUrd
 Qm8A7BXHKyPTr59wV5qgJdPsrHHFOjuIzAiLxOE8IIyOIejUmuASZQZtw3krej/+pm
 qKzrxWVh2qOxg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Oct 2021 21:37:20 +0200
Date: Tue, 19 Oct 2021 21:37:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Matthew Weber <matthew.weber@collins.com>
Message-ID: <20211019193720.GX2400@scaer>
References: <20211018214014.1202-1-matthew.weber@collins.com>
 <20211018214014.1202-2-matthew.weber@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018214014.1202-2-matthew.weber@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/lightning: [revert]ignore not
 applicable CVE-2020-7747
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Matthew, All,

On 2021-10-18 16:40 -0500, Matthew Weber via buildroot spake thusly:
> This reverts commit 613953f8217bf5b27489e0a939147ef7c74c3f7a.
> 
> A new CPE ID was assigned by NIST and this whitelist can be
> dropped as the package is setup to use the correct CPE (Not
> to be confused with the other lightning-* packages which show
> up when a free txt search is used to find the CVE.)
> 
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

With a slight reword in the title, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lightning/lightning.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
> index c0036e5cd1..da8c07e61f 100644
> --- a/package/lightning/lightning.mk
> +++ b/package/lightning/lightning.mk
> @@ -13,10 +13,6 @@ LIGHTNING_CPE_ID_VENDOR = gnu
>  # We're patching include/Makefile.am
>  LIGHTNING_AUTORECONF = YES
>  
> -# CVE-2020-7747 is for the Javascript lightning-server project, and not for
> -# GNU Lightning.
> -LIGHTNING_IGNORE_CVES = CVE-2020-7747
> -
>  ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
>  LIGHTNING_DEPENDENCIES += binutils zlib
>  LIGHTNING_CONF_OPTS += --enable-disassembler
> -- 
> 2.17.1
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
