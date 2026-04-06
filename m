Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65125F46C64
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 17:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24F9D407E5;
	Mon,  6 Apr 2026 17:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dCZ891XuskN; Mon,  6 Apr 2026 17:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1114E407D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775496397;
	bh=FdpQpAqx6SIURazJt0OuHHoiQIs0IaqENjH7o3FhXUA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jouw8T9uC7udvpezEI08AaOvxitwAkvpwjQ76BupB1Yf433PQFe1GLyXLXJAhBEbr
	 kZvEamVISvTDFZzAHmAWteBhej2pdoNWxqOe9EXBmEe2z/OIWATH42jyTN///3j62V
	 LV65RQM35YkXwVvKb6yyT3+pJR3mr9fUgnxtT7mdOKoZBPfxINkpHU5eSsfl3+xOH5
	 RwFD1JjD4dHGyiFa7OnGpv4z9tQprb1ARmIPPydGW5NWvdFwB9+NOboED8C91Hgf3l
	 E3jYxQbMAjlOmI+7UjWmKX2Wz32T8FKGsiWApJFgCuPAuOIQQ8Hz+IjZKnKcT9nheB
	 NrjY7EymGRN4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1114E407D3;
	Mon,  6 Apr 2026 17:26:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 289451EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E80080E96
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ADCJPTcYMoB for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 17:26:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F0D280E92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F0D280E92
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F0D280E92
 for <buildroot@busybox.net>; Mon,  6 Apr 2026 17:26:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 424E513F8A7;
 Mon,  6 Apr 2026 19:26:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 19:26:30 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 19:26:30 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260406100822.7845-1-francois.perrad@gadz.org>
References: <20260406100822.7845-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <90f9582eb5fef06765158333df520c91@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775496391;
 bh=7tXXRoDrrAPTseE/4ADu8AWiRXcnsLABaQBQirny4Dc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k9IoSVU1LXSTa5nswhAk4/RIKqDk6X57SsLa7lEnzOgPvBATh9XD24GY1jMqml3nx
 3ls6z0Sd+kzAALx9ozmhESwt9pGYg/ex+Bg1D5ljp0WhYGvUS1yaOlQVEfNAFdCwIh
 v8T9pUCn47d6wYOyY8iC2RPuRC5wYDyMVrd91mANhgd4oKCIw0dkOFo28TJ1Cuw9UF
 8ei4i/hXeCSZmaDFTQOSnX2DS/pS/GJUC9ln00CQP9DhbnwMOd5k1IwU5Dp9b/qitv
 JC2GYdxjljVvQPtbxoFo4mNgHuefjFNajwsWDRoam6jO0oi9ndy/ijDrXrh2qz6s0W
 vF9DGuv74mYcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k9IoSVU1
Subject: Re: [Buildroot] [PATCH] package/quickjs: bump to version 2025-09-13
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

Hi Francois,

Thanks for the patch.

On 06/04/2026 12:08, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
[...]
> diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
> index e2170b297..511f14245 100644
> --- a/package/quickjs/quickjs.mk
> +++ b/package/quickjs/quickjs.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -QUICKJS_VERSION = 2025-04-26
> +QUICKJS_VERSION = 2025-09-13

Looking at:
https://autobuild.buildroot.org/stats/master.html

It seems there is 7 CVEs assigned to the old version,
fixed by this new version. CVE-2025-62490 to CVE-2025-62496
inclusive.

Could you mark this commit as a "security bump", and
add in the commit log a link to the change log
https://bellard.org/quickjs/Changelog
and references to fixed CVEs, please?

>  QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
>  QUICKJS_SITE = https://bellard.org/quickjs
>  QUICKJS_LICENSE = MIT
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
