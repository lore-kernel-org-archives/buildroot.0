Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96A7CA0FE9
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 22:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729CC42C9B;
	Mon, 25 Aug 2025 22:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GolCATwNSiC; Mon, 25 Aug 2025 22:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C5442CB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C5442CB3;
	Mon, 25 Aug 2025 22:48:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D4FCD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD1B342CB3
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePxkXU3OyVZm for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 22:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C51F42CC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C51F42CC6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C51F42CC6
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 22:48:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4C6CB19F57B;
 Tue, 26 Aug 2025 00:48:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Aug 2025 00:48:42 +0200
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 00:48:42 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250825215924.480927-1-giulio.benetti@benettiengineering.com>
References: <20250825215924.480927-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <74c7cd0ddc289a6b5a2fc98d088d13e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756162123;
 bh=B1ni7OrzhCsQkRRgHKSAPiBG1XROWLl8WcA2OF8ZdVU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bas+lb9E14Y3tIVBVAw4h0H8Q5mgxT/PDmhYBokYvluIjH2iiFCqEUEO5cdk3Lvu7
 E169Pp7nZ8Kic5xC6h13in4a5WKO6rZn6DvUC4i8LMEwC5/ZMH+gooLay3ap9AF4wl
 uwkBFpMVPBBBfWDLjPMctwsAne2fZI5xfT4rFxpiquGz6Wms/w60IVuPocZwSoyjBj
 dO4ZhCppeG1lR1ODI+rZPd8NWTW61hydS+GxefkClcNNQC8wfotV8AFk+jjRoTFYPX
 djREWydEpq+9tcj7SIY7noi3edhKFg8SRAopqQy1QsIAUOD8deBpyWprPCAhsv+6mm
 YdOs8prYVO3hQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bas+lb9E
Subject: Re: [Buildroot] [for-next] package/libfuse3: bump to version 3.17.4
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

On 25/08/2025 23:59, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.4
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
