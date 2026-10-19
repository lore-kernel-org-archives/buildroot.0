Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F93CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B7C80FA8;
	Mon, 19 Oct 2026 13:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuzuItxcLjtg; Mon, 19 Oct 2026 13:37:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A6A198102A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792417025;
	b=CPt2TBshi3BtZuE31M8qp/e7gqomhEBYbUF9kX3g/wXQuCt26/CFHkyoAhsm97CWkqUs
	 V8XEGWbqH9JsHudXiC/j9dZQYGcJvjrTghDhKoXY17dSD2zc5o37ATTtMFLkvsG4Z9vhq
	 3MkUK9MZaTZAm8vKj5xHqiVcQQLNGqE81zecRoU6MDSNTfa+cJdBx7kpI2fvQt3Q7Pve2
	 6SrZt9B0fn1VJNYw/m+4z7Jqp6mMFiEmMMbwvUZWRk3FolANsHjmZe6jBUDTocmXEei4X
	 XLL7CJxbiLwffToqNW/59tSKDRVJG7JE+Jo4xyhl7Jxi25vwx+eH6m3CGhRJg33Ux2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792417025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7LFuSobXKmmWJ5mbMQawY7XSWLpe0XyBTkQcfXSRlGI=;
	b=LSjSKefJ6lDZ8R1RWYi/S0LvV81OnY7wNWRVHrxu4E9qWvWZ1NJHgL5miWZSRsqtZ3PS
	 JG/zXr5D9TRkerqZ/j+dyFrpqKL2hd921aQoO/Zbg6xi5cbFdDiZ09NnLAbwqyxTYrOj7
	 h9bvAHIE5IWDe7ndfBbdp6byVOgv8f8exf2BcynXagyTC039706VZtTZmFbPVCV/PO6Bj
	 sgFmqXTqhMWdIgVh+IiqoP9sO9fqH/Asfapj2AoHktrnJLEIeBMKGAoUTA0xwFIaGpIoK
	 MVfn80fEJ1uDP7j60Jm7ev1+K76tBot5TVLPHYjVARLuYZlcHYoKO60m0pMBEeLVnXg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792417025;
	bh=7LFuSobXKmmWJ5mbMQawY7XSWLpe0XyBTkQcfXSRlGI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HRGdchNzlzictLKwJ8c1zZRmojqNMqpAefSBr3b9tsFsp/xbysi4q+DcpCKwbKaFM
	 UqwrCOPLuPM3pUNqnnzuPhB8l4RlJacygmk2g9P7Wzfxih6qfNHo9Sa2iGllV0fN/F
	 lha6VJS576KmIixnITDFv/NSVvfvRI9eg47/R6PFNyiJmiNm8TiodMJhaSMq0Vppxn
	 sr/kl6lBlFF8jY8ulmsCQLf3F0lieWb1BD3jyQ4WHQPFS7l6BIeFfMjvgzFt3qI6vk
	 yBVgKT3LKGZ3A7emVcV/PWh4zmNd0ZEwLGTXonUl7GVf5e3kpJt5O0dC2VKuLWUjfL
	 BUp5zUNvg9IQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A198102A;
	Mon, 19 Oct 2026 13:37:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84D591DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 763726069B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VS59mv9cTsSK for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:37:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0502B6068F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792417023;
 b=NfAH2ZTgUqXduPKDceJ96a29Gz4aPmMUXZFrqs9jxt8o67lLTj+MLj+YOI6Zcvc9x5Eu
 4S7OwmcjKydHZ7k3Rm0Uw9rMCFW1kABQQ8xW5jY9LgYQqIedjVyOhfA2VfXwy2pOEj0ZD
 67yqfMKeow+L+7CfT3PCjlh1J4rkxzO3I0uV6aSUw+D8vAHLq722Y6FCoOsEaiBU8AjLu
 2WTKP65B4DXvhjojOGwjuCkOeFyjX9j6u7s+MqySAgBhHTxoe7MOqakw/QuqVVnIaTiAN
 CgCaWIGjDSBcMVeF8W8gkEisiyAmCGXZYJdBEhzWal8c6a7o3cClZxEw/5OWM8UF0Ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792417023;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5q4zqrqZUn5y1Kq8rpLLZXL5oBhiLw0MIeidphPnCzE=;
 b=RvqIk/eosRIesg9bVqpym4ZASCvnYihgMUeIp5iFkiu8g9TAwsC6N44brqbOr6mO/kAQ
 wUR2bCQRdUVGDeAzwfY2Uy64K+YhoBXQgwGsTlC8Bamr/C1tO62LYiDAaqjpsScZFqd3T
 9lx6OgMmZZjLmoB/vb+N8egkxyeAek1KGh/JFi/8r/10SVl/Np9/AIB90pihaj7BOV+QL
 eflBn2RZNgYJubk5M+ENhA76KKj1qN5zcoTBLaleGg1DFuQPGTYhLn8c36aon+JxRPh4m
 pkGIUcRi4yZLuYPSXMgaChCev/YEYSWGAfgOwz7GQx9eavAysd76ngihlMFoTT1Y9Ow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FpRXUOMi; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0502B6068F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:37:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1BCB0C653E6;
 Mon, 19 Oct 2026 13:37:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA69D60582;
 Mon, 19 Oct 2026 13:36:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D39A10328D3A; 
 Mon, 19 Oct 2026 15:36:53 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:36:52 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atYc79ufvjhnliKW@windsurf>
References: <20261019115916.775677-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019115916.775677-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/hyperfine: bump to version 2.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 19, 2026 at 05:29:15PM +0530, Shubham Chakraborty wrote:
> For change log, see:
> https://github.com/sharkdp/hyperfine/blob/v2.0.0/CHANGELOG.md
> 
> Changes in v2.0.0 include:
> - Add support for alternative performance metrics (peak memory usage,
>   instructions, CPU cycles, cache misses, branch misses, ...).
> - Add --env to set environment variables even without an intermediate
>   shell.
> - Benchmarked commands are now executed directly by default, without
>   an intermediate shell (--shell=none).
> - The JSON format for --export-json has changed (schema version 2).
> 
> Refresh the vendored cargo tarball hash for the new release.
> 
> Tested using:
>  utils/test-pkg -c /tmp/hyperfine.config -p hyperfine
>  (Result: 6 builds, 3 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
