Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6991ACA1013
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 19:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259D740B37;
	Thu, 18 Sep 2025 19:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRuDyauONtrY; Thu, 18 Sep 2025 19:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 566ED40B58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 566ED40B58;
	Thu, 18 Sep 2025 19:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FFED273
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46D9740B58
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFpa9lp33I5H for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 19:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7490C40B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7490C40B54
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7490C40B54
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:34:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 01D3FB0053D;
 Thu, 18 Sep 2025 21:34:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 18 Sep 2025 21:34:34 +0200
MIME-Version: 1.0
Date: Thu, 18 Sep 2025 21:34:34 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250918065115.65994-1-thomas.perale@mind.be>
References: <20250918065115.65994-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <82238145ef539aaef35bb405713665d4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758224076;
 bh=Jp79ktbgsr9LJ3Tl4e7+s/F5rUUAVdSc0msWY9ZyGI4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q2vCXJ3Xy9KrFC+y/4Ur7H64Wt4yFMfVvBPTXuZag0jM3wn/8ajk2rV3glhpQgdAk
 +Fm21pL0A0ThC/Xo7lClxSpIrUZxD0ecdMwl6CmTOb00sqsTvqlEOLJswnNekRDqel
 TH9se3LKxdnbCAXPkM6MocnrVZByCthlMOMSvc0ovFmpDXXOxkyj7Q15gPQDL334uA
 LzL/xPHd5fuU0+yyxpjuc2wdxooFUtEik+roJVdhwXLE4oPpi7XsvOgnnv3eGDJtSF
 e/bZRiRFBVyJndc6bHlXSgKQoGrICTAB2Yu4WavAxP/ebcUhlrRQQats65j4sfetfe
 IdmaFdZAgmbVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q2vCXJ3X
Subject: Re: [Buildroot] [PATCH] package/civetweb: add patch for
 CVE-2025-55763
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

On 18/09/2025 08:51, Thomas Perale via buildroot wrote:
> This fixes the following vulnerability:
> 
> - CVE-2025-55763
> 
> Buffer Overflow in the URI parser of CivetWeb 1.14 through 1.16 
> (latest)
> allows a remote attacker to achieve remote code execution via a crafted
> HTTP request. This vulnerability is triggered during request processing
> and may allow an attacker to corrupt heap memory, potentially leading 
> to
> denial of service or arbitrary code execution.
> 
> For more information, see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2025-55763
>   - 
> https://github.com/civetweb/civetweb/commit/76e222bcb77ba8452e5da4e82ae6cecd499c25e0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
