Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331E5CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0969180DFB;
	Fri, 15 May 2026 09:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDAiT_pwtbRB; Fri, 15 May 2026 09:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F227B80D59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839057;
	bh=CreJbWD4H8iyDyoXiy1BhmFbsjGWb2ZTWj7G56/ELp8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fE+h8eIWrHM8FvQeINtJOrBhnSXRfWA7Jl/0+akLh6IN+H1aAF8G17RwJsQao30t+
	 y9O6IH7N3I2fKKlAZPIwb6t4xHAFvn695trDTf0eg9idWjHgWhaStHYmLSF/XXjV7K
	 DdVEOiYwlXTXqu2qoF+mp2r0KymxaUIG34XbG1VmjyjaJbBh6Zwcch2CS3xjz9rMFk
	 XpqbQh6QYsXg0lVa9tSqoG+Tj19fssrFTVxyLfcI1nZezILKdhga0x3qyZ1K7Dagab
	 FOKbPMBLFtiTlWawt1uUg3HiaDYRYVpvBkwED9Uxj6j2qOhOSH15MG+8ZKVahxZWw5
	 Pb3GFWnT2X+aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F227B80D59;
	Fri, 15 May 2026 09:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37768E7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E5B54174B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8Sm3tkOJV7n for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3AFD41747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3AFD41747
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3AFD41747
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id ED99919F73B;
 Fri, 15 May 2026 11:57:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:57:30 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:57:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260512150334.508969-1-bernd@kuhls.net>
References: <20260512150334.508969-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7ead3001e954240fc01edda49703d35c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778839052;
 bh=nSHjuXktBQW8NaU6nibx/oof4lZwS8j8RDWkd8uexC0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aZicYVBa4AEb9V4UEx/B/Eo+rFe2H1m0Oqh5IJHwu+U61jgLooYcLWomx6ektfaQQ
 EQJLv6O2BfFq3+5i1MxCe41Sb4+ipEGsrh+vRq12CzrCRj9qfCIj3gr4pZDIlr29yo
 30tUcvrpbJvVfXnku6VJdUjmSPlLc4Qiu7iecn+IZIbyf3zhgjZkxsbqEa4DZI0zvo
 1qdYimIJOgGmJtoi84rjhcd1vb/7pPSrSy1OQU1tOeMaO14qs6yE0QnTo2z1RQ2c6U
 2n2150raPoDYvkcjYQPlFEIyhJh2RkFGE+74iQ4QMhaW5YtgXsDU5xm1i1FN1pPkvN
 jWnWzfjL5XNFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aZicYVBa
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libxmlb: bump version to
 0.3.26
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

On 12/05/2026 17:03, Bernd Kuhls wrote:
> https://github.com/hughsie/libxmlb/blob/0.3.26/NEWS
> 
> Switched to xz tarball and tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
