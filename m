Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF2BC3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 17:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC59440723;
	Sat, 10 May 2025 17:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQDDcb6VIGm2; Sat, 10 May 2025 17:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFA440726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFA440726;
	Sat, 10 May 2025 17:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3E2BE0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1670812E5
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_9L9E_cMDLC for <buildroot@buildroot.org>;
 Sat, 10 May 2025 17:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0478280E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0478280E1C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0478280E1C
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:17:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DCA0413F8B9;
 Sat, 10 May 2025 19:17:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 May 2025 19:17:04 +0200
MIME-Version: 1.0
Date: Sat, 10 May 2025 19:17:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250510075826.781184-1-thomas.petazzoni@bootlin.com>
References: <20250510075826.781184-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8de922b214c78aa0feaf5237ae44392b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746897427;
 bh=3sT0FN+fGGBr24GKsdw107VU8rjXpigRrH5R/29fkQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RtoQathdnyMLZ2qi+SSkc9g36H31ks74pImVhAhekxH2X77EUHEfpL4xza4lnXdSy
 bAca05wicpkRc/b3TvAs3ho+jQ+vgubwtKKLW5DiXDl36ajVGd6seeUdPoi5nYMuil
 rtdc3NclQJFYOoVZBo1H5qgKWkpG9ZizakR94ljbO8n8jRec8Nj3W/Lyt3J/Fd8X6S
 107T+Vwcrv+y6x1QSvP6IjisD6Sdnzlfe2Vn4uHWci7yWDM0YnNWz5p4R+C5Z6iVR1
 S6fWfdewKEQjxjz2HA2740LNnLMHjhroP9reQ/e1gH89K/T+ALdcc2UpnDTJMY8X7B
 jy9uO9Fy6S+3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RtoQathd
Subject: Re: [Buildroot] [PATCH] package/libtirpc: backport upstream fixes
 for GCC 15.x issues
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

On 10/05/2025 09:58, Thomas Petazzoni via buildroot wrote:
> This commit backports two upstream commits that address GCC 15.x build
> issues.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/abca98bc69ac51af3652ab2d0d187d1461f83515/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
