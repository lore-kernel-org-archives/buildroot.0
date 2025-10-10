Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F7CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 11:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFBAD844D1;
	Fri, 10 Oct 2025 11:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRJCUHoquNrh; Fri, 10 Oct 2025 11:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAC1B844B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC1B844B9;
	Fri, 10 Oct 2025 11:47:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA0DB14B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0AF140AF9
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0L3Xbh3uNe_5 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 11:47:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D00DC40A02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00DC40A02
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D00DC40A02
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:47:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BD40B2003A4;
 Fri, 10 Oct 2025 13:47:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 13:47:04 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 13:47:04 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251007080547.2028121-1-dario.binacchi@amarulasolutions.com>
References: <20251007080547.2028121-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a50554f953ccbb896e74b329e983a8c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760096825;
 bh=2lGIioxlJu3/7ZryHk2CX64cvsAAqXePbNVdl3vxPcw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T+Ew40LBmyc4ozxYTIsVGDG73Ok5hmXv4D8Lw2kBeRSwpAIsmSf29zB9ki7mdm4D8
 LsqN69JPgSYWJTl5Uf8j8H7b//RwaRIsbyYW0VIv25mBRyWYYxixv5cxgXr2sbDqb+
 hwQH3AnpZLQF5ysnt64o3mwsWohcoGxO1A2z/gavUahHtlhcVzmdhMRzsjb7yIjqG9
 jMhC2wrowhv74ytPxfm0tefWQxAsM4IbK6ahkoNume6coCCg43DIUQMSWBH2fUf5Qt
 ZrZOLYExyEadVhmdQddgIZxIumDvR4nqwTd/9mhJgLun1rjksoRMTGNxRagu4XC7hm
 oklSWqczEbdqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T+Ew40LB
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.10
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

On 07/10/2025 10:05, Dario Binacchi wrote:
> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2025-October/599798.html
> 
> Changelog:
> https://github.com/u-boot/u-boot/compare/v2025.07...v2025.10
> 
> With upstream commit a239b0b0b6db ("Add symlink from gpl-2.0.txt to
> a COPYING file"), COPYING is now a symlink to Licenses/gpl-2.0.txt,
> causing the install command in UBOOT_COPY_OLD_LICENSE_FILE to fail
> because the source and destination refer to the same file. To avoid
> this, copy the license file only if Licenses/gpl-2.0.txt does not
> already exist.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
