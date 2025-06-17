Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F0BC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC56282375;
	Tue, 17 Jun 2025 19:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybSqn6Rmu1cr; Tue, 17 Jun 2025 19:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F6F283B55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6F283B55;
	Tue, 17 Jun 2025 19:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABBB3E2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DA9483B51
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFL3r1m1rws6 for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C439D83B39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C439D83B39
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C439D83B39
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:43:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2C593780371;
 Tue, 17 Jun 2025 21:43:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:43:34 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:43:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250612131200.393469-1-fiona.klute@gmx.de>
References: <20250612131200.393469-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <458f126294b6fc9fa5a6664f3b2bc108@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750189415;
 bh=e9zAbt3fqWptvydzXSp4cFMDXzGK09sLi/3tuP2G37c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qNvhPRJZraOMObtMJHbcN9fHbOEqmDhzkUqBhI5eFA5KeH8eq4/0Cr8vL9Rl4kVha
 obQM5O1Hc7xmdjaesR+qN2knkEvBDptduo9TXfcE6CaYr6qNWnzgbKDlOQB9keyEJS
 lK5/mLkJAwCgetdkjVGk0JCAbPx5kKSF5of98fmfIisgatoGimjoyoW+VizvBYthyj
 bBjaRgVY6FOrYiBCwvc01NVvEskycF0p/CJM//CJ3vxoiHTph4a62741EOc2kowrFr
 irnG3Rr9nkPAjNhBrhVLuo1sBWIvDmt/a6qunV1CKEJhTdFuPO7LHgFXyWPJ0JOVj7
 I5a8pRpBIFT3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qNvhPRJZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libndp: fix build with GCC 14
 and musl
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

On 12/06/2025 15:12, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Patch has been pending upstream for a while [1], Alpine has merged an
> older version that includes some whitespace damage but is functionally
> equivalent.
> 
> [1] https://github.com/jpirko/libndp/pull/29
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
