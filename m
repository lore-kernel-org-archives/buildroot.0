Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690BACD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 05:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C4284460;
	Mon, 11 May 2026 05:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVBlmEYH7EpN; Mon, 11 May 2026 05:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D920184464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778478985;
	bh=lThikXf8DVbGnXXepGaAgtZLzD/n9uB3yLbIIOd4icQ=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nx6YJ0JhG9zm7vwYPdnuh2vBDcg3Zv89uOok41gx7lEN+FoURVL2HaQH+VBUoKTGD
	 ayDB9M9ABmTtrAy5wklXcDS91kpTGQPR2dKcMkWTC9DyYuFBTMsUG5oQ3mX2Mvx34i
	 G3b4uAFTzkn8WNUYyEvKAajVjUqTv/+sCaqXSDJlPuxYxhkfHScNSE5becZ3AQ1VjT
	 3lChnUd+YvXqOl1tIh13hc9t3/ChpXmrsEQKZ4B/dh39GLLcZcOAY+VZctVVFRXNkV
	 VKwRU0I4LWD8Zo8KZyhvGNau1HNsAfTBoiXP8spdkZ5mu4R6Qc8dWXpgZbZk+b9P+S
	 vxXNH7hGuuUTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D920184464;
	Mon, 11 May 2026 05:56:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF76C173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 05:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4B44402EF
 for <buildroot@buildroot.org>; Mon, 11 May 2026 05:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqJb7UsC6Gnv for <buildroot@buildroot.org>;
 Mon, 11 May 2026 05:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04E5C4007F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E5C4007F
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04E5C4007F
 for <buildroot@buildroot.org>; Mon, 11 May 2026 05:56:21 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id 580584402AF;
 Mon, 11 May 2026 08:55:52 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511053836.208037-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 11 May 2026 07:38:36 +0200")
References: <20260511053836.208037-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 11 May 2026 08:56:16 +0300
Message-ID: <87a4u632wv.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1778478952;
 bh=2n7npmb2rNQuGvZOrWJA1Lvg89fl7j9mFbOM7aGSr/8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CFj/Lf1gtO0TRmcZKD2y1nLS+m/mKp/cz/GSjdC8FDvGSFJxMuRfbq0baSr+rcA0U
 ovW3IE+nu7FZhI7jF3ftshkGD27Sc8j9HdmILpISIp3Lq1sfT5NDBOqI9hQpjS5CLo
 SXuXLoyT8QY2pInmibemNQqcRjlzdEiu0NAej245tXHNsAai6MYxEOFFC7eN0JmB5P
 tfw/RwKYqhWgto2fyyTYWpyCV9sNqFSy3jX+Z/L7A0F6f4OCvAsCQ4d6uqy6SIo36W
 FbQFMRHOTlzDwZslDSiiG7pf17FlICyDJyLbzzvoYV6L8Zo18LSitfyyMrbgcBemCj
 Symh0Ho/tSBbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=CFj/Lf1g
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: bump version to
 2026.91
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

On Mon, May 11 2026, Bernd Kuhls wrote:
> https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2026q2/002398.html
>
> This bump includes
> "- scp: Fix regression in 2026.90 building on older glibc or other libc.
>   reallocarray() was required, it is no longer needed."
>
> and fixes a build error introduced by buildroot commit
> 5b136c89ffed35c30dff1802924a4dcf9bdab798.
>
> Fixes:
> https://autobuild.buildroot.net/results/637/6372e58671d3719b127dcb69642420a07f441790/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index 81296375a1..31ac153b89 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
> +sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
>  
>  # License file, locally computed
>  sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index beb635e15e..a7de8432af 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DROPBEAR_VERSION = 2026.90
> +DROPBEAR_VERSION = 2026.91
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
