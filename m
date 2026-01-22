Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A77D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F6AA60724;
	Thu, 22 Jan 2026 19:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztRJHZJ-d2pg; Thu, 22 Jan 2026 19:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 629226071A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109850;
	bh=rU4eKScOPAbH1AeSvEvv3W93QBuEWKsyh6ZbBtxC84Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WFHnqygsVBTk7JJvng6VzlFZDDf4Op3LFr/xeiK5cCYd88jTxbMqpJK8Ospd0cpuv
	 R/cw/DZ2J66is37X4v8PPl6reJAQaVNHM5nNxqCuoguXyQwT/n/gJamHIld0Y2fcPx
	 JN+SNB25jDTAKkn6dSsT0Zr1buS/sCdM6VGACQey8lA3kwHAHMNegKX0SvKJkX23v3
	 In3aX9gCgDLNjXvq7+gdWaW2bA9ubzSylY5P59H7WPT1EGydpzT3oYMKPpI3o2f3LQ
	 jJiQ/mGBMDRKwBzTmZHMs9s07ANnddlRzr4CPur4Lj8KvvbGZPia4amZoG4nFv3ZqF
	 7ukTAWfqP519w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629226071A;
	Thu, 22 Jan 2026 19:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AE24DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB47B4012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esio8w9vIb5s for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1A0240156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1A0240156
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1A0240156
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:24:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BF4DB19F5C2;
 Thu, 22 Jan 2026 20:24:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:24:02 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:24:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260121004747.1348473-1-james.hilliard1@gmail.com>
References: <20260121004747.1348473-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <2ee4ae2e7eb5254b93e3f3ec912f51a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769109845;
 bh=6XKMoLBEXrIE3BU6XL5BGU+SThI/hlrOctoRHOg9e1s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JMmvGmWnbZ9dFzIsbS8LzHnaRiH3S3BCOEWiP7x2mMOfMN5ZxLD6e6l5Go85wBrcT
 h3RBRtVHZUS4dJ2oBxpRR2eYgKg9iBJRkCHsoSsWyl4Kfbm7bSfmUlZXgaaQSCkO7I
 zZ3CcmAgDRM5nKprVazgiq/VAZ1CmD/BmCThoeg0ywz0abW4+HZXNJQRgvjPqbUXxU
 tDNl81SAhAZdLHU+MVQtXUYxODbu764QIMF3ipDRzuoN1foqNEE+XgY6WzDcF/GxLq
 2G0Gm6P8glwsS3umivgtLiaaP0msLLgl92dsxRuIux/wisAmnJI/Rl7y/jzNKwhmx4
 6Rgo1xadZpjZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JMmvGmWn
Subject: Re: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version
 0.3.7
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

On 21/01/2026 01:47, James Hilliard wrote:
> Drop Update cmake_minimum_required to 3.5 patch which is now upstream.
> 
> Rebase do not force the build of a shared library patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
