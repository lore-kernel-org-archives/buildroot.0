Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DA3F5A8A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D374D82CE4;
	Mon, 20 Apr 2026 17:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qM8vt069JMv; Mon, 20 Apr 2026 17:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09CDF82BA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705691;
	bh=taUXATPyJajWe3Dg5+YF6IBAKuVtSSyeUsIpjxXnnPM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MaHkSKejeVhSaZIVwie394SNofip/Qr+EjjrI6LIaaZ11h+aTKNE8//S8OBZ2lG9D
	 HyN6PQJwjiO4orxc6lORGLTNPAEmu1as7D5bKtHLbXhXBVhuT/mWN4XWGd7g3Q43bC
	 3Isil/qcusa/881WY1WWhb22rQ43Vt/th3YzK7zAvhqNo3iVuGtWD/CxdY7WRDcssA
	 PDCvx1NWqYVP86/YwAQRAiHjLRgvPFj1EORtqJUE8JzBcLDT8Rhn31AFcpNgTnnGWR
	 GCgUCaX10bqBkeB2VTS9fDifCvZI2lnuJpiuhHCniO7ToWfuMJizcebt5jMnQnZOBb
	 kRuKJJ93ASaGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09CDF82BA1;
	Mon, 20 Apr 2026 17:21:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A01524D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F7648280E
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwN9CBBj38Nn for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A950827FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A950827FA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A950827FA
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:21:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 30E8919F58A;
 Mon, 20 Apr 2026 19:21:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Apr 2026 19:21:25 +0200
MIME-Version: 1.0
Date: Mon, 20 Apr 2026 19:21:25 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260420171837.470571-1-ju.o@free.fr>
References: <20260420171837.470571-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <9bc74570139a2d4c0a2f0036fe714e6c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776705686;
 bh=lXEo/RolA7EQuoZbbi4dZLRYxd0oH6YVmLTFADY6p0k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HnQxsRNqWVU7ILD7/3Wtz5AOIUcmSJ4JyWGqnu57kQiC2+orTGO73PJZjbmxENQLy
 8ezHt0tcW/S8+ii1XH+kFUd9gJx1ruQDUd5PJLPQ5uZhSJtYBiJ0Om24sWCh3BWNvz
 6O/A79ZmYfb38wyq6Kd53+ykOadFzqvqPEl2vS5SNiIP6n/HPvZa5TJlx+Q9QEWc3e
 iDXNbH8Tf0A1lEP7P8yj5llP2vulRFu7q+NWsOx5N156kG4SAQARPrRQjRbVIFbSDg
 BaleYMoI26yGiuv8DWjwmX5IsOakJ922Eumb+4fKgx31Rl8k/qYS0QODqJNXsqJNJG
 aAmCrMwUpv4oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HnQxsRNq
Subject: Re: [Buildroot] [PATCH 1/1] package/fakeroot: fix hash file format
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

On 20/04/2026 19:18, Julien Olivain via buildroot wrote:
> Commit [1] "package/fakeroot: bump to version 1.37.2" introduced an
> incorrect hash file format. The command "make check-package" reports
> the error:
> 
>     package/fakeroot/fakeroot.hash:2: expected three fields 
> (https://nightly.buildroot.org/#adding-packages-hash)
> 
> This commit fixes that.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/a4f2419164c4f3514e573427f6537f94c2878837
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
