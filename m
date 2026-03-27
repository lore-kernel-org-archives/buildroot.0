Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F90810ED674
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 12:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E703415F4;
	Fri, 27 Mar 2026 12:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9wghqzXgwRT; Fri, 27 Mar 2026 12:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40300415E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774616186;
	bh=f00NnRl4rS+3j5KSMgdhUVj553zWNl/Cf2VAJX4o0Zo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bnSs+Y80867f3ffe5OCtdChEihBZbQ4PGnDIkvA4acP9zyGRwtLmu/bwBzPYfEk2k
	 v2gjooOaHcHdTwxYdY0wvcCKz4o7vEBTVvMolg0zZpu9imtMGGAoEXaYRQVgYrPf3H
	 IOo5fQFDCWKWgxQxg+R3ri6GzcARPqbWqwPIlKxdWzBNGXAB529jwOBm1WkOA7r70s
	 Ofz+abEJR4tztFPM7dMu49SpFlzqtpHK0tDK9up2ir1PFzB+6ReWGsnZo6U3YRkBeo
	 /b7JYlTUwZ0poeX7K4mIePrXCXmmaZYLu93anF+NM96MAFYGxUkt+ip4tRTPRhC/GH
	 GoF0ChnL4bfCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40300415E1;
	Fri, 27 Mar 2026 12:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A0221D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 12:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F7DD60BC3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 12:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EZepGqwYGbA for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 12:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B55960BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B55960BC1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B55960BC1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 12:56:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 30A2B780372;
 Fri, 27 Mar 2026 13:56:16 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 13:56:16 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 13:56:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260326211551.3598750-1-bernd@kuhls.net>
References: <20260326211551.3598750-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7c758ca3496e7d0c2f777aa881d19952@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774616180;
 bh=g+67SyFSpyBWI1ZyGzqoDs0pkGraYQi8gMZIs4M8/zA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mWafoNRsS4Cf52AkmS04pt1H5wDnYquZysVfoEqCulGUDTt85L1Ao6aZoo/2/sOgk
 qQ9Q6GpThn3NIwPogi1Zlt/dqs1BQH2wjOxT94DnFuxecUfDzQ7P/MpW4HzrgumwS6
 jtIWIoCGaIJPsFbaOIjqzI//o6OiPEVBPS1yfocPKRwjiQw0Au2V5YNrMz1v46NaKB
 zXNlUEfA2LmtsfW0C3+iwGOyqum2+xl6FVYlBui3s+YGcBIvuLlVcnYUnnXvXG9aCM
 OZVN1KJy/IJrST+B/VAqF8uIY8DZyYXkiWTvoMjgfVQBXJp4O8VnbQVraY7xilbIFJ
 LyFVqmZfnxcTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mWafoNRs
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version 2.43-16-g5c6fca0c6
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

Thanks for the patch.

On 26/03/2026 22:15, Bernd Kuhls wrote:
> Fixes CVE-2026-4437:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=5c6fca0c62ce5bd6e68e259f138097756cbafd4d
> 
> For a full list of changes, see:
> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=5c6fca0c62ce5bd6e68e259f138097756cbafd4d
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 64a2c58377..6cdcf5ce93 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 
> origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
> +GLIBC_VERSION = 2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d

It there is one extra commit pushed upstream addressing another
CVE-2026-4438. See:
https://sourceware.org/git/?p=glibc.git;a=commit;h=dd9945c0ba40d2dbc9eb7c99291ba6b69bd66718

So we should probably bump directly to:
glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718

Can you send an updated patch to this newer version, please?

>  GLIBC_SITE = https://sourceware.org/git/glibc.git
>  GLIBC_SITE_METHOD = git
> 

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
