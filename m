Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B19EE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 16:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 055CA80A92;
	Sat, 28 Dec 2024 16:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3s02pgobVL8; Sat, 28 Dec 2024 16:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A3A380AE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3A380AE1;
	Sat, 28 Dec 2024 16:38:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5483FC8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32B3880A92
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzXlAbVnZ33H for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 16:38:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23E0E8083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E0E8083E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23E0E8083E
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 16:38:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7F08E13F86A;
 Sat, 28 Dec 2024 17:37:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43504])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 17:37:56 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 17:37:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241228162315.3156194-1-thomas.petazzoni@bootlin.com>
References: <20241228162315.3156194-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dee4df78f10600e81bcc22fe247e32a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735403877;
 bh=SGpvuc0TwFWd8WR0Fl0sKQ0ZYdx4wNms2oxsr5+Yars=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f/lRUSvuTKQarBQKt7+jTjWDj2Lhey/eZnz0O6q261iAJT5mlVL1kgzW9fNDneS1W
 HzPSQYMjhkmc2StmwDizsPW3AIAPuLnCPVFWZfppwZ/TtVnojAEM9IIgHu8YdKjd38
 YxUasBtzpIxM+Eg+jw5dWsRPvdxKONx3ql4MR/Kahlcvl/AXV0ubBMDsz5STygqD77
 7yUj1zINrUhwywpM+ykRAUhAk4WkkHLWEoujyCGoSavEUX++kAtr+z8dEZOGZf90i7
 kPY0ylwF22CFfi/G624nIMfUle88M4sXcfMwjLc2LMcdppArf6iAVNUjSneNDiifiT
 uKNW2FtP/gO1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f/lRUSvu
Subject: Re: [Buildroot] [PATCH] package/tinifier: bump version to 4.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/12/2024 17:23, Thomas Petazzoni via buildroot wrote:
> 3.4.0 -> 3.5.0:
> 
> Changed
> 
>     Go version updated from 1.17.3 up to 1.18.0
> 
> 3.5.0 -> 4.0.0:
> 
> Changed
> 
>     Go version updated from 1.18 up to 1.19
>     Sub-command quota now supports multiple keys at once
>     Default threads count for compress sub-command is now NumCPU * 6
>     Go package (module) name changed to 
> github.com/tarampampam/tinifier/v4
>     New terminal UI
> 
> Added
> 
>     .env file support
>     Global --version flag
>     --update-mod-date flag for compress sub-command (since this 
> release, the original file modification date will be preserved by 
> default)
>     --keep-original-file flag for compress sub-command #103
> 
> Removed
> 
>     Sub-command version (you can use --version flag instead)
>     Global --debug flag
>     Global --verbose flag
> 
> 4.0.0 -> 4.1.0:
> 
> Changed
> 
>     Go dependencies updated
>     Go version updated from 1.19 up to 1.20
>     Module name changed from github.com/tarampampam/tinifier/v4 to 
> gh.tarampamp.am/tinifier/v4
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
