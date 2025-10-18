Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC082CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 18:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17DB832E7;
	Sat, 18 Oct 2025 18:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_s1ITDNfygC; Sat, 18 Oct 2025 18:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E43648329E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E43648329E;
	Sat, 18 Oct 2025 18:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D12D43F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 639BD40EEA
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLOxAmwXZavF for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 18:21:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60B7B40EE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60B7B40EE6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60B7B40EE6
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C70EA13F8AD;
 Sat, 18 Oct 2025 20:21:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 20:21:32 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 20:21:32 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251017205626.438525-1-raphael.pavlidis@gmail.com>
References: <20251017205626.438525-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ec0da1c29fb9588e2fd34020443f9460@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760811693;
 bh=QsQ2Vxudcn+nMjQtAMJ3H1+Pdsxk5pgdlH6SG1a37sI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AqOnombqIDJqix5KRyDsLF8MucjFmbHpSN1AOPWdKBQn7v9ee33ps4zRo24HOCnmB
 86XTa9wlSO2m0MIuI64QianZus/jQid8BaYJFGoZ4pNrerqI/uc4egZ3AZVRI52Yz3
 K9bgmLsdL3DGflLexkpSwYkV80T1lJ0cvE42FLdpith1CVg4PH88gPz+E4bBx3M1Qw
 DHn8IUPW/tDikPnfXmacf74/zHrAKrK+3ta10R/u9eQ3WfIMW4pUwjESPMU6FgaSrz
 fBRVd38sUAcdJQpULRAKdyW0AjpQyEBT5h0voxF/PtmGVy4KzYXa6JOd/8oZG3dm8D
 zgj3CsDSqyP9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AqOnombq
Subject: Re: [Buildroot] [PATCH v1 1/1] package/slirp: bump to version 4.9.1
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

On 17/10/2025 22:56, Raphael Pavlidis wrote:
> Changelog:
> https://gitlab.freedesktop.org/slirp/libslirp/-/releases/v4.9.0
> https://gitlab.freedesktop.org/slirp/libslirp/-/releases/v4.9.1
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
