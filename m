Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C8BC636B6
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 18:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49F483C7E;
	Sun, 22 Feb 2026 18:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2abgTKWtkFx5; Sun, 22 Feb 2026 18:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC53283BE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771785450;
	bh=wQ+p52yBqQSesOd4janaWPQ7nPXMXUPimWeVD0V/TbQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4LXy9hYjfVZ3AEv9NKKQ1Hkk1nIDZtiOWkhpZ2VdzzISbjXhcYx+XfPBgFS4k70c
	 fWVKXtj/lIlLMZOwIYjqEryGAHdLojyHwonEEFmQCjt6jqMulY9eJ0dVPR6RqBHKad
	 0+KA4JLebbyEKNqsoiUvPmNCXJruuheuPsrzH6RH9iZhWP5Lzxx0ACNtSqNEe/NSbD
	 1j4pdcFRSHILEQ1vQU0+phFQyGaKnuLPVfOun+umRjquIrVtuayCQBhPOq+dGepbkd
	 gGPoyNxWicDMt0JXm2LyRWz0HUJNHQl6qNBb4T0hrhFeWvBxp8hMb1IDyCJI//9+hK
	 pwaZy24Jc7K8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC53283BE4;
	Sun, 22 Feb 2026 18:37:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C96AB249
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE8C683BE4
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PLb4TCRk7zc for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 18:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC33B83BE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC33B83BE2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC33B83BE2
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:37:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8E9BD78035B;
 Sun, 22 Feb 2026 19:37:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Feb 2026 19:37:24 +0100
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 19:37:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260218204738.915516-1-giulio.benetti@benettiengineering.com>
References: <20260218204738.915516-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <c8db3cb0c9b428fd870d1a3523a3f747@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771785445;
 bh=H3u/gLaFZ2P5ob2NZsNZo4SJAkk5dDCYjJSqjsYnDZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OSzU72/n5nrRv0BUWGpLohx7eOFV7rw1n8sndVRPp9sqsTz4u2Q4mlizLY0Ia2mV/
 qvvbQS7IDOcq82iTLigdeSGIjXTaK+Z+zkwNKqH/I67BT2JKRjSN0eCWf4FBUUSwGL
 TP664ozIn5aAJ3+9pqhLz2/eZ2BGnpKF9taXQG8Gr3Y8FvjXPlF/0UDSBQ1ZOQv5Q9
 8EEJ5Un7vIoCDZaqSbuJsd2/TevwN/5LixSKR6EGPXmw0ETHqbTbsF0GSGC+s2pDio
 4x3Ya1ySyomYTWIozVQDiz89ZuU0wYGQUcv/ecXGhHHhKb7GyzuUbJEw/YSMqxC2rw
 AqTvwYNDYymUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OSzU72/n
Subject: Re: [Buildroot] [PATCH] package/bind: bump version to 9.18.45
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

On 18/02/2026 21:47, Giulio Benetti wrote:
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/changelog.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master (since it is a bugfix only release).
For info, I fixed the signature url in the license hash file. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/f0d13085291aebd484eb8ca653a9674a3c1de00c

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
