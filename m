Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6029C5AD48
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 23:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54AC76068A;
	Sat,  8 Aug 2026 23:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQ1ImkRl_Oax; Sat,  8 Aug 2026 23:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B5B0605FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786230416;
	bh=CRS1Z6wWlnU5Xttf+5bSmsL8tfAGwr6vz1pD+dvXdJ0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y+bpX38RuTqy8FfhO4O0qOOXuQUZ9NO63ZYzXq6oYVqk6G662GBNg5rxe9TcE23c9
	 57Lmy3MSQmDqrAcC8/iWXoPddcTbeAiuVtmZQ1y6c0XQdzIJCC4Nn+n7fYTsQkuclC
	 wSe6h+wmcUj2GlQ1dSEaUbd5csuBqqSOAGZovuhiwTT0AlytiXaPyTW3Y2l5HW4tJy
	 AnysA4eLp83admiXehv+1eCAP5tHnmK7JzbRTeebBW+GJ/zKdifLYhKYyW/o0JTv/+
	 clSPGJ8Spl//Q8YQWiXAa32DLkk+dwd4gYvNy767+MYI+epYflLjn3vm5FKarvthBh
	 XF3kSSz5m5myw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B5B0605FF;
	Sat,  8 Aug 2026 23:06:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F185282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2587A4056F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjzMR43T4-6O for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 23:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B18A140545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18A140545
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B18A140545
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:06:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B547F19F54D;
 Sun,  9 Aug 2026 01:06:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 01:06:48 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 01:06:48 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, Romain Gantois
 <romain.gantois@bootlin.com>
In-Reply-To: <20260808171156.1421460-1-thomas.petazzoni@bootlin.com>
References: <20260808171156.1421460-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <3942abb3a86dffe5c8eb14d559f518b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786230410;
 bh=upKkrDyj3qn79vL1fkGAtMiKa+4YAPi1dGFBQkgLNAg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WXSN+u9UgW6K0op9C/6x2VtBOMYzLUF7FHILrXGPCvkNUXBMkV+TPJzBPutiqxli2
 vxZt9qCCvd8VTEJueasYIn5JhbrgnoqDJBDI5tIXTDfgXJuwZ5xZ/U0IO0u7/L2ogf
 ornBJdzjHru9fDqNlnfTFbiWQmU82uiP0stOpoX5XDprvpU2fga4Db/f4ICwi88YQD
 DeluhT5cpoEYSUl2cED9PF+vmqiPx2OhfOJ50UDJQuxodaIEIS4aErgxo8Q24aAjy/
 MIAsmspWZohcfX49Ci+ykyr4ytdvqFCreOWFvsEEvzJc/0k9f3T1kpyjdIXqLls0q8
 Ei0O/1GnFVpfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WXSN+u9U
Subject: Re: [Buildroot] [PATCH] package/snagboot: bump to version 2.6.1
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

On 08/08/2026 19:11, Thomas Petazzoni via buildroot wrote:
> Changelog 2.5..2.6:
> 
> treewide:
> Migrate documentation to readthedocs
> Emit more specific error messages for USB permission-based access 
> issues
> Add unit tests
> 
> snagflash:
> Support compressed input files, e.g. *.wic.bz2
> Refactor fastboot-uboot logic to factor out common code and improve 
> logging
> Automatically detect when oem_run isn't supported by U-Boot, and 
> fallback to ucmd
> 
> snagrecover:
> Support Renesas RZ/N1 platforms
> Support SoC model aliases, and add i.MX8MP alias
> Handle relative path prefixes with the -F syntax
> 
> Changelog 2.6..2.6.1:
> 
> snagrecover:
> Correct i.MX93 ROM code recovery which doesn't support control endpoint 
> HID commands
> Add multi-board support to AM335x recovery setup script
> Add i.MX7Solo support
> 
> treewide:
> Fix broken links in documentation
> Drop Python 3.9 support
> Add CI for Python 3.14
> 
> One packaging-related change is that Snagboot would now
> unconditionally import the bzip2, gzip and lzma Python modules, which
> are not necessarily available. Since these are only needed when
> compressed images are provided as input, we submitted a patch upstream
> to make those imports only when compressed files are provided as
> input, relaxing those dependencies.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
