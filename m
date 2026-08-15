Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C6C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696E280EA3;
	Sat, 15 Aug 2026 15:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctjn1HUIz3Q9; Sat, 15 Aug 2026 15:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6385B80E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786806615;
	bh=3AqWayjJTk2ZGqrNNMdzDGJQ/WpEFnaesjYuzD9koN4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SFHxnLDB3Dpvl2VXf7ipz3xcIWDKWzwir15RFTsbImk9LjMWDI10avXIfLzKw7W0E
	 hLdswGGqJTE19w9S6oMh+2FJPoji3dujuB71ZrgmQfkCNDANhMJhz+Dca2uB79NcRy
	 req/xK8j8mRmPr0InAGv86qam4dtD5Bk8eO5WQkoYmhGxVSR7Mc7SpOs/9LU+HU18w
	 3QFebijbrH7NF3r0vcXRn+fJrGkjR5Zdbc3vqSd9guF7wVDAjvgrZLWY5dLsqu9Lxf
	 EnT5Mw03vM57n9F5sLTtgXJ4n+CVNoQofNheWZrn3nJtutOvs+pRWZikhwZSUmnHBl
	 5NkM4pG1mm9qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6385B80E8F;
	Sat, 15 Aug 2026 15:10:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4E3B392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AE974082F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GR3r2meZINSn for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:10:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3DDF4082B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DDF4082B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3DDF4082B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:10:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DC7CB780389;
 Sat, 15 Aug 2026 17:10:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 17:10:06 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 17:10:06 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
References: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <af2a633f1a117bf9e12e90debff06dcf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/5] toolchain/toolchain-external: drop
 Synopsys ARC toolchain
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

On 08/08/2026 17:27, Thomas Petazzoni via buildroot wrote:
> This toolchain is from 2024.06 and has not been updated since then. It
> was marked in commit 11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8 in
> January 2025.
> 
> A warning was sent to Synopsys ARC people in December 2025, and
> despite a reply that some effort would be made [1], no contributions
> were actually done. Also, Alexey Brodkin is no longer at
> Synopsys. Time to remove Synopsys ARC specific toolchain and toolchain
> components.
> 
> [1] 
> https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/
> 
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
