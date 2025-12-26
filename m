Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FE7E8FDB5
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB21681161;
	Fri, 26 Dec 2025 20:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkK4MAYllO_V; Fri, 26 Dec 2025 20:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF97810F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766781027;
	bh=3GkxOg8KtjdoJTsJ4Wme3Yk6ZUUijfyiSpb/NnrH/1U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QjkTq8fGIjvoWjyp2jkN04ogsY77tuSKkiP1Is46JFP2XIsFtWOmx+lrGgno9IGaV
	 bs2A/gR6C5KxZ/HWAUv+gCdf7wV31TzakLwmkWfn+MVrAz+yLn7FPn3Umkp0qTY919
	 oDpX5mBIrvhaWmLxLSHA52P9zDFQ6d+jRi3pRLVqjOVRxMrFP6bp3+HmYC3Br0nldi
	 tEhjqtXU1h5p3tRClwcHvNnF8+fXRU9ZMqW9Sk1p3jz8cI26VQc4n2sBDAhkbk5x7k
	 bbxeycIGn6NuFQe4ksQm7DEjojpIcb44Fwh4SeMno1+Y13G2nMkncKINUL/TfrJ+M7
	 I4yGtsnvY/R/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF97810F7;
	Fri, 26 Dec 2025 20:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BDFB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E4A3810F7
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRj_ScLEPtkG for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69D1B80F12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D1B80F12
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69D1B80F12
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:30:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A69A16012D;
 Fri, 26 Dec 2025 21:30:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 21:30:21 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 21:30:21 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251222124816.82310-1-buildroot@bubu1.eu>
References: <20251222124816.82310-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <4f5d7aaf0bdc088e970134ffb848a0da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766781023;
 bh=WH8dnckLYZsmI3YsY/m/BDtf0SoAZiPIYx45c92BVDY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N9zs2pn3iZTupF1ly2/59I1notktOP2DmuUERlWgIJFQdyQpWTAWZddTQcb1J3Kyj
 /yRklXi5hlZL0e7v4CgDzX5D1xaUxPUE2Kcdc3/Hi3gw6dV+bsOD8tli8uykujBHuU
 LNFwO3XKPr+QCL4gyaXSdt5iD/IlFaZTe0Gw0ufU/uToBrV8cQ4qrE9ZsIAiLYtQ4r
 zNYf4uBqIDhA6cpvO00SZSyntB0hxm7/p8CBVWufMsTTtMlSCmC2j6BLkna41+bRt9
 jVED0EkOU0ERCOyiPl2RptM4+VOOZmVoyfS84XeP8seMZx+sIXs+tx4GZDT0S8Kbxm
 z9cRQBbI+79xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=N9zs2pn3
Subject: Re: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.40.0
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

On 22/12/2025 13:48, Marcus Hoffmann via buildroot wrote:
> Changes:
> * https://github.com/Kludex/uvicorn/releases/tag/0.39.0
> * https://github.com/Kludex/uvicorn/releases/tag/0.40.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
